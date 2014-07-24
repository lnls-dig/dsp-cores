-------------------------------------------------------------------------------
-- Title      : Downconverter testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : downconv_bench.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS
-- Created    : 2014-04-16
-- Last update: 2014-04-17
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Tests the downconversion integration.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-04-16  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity downconv_bench is
end downconv_bench;

architecture test of downconv_bench is
  constant c_input_freq : real := 120.0e6;
  constant clock_period : time := 1.0 sec / (2.0 * c_input_freq);

  -- Bus widths
  constant c_input_width  : natural := 24;
  constant c_mixed_width  : natural := 24;
  constant c_output_width : natural := 32;

  -- Mixer parameters
  constant c_sin_file         : string  := "./dds_sin.nif";
  constant c_cos_file         : string  := "./dds_cos.nif";
  constant c_number_of_points : natural := 6;

  -- CIC parameters
  constant c_diff_delay      : natural := 2;
  constant c_stages          : natural := 3;
  constant c_decimation_rate : natural := 1000;
  constant c_bus_width       : natural := natural(ceil(log2(real(c_decimation_rate))));

  -- Signals
  signal clock     : std_logic := '0';
  signal adc_data  : std_logic_vector(c_input_width-1 downto 0);
  signal endoffile : bit       := '0';
  signal reset_n   : std_logic := '0';
  signal ce        : std_logic := '0';

  signal I_sig : std_logic_vector(c_mixed_width-1 downto 0);
  signal Q_sig : std_logic_vector(c_mixed_width-1 downto 0);

  signal I_out     : std_logic_vector(c_output_width-1 downto 0);
  signal Q_out     : std_logic_vector(c_output_width-1 downto 0);
  signal cic_valid : std_logic;

  component mixer is
    generic (
      g_sin_file         : string;
      g_cos_file         : string;
      g_number_of_points : natural;
      g_input_width      : natural;
      g_output_width     : natural);
    port (
      reset_n_i : in  std_logic;
      clock_i   : in  std_logic;
      signal_i  : in  std_logic_vector;
      I_out     : out std_logic_vector;
      Q_out     : out std_logic_vector);
  end component mixer;

  component cic_dyn is
    generic (
      g_input_width  : natural;
      g_output_width : natural;
      g_stages       : natural;
      g_delay        : natural;
      g_max_rate     : natural;
      g_bus_width    : natural);
    port (
      clock_i   : in  std_logic;
      reset_n_i : in  std_logic;
      ce_i      : in  std_logic;
      data_i    : in  std_logic_vector;
      ratio_i   : in  std_logic_vector;
      data_o    : out std_logic_vector;
      valid_o   : out std_logic);
  end component cic_dyn;
  
begin

  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period;
    clock <= '1';
    wait for clock_period;
  end process;

  rst_gen : process(clock)
    variable clock_count : natural := 4;
    variable ce_count    : natural := 7;
  begin
    if rising_edge(clock) then
      if clock_count /= 0 then
        clock_count := clock_count - 1;
      else
        reset_n <= '1';
      end if;
      
      if ce_count /= 0 then
        ce_count := ce_count - 1;
      else
        ce <= '1';
      end if;

    end if;
  end process;

  adc_read : process(clock)
    file adc_file     : text open read_mode is "downconv.samples";
    variable cur_line : line;
    variable datain   : real;
  begin
    if rising_edge(clock) and reset_n = '1' then

      if not endfile(adc_file) then
        readline(adc_file, cur_line);
        read(cur_line, datain);
        adc_data <= std_logic_vector(to_signed(integer(datain*real(2**(c_input_width-1))), c_input_width));
      else
        endoffile <= '1';
      end if;
      
    end if;
  end process adc_read;

  uut1 : mixer
    generic map (
      g_sin_file         => c_sin_file,
      g_cos_file         => c_cos_file,
      g_number_of_points => c_number_of_points,
      g_input_width      => c_input_width,
      g_output_width     => c_mixed_width)
    port map (
      reset_n_i => reset_n,
      clock_i   => clock,
      signal_i  => adc_data,
      I_out     => I_sig,
      Q_out     => Q_sig);

  uut_cic_I : cic_dyn
    generic map (
      g_input_width  => c_mixed_width,
      g_output_width => c_output_width,
      g_stages       => c_stages,
      g_delay        => c_diff_delay,
      g_max_rate     => c_decimation_rate,
      g_bus_width    => c_bus_width)
    port map (
      clock_i   => clock,
      reset_n_i => reset_n,
      ce_i      => ce,
      data_i    => I_sig,
      ratio_i   => std_logic_vector(to_unsigned(c_decimation_rate, c_bus_width)),
      data_o    => I_out,
      valid_o   => cic_valid);

  uut_cic_Q : cic_dyn
    generic map (
      g_input_width  => c_mixed_width,
      g_output_width => c_output_width,
      g_stages       => c_stages,
      g_delay        => c_diff_delay,
      g_max_rate     => c_decimation_rate,
      g_bus_width    => c_bus_width)
    port map (
      clock_i   => clock,
      reset_n_i => reset_n,
      ce_i      => ce,
      data_i    => Q_sig,
      ratio_i   => std_logic_vector(to_unsigned(c_decimation_rate, c_bus_width)),
      data_o    => Q_out,
      valid_o   => cic_valid);



  signal_write : process(cic_valid)
    file downconv_file : text open write_mode is "downconv_out.samples";
    variable cur_line  : line;
    variable I, Q      : integer;
  begin
    if rising_edge(cic_valid) then
      if(endoffile = '0') then
        I := to_integer(signed(I_out));
        write(cur_line, I);

        write(cur_line, string'(" "));

        Q := to_integer(signed(Q_out));
        write(cur_line, Q);
        writeline(downconv_file, cur_line);
      else
        assert (false) report "Input file finished." severity failure;
      end if;
    end if;
  end process;
  
end test;
