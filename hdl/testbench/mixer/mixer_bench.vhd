-------------------------------------------------------------------------------
-- Title      : Mixer testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mixer_bench.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS
-- Created    : 2014-01-21
-- Last update: 2015-03-13
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Tests the mixer stage of the BPM DSP chain.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-21  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

--library UNISIM;
--use UNISIM.vcomponents.all;

entity mixer_bench is
end mixer_bench;

architecture test of mixer_bench is
  constant c_input_freq : real := 112.8e6;
--  constant c_mixer_freq   : real    := 20.0e6;

  constant c_sin_file         : string  := "./dds_sin.nif";
  constant c_cos_file         : string  := "./dds_cos.nif";
  constant c_number_of_points : natural := 35;
  constant c_input_width      : natural := 16;
  constant c_dds_width        : natural := 16;
  constant c_output_width     : natural := 31;

  constant clock_period : time      := 1.0 sec / (2.0 * c_input_freq);
  signal clock          : std_logic := '0';
  signal adc_data       : std_logic_vector(c_input_width-1 downto 0);
  signal endoffile      : bit       := '0';
  signal reset          : std_logic := '1';
  signal I_sig          : std_logic_vector(c_output_width-1 downto 0);
  signal Q_sig          : std_logic_vector(c_output_width-1 downto 0);

  component mixer is
    generic (
      g_sin_file         : string;
      g_cos_file         : string;
      g_number_of_points : natural;
      g_input_width      : natural;
      g_dds_width        : natural;
      g_output_width     : natural);
    port (
      rst_i    : in  std_logic;
      clk_i    : in  std_logic;
      ce_i     : in  std_logic;
      signal_i : in  std_logic_vector(g_input_width-1 downto 0);
      I_out    : out std_logic_vector(g_output_width-1 downto 0);
      Q_out    : out std_logic_vector(g_output_width-1 downto 0));
  end component mixer;
  
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
  begin
    if rising_edge(clock) and clock_count /= 0 then
      clock_count := clock_count - 1;

      if clock_count = 0 then
        reset <= '0';
      end if;
    end if;
  end process;

  adc_read : process(clock)
    file adc_file     : text open read_mode is "mixer.samples";
    variable cur_line : line;
    variable datain   : real;
  begin
    if rising_edge(clock) and reset = '0' then

      if not endfile(adc_file) then
        readline(adc_file, cur_line);
        read(cur_line, datain);
        adc_data <= std_logic_vector(to_signed(integer(datain*(2.0**(real(c_input_width)-1.0))-1.0), c_input_width));
      else
        endoffile <= '1';
      end if;
      
    end if;
  end process adc_read;

  uut : mixer
    generic map (
      g_sin_file         => c_sin_file,
      g_cos_file         => c_cos_file,
      g_number_of_points => c_number_of_points,
      g_input_width      => c_input_width,
      g_dds_width        => c_dds_width,
      g_output_width     => c_output_width)
    port map (
      rst_i    => reset,
      clk_i    => clock,
      ce_i     => '1',
      signal_i => adc_data,
      I_out    => I_sig,
      Q_out    => Q_sig);


  signal_write : process(clock)
    file mixer_file   : text open write_mode is "mixer_out.samples";
    variable cur_line : line;
    variable I, Q     : integer;
  begin
    if rising_edge(clock) then
      if(endoffile = '0') then
        I := to_integer(signed(I_sig));
        write(cur_line, I);

        write(cur_line, string'(" "));

        Q := to_integer(signed(Q_sig));
        write(cur_line, Q);
        writeline(mixer_file, cur_line);
      else
        assert (false) report "Input file finished." severity failure;
      end if;
    end if;
  end process;
  
end test;
