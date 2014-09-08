-------------------------------------------------------------------------------
-- Title      : DDC Chain testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ddc_bench.vhd
-- Author     : Gustavo BM Bruno
-- Company    : 
-- Created    : 2014-01-30
-- Last update: 2014-02-21
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Tests the testbench for DDC chain up to the FOFB rate amplitude
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-30  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity ddc_bench is
end ddc_bench;

architecture test of ddc_bench is
  constant input_freq        : real      := 1.1742939e08;
  constant mixer_freq        : real      := 3.0080435e07;
  constant sw_freq           : real      := input_freq/1000.0;
  constant clock_period      : time      := 1.0 sec /(2.0*input_freq);
  signal clock               : std_logic := '0';
  signal adc_data            : std_logic_vector(15 downto 0);
  signal endoffile           : bit       := '0';
  signal tvalid              : std_logic;
  signal amplitude           : std_logic_vector(31 downto 0);  -- output signal
  signal switch_sel          : std_logic;
  signal adc_ch1             : std_logic_vector(15 downto 0);  -- signal from the straight channel
  signal adc_ch2             : std_logic_vector(15 downto 0);  -- signal from the switched channel
  signal reset               : std_logic := '1';
  signal reset_n             : std_logic := '0';
  constant samples_to_switch : natural   := 5;

  component ddc_chain is
    generic (
      g_clk_freq : real;
      g_sw_freq  : real);
    port (
      signal reset_n_i : in  std_logic;
      signal clk_adc   : in  std_logic;
      signal adc_data  : in  std_logic_vector(15 downto 0);
      signal amplitude : out std_logic_vector(31 downto 0);
      signal tvalid    : out std_logic;
      signal switch_o  : out std_logic);
  end component ddc_chain;
  
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
        reset   <= '0';
        reset_n <= '1';
      end if;
    end if;
  end process;

  -- To simulate the different channels, the data file should have two columns
  -- per line, each for a different datapath. The switching process is then
  -- simulated by the testbench.
  sample_read : process(clock)
    file adc_file             : text open read_mode is "samples.dat";
    variable cur_line         : line;
    variable datain1, datain2 : real;
  begin
    if rising_edge(clock) then
      if not endfile(adc_file) then
        readline(adc_file, cur_line);

        read(cur_line, datain1);
        adc_ch1 <= std_logic_vector(to_signed(integer(datain1*(2.0**15.0)), 16));

        read(cur_line, datain2);
        adc_ch2 <= std_logic_vector(to_signed(integer(datain2*(2.0**15.0)), 16));
        
      else
        endoffile <= '1';
      end if;
    end if;
  end process sample_read;

  adc_switch : process(clock, switch_sel)
    variable samples_to_end : natural := samples_to_switch;
  begin
    
    if rising_edge(clock) then

      if samples_to_end > 0 then        --send zeros for some samples
        adc_data       <= std_logic_vector(to_signed(0, 16));
        samples_to_end := samples_to_end - 1;
      elsif switch_sel = '0' then       --now, send "real" samples
        adc_data <= adc_ch1;
      else
        adc_data <= adc_ch2;
      end if;

    end if;

    if switch_sel'event then
      samples_to_end := samples_to_switch;
    end if;

  end process adc_switch;

  uut : ddc_chain
    generic map (
      g_clk_freq => input_freq,
      g_sw_freq  => sw_freq)
    port map (
      reset_n_i => reset_n,
      clk_adc   => clock,
      adc_data  => adc_data,
      amplitude => amplitude,
      tvalid    => tvalid,
      switch_o  => switch_sel);

  signal_write : process(tvalid)
    file ddc_file     : text open write_mode is "ddc_out.dat";
    variable cur_line : line;
    variable output   : integer;
  begin
    if rising_edge(tvalid) then
      if(endoffile = '0') then

        output := to_integer(signed(amplitude));
        write(cur_line, output);
        writeline(ddc_file, cur_line);
        
      else
        assert (false) report "Input file finished." severity failure;
      end if;
    end if;
  end process;
  
end test;
