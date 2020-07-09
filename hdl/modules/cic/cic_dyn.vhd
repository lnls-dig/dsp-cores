-------------------------------------------------------------------------------
-- Title      : CIC with dynamically-adjustable decimator
-- Project    :
-------------------------------------------------------------------------------
-- File       : cic.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-03-11
-- Last update: 2016-05-02
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: CIC with dinamically adjustable decimation rate
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-11  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity cic_dyn is

  generic (
    g_input_width      : natural := 16;
    g_output_width     : natural := 16;
    g_stages           : natural := 1;      -- aka "N"
    g_delay            : natural := 1;      -- aka "M"
    g_max_rate         : natural := 2048;   -- Max decimation rate
    g_tag_desync_cnt_width : natural := 14;
    g_bus_width        : natural := 11;     -- Decimation ratio bus width.
    g_with_ce_synch    : boolean := false;
    g_tag_width        : natural := 1;      -- Input data tag width
    g_data_mask_width  : natural := 16;     -- Input data mask width
    g_round_convergent : natural := 0
    );
  port (
    clk_i            : in  std_logic                                      := '0';
    rst_i            : in  std_logic                                      := '0';
    ce_i             : in  std_logic                                      := '0';
    ce_out_i         : in  std_logic                                      := '0';
    valid_i          : in  std_logic                                      := '0';
    data_i           : in  std_logic_vector(g_input_width-1 downto 0)     := (others => '0');
    data_tag_i       : in  std_logic_vector(g_tag_width-1 downto 0)       := (others => '0');
    data_tag_en_i    : in  std_logic                                      := '0';
    data_tag_desync_cnt_rst_i : in std_logic                              := '0';
    data_tag_desync_cnt_o     : out std_logic_vector(g_tag_desync_cnt_width-1 downto 0);
    data_mask_num_samples_beg_i : in  unsigned(g_data_mask_width-1 downto 0)  := (others => '0');
    data_mask_num_samples_end_i : in  unsigned(g_data_mask_width-1 downto 0)  := (others => '0');
    data_mask_en_i   : in  std_logic                                      := '0';
    ratio_i          : in  std_logic_vector(g_bus_width-1 downto 0)       := (others => '0');
    data_o           : out std_logic_vector(g_output_width-1 downto 0)    := (others => '0');
    valid_o          : out std_logic                                      := '0'
    );

end entity cic_dyn;

-------------------------------------------------------------------------------

