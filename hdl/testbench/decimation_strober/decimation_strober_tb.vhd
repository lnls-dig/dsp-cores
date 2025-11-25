-------------------------------------------------------------------------------
-- Title      : Decimation Strober testbench
-------------------------------------------------------------------------------
-- Author     : David Daminelli
-- Company    : CNPEM LNLS
-- Platform   : Simulation
-- Standard   : VHDL 2008
-------------------------------------------------------------------------------
-- Description: Simple testbench to assert decimation strober output.
-------------------------------------------------------------------------------
-- Copyright (c) 2023-01-23 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2025-11-25  1.0      David Daminelli       Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;

library work;

entity decimation_strober_tb is
end entity decimation_strober_tb;

architecture tb of decimation_strober_tb is
  --------- Procedure declaration ---------
  -- Clock generation
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

  -- Reset
  procedure f_reset(signal rst : out std_logic;
                    signal clk : in std_logic) is
  begin
    rst <= '1';
    f_wait_cycles(clk, 1);
    rst <= '0';
    f_wait_cycles(clk, 1);
  end procedure f_reset;

  --------- Constants declaration ---------
  constant c_clk_freq   : natural := 100e3;
  constant c_maxrate    : natural := 2048;
  constant c_bus_width  : natural := integer(ceil(log2(real(c_maxrate))));

  --------- Signal declaration ---------
  signal clk    : std_logic := '0';
  signal rst    : std_logic := '0';
  signal strobe : std_logic := '0';
  signal ratio  : integer   := 1;

begin
  ------ Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  p_test : process
  begin
    for i in 1 to c_maxrate-1 loop
      ratio <= i;
      f_reset(rst, clk);
      f_wait_cycles(clk, i);
      assert strobe = '1'
        report "Strobe failed on ratio " & to_string(i)
      severity failure;
    end loop;
    report "Finished!";
    std.env.finish;
  end process p_test;

  UUT : entity work.decimation_strober
    generic map (
      g_maxrate   => c_maxrate,
      g_bus_width => c_bus_width
    )
    port map (
      clk_i    => clk,
      rst_i    => rst,
      ce_i     => '1',
      valid_i  => '1',
      ratio_i  => std_logic_vector(to_unsigned(ratio, c_bus_width)),
      strobe_o => strobe
    );
end architecture tb;