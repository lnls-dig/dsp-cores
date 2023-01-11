-------------------------------------------------------------------------------
-- Title      : Fixed point division testbench
-------------------------------------------------------------------------------
-- Author     : Augusto Fraga Giachero
-- Company    : CNPEM LNLS-GIE
-- Platform   : Simulation
-- Standard   : VHDL 2008
-------------------------------------------------------------------------------
-- Description: Validate the div_fixedpoint against random numbers pairs
-------------------------------------------------------------------------------
-- Copyright (c) 2023 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2023-01-09  1.0      augusto.fraga         Created
-------------------------------------------------------------------------------

library ieee;

package fixed_trunc_pkg is new IEEE.fixed_generic_pkg
  generic map (
    fixed_round_style    => IEEE.fixed_float_types.fixed_truncate,
    fixed_overflow_style => IEEE.fixed_float_types.fixed_saturate,
    fixed_guard_bits     => 3,
    no_warning           => false
    );

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.arith_generic.all;
use work.fixed_trunc_pkg.all;

entity div_fixedpoint_tb is
  generic (
    g_DATAIN_WIDTH : integer range 2 to 48 := 32;
    g_PRECISION    : integer range 1 to 47 := 31
    );
end entity;

architecture div_fixedpoint_tb_arch of div_fixedpoint_tb is
  constant c_INT_WIDTH  : natural := (g_DATAIN_WIDTH - g_PRECISION) - 1;
  constant c_FRAC_WIDTH : natural := g_PRECISION;

  procedure f_gen_clk(constant freq : in    natural;
                      signal   clk  : inout std_logic) is
  begin
    loop
      wait for (0.5 / real(freq)) * 1 sec;
      clk <= not clk;
    end loop;
  end procedure f_gen_clk;

  procedure f_wait_cycles(signal   clk    : in std_logic;
                          constant cycles : natural) is
  begin
    for i in 1 to cycles loop
      wait until rising_edge(clk);
    end loop;
  end procedure f_wait_cycles;

  -- Wait for the input signal 'sig' to reach the value specified in the 'val'
  -- input, advance clock signals until the codition is met
  procedure f_wait_clocked_signal(signal clk : in std_logic;
                                  signal sig : in std_logic;
                                  val        : in std_logic;
                                  timeout    : in natural := 2147483647) is
  variable cnt : natural := timeout;
  begin
    while sig /= val and cnt > 0 loop
      wait until rising_edge(clk);
      cnt := cnt - 1;
    end loop;
  end procedure f_wait_clocked_signal;

  procedure f_pulse_signal(signal clk : in  std_logic;
                           signal sig : out std_logic) is
    begin
      sig <= '1';
      wait until rising_edge(clk);
      sig <= '0';
  end procedure f_pulse_signal;

  subtype t_sfixed_div_in is sfixed(c_INT_WIDTH downto -c_FRAC_WIDTH);

  type t_rand_gen is protected
    procedure genrand(signal num: out t_sfixed_div_in;
                      signal den: out t_sfixed_div_in);
  end protected t_rand_gen;

  type t_rand_gen is protected body
    variable s1: integer := 1600460924;
    variable s2: integer := 462006787;

    -- Generate random denominators and nominators for fixed point division.
    -- Guarantee that den is > 0, |den| > |num|
    procedure genrand(signal num: out t_sfixed_div_in;
                      signal den: out t_sfixed_div_in) is
      variable rand1, rand2: real;
      begin
        uniform(s1, s2, rand1);
        uniform(s1, s2, rand2);
        rand1 := (rand1 - 0.5) * 2.0;
        rand2 := (rand2 - 0.5) * 2.0;
        if abs(rand1) > abs(rand2) then
          den <= to_sfixed(abs(rand1), c_INT_WIDTH, -c_FRAC_WIDTH);
          num <= to_sfixed(rand2, c_INT_WIDTH, -c_FRAC_WIDTH);
        else
          den <= to_sfixed(abs(rand2), c_INT_WIDTH, -c_FRAC_WIDTH);
          num <= to_sfixed(rand1, c_INT_WIDTH, -c_FRAC_WIDTH);
        end if;
    end procedure genrand;
  end protected body t_rand_gen;

  function f_div_fixedpoint(num: signed; den: signed) return signed is
    variable num_ext : signed(num'high*2 downto 0) := (others => '0');
    variable num_tmp : num_ext'subtype;
    variable quo     : num'subtype := (others => '0');
    begin
      num_ext(num_ext'high downto num'high) := num;
      num_tmp := (num_ext / den);
      quo := num_tmp(den'high downto den'low);
      return quo;
  end function f_div_fixedpoint;

  function f_div_fixedpoint(num: sfixed; den: sfixed) return sfixed is
    begin
      return sfixed(f_div_fixedpoint(signed(to_slv(num)), signed(to_slv(den))));
  end function f_div_fixedpoint;

  signal clk           : std_logic := '0';
  signal rst           : std_logic := '1';
  signal valid_i       : std_logic := '0';
  signal valid_o       : std_logic;
  signal err           : std_logic;
  signal num           : t_sfixed_div_in := (others => '0');
  signal den           : t_sfixed_div_in := (others => '0');
  signal quo           : std_logic_vector(g_PRECISION downto 0);
  signal rema          : std_logic_vector(g_DATAIN_WIDTH-1 downto 0);

  shared variable numgen : t_rand_gen;

  begin

  cmp_div_fixp: div_fixedpoint
    generic map (
      g_DATAIN_WIDTH => g_DATAIN_WIDTH,
      g_PRECISION    => g_PRECISION
    )
    port map (
      clk_i => clk,
      rst_i => rst,
      ce_i  => '1',
      n_i   => to_slv(num),
      d_i   => to_slv(den),
      q_o   => quo,
      r_o   => rema,
      trg_i => valid_i,
      rdy_o => valid_o,
      err_o => err
    );

  f_gen_clk(100e6, clk);

  process
    variable quo_fp, quo_mockup : t_sfixed_div_in;
    begin
      f_wait_cycles(clk, 10);
      rst <= '0';

      -- Generate 2000 random number pairs to test the division
      for i in 1 to 2000 loop
        numgen.genrand(num, den);
        f_pulse_signal(clk, valid_i);
        f_wait_clocked_signal(clk, valid_o, '1');
        quo_fp := to_sfixed(quo, c_INT_WIDTH, -c_FRAC_WIDTH);
        quo_mockup := f_div_fixedpoint(num, den);
        -- TODO: Test the remainder output
        if quo_fp /= quo_mockup then
          report LF &
            "Test #" & to_string(i) & LF &
            "quo_fp =      " & to_string(quo_fp) & LF &
            "quo_mockup =  " & to_string(quo_mockup) & LF &
            "num = " & to_string(num) & " den = " & to_string(den) severity error;
        end if;

      end loop;
      std.env.finish;

  end process;
end architecture;
