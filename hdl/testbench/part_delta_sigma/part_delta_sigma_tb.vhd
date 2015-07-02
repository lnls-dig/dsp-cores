-------------------------------------------------------------------------------
-- Title      : Delta over sigma testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : part_delta_sigma_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-19
-- Last update: 2015-07-02
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

entity part_delta_sigma_tb is
end entity part_delta_sigma_tb;

-------------------------------------------------------------------------------

architecture str of part_delta_sigma_tb is
  constant c_input_freq   : real    := 120.0e6;
  constant c_half_period  : time    := 1.0 sec / (2.0 * c_input_freq);
  constant c_ce_period    : natural := 2;    -- in number of clock cycles
  constant c_valid_period : natural := 100;  -- in number of ce cycles


  constant c_output_file : string  := "./part_delta_sigma.samples";
  constant c_width       : natural := 32;
  constant c_k           : real    := 2.0**real(c_width-2);
  constant c_k_width     : natural := 24;


  -- Signals
  signal clock     : std_logic := '0';
  signal endoffile : bit       := '0';
  signal ce        : std_logic := '0';
  signal reset     : std_logic := '0';
  signal valid     : std_logic := '0';
  signal valid_out : std_logic := '0';

  signal a, b, c, d : std_logic_vector(c_width-1 downto 0);

  signal x_in, y_in, q_in, sum_in     : real;
  signal x_out, y_out, q_out, sum_out : std_logic_vector(c_width-1 downto 0);
  constant c_kx                       : std_logic_vector(c_k_width-1 downto 0) := "011111111111111111111111";
  constant c_ky                       : std_logic_vector(c_k_width-1 downto 0) := "011111111111111111111111";
  constant c_ksum                     : std_logic_vector(c_k_width-1 downto 0) := "011111111111111111111111";

  component part_delta_sigma is
    generic (
      g_width   : natural;
      g_k_width : natural);
    port (
      a_i     : in  std_logic_vector(g_width-1 downto 0);
      b_i     : in  std_logic_vector(g_width-1 downto 0);
      c_i     : in  std_logic_vector(g_width-1 downto 0);
      d_i     : in  std_logic_vector(g_width-1 downto 0);
      kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      valid_o : out std_logic;
      rst_i   : in  std_logic;
      x_o     : out std_logic_vector(g_width-1 downto 0);
      y_o     : out std_logic_vector(g_width-1 downto 0);
      q_o     : out std_logic_vector(g_width-1 downto 0);
      sum_o   : out std_logic_vector(g_width-1 downto 0));
  end component part_delta_sigma;
  
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

  valid_gen : process(clock)
    variable valid_count : natural := 0;
  begin
    
    if rising_edge(clock) and ce = '1' then
      valid_count := valid_count + 1;

      if valid_count = c_valid_period then
        valid       <= '1';
        valid_count := 0;
      else
        valid <= '0';
      end if;
      
    end if;
    
  end process;

  data_gen : process
    variable x_temp, y_temp : real;
  begin

    wait until valid = '1';

    for x_int in -999 to 999 loop       --avoid extremes because the math is
                                        --not defined for them

      x_temp := real(x_int)/1000.0;
      x_in   <= x_temp;

      for y_int in -99 to 99 loop

        y_temp := real(y_int)/100.0;
        y_in   <= y_temp;

        a <= std_logic_vector(to_signed(integer(
          0.25*c_k*(-x_temp + y_temp + 1.0)),c_width));

        b <= std_logic_vector(to_signed(integer(
          0.25*c_k*(x_temp + y_temp + 1.0)),c_width));

        c <= std_logic_vector(to_signed(integer(
          0.25*c_k*(x_temp - y_temp + 1.0)),c_width));

        d <= std_logic_vector(to_signed(integer(
          0.25*c_k*(-x_temp - y_temp + 1.0)),c_width));

        wait until valid = '1';
      end loop;
    end loop;
    assert(false) report "end of input stream" severity failure;
  end process;


  output_check : process(clock)
    file samples_file                 : text open write_mode is "part_delta_sigma.samples";
    variable cur_line                 : line;
    variable x_diff, y_diff, sum_diff : real;

  begin

    if rising_edge(clock) and ce = '1' and valid_out = '1' then

      write(cur_line, x_in);
      write(cur_line, ht);
      write(cur_line, y_in);
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

  uut : part_delta_sigma
    generic map (
      g_width   => c_width,
      g_k_width => c_k_width)
    port map (
      a_i     => a,
      b_i     => b,
      c_i     => c,
      d_i     => d,
      kx_i    => c_kx,
      ky_i    => c_ky,
      ksum_i  => c_ksum,
      clk_i   => clock,
      rst_i   => reset,
      ce_i    => ce,
      valid_i => valid,
      valid_o => valid_out,
      x_o     => x_out,
      y_o     => y_out,
      q_o     => q_out,
      sum_o   => sum_out);

end architecture str;

-------------------------------------------------------------------------------

