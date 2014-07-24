-------------------------------------------------------------------------------
-- Title      : Fixed DDS testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dds_bench.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-07
-- Last update: 2014-04-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testbench for the Fixed frequency DDS
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-07  1.0      aylons  Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity dds_bench is

end entity dds_bench;

architecture test of dds_bench is
  constant input_freq      : real    := 1.1742939e08;
  constant sw_freq         : real    := input_freq/1000.0;
  constant clock_period    : time    := 1.0 sec /(2.0*input_freq);
  constant cycles_to_reset : natural := 4;

  constant data_width       : natural := 16;
  constant number_of_points : natural := 203;
  constant sin_file         : string  := "./dds_sin.nif";
  constant cos_file         : string  := "./dds_cos.nif";


  signal clock   : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal ce      : std_logic := '1';

  signal sin_out : std_logic_vector(data_width-1 downto 0);
  signal cos_out : std_logic_vector(data_width-1 downto 0);

  component fixed_dds is
    generic (
      g_number_of_points : natural;
      g_output_width     : natural;
      g_sin_file         : string;
      g_cos_file         : string);
    port (
      clock_i   : in  std_logic;
      ce_i      : in  std_logic;
      reset_n_i : in  std_logic;
      sin_o     : out std_logic_vector(g_output_width-1 downto 0);
      cos_o     : out std_logic_vector(g_output_width-1 downto 0));
  end component fixed_dds;
  
begin
  
  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period;
    clock <= '1';
    wait for clock_period;
  end process;

  rst_gen : process(clock)
    variable clock_count : natural := cycles_to_reset;
  begin
    if rising_edge(clock) and clock_count /= 0 then
      clock_count := clock_count - 1;

      if clock_count = 0 then
        reset_n <= '1';
      end if;

    end if;
  end process;

  uut : fixed_dds
    generic map (
      g_number_of_points => number_of_points,
      g_output_width     => data_width,
      g_sin_file         => sin_file,
      g_cos_file         => cos_file)
    port map (
      clock_i   => clock,
      ce_i      => ce,
      reset_n_i => reset_n,
      sin_o     => sin_out,
      cos_o     => cos_out);

end architecture test;
