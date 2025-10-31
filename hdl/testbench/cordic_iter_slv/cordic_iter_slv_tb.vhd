-------------------------------------------------------------------------------
-- Title      : cordic_iter_slv_tb.vhd testbench
-- Project    :
-------------------------------------------------------------------------------
-- File       : gc_iq_modulator_tb.vhd
-- Author     : David Daminelli <david.daminelli@lnls.br>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2025-06-18
-- Last update: 2025-06-18
-- Platform   :
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description: A testbench for the cordic_iter_slv.vhd core.
--              This testbench loops through a set of I and Q values, computes
--              the expected amplitude and phase, and compares it to the output.
-------------------------------------------------------------------------------
-- Copyright (c) 2025 Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author            Description
-- 2025-07-04  1.0      david.daminelli   Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;

entity cordic_iter_slv_tb is

  ------ Procedure Declaration ------
  -- Clock Generation
  procedure f_gen_clk(constant freq : in    natural;
                      signal   clk  : inout std_logic) is
    begin
      loop
        wait for (0.5 / real(freq)) * 1 sec;
        clk <= not clk;
      end loop;
    end procedure f_gen_clk;

  -- Wait procedure
  procedure f_wait_cycles(signal   clk    : in std_logic;
                          constant cycles : natural) is
    begin
      for i in 1 to cycles loop
        wait until rising_edge(clk);
      end loop;
    end procedure f_wait_cycles;

  ------ Constants Declaration ------
  constant c_INPUT_WIDTH  : natural := 16;
  constant c_clk_freq     : natural := 100e3;
  constant c_cordic_gain  : real    := 1.647;

  -- Component Generics
  constant c_stages     : natural := 2**5;
  constant c_bit_growth : natural := natural(ceil(log2(real(c_stages))));
  constant c_mode       : string  := "rect_to_polar";

  ------ Signal Declaration ------
  signal clk          : std_logic := '0';
  signal rst          : std_logic := '0';

  -- Component ports
  signal s_x, s_y     : integer   := 0;
  signal s_ce         : std_logic := '1';
  signal s_valid_in   : std_logic := '0';
  signal s_mag_out    : std_logic_vector(c_INPUT_WIDTH-1 downto 0) := (others => '0');
  signal s_phs_out    : std_logic_vector(c_INPUT_WIDTH-1 downto 0) := (others => '0');
  signal s_valid_out  : std_logic;

  -- Test Signals
  signal s_abs  : real := 0.0;
  signal s_phs  : real := 0.0;

end cordic_iter_slv_tb;

architecture tb of cordic_iter_slv_tb is
begin
  ------ Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  ------ Test processes ------
  p_gen_stimulus: process
  begin
    rst <= '1';
    f_wait_cycles(clk, 5);
    rst <= '0';
    for i in 0 to c_INPUT_WIDTH-2 loop
      s_x <= 2**i;
      for j in 0 to c_INPUT_WIDTH-2 loop
        s_y <= 2**j;
        s_valid_in <= '1';
        f_wait_cycles(clk, 1);
        -- the core extend the data in 2 bits, this /4.0 compensates that gain
        s_abs <= SQRT(real(s_x**2) + real(s_y**2))*c_cordic_gain/4.0;
        s_phs <= ARCTAN(real(s_y)/real(s_x))/math_pi * 180.0;
        s_valid_in <= '0';
        f_wait_cycles(clk, 1);
        f_wait_cycles(clk, c_stages);
      end loop;
    end loop;
    report "Success!";
    std.env.finish;
  end process;

  p_assertion: process(clk)
    variable v_phs, v_amp : real := 0.0;
  begin
    if rising_edge(clk) then
      if s_valid_out = '1' then -- asserts only when out is valid
        -- Amp assertion
        v_amp := real(to_integer(signed(s_mag_out)));
        assert abs(v_amp - s_abs) < 2.0
          report "Amp failed! Expected " & to_string(s_abs)
                  & " got " & to_string(v_amp) &
                  " diff " & to_string(abs(v_amp-s_abs))
        severity warning;
        --Phs assertion
        v_phs := real(to_integer(signed(s_phs_out)))/(2.0**(c_INPUT_WIDTH-1)-1.0) * 180.0;
        assert abs(v_phs - s_phs) < 2.0
          report "Phs failed! Expected " & to_string(s_phs)
                  & " got " & to_string(v_phs)
        severity warning;
      end if;
    end if;
  end process;

  ------ Entity instantiation ------
  DUT : entity work.cordic_iter_slv
  generic map (
    g_input_width        => c_INPUT_WIDTH,
    g_xy_calc_width      => c_INPUT_WIDTH + c_bit_growth + 2,
    g_x_output_width     => c_INPUT_WIDTH,
    g_phase_calc_width   => c_INPUT_WIDTH + c_bit_growth + 2,
    g_phase_output_width => c_INPUT_WIDTH,
    g_stages             => c_stages,
    g_iter_per_clk       => 2,
    g_rounding           => true
    )
  port map (
    clk_i     => clk,
    ce_data_i => s_ce,
    valid_i   => s_valid_in,
    ce_i      => s_ce,
    x_i       => std_logic_vector(to_signed(s_x, c_INPUT_WIDTH)),
    y_i       => std_logic_vector(to_signed(s_y, c_INPUT_WIDTH)),
    mag_o     => s_mag_out,
    phase_o   => s_phs_out,
    valid_o   => s_valid_out
    );

end tb;