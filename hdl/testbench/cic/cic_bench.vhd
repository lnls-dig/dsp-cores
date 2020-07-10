-------------------------------------------------------------------------------
-- Title      : CIC testbench
-- Project    :
-------------------------------------------------------------------------------
-- File       : cic_bench.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-03-10
-- Last update: 2016-05-06
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testbench for generic CIC filter
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-10  1.0  aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.swap_pkg.all;

-------------------------------------------------------------------------------

entity cic_bench is
end entity cic_bench;


architecture str of cic_bench is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  constant c_input_freq      : real    := 100.0e6;
  constant c_clock_period    : time    := 1.0 sec /(2.0*c_input_freq);
  constant c_delay_period    : time    := c_clock_period;
  constant c_cycles_to_reset : natural := 4;

  signal clock   : std_logic := '0';
  signal reset   : std_logic := '1';
  signal reset_n   : std_logic := '0';
  signal ce      : std_logic := '1';
  signal ce_out  : std_logic := '1';
  signal sw_out  : std_logic := '0';
  signal data_tag : std_logic_vector(0 downto 0) := "0";
  signal data_tag_en : std_logic := '0';
  signal valid       : std_logic := '0';
  signal freqgen_en  : std_logic := '0';

  constant c_input_width     : natural := 24;
  constant c_output_width    : natural := c_input_width + 9;
  constant c_diff_delay      : natural := 1;
  constant c_stages          : natural := 1;
  constant c_decimation_rate : natural := 32;
  constant c_decimation_rate_log2 : natural := natural(ceil(log2(real(c_decimation_rate+1))));
  constant c_bus_width       : natural := natural(ceil(log2(real(c_decimation_rate))))+2;
  constant c_data_mask_width : natural := 10;

  signal data_mask_beg_num_samples  : unsigned(c_data_mask_width-1 downto 0) := to_unsigned(10, c_data_mask_width);
  signal data_mask_end_num_samples  : unsigned(c_data_mask_width-1 downto 0) := to_unsigned(10, c_data_mask_width);
  --signal data_mask_end_num_samples  : unsigned(c_data_mask_width-1 downto 0) := to_unsigned(2, c_data_mask_width);
  signal data_mask_en           : std_logic := '0';

  signal data_in   : std_logic_vector(c_input_width-1 downto 0) := (others => '0');
  signal data_out  : std_logic_vector(c_output_width-1 downto 0);
  signal cic_valid : std_logic;
  signal valid_tr : std_logic;
  signal sync_trig : std_logic := '0';
  signal endoffile : std_logic := '0';

  component cic_dyn is
    generic (
      g_input_width      : natural := 16;
      g_output_width     : natural := 16;
      g_stages           : natural := 1;      -- aka "N"
      g_delay            : natural := 1;      -- aka "M"
      g_max_rate         : natural := 2048;   -- Max decimation rate
      g_bus_width        : natural := 11;     -- Decimation ratio bus width.
      g_with_ce_synch    : boolean := false;
      g_tag_width        : natural := 1;      -- Input data tag width
      g_data_mask_width  : natural := 10;     -- Input data mask width
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
      data_mask_num_samples_beg_i : in  unsigned(g_data_mask_width-1 downto 0)  := (others => '0');
      data_mask_num_samples_end_i : in  unsigned(g_data_mask_width-1 downto 0)  := (others => '0');
      data_mask_en_i   : in  std_logic                                      := '0';
      ratio_i          : in  std_logic_vector(g_bus_width-1 downto 0)       := (others => '0');
      data_o           : out std_logic_vector(g_output_width-1 downto 0)    := (others => '0');
      valid_o          : out std_logic                                      := '0'
      );
  end component cic_dyn;

