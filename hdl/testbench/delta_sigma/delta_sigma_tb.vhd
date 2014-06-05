-------------------------------------------------------------------------------
-- Title      : Delta over sigma testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : delta_sigma_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-19
-- Last update: 2014-05-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Tests delta over sigma calculation
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-19  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

--use work.arith_dsp48e.all;
--use work.utilities.all;

-------------------------------------------------------------------------------

entity delta_sigma_tb is
end entity delta_sigma_tb;

-------------------------------------------------------------------------------

architecture str of delta_sigma_tb is
  constant c_input_freq  : real    := 120.0e6;
  constant c_half_period : time    := 1.0 sec / (2.0 * c_input_freq);
  constant c_ce_period   : natural := 100;  -- in number of clock cycles

  constant c_output_file : string  := "./delta_sigma.samples";
  constant c_width       : natural := 32;
  constant c_k           : real    := 2.0**real(c_width-2);
  constant c_k_width     : natural := 24;
  constant c_delay       : natural := 3;


  -- Signals
  signal clock     : std_logic := '0';
  signal endoffile : bit       := '0';
  signal ce        : std_logic := '0';
  signal reset     : std_logic := '0';

  signal a, b, c, d : std_logic_vector(c_width-1 downto 0);

  signal x_in, y_in, q_in, sum_in     : real;
  signal x_out, y_out, q_out, sum_out : std_logic_vector(c_width-1 downto 0);
  constant c_kx                       : std_logic_vector(c_k_width-1 downto 0) := "011111111111111111111111";
  constant c_ky                       : std_logic_vector(c_k_width-1 downto 0) := "011111111111111111111111";
  constant c_ksum                     : std_logic_vector(c_k_width-1 downto 0) := "011111111111111111111111";

  component delta_sigma is
    generic (
      g_width   : natural;
      g_k_width : natural);
    port (
      a_i    : in  std_logic_vector(g_width-1 downto 0);
      b_i    : in  std_logic_vector(g_width-1 downto 0);
      c_i    : in  std_logic_vector(g_width-1 downto 0);
      d_i    : in  std_logic_vector(g_width-1 downto 0);
      kx_i   : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i   : in  std_logic_vector(g_k_width-1 downto 0);
      ksum_i : in  std_logic_vector(g_k_width-1 downto 0);
      clk_i  : in  std_logic;
      ce_i   : in  std_logic;
      rst_i  : in  std_logic;
      x_o    : out std_logic_vector(g_width-1 downto 0);
      y_o    : out std_logic_vector(g_width-1 downto 0);
      q_o    : out std_logic_vector(g_width-1 downto 0);
      sum_o  : out std_logic_vector(g_width-1 downto 0));
  end component delta_sigma;
  
begin  -- architecture str

  clk_gen : process
  begin
    clock <= '0';
    wait for c_half_period;
    clock <= '1';
    wait for c_half_period;

  end process;

  rst_gen : process(clock)
    constant clocks_to_reset : natural := 1;
    variable reset_count     : natural := 0;
  begin

    if rising_edge(clock) then

      if reset_count = 0 then
        reset       <= '1';
        reset_count := reset_count + 1;
      elsif reset_count = clocks_to_reset then
        reset <= '0';
      else
        reset_count := reset_count +1;
      end if;

    end if;
    
  end process;

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

  data_gen : process
  begin

    for x_int in -999 to 999 loop       --avoid extreme because the math is
                                        --not defined for them

      x_in <= real(x_int)/1000.0;

      for y_int in -99 to 99 loop
        wait until ce = '1';

        y_in <= real(y_int)/100.0;

        a <= std_logic_vector(to_signed(integer(
          0.25*c_k*(-x_in + y_in + 1.0)),c_width));

        b <= std_logic_vector(to_signed(integer(
          0.25*c_k*(x_in + y_in + 1.0)),c_width));

        c <= std_logic_vector(to_signed(integer(
          0.25*c_k*(x_in - y_in + 1.0)),c_width));

        d <= std_logic_vector(to_signed(integer(
          0.25*c_k*(-x_in - y_in + 1.0)),c_width));

      end loop;
    end loop;
    assert(false) report "end of input stream" severity failure;
  end process;

  output_check : process(ce)
    file samples_file                 : text open write_mode is "delta_sigma.samples";
    variable cur_line                 : line;
    variable x_diff, y_diff, sum_diff : real;

    type delay_chain is array(c_delay downto 0) of real;
    variable x_delay, y_delay : delay_chain;

  begin

    if rising_edge(ce) then

      for i in c_delay downto 1 loop
        x_delay(i) := x_delay(i-1);
        y_delay(i) := y_delay(i-1);
      end loop;

      x_delay(0) := x_in;
      y_delay(0) := y_in;

      write(cur_line, x_delay(c_delay));
      write(cur_line, ht);
      write(cur_line, y_delay(c_delay));
      write(cur_line, ht);

      write(cur_line, to_integer(signed(x_out)));
      write(cur_line, ht);
      write(cur_line, to_integer(signed(y_out)));
      write(cur_line, ht);

      write(cur_line, to_integer(signed(q_out)));
      write(cur_line, ht);
      write(cur_line, to_integer(signed(sum_out)));
      write(cur_line, ht);

      writeline(samples_file, cur_line);

      -- compare results directly
      x_diff   := real(to_integer(signed(x_out)))/2.0**31.0 - x_in;
      y_diff   := real(to_integer(signed(y_out)))/2.0**31.0 - y_in;
      sum_diff := real(to_integer(signed(sum_out)))/2.0**31.0 - sum_in;

      --assert x_diff < x_in/(10.0**5.0)
      --  report "x difference too big"
      --  severity failure;
      
    end if;
  end process;

  uut : delta_sigma
    generic map (
      g_width   => c_width,
      g_k_width => c_k_width)
    port map (
      a_i    => a,
      b_i    => b,
      c_i    => c,
      d_i    => d,
      kx_i   => c_kx,
      ky_i   => c_ky,
      ksum_i => c_ksum,
      clk_i  => clock,
      rst_i  => reset,
      ce_i   => ce,
      x_o    => x_out,
      y_o    => y_out,
      q_o    => q_out,
      sum_o  => sum_out);

end architecture str;

-------------------------------------------------------------------------------

