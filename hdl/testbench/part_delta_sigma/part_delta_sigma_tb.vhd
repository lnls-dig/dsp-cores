-------------------------------------------------------------------------------
-- Title      : Partial delta/sigma core testbench
-- Project    :
-------------------------------------------------------------------------------
-- File       : part_delta_sigma_tb.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    :
-- Created    : 2015-07-15
-- Last update: 2022-10-21
-- Platform   : Simulation
-- Standard   : VHDL 2008
-------------------------------------------------------------------------------
-- Description: Reads BPM antennas' data from file, drives part_delta_sigma
--              core checks its outputs against expected values.
-------------------------------------------------------------------------------
-- Copyright (c) 2015
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author            Description
-- 2015-07-15  1.0      finotti           Created
-- 2022-10-21  2.0      guilherme.ricioli Rewriten
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.env.finish;
use std.textio.all;

entity part_delta_sigma_tb is
  generic (
    g_BPM_ANTENNAS_FILE : string  := "../bpm_a_b_c_d_readings.dat";
    g_KX                : natural := 1000;
    g_KY                : natural := 1000;
    g_KSUM              : natural := 1000;
    g_OFFSET_X          : integer := 10000;
    g_OFFSET_Y          : integer := 10000
  );
end entity part_delta_sigma_tb;

architecture part_delta_sigma_tb_arch of part_delta_sigma_tb is
  -- constants
  constant c_SYS_CLOCK_FREQ     : natural := 100_000_000;

  constant c_WIDTH              : natural := 32;
  constant c_K_WIDTH            : natural := 24;
  constant c_OFFSET_WIDTH       : natural := 32;

  constant c_KX                 :
    std_logic_vector(c_K_WIDTH-1 downto 0) :=
      std_logic_vector(to_unsigned(g_KX, c_K_WIDTH));
  constant c_KY                 :
    std_logic_vector(c_K_WIDTH-1 downto 0) :=
      std_logic_vector(to_unsigned(g_KY, c_K_WIDTH));
  constant c_KSUM               :
    std_logic_vector(c_K_WIDTH-1 downto 0) :=
      std_logic_vector(to_unsigned(g_KSUM, c_K_WIDTH));
  constant c_OFFSET_X           :
    std_logic_vector(c_OFFSET_WIDTH-1 downto 0) :=
      std_logic_vector(to_unsigned(g_OFFSET_X, c_OFFSET_WIDTH));
  constant c_OFFSET_Y           :
    std_logic_vector(c_OFFSET_WIDTH-1 downto 0) :=
      std_logic_vector(to_unsigned(g_OFFSET_Y, c_OFFSET_WIDTH));

  -- part_delta_sigma internal div_fixedpoint cores aren't pipelined, so we must
  -- wait for its delay to feed another reading
  constant c_PDS_HARD_INP_DELAY : natural := 33;

  -- signals
  signal clk                    : std_logic := '0';
  signal rst                    : std_logic := '0';

  signal ce                     : std_logic := '0';
  signal a_b_c_d_valid          : std_logic := '0';
  signal x_y_q_sum_valid        : std_logic := '0';

  signal a, b, c, d             : std_logic_vector(c_WIDTH-1 downto 0);
  signal x, y, q, sum           : std_logic_vector(c_WIDTH-1 downto 0);

  component part_delta_sigma is
    generic (
      g_WIDTH         : natural;
      g_K_WIDTH       : natural;
      g_OFFSET_WIDTH  : natural
    );
    port (
      clk_i           : in std_logic;
      rst_i           : in std_logic;
      a_i             : in std_logic_vector(g_WIDTH-1 downto 0);
      b_i             : in std_logic_vector(g_WIDTH-1 downto 0);
      c_i             : in std_logic_vector(g_WIDTH-1 downto 0);
      d_i             : in std_logic_vector(g_WIDTH-1 downto 0);
      kx_i            : in std_logic_vector(g_K_WIDTH-1 downto 0);
      ky_i            : in std_logic_vector(g_K_WIDTH-1 downto 0);
      ksum_i          : in std_logic_vector(g_K_WIDTH-1 downto 0);
      offset_x_i      : in std_logic_vector(g_OFFSET_WIDTH-1 downto 0);
      offset_y_i      : in std_logic_vector(g_OFFSET_WIDTH-1 downto 0);
      ce_i            : in std_logic;
      valid_i         : in std_logic;
      x_o             : out std_logic_vector(g_WIDTH-1 downto 0);
      y_o             : out std_logic_vector(g_WIDTH-1 downto 0);
      q_o             : out std_logic_vector(g_WIDTH-1 downto 0);
      sum_o           : out std_logic_vector(g_WIDTH-1 downto 0);
      valid_o         : out std_logic
    );
  end component part_delta_sigma;

  -- procedures
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

  -- functions
  -- calculates fixed point position based on pds_scaling_stage internal
  -- multiplications
  function f_calc_fp_pos (a_int_width : natural;
                          b_int_width : natural;
                          p_width     : natural)
  return integer is
    variable v_mult_int_width : natural := a_int_width + b_int_width;
    variable v_ret : integer;
  begin
    v_ret := (p_width - v_mult_int_width) + 1;

    return v_ret;
  end f_calc_fp_pos;

  function f_fp_to_real (arg : std_logic_vector; fp_pos : integer)
  return real is
    variable v_ret : real := real(to_integer(signed(arg)));
  begin
    v_ret := v_ret/(2.0**(fp_pos));

    return v_ret;
  end f_fp_to_real;