begin  -- architecture str


  clk_gen : process
  begin
    clock <= '1';
    wait for c_clock_period/2;
    clock <= '0';
    wait for c_clock_period/2;
  end process;

  ce_gen : process
  begin
    if reset = '0' then
      ce_out <= '0';
      ce <= '0';
      wait for 3*c_clock_period;
      ce_out <= '1';
      ce <= '1';
      wait for c_clock_period;
    else
      ce_out <= '0';
      ce <= '0';
      wait for c_clock_period;
    end if;
  end process;

  valid_tr_gen : process
  begin
    if reset = '0' then
      valid_tr <= '0';
      wait for 11*c_clock_period;
      valid_tr <= '1';
      wait for c_clock_period;
    else
      valid_tr <= '0';
      wait for c_clock_period;
    end if;
  end process;

  sync_trig_gen : process
  begin
    if reset = '0' then
      wait for (12*c_decimation_rate-1)*c_clock_period;
      sync_trig <= '1';
      wait for c_clock_period;
      sync_trig <= '0';
    else
      sync_trig <= '0';
      wait for (4043+5)*c_delay_period;
    end if;
  end process;

  cmp_tag : entity work.swap_freqgen
  generic map (
    g_delay_vec_width                       => 10,
    g_swap_div_freq_vec_width               => c_decimation_rate_log2
  )
  port map (
    clk_i                                   => clock,
    rst_n_i                                 => reset_n,
    en_i                                    => ce,

    sync_trig_i                             => sync_trig,

    -- Swap and de-swap signals
    swap_o                                  => open,
    deswap_o                                => sw_out,
    swap_mode_i                             => c_swmode_swap_deswap,
    swap_div_f_i                            => std_logic_vector(to_unsigned(c_decimation_rate,
                                                                            c_decimation_rate_log2)),
    swap_div_f_cnt_en_i                     => valid,
    deswap_delay_i                          => (others => '0')
  );

  --sw_gen : process
  --begin
  --  if reset = '0' then
  --    sw_out <= '1';
  --    wait for c_decimation_rate*c_clock_period;
  --    sw_out <= '0';
  --    wait for c_decimation_rate*c_clock_period;
  --  else
  --    sw_out <= '0';
  --    wait for 3*c_clock_period;
  --  end if;
  --end process;

  data_tag(0) <= sw_out;

  data_tag_en_gen : process
  begin
    data_tag_en <= '0';
    wait for 200*c_clock_period;
    data_tag_en <= '1';
    wait;
  end process;

  mask_gen : process
  begin
    data_mask_en <= '0';
    wait for 10*c_clock_period;
    data_mask_en <= '0';
    wait for 1000*c_clock_period;
    data_mask_en <= '1';
    wait;
  end process;

  rst_gen : process(clock)
    variable clock_count : natural := c_cycles_to_reset;
  begin
    if rising_edge(clock) and clock_count /= 0 then
      clock_count := clock_count - 1;

      if clock_count = 0 then
        reset <= '0';
      end if;

    end if;
  end process;

  reset_n <= not reset;


  --input_read : process(clock)
  --  file data_file    : text open read_mode is "cic.samples";
  --  variable cur_line : line;
  --  variable datain   : integer;
  --begin
  --  if rising_edge(clock) and reset = '0' then
  --    if not endfile(data_file) and valid_tr = '1' then
  --      readline(data_file, cur_line);
  --      read(cur_line, datain);
  --      data_in <= std_logic_vector(to_signed(datain, c_input_width));
  --      valid <= '1';
  --    --else
  --    elsif ce = '1' then
  --      --endoffile <= '1';
  --      valid <= '0';
  --    end if;
  --  end if;
  --end process input_read;

  input_read : process(clock)
    file data_file    : text open read_mode is "cic.samples";
    variable cur_line : line;
    variable datain   : integer;
  begin
    if rising_edge(clock) and reset = '0' and ce = '1' then
      if not endfile(data_file) and valid_tr = '1' then
        readline(data_file, cur_line);
        read(cur_line, datain);
        data_in <= std_logic_vector(to_signed(datain, c_input_width));
        valid <= '1';
      else
        --endoffile <= '1';
        valid <= '0';
      end if;
    end if;
  end process input_read;

  uut : cic_dyn
    generic map (
      g_input_width              => c_input_width,
      g_output_width             => c_output_width,
      g_stages                   => c_stages,
      g_delay                    => c_diff_delay,
      g_max_rate                 => c_decimation_rate,
      g_with_ce_synch            => true,
      g_bus_width                => c_bus_width,
      g_round_convergent         => 1)
    port map (
      clk_i                      => clock,
      rst_i                      => reset,
      ce_i                       => ce,
      ce_out_i                   => ce_out,
      valid_i                    => valid,
      data_i                     => data_in,
      data_tag_i                 => data_tag,
      data_tag_en_i              => data_tag_en,
      data_mask_num_samples_beg_i => data_mask_beg_num_samples,
      data_mask_num_samples_end_i => data_mask_end_num_samples,
      data_mask_en_i             => data_mask_en,
      ratio_i                    => std_logic_vector(to_unsigned(c_decimation_rate, c_bus_width)),
      data_o                     => data_out,
      valid_o                    => cic_valid);

  output_write : process(cic_valid)
    file ouput_file   : text open write_mode is "cic_out.samples";
    variable cur_line : line;
    variable data     : integer;
  begin

    if rising_edge(cic_valid) then
      if(endoffile = '0') then
        data := to_integer(signed(data_out));

        write(cur_line, data);
        writeline(ouput_file, cur_line);
      else
        assert (false) report "Input file finished." severity failure;
      end if;
    end if;
  end process output_write;


end architecture str;

-------------------------------------------------------------------------------

