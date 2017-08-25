-------------------------------------------------------------------------------
-- Title      : BPM Mixer
-- Project    :
-------------------------------------------------------------------------------
-- File       : mixer.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS - CNPEM
-- Created    : 2014-01-21
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Mixer at input stage for BPM
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-21  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.dsp_cores_pkg.all;

entity mixer is
  generic(
    g_sin_file         : string  := "./dds_sin.nif";
    g_cos_file         : string  := "./dds_cos.nif";
    g_number_of_points : natural := 6;
    g_input_width      : natural := 16;
    g_dds_width        : natural := 16;
    g_output_width     : natural := 32;
    g_mult_levels      : natural := 7
    );
  port(
    reset_i     : in  std_logic;
    clock_i     : in  std_logic;
    ce_i        : in  std_logic;
    signal_i    : in  std_logic_vector(g_input_width-1 downto 0);
    valid_i     : in  std_logic;
    I_out       : out std_logic_vector(g_output_width-1 downto 0);
    Q_out       : out std_logic_vector(g_output_width-1 downto 0);
    valid_o     : out std_logic);

end entity mixer;

architecture rtl of mixer is

  signal sine   : std_logic_vector(g_dds_width-1 downto 0);
  signal cosine : std_logic_vector(g_dds_width-1 downto 0);
  signal dds_valid   : std_logic;
  signal I_valid_out : std_logic;
  signal Q_valid_out : std_logic;

begin

  cmp_dds : fixed_dds
    generic map (
      g_number_of_points => g_number_of_points,
      g_output_width     => g_dds_width,
      g_sin_file         => g_sin_file,
      g_cos_file         => g_cos_file)
    port map (
      clock_i => clock_i,
      ce_i    => ce_i,
      reset_i => reset_i,
      valid_i => valid_i,
      sin_o   => sine,
      cos_o   => cosine,
      valid_o => dds_valid);

  cmp_mult_I : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_dds_width,
      g_signed  => true,
      g_p_width => g_output_width,
      g_round_convergent => 1)
    port map (
      a_i     => signal_i,
      b_i     => cosine,
      valid_i => dds_valid,
      p_o     => I_out,
      valid_o => I_valid_out,
      ce_i    => ce_i,
      clk_i   => clock_i,
      reset_i => reset_i);


  cmp_mult_Q : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_dds_width,
      g_signed  => true,
      g_p_width => g_output_width,
      g_round_convergent => 1)
    port map (
      a_i     => signal_i,
      b_i     => sine,
      valid_i => dds_valid,
      p_o     => Q_out,
      valid_o => Q_valid_out,
      clk_i   => clock_i,
      ce_i    => ce_i,
      reset_i => reset_i);

    -- Any valid, either from I or Q is fine.
    valid_o <= I_valid_out;

end rtl;
