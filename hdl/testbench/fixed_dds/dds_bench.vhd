-------------------------------------------------------------------------------
-- Title      : Fixed DDS testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dds_bench.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-07
-- Last update: 2015-03-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testbench for the fixed-frequency DDS
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
  constant number_of_points : natural := 35;
  constant c_phase_bus_size : natural := 0;
--  constant sin_file         : string  := "./dds_sin.nif";
--  constant cos_file         : string  := "./dds_cos.nif";

  signal clock   : std_logic := '0';
  signal rst_n   : std_logic := '0';
  signal ce      : std_logic := '1';

  signal cur_phase          : signed(c_phase_bus_size-1 downto 0) := (others => '0');
  constant phase_delay      : natural                             := 1;

  type delay_line_type is array (phase_delay downto 0) of std_logic_vector(c_phase_bus_size-1 downto 0);
  signal delayed_cur_phase  : delay_line_type                     := (others => (others => '0'));
  signal delayed_cur_sample : delay_line_type                     := (others => (others => '0'));

  signal sin_out : std_logic_vector(data_width-1 downto 0);
  signal cos_out : std_logic_vector(data_width-1 downto 0);

  component fixed_dds is
    generic (
      g_number_of_points : natural;
      g_output_width     : natural;
      g_phase_bus_size   : natural;
      g_sin_file         : string;
      g_cos_file         : string);
    port (
      clk_i       : in  std_logic;
      ce_i        : in  std_logic;
      rst_n_i   : in  std_logic;
      phase_sel_i : in  std_logic_vector(g_phase_bus_size-1 downto 0);
      sin_o       : out std_logic_vector(g_output_width-1 downto 0);
      cos_o       : out std_logic_vector(g_output_width-1 downto 0));
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
        rst_n   <= '1';
      end if;

    end if;
  end process;

  varying_phase : process(clock)
    variable cur_sample : natural range 0 to number_of_points := 0;
    file ouput_file     : text open write_mode is "dds_out.samples";
    variable cur_line   : line;
  begin

    if rising_edge(clock) then

      if rst_n   = '0' then
        cur_sample := 0;
        cur_phase  <= (others => '0');

      else

        if cur_sample = number_of_points-1 then
          cur_sample := 0;
          cur_phase  <= cur_phase + to_signed(1, c_phase_bus_size);
        else
          cur_sample := cur_sample+1;
        end if;

        for n in phase_delay downto 1 loop
          delayed_cur_phase(n)  <= delayed_cur_phase(n-1);
          delayed_cur_sample(n) <= delayed_cur_sample(n-1);
        end loop;

        delayed_cur_sample(0) <= std_logic_vector(to_signed(cur_sample, c_phase_bus_size));
        delayed_cur_phase(0)  <= std_logic_vector(cur_phase);
      end if;  --rst_n   = '0'

    end if;
  end process;

  uut : fixed_dds
    generic map (
      g_number_of_points => number_of_points,
      g_output_width     => data_width,
      g_phase_bus_size   => c_phase_bus_size,
      g_sin_file         => sin_file,
      g_cos_file         => cos_file)
    port map (
      clk_i       => clock,
      ce_i        => ce,
      rst_n_i   => rst_n,
      phase_sel_i => std_logic_vector(cur_phase),
      sin_o       => sin_out,
      cos_o       => cos_out);

end architecture test;
