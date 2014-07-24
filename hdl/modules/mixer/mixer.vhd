-------------------------------------------------------------------------------
-- Title      : BPM Mixer
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mixer.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS - CNPEM
-- Created    : 2014-01-21
-- Last update: 2014-04-14
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

entity mixer is
  generic(
    g_sin_file     : string  := "./dds_sin.nif";
    g_cos_file     : string  := "./dds_cos.nif";
    g_input_width  : natural := 24;
    g_output_width : natural := 24
    );
  port(
    reset_n_i : in  std_logic;
    clock_i   : in  std_logic;
    signal_i  : in  std_logic_vector(g_input_width-1 downto 0);
    I_out     : out std_logic_vector(g_output_width-1 downto 0);
    Q_out     : out std_logic_vector(g_output_width-1 downto 0)
    );

end entity mixer;

architecture rtl of mixer is

  signal sine   : std_logic_vector(g_output_width-1 downto 0);
  signal cosine : std_logic_vector(g_output_width-1 downto 0);

  component fixed_dds is
    generic (
      g_number_of_points : natural;
      g_output_width     : natural;
      g_sin_file         : string;
      g_cos_file         : string);
    port (
      clock_i   : in  std_logic;
      ce_i      : in  std_logic;
      reset_n_i : in  std_logic;
      sin_o     : out std_logic_vector(g_output_width-1 downto 0);
      cos_o     : out std_logic_vector(g_output_width-1 downto 0));
  end component fixed_dds;

  component generic_multiplier is
    generic (
      g_a_width : natural;
      g_b_width : natural;
      g_signed  : boolean;
      g_p_width : natural);
    port (
      a_i       : in  std_logic_vector(g_a_width-1 downto 0);
      b_i       : in  std_logic_vector(g_b_width-1 downto 0);
      p_o       : out std_logic_vector(g_p_width-1 downto 0);
      clk_i     : in  std_logic;
      reset_n_i : in  std_logic);
  end component generic_multiplier;

begin

  cmp_dds : fixed_dds
    generic map (
      g_number_of_points => 203,
      g_output_width     => g_output_width,
      g_sin_file         => g_sin_file,
      g_cos_file         => g_cos_file)
    port map (
      clock_i   => clock_i,
      ce_i      => '1',
      reset_n_i => reset_n_i,
      sin_o     => sine,
      cos_o     => cosine);

  cmp_mult_I : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_output_width,
      g_signed  => true,
      g_p_width => g_output_width)
    port map (
      a_i       => signal_i,
      b_i       => cosine,
      p_o       => I_out,
      clk_i     => clock_i,
      reset_n_i => reset_n_i);


  cmp_mult_Q : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_output_width,
      g_signed  => true,
      g_p_width => g_output_width)
    port map (
      a_i       => signal_i,
      b_i       => sine,
      p_o       => Q_out,
      clk_i     => clock_i,
      reset_n_i => reset_n_i);

end rtl;
