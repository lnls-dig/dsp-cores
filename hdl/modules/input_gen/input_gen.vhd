-------------------------------------------------------------------------------
-- Title      : Input generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : input_gen.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-06-26
-- Last update: 2014-07-01
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
  component fixed_dds is
    generic (
      g_number_of_points : natural;
      g_output_width     : natural;
      g_phase_bus_size   : natural;
      g_sin_file         : string;
      g_cos_file         : string);
    port (
      clock_i     : in  std_logic;
      ce_i        : in  std_logic;
      reset_i     : in  std_logic;
      phase_sel_i : in  std_logic_vector(g_phase_bus_size-1 downto 0);
      sin_o       : out std_logic_vector(g_output_width-1 downto 0);
      cos_o       : out std_logic_vector(g_output_width-1 downto 0));
  end component fixed_dds;

  component generic_multiplier is
    generic (
      g_a_width : natural;
      g_b_width : natural;
      g_signed  : boolean;
      g_p_width : natural;
      g_levels  : natural);
    port (
      a_i     : in  std_logic_vector(g_a_width-1 downto 0);
      b_i     : in  std_logic_vector(g_b_width-1 downto 0);
      p_o     : out std_logic_vector(g_p_width-1 downto 0);
      ce_i    : in  std_logic;
      clk_i   : in  std_logic;
      reset_i : in  std_logic);
  end component generic_multiplier;

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
      g_phase_bus_size   => 8,
      g_sin_file         => "./dds_sin.nif",
      g_cos_file         => "./dds_cos.nif")
    port map (
      clock_i     => clk_i,
      ce_i        => ce_i,
      reset_i     => '0',
      phase_sel_i => (others => '0'),
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
      p_o     => a_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      reset_i => '0');

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
      p_o     => b_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      reset_i => '0');

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
      p_o     => c_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      reset_i => '0');

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
      p_o     => d_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      reset_i => '0');

end architecture str;

-------------------------------------------------------------------------------
