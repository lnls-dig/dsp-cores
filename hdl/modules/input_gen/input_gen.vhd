-------------------------------------------------------------------------------
-- Title      : Input generator
-- Project    :
-------------------------------------------------------------------------------
-- File       : input_gen.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-06-26
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simulates an input signal using hardware.
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-06-26  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity input_gen is

  generic (
    g_input_width  : natural := 16;
    g_output_width : natural := 16;
    g_ksum         : integer := 1
    );

  port (
    x_i   : in  std_logic_vector(g_input_width-1 downto 0);
    y_i   : in  std_logic_vector(g_input_width-1 downto 0);
    clk_i : in  std_logic;
    ce_i  : in  std_logic;
    a_o   : out std_logic_vector(g_output_width-1 downto 0);
    b_o   : out std_logic_vector(g_output_width-1 downto 0);
    c_o   : out std_logic_vector(g_output_width-1 downto 0);
    d_o   : out std_logic_vector(g_output_width-1 downto 0)
    );

end entity input_gen;

-------------------------------------------------------------------------------

architecture str of input_gen is

  signal a_bb, b_bb, c_bb, d_bb : std_logic_vector(g_input_width-1 downto 0) := (others => '0');
  signal sin, cos               : std_logic_vector(23 downto 0);
  constant c_ksum               : signed(g_input_width-1 downto 0)           := to_signed(g_ksum,g_input_width);
  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  calculate : process(clk_i)
    variable x, y : signed(g_input_width-1 downto 0);
  begin

    if rising_edge(clk_i) then
      if ce_i = '1' then
        x := signed(x_i);
        y := signed(y_i);

        a_bb <= std_logic_vector(c_ksum - x + y);
        b_bb <= std_logic_vector(c_ksum + x + y);
        c_bb <= std_logic_vector(c_ksum + x - y);
        d_bb <= std_logic_vector(c_ksum - x - y);

      end if;  --clk
    end if;  -- ce

  end process calculate;

  cmp_dds : fixed_dds
    generic map (
      g_number_of_points => 6,
      g_output_width     => 24,
      g_sin_file         => "./dds_sin.nif",
      g_cos_file         => "./dds_cos.nif")
    port map (
      clk_i       => clk_i,
      ce_i        => ce_i,
      rst_i       => '0',
      valid_i     => '1',
      sin_o       => sin,
      cos_o       => cos);

  cmp_mod_a : generic_multiplier
    generic map (
      g_a_width => 16,
      g_b_width => 24,
      g_signed  => true,
      g_p_width => g_output_width,
      g_levels  => 6)
    port map (
      a_i     => a_bb,
      b_i     => sin,
      valid_i => '1',
      p_o     => a_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

  cmp_mod_b : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => 24,
      g_signed  => true,
      g_p_width => g_output_width,
      g_levels  => 6)
    port map (
      a_i     => b_bb,
      b_i     => sin,
      valid_i => '1',
      p_o     => b_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

  cmp_mod_c : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => 24,
      g_signed  => true,
      g_p_width => g_output_width,
      g_levels  => 6)
    port map (
      a_i     => c_bb,
      b_i     => cos,
      valid_i => '1',
      p_o     => c_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

  cmp_mod_d : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => 24,
      g_signed  => true,
      g_p_width => g_output_width,
      g_levels  => 6)
    port map (
      a_i     => d_bb,
      b_i     => cos,
      valid_i => '1',
      p_o     => d_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

end architecture str;

-------------------------------------------------------------------------------
