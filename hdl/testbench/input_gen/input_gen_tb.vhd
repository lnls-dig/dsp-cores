-------------------------------------------------------------------------------
-- Title      : Input generator testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : input_gen_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-07-01
-- Last update: 2014-07-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simple testbench to validate input generator
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-07-01  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


library std;
use std.textio.all;

-------------------------------------------------------------------------------

entity input_gen_tb is
end entity input_gen_tb;

-------------------------------------------------------------------------------

architecture str of input_gen_tb is
  constant c_input_freq  : real := 120.0e6;
  constant c_half_period : time := 1.0 sec / (2.0 * c_input_freq);

  constant c_output_file : string  := "./input_gen.samples";
  constant c_ce_period   : natural := 2;  -- in number of clock cycles

  constant c_input_width  : natural := 16;
  constant c_output_width : natural := 32;
  constant c_ksum         : natural := 10000;

  -- Signals
  signal clock     : std_logic := '0';
  signal endoffile : bit       := '0';
  signal ce        : std_logic := '0';

  -- data signals

  signal x_in, y_in                 : std_logic_vector(c_input_width-1 downto 0);
  signal a_out, b_out, c_out, d_out : std_logic_vector(c_output_width-1 downto 0);


  component input_gen is
    generic (
      g_input_width  : natural;
      g_output_width : natural;
      g_ksum         : integer);
    port (
      x_i   : in  std_logic_vector(g_input_width-1 downto 0);
      y_i   : in  std_logic_vector(g_input_width-1 downto 0);
      clk_i : in  std_logic;
      ce_i  : in  std_logic;
      a_o   : out std_logic_vector(g_output_width-1 downto 0);
      b_o   : out std_logic_vector(g_output_width-1 downto 0);
      c_o   : out std_logic_vector(g_output_width-1 downto 0);
      d_o   : out std_logic_vector(g_output_width-1 downto 0));
  end component input_gen;
  
begin  -- architecture str

  clk_gen : process
  begin
    clock <= '0';
    wait for c_half_period;
    clock <= '1';
    wait for c_half_period;
  end process clk_gen;

  ce_gen : process(clock)
    variable ce_count : natural := 0;
  begin
    
    if rising_edge(clock) then
      ce_count := ce_count + 1;

      if ce_count = c_ce_period then
        ce       <= '1';
        ce_count := 0;
      else
        ce <= '0';
      end if;
      
    end if;
    
  end process;

  uut : input_gen
    generic map (
      g_input_width  => c_input_width,
      g_output_width => c_output_width,
      g_ksum         => c_ksum)
    port map (
      x_i   => x_in,
      y_i   => y_in,
      clk_i => clock,
      ce_i  => ce,
      a_o   => a_out,
      b_o   => b_out,
      c_o   => c_out,
      d_o   => d_out);

  data_gen : process
  begin

    for x_int in -99 to 99 loop
      x_in <= std_logic_vector(to_signed(x_int, c_input_width));

      for y_int in -99 to 99 loop
        wait until ce = '1';
        y_in <= std_logic_vector(to_signed(y_int, c_input_width));

      end loop;
    end loop;
    assert(false) report "end of input stream" severity failure;
  end process data_gen;

end architecture str;

-------------------------------------------------------------------------------
