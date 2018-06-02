-------------------------------------------------------------------------------
-- Title      : Downconverter testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : downconv_bench.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS
-- Created    : 2014-04-16
-- Last update: 2014-06-05
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
  constant c_phase_width  : natural := 8;

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
  signal adc_data  : std_logic_vector(c_input_width-1 downto 0) := (others => '0');
  signal endoffile : bit       := '0';
  signal reset     : std_logic := '1';
  signal ce        : std_logic;

  signal I_out     : std_logic_vector(c_output_width-1 downto 0);
  signal Q_out     : std_logic_vector(c_output_width-1 downto 0);
  signal cic_valid : std_logic;

  component downconv is
    generic (
      g_input_width      : natural;
      g_mixed_width      : natural;
      g_output_width     : natural;
      g_phase_width      : natural;
      g_sin_file         : string;
      g_cos_file         : string;
      g_number_of_points : natural;
      g_diff_delay       : natural;
      g_stages           : natural;
      g_decimation_rate  : natural);
    port (
      signal_i : in  std_logic_vector(g_input_width-1 downto 0);
      clk_i    : in  std_logic;
      ce_i     : in  std_logic;
      rst_i    : in  std_logic;
      phase_i  : in  std_logic_vector(g_phase_width-1 downto 0);
      I_o      : out std_logic_vector(g_output_width-1 downto 0);
      Q_o      : out std_logic_vector(g_output_width-1 downto 0);
      valid_o  : out std_logic);
  end component downconv;


  component strobe_gen is
    generic (
      g_maxrate   : natural;
      g_bus_width : natural);
    port (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ce_i     : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component strobe_gen;
  
begin

  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period;
    clock <= '1';
    wait for clock_period;
  end process;

  strobe_gen_1 : strobe_gen
    generic map (
      g_maxrate   => 2,
      g_bus_width => 2)
    port map (
      clk_i    => clock,
      rst_i    => '0',
      ce_i     => '1',
      ratio_i  => std_logic_vector(to_unsigned(2, 2)),
      strobe_o => ce);

  rst_gen : process(clock)
    variable clock_count : natural := 10;
  begin
    if rising_edge(clock) then
      if clock_count /= 0 then
        clock_count := clock_count - 1;
      else
        reset <= '0';
      end if;
    end if;
  end process;

  adc_read : process(clock)
    file adc_file     : text open read_mode is "downconv.samples";
    variable cur_line : line;
    variable datain   : real;
  begin
    if rising_edge(clock) and reset = '0' then
      if ce = '1' then

        if not endfile(adc_file) then
          readline(adc_file, cur_line);
          read(cur_line, datain);
          adc_data <= std_logic_vector(to_signed(integer(datain*real(2**(c_input_width-1))), c_input_width));
        else
          endoffile <= '1';
        end if;
        
      end if;
    end if;
  end process adc_read;


  uut : downconv
    generic map (
      g_input_width      => c_input_width,
      g_mixed_width      => c_mixed_width,
      g_output_width     => c_output_width,
      g_phase_width      => c_phase_width,
      g_sin_file         => c_sin_file,
      g_cos_file         => c_cos_file,
      g_number_of_points => c_number_of_points,
      g_diff_delay       => c_diff_delay,
      g_stages           => c_stages,
      g_decimation_rate  => c_decimation_rate)
    port map (
      signal_i => adc_data,
      clk_i    => clock,
      ce_i     => ce,
      rst_i    => reset,
      phase_i  => std_logic_vector(to_unsigned(0, c_phase_width)),
      I_o      => I_out,
      Q_o      => Q_out,
      valid_o  => cic_valid);

  signal_write : process(reset, clock)
    file downconv_file        : text open write_mode is "downconv_out.samples";
    variable cur_line         : line;
    variable I, Q, mag, phase : integer;
  begin
    --put a header when simulation starts
    if falling_edge(reset) then
      write(cur_line, string'("I"));
      write(cur_line, ht);
      write(cur_line, string'("Q"));
      write(cur_line, ht);
    end if;

    if rising_edge(clock) then
      if(endoffile = '0') then
        if(cic_valid = '1') then
          I := to_integer(signed(I_out));
          write(cur_line, I);

          Q := to_integer(signed(Q_out));
          write(cur_line, ht);
          write(cur_line, Q);

          writeline(downconv_file, cur_line);
        end if;
      else
        assert (false) report "Input file finished." severity failure;
      end if;
      
    end if;
  end process;
  
end test;
