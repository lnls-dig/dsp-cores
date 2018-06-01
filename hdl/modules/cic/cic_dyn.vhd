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
    g_bus_width        : natural := 11;     -- Decimation ratio bus width.
    g_with_ce_synch    : boolean := false;
    g_tag_width        : natural := 1;      -- Input data tag width
    g_round_convergent : natural := 0
    );
  port (
    clock_i          : in  std_logic                                      := '0';
    reset_i          : in  std_logic                                      := '0';
    ce_i             : in  std_logic                                      := '0';
    ce_out_i         : in  std_logic                                      := '0';
    valid_i          : in  std_logic                                      := '1';
    data_i           : in  std_logic_vector(g_input_width-1 downto 0)     := (others => '0');
    data_tag_i       : in  std_logic_vector(g_tag_width-1 downto 0)       := (others => '0');
    data_tag_en_i    : in  std_logic                                      := '0';
    ratio_i          : in  std_logic_vector(g_bus_width-1 downto 0)       := (others => '0');
    data_o           : out std_logic_vector(g_output_width-1 downto 0)    := (others => '0');
    valid_o          : out std_logic                                      := '0'
    );

end entity cic_dyn;

-------------------------------------------------------------------------------

architecture str of cic_dyn is
  signal decimation_strobe : std_logic := '0';
  signal data_out          : std_logic_vector(g_output_width-1 downto 0) := (others => '0');
  signal valid_out         : std_logic                                   := '0';
  signal synch_int         : std_logic                                   := '0';

  type t_fsm_state is (IDLE, CHECK_SYNC, START_SYNC, SYNCHING);
  signal fsm_current_state : t_fsm_state := CHECK_SYNC;

  signal valid_d0          : std_logic := '0';
  signal data_d0           : std_logic_vector(g_input_width-1 downto 0) := (others => '0');
  signal data_tag_d0       : std_logic_vector(g_tag_width-1 downto 0) := (others => '0');
  signal data_tag_d1       : std_logic_vector(g_tag_width-1 downto 0) := (others => '0');
  signal reset_modules     : std_logic := '0';
  signal reset_int         : std_logic := '0';

  component decimation_strober
    generic (
      g_maxrate   : natural := 2048;
      g_bus_width : natural := 11);
    port (
      clock_i  : in  std_logic;
      reset_i  : in  std_logic;
      ce_i     : in  std_logic;
      valid_i  : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component;

begin  -- architecture str

  p_sync_cic_fsm : process(clock_i)
  begin
    if rising_edge(clock_i) then
      if reset_i = '1' then
        fsm_current_state <= IDLE;
        valid_d0 <= '0';
        data_d0 <= (others => '0');
        data_tag_d0 <= (others => '0');
        data_tag_d1 <= (others => '0');
        reset_modules <= '0';
      else
        if ce_i = '1' then

          -- We take one clock cycle to detect a transition and act on it.
          -- so, delay everyone by this same amount
          valid_d0 <= valid_i;
          data_d0 <= data_i;
          data_tag_d0 <= data_tag_i;
          -- To check for a transition we need another clock cycle. So, use a
          -- delayed version of data_tag
          data_tag_d1 <= data_tag_d0;

          -- FSM transitions
          case fsm_current_state is

            when IDLE =>
              -- CIC synchronization is disabled
              if data_tag_en_i = '0' then
                fsm_current_state <= IDLE;
              else
                fsm_current_state <= CHECK_SYNC;
              end if;

            when CHECK_SYNC =>
              if data_tag_en_i = '0' then
                fsm_current_state <= IDLE;
              else
                -- when we decimate the CIC, check if the next sample
                -- belongs to the next tag. This means that the CIC decimation
                -- cycle is synched with the tag
                if decimation_strobe = '1' then
                  -- tag transition
                  if data_tag_d0 /= data_tag_d1 then
                    -- CIC is synched with tag
                    fsm_current_state <= CHECK_SYNC;
                  else
                    fsm_current_state <= START_SYNC;
                  end if;
                end if;
              end if;

            WHEN START_SYNC =>
              if data_tag_en_i = '0' then
                fsm_current_state <= IDLE;
              else
                reset_modules <= '1';
                fsm_current_state <= SYNCHING;
              end if;

            when SYNCHING =>
              if data_tag_en_i = '0' then
                fsm_current_state <= IDLE;
              else
                -- tag transition
                if data_tag_i /= data_tag_d0 then
                  reset_modules <= '0';
                  fsm_current_state <= CHECK_SYNC;
                end if;
              end if;

            when others =>
              fsm_current_state <= IDLE;
          end case;

        end if;
      end if;
    end if;
  end process;

  reset_int <= reset_i or reset_modules;

  cmp_decimation_strober : decimation_strober
    generic map (
      g_maxrate   => g_max_rate,
      g_bus_width => g_bus_width)
    port map (
      clock_i  => clock_i,
      reset_i  => reset_int,
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
      clk_i     => clock_i,
      rst_i     => reset_int,
      en_i      => ce_i,
      data_i    => data_d0,
      data_o    => data_out,
      act_i     => valid_d0,
      act_out_i => decimation_strobe,
      val_o     => valid_out);

  gen_with_ce_sync : if g_with_ce_synch generate
    cmp_ce_synch : ce_synch
      generic map (
        g_data_width => g_output_width)
      port map (
        clk_i      => clock_i,
        rst_i      => reset_i,

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
