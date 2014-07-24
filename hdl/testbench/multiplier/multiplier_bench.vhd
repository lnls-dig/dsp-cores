-------------------------------------------------------------------------------
-- Title      : Multiplier testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : multiplier_bench.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-02-01
-- Last update: 2014-02-26
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Multiplier testbench
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

entity multiplier_bench is

end entity multiplier_bench;

architecture test of multiplier_bench is
  constant input_freq   : real := 120.0e6;
  constant clock_period : time := 1.0 sec /(2.0*input_freq);

  signal clock     : std_logic := '0';
  signal endoffile : bit       := '0';

  signal a1 : std_logic_vector(15 downto 0);
  signal b1 : std_logic_vector(15 downto 0);
  signal p1 : std_logic_vector(15 downto 0);

  component generic_multiplier is
    generic (
      g_a_width : natural;
      g_b_width : natural;
      g_signed  : boolean;
      g_p_width : natural);
    port (
      a_i       : in  std_logic_vector(g_a_width-1 downto 0);
      b_i       : in  std_logic_vector(g_b_width-1 downto 0);
      p_o       : out std_logic_vector(g_p_width-1 downto 0);
      clk_i     : in  std_logic;
      reset_n_i : in  std_logic);
  end component generic_multiplier;
  
begin  -- architecture test

  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period;
    clock <= '1';
    wait for clock_period;
  end process;

  uut : generic_multiplier
    generic map(
      g_a_width => 16,
      g_b_width => 16,
      g_signed  => true,
      g_p_width => 16)
    port map(
      a_i       => a1,
      b_i       => b1,
      p_o       => p1,
      clk_i     => clock,
      reset_n_i => '1');

  b1 <= X"7FFF";

  -- FIXME: too simple of a test, requiring manual inspection. Improve it.
  single_test : process(clock)
    variable a_test : integer := -1000;
  begin
    if rising_edge(clock) then
      a1     <= std_logic_vector(to_signed(a_test, 16));
      a_test := a_test + 20;
      if a_test = 1000 then
        assert(false) report "Input file finished." severity failure;
      end if;
    end if;
  end process;
  
  
end architecture test;
