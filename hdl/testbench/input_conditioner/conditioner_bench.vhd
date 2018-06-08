-------------------------------------------------------------------------------
-- Title      : Input Conditioner testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : conditioner_bench.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-02-01
-- Last update: 2014-02-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Input conditioner testbench
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-02-01  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity conditioner_bench is

end entity conditioner_bench;

architecture test of conditioner_bench is
  constant input_freq   : real      := 1.1742939e08;
  constant sw_freq      : real      := input_freq/1000.0;
  constant clock_period : time      := 1.0 sec /(2.0*input_freq);

  signal clock          : std_logic := '0';
  signal adc_ch1        : std_logic_vector(15 downto 0);  -- signal from the straight channel
  signal adc_ch2        : std_logic_vector(15 downto 0);  -- signal from the switched channel
  signal adc_data       : std_logic_vector(15 downto 0);  -- signal to the uut
  signal endoffile      : bit       := '0';

  constant samples_to_switch : natural   := 5;
  signal switch_sel          : std_logic := '0';
  signal data_out            : std_logic_vector(23 downto 0);

  component input_conditioner is
    generic (
      g_clk_freq : real;
      g_sw_freq  : real);
    port (
      rst_n_i     : in  std_logic;    -- Reset data
      clk_i         : in  std_logic;    -- Main clock
      adc_data_i    : in  std_logic_vector(15 downto 0);  -- Raw data from the ADC
      switch_o      : out std_logic;    -- Switch position output
      data_output_o : out std_logic_vector(23 downto 0));  -- Windowed output data
  end component input_conditioner;

begin  -- architecture test

  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period;
    clock <= '1';
    wait for clock_period;
  end process;



  -- To simulate the different channels, the data file should have two columns
  -- per line, each for a different datapath. The switching process is then
  -- simulated by the testbench.
  sample_read : process(clock)
    file adc_file             : text open read_mode is "amostras.dat";
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
      if samples_to_end > 0 then
        adc_data       <= std_logic_vector(to_signed(0, 16));
        samples_to_end := samples_to_end - 1;
      elsif switch_sel = '0' then
        adc_data <= adc_ch1;
      else
        adc_data <= adc_ch2;
      end if;
    end if;

    if switch_sel'event then
      samples_to_end := samples_to_switch;
    end if;

  end process adc_switch;

  uut : input_conditioner
    generic map(
      g_clk_freq => input_freq,
      g_sw_freq  => sw_freq)
    port map(
      rst_n_i     => '1',
      clk_i         => clock,
      adc_data_i    => adc_data,
      switch_o      => switch_sel,
      data_output_o => data_out);

  signal_write : process(clock)
    file conditioner_file            : text open write_mode is "conditioner_out.dat";
    variable cur_line                : line;
    variable data_input, data_output : integer;
  begin
    if rising_edge(clock) then
      if(endoffile = '0') then

        data_input := to_integer(signed(adc_data));
        write(cur_line, data_input);

        write(cur_line, string'(" "));

        data_output := to_integer(signed(data_out));
        write(cur_line, data_output);

        writeline(conditioner_file, cur_line);
      else
        assert (false) report "Input file finished." severity failure;
      end if;
    end if;
  end process;
  
end architecture test;