architecture str of cic_dyn is

  signal decimation_strobe : std_logic := '0';
  signal decimation_strobe_d0 : std_logic := '0';
  signal data_out          : std_logic_vector(g_output_width-1 downto 0) := (others => '0');
  signal valid_out         : std_logic                                   := '0';
  signal synch_int         : std_logic                                   := '0';
  signal desync_cnt        : unsigned(g_tag_desync_cnt_width-1 downto 0) := (others => '0');

  type t_fsm_cic_sync_state is (IDLE, CHECK_SYNC, START_SYNC, SYNCHING);
  signal fsm_cic_sync_current_state : t_fsm_cic_sync_state := IDLE;

  signal data_mask_en_d0   : std_logic := '0';
  signal data_mask_beg_idx : unsigned(g_data_mask_width-1 downto 0) :=
                                   to_unsigned(0, g_data_mask_width);
  signal data_mask_end_idx : unsigned(g_data_mask_width-1 downto 0) :=
                                   to_unsigned(0, g_data_mask_width);
  signal data_mask_counter : unsigned(g_data_mask_width-1 downto 0) :=
                                   to_unsigned(0, g_data_mask_width);

  signal valid_d0          : std_logic := '0';
  signal data_d0           : std_logic_vector(g_input_width-1 downto 0) := (others => '0');
  signal data_tag_input    : std_logic_vector(g_tag_width-1 downto 0) := (others => '0');
  signal data_tag_d0       : std_logic_vector(g_tag_width-1 downto 0) := (others => '0');
  signal data_tag_d1       : std_logic_vector(g_tag_width-1 downto 0) := (others => '0');
  signal rst_modules       : std_logic := '0';
  signal rst_int           : std_logic := '0';
  signal rst_n_int         : std_logic := '0';
  signal data_tag_change   : std_logic := '0';
  signal data_tag_change_d0 : std_logic := '0';

  component decimation_strober
    generic (
      g_maxrate   : natural := 2048;
      g_bus_width : natural := 11);
    port (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ce_i     : in  std_logic;
      valid_i  : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component;

begin  -- architecture str

  -- We don't need CE here as these are user configurable registers. We will have
  -- lots of clock cycles anyway
  p_data_mask_limits : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        data_mask_beg_idx <= (others => '0');
        data_mask_end_idx <= (others => '0');
      else
        -- Set beginning counter index
        data_mask_beg_idx <= data_mask_num_samples_beg_i;
        if data_mask_num_samples_beg_i > g_max_rate then
          data_mask_beg_idx <= to_unsigned(g_max_rate, data_mask_beg_idx'length);
        end if;

        -- Set ending counter index
        data_mask_end_idx <= g_max_rate - data_mask_num_samples_end_i;
        if data_mask_num_samples_end_i > g_max_rate then
          data_mask_end_idx <= to_unsigned(0, data_mask_end_idx'length);
        end if;
      end if;
    end if;
  end process;

  -- Data masking logic
  p_data_mask : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        data_mask_counter <= (others => '0');
        valid_d0 <= '0';
        data_d0 <= (others => '0');
        data_mask_en_d0 <= '0';
      else
        if ce_i = '1' then
          data_mask_counter <= data_mask_counter + 1;

          -- decimation_strobe always happens at g_max_rate clock
          -- cycles
          if decimation_strobe = '1' then
            data_mask_counter <= (others => '0');
            data_mask_en_d0 <= data_mask_en_i;
          end if;

          if data_mask_en_d0 = '1' and
              (data_mask_counter < data_mask_beg_idx or
               data_mask_counter >= data_mask_end_idx) then
            data_d0 <= (others => '0');
          else
            data_d0 <= data_i;
          end if;

         -- We take one clock cycle to detect a transition and act on it.
         -- so, delay everyone by this same amount
         valid_d0 <= valid_i;
         decimation_strobe_d0 <= decimation_strobe;

        end if;
      end if;
    end if;
  end process;

  data_tag_change <= '1' when data_tag_i /= data_tag_d0 else '0';
  data_tag_change_d0 <= '1' when data_tag_d0 /= data_tag_d1 else '0';

  p_sync_cic_fsm : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i   = '1' then
        fsm_cic_sync_current_state <= IDLE;
        rst_modules <= '0';
        desync_cnt <= (others => '0');
        data_tag_d0 <= (others => '0');
        data_tag_d1 <= (others => '0');
      else
        if ce_i = '1' then

          data_tag_d0 <= data_tag_i;
          -- To check for a transition we need another clock cycle. So, use a
          -- delayed version of data_tag
          data_tag_d1 <= data_tag_d0;

          -- Desync clear
          if data_tag_desync_cnt_rst_i = '1' then
            desync_cnt <= (others => '0');
          end if;

          -- FSM transitions
          case fsm_cic_sync_current_state is

            when IDLE =>
              -- passthrough
              rst_modules <= '0';
              -- CIC synchronization is disabled
              if data_tag_en_i = '0' then
                fsm_cic_sync_current_state <= IDLE;
              else
                fsm_cic_sync_current_state <= CHECK_SYNC;
              end if;

            when CHECK_SYNC =>
              if data_tag_en_i = '0' then
                fsm_cic_sync_current_state <= IDLE;
              else
                -- when we decimate the CIC, check if the next sample
                -- belongs to the next tag. This means that the CIC decimation
                -- cycle is synched with the tag
                if decimation_strobe = '1' then
                  -- tag transition
                  if data_tag_change_d0 = '1' then
                    -- CIC is synched with tag
                    fsm_cic_sync_current_state <= CHECK_SYNC;
                  else
                    fsm_cic_sync_current_state <= START_SYNC;
                  end if;
                end if;
              end if;

            when START_SYNC =>
              if data_tag_en_i = '0' then
                fsm_cic_sync_current_state <= IDLE;
              else
                rst_modules <= '1';
                fsm_cic_sync_current_state <= SYNCHING;

                -- count desync occurence
                desync_cnt <= desync_cnt + 1;
              end if;

            when SYNCHING =>
              if data_tag_en_i = '0' then
                fsm_cic_sync_current_state <= IDLE;
              else
                -- tag transition
                if data_tag_change = '1' then
                  rst_modules <= '0';
                  fsm_cic_sync_current_state <= CHECK_SYNC;
                end if;
              end if;

            when others =>
              fsm_cic_sync_current_state <= IDLE;
          end case;

        end if;
      end if;
    end if;
  end process;

  data_tag_desync_cnt_o <= std_logic_vector(desync_cnt);
  rst_int <= rst_i or rst_modules;

  cmp_decimation_strober : decimation_strober
    generic map (
      g_maxrate   => g_max_rate,
      g_bus_width => g_bus_width)
    port map (
      clk_i    => clk_i,
      rst_i    => rst_int,
      ce_i     => ce_i,
      valid_i  => valid_d0,
      ratio_i  => ratio_i,
      strobe_o => decimation_strobe);

  cmp_cic_decim : cic_decim
    generic map (
      DATAIN_WIDTH     => g_input_width,
      DATAOUT_WIDTH    => g_output_width,
      M                => g_delay,
      N                => g_stages,
      MAXRATE          => g_max_rate,
      BITGROWTH        => integer(ceil(real(g_stages)*log2(real(g_delay)*real(g_max_rate)))),
      ROUND_CONVERGENT => g_round_convergent)
    port map (
      clk_i     => clk_i,
      rst_i     => rst_int,
      en_i      => ce_i,
      data_i    => data_d0,
      data_o    => data_out,
      act_i     => valid_d0,
      act_out_i => decimation_strobe_d0,
      val_o     => valid_out);

  gen_with_ce_sync : if g_with_ce_synch generate
    cmp_ce_synch : ce_synch
      generic map (
        g_data_width => g_output_width)
      port map (
        clk_i      => clk_i,
        rst_i      => rst_i,

        ce_in_i    => ce_i,
        data_i     => data_out,
        valid_i    => valid_out,

        ce_out_i   => ce_out_i,
        data_o     => data_o,
        valid_o    => valid_o);
    end generate;

    gen_without_ce_sync : if not(g_with_ce_synch) generate
      data_o <= data_out;
      valid_o <=valid_out;
    end generate;

end architecture str;

-------------------------------------------------------------------------------