begin
  f_gen_clk(c_SYS_CLOCK_FREQ, clk);

  -- main process
  process
    file fin : text;
    variable lin : line;
    variable meas_idx : natural := 0;
    variable v_a, v_b, v_c, v_d : integer;
  begin
    -- resetting cores
    report "resetting cores"
    severity note;

    rst <= '1';
    f_wait_cycles(clk, 1);

    rst <= '0';
    f_wait_cycles(clk, 10);

    file_open(fin, g_BPM_ANTENNAS_FILE, read_mode);
    f_wait_clocked_signal(clk, ce, '0');
    while not endfile(fin)
    loop
      readline(fin, lin); read(lin, v_a);
      readline(fin, lin); read(lin, v_b);
      readline(fin, lin); read(lin, v_c);
      readline(fin, lin); read(lin, v_d);

      -- driving a, b, c and d
      a <= std_logic_vector(to_signed(v_a, c_WIDTH));
      b <= std_logic_vector(to_signed(v_b, c_WIDTH));
      c <= std_logic_vector(to_signed(v_c, c_WIDTH));
      d <= std_logic_vector(to_signed(v_d, c_WIDTH));
      a_b_c_d_valid <= '1';
      -- waiting for a ce pulse
      f_wait_clocked_signal(clk, ce, '1');
      f_wait_clocked_signal(clk, ce, '0');

      a_b_c_d_valid <= '0';
      f_wait_cycles(ce, c_PDS_HARD_INP_DELAY);

      meas_idx := meas_idx + 1;
    end loop;

    f_wait_cycles(ce, c_PDS_HARD_INP_DELAY);

    report "all good!"
    severity note;
    finish;

  end process;

  -- process to check outputs
  check: process
    file fin : text;
    variable lin : line;
    variable v_a, v_b, v_c, v_d : real := 0.0;
    variable meas_idx : natural := 0;
    variable v_kx : real := real(to_integer(unsigned(c_KX)));
    variable v_ky : real := real(to_integer(unsigned(c_KY)));
    variable v_ksum : real := real(to_integer(unsigned(c_KSUM)));
    variable v_offset_x : real := real(to_integer(signed(c_OFFSET_X)));
    variable v_offset_y : real := real(to_integer(signed(c_OFFSET_Y)));
    variable v_sum_ac, v_sum_bd, v_diff_ac_over_sum_ac, v_diff_bd_over_sum_bd,
      v_sum_not_scaled : real := 0.0;
    variable v_x, v_y, v_q, v_sum : real := 0.0;
    variable v_x_y_fp_pos : integer := f_calc_fp_pos(1, c_K_WIDTH, c_WIDTH);
    variable v_q_fp_pos : integer := c_WIDTH-1;
    variable v_sum_fp_pos : integer := f_calc_fp_pos(c_WIDTH, c_K_WIDTH, c_WIDTH);
    variable v_expec_x, v_expec_y, v_expec_q, v_expec_sum : real := 0.0;
    variable v_err_x, v_err_y, v_err_q, v_err_sum : real := 0.0;
  begin
    file_open(fin, g_BPM_ANTENNAS_FILE, read_mode);
    f_wait_clocked_signal(clk, x_y_q_sum_valid, '0');
    loop
      -- waiting for x, y, q and sum valid pulse
      f_wait_clocked_signal(clk, x_y_q_sum_valid, '1');
      f_wait_clocked_signal(clk, x_y_q_sum_valid, '0');

      v_x := f_fp_to_real(x, v_x_y_fp_pos);
      v_y := f_fp_to_real(y, v_x_y_fp_pos);
      v_q := f_fp_to_real(q, v_q_fp_pos);
      v_sum := f_fp_to_real(sum, v_sum_fp_pos);

      readline(fin, lin); read(lin, v_a);
      readline(fin, lin); read(lin, v_b);
      readline(fin, lin); read(lin, v_c);
      readline(fin, lin); read(lin, v_d);

      v_sum_ac              := (v_a + v_c);
      v_sum_bd              := (v_b + v_d);
      v_diff_ac_over_sum_ac := (v_a - v_c)/(v_a + v_c);
      v_diff_bd_over_sum_bd := (v_b - v_d)/(v_b + v_d);
      v_sum_not_scaled      := (v_a + v_b + v_c + v_d);

      -- computing expected values
      v_expec_x   := v_kx*(0.5*v_diff_ac_over_sum_ac - 0.5*v_diff_bd_over_sum_bd);
      v_expec_x   := v_expec_x - v_offset_x;
      v_expec_y   := v_ky*(0.5*v_diff_ac_over_sum_ac + 0.5*v_diff_bd_over_sum_bd);
      v_expec_y   := v_expec_y - v_offset_y;
      v_expec_q   := (v_sum_ac - v_sum_bd)/v_sum_not_scaled;
      v_expec_sum := v_ksum*v_sum_not_scaled;
      v_expec_sum := v_ksum*v_sum_not_scaled;

      -- checking x, y, q and sum against expected values
      v_err_x   := abs(v_x/v_expec_x - 1.0);
      v_err_y   := abs(v_y/v_expec_y - 1.0);
      v_err_q   := abs(v_q/v_expec_q - 1.0);
      v_err_sum := abs(v_sum/v_expec_sum - 1.0);

      if v_err_x > 0.01 then
        report "wrong x: " & to_string(v_x) & " (expected: " &
          to_string(v_expec_x) & ") on measurement " & natural'image(meas_idx)
        severity error;
      elsif v_err_y > 0.01 then
        report "wrong y: " & to_string(v_y) & " (expected: " &
          to_string(v_expec_y) & ") on measurement " & natural'image(meas_idx)
        severity error;
      -- TODO: sum has its 23 lsbs discarded; how to properly check it?
      --elsif v_err_sum > 0.1 then
      --  report "wrong sum: " & to_string(v_sum) & " (expected: " &
      --    to_string(v_expec_sum) & ") on measurement " & natural'image(meas_idx) & " " & to_string(v_err_sum)
      --  severity note;
      elsif v_err_q > 0.01 then
        report "wrong q: " & to_string(v_q) & " (expected: " &
          to_string(v_expec_q) & ") on measurement " & natural'image(meas_idx)
        severity error;
      end if;

      f_wait_cycles(clk, 1);
      meas_idx := meas_idx + 1;
    end loop;
  end process check;

  -- process to pulse ce
  p_ce_gen: process
  begin
    f_wait_cycles(clk, 10);
    ce <= '1';
    f_wait_cycles(clk, 1);
    ce <= '0';
  end process p_ce_gen;

  -- components
  cmp_part_delta_sigma : part_delta_sigma
    generic map (
      g_WIDTH         => c_WIDTH,
      g_K_WIDTH       => c_K_WIDTH,
      g_OFFSET_WIDTH  => c_OFFSET_WIDTH
    )
    port map (
      clk_i           => clk,
      rst_i           => rst,
      a_i             => a,
      b_i             => b,
      c_i             => c,
      d_i             => d,
      kx_i            => c_KX,
      ky_i            => c_KY,
      ksum_i          => c_KSUM,
      offset_x_i      => c_OFFSET_X,
      offset_y_i      => c_OFFSET_Y,
      ce_i            => ce,
      valid_i         => a_b_c_d_valid,
      x_o             => x,
      y_o             => y,
      q_o             => q,
      sum_o           => sum,
      valid_o         => x_y_q_sum_valid
    );

end architecture part_delta_sigma_tb_arch;
