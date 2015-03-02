-------------------------------------------------------------------------------
-- Title      : Input Conditioner
-- Project    :
-------------------------------------------------------------------------------
-- File       : input_conditioner.vhd
-- Author     : Gustavo BM Bruno
-- Company    :
-- Created    : 2014-01-30
-- Last update: 2014-02-26
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Define the timing for the switch at the RFFE board and apply a
-- proper window at the switch to avoid the switching noise.
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-30  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.genram_pkg.all;

entity input_conditioner is

  generic (
    --g_clk_freq     : real    := 120.0e6;  -- System clock frequency
    --g_sw_freq      : real    := 100.0e3;  -- Desired switching frequency
    g_sw_interval  : natural := 1000;
    g_input_width  : natural := 16;
    g_output_width : natural := 24;
    g_window_width : natural := 24;
    g_input_delay  : natural := 2;
    g_window_coef_file : string);
  port (
    reset_n_i : in std_logic;             -- Reset data
    clk_i     : in std_logic;             -- Main clock
    adc_a_i   : in std_logic_vector(g_input_width-1 downto 0);
    adc_b_i   : in std_logic_vector(g_input_width-1 downto 0);
    adc_c_i   : in std_logic_vector(g_input_width-1 downto 0);
    adc_d_i   : in std_logic_vector(g_input_width-1 downto 0);

    switch_o : out std_logic;           -- Switch position output
    switch_en_i : in std_logic;
    switch_delay_i : in std_logic_vector(15 downto 0);

    a_o      : out std_logic_vector(g_output_width-1 downto 0);
    b_o      : out std_logic_vector(g_output_width-1 downto 0);
    c_o      : out std_logic_vector(g_output_width-1 downto 0);
    d_o      : out std_logic_vector(g_output_width-1 downto 0);
    dbg_cur_address_o : out std_logic_vector(31 downto 0));

end entity input_conditioner;

architecture structural of input_conditioner is
  --constant c_mem_size : natural := natural(g_clk_freq/(g_sw_freq*2.0)) + 1;
  constant c_mem_size : natural := g_sw_interval/2 + 1;
  constant c_bus_size : natural := f_log2_size(c_mem_size);

  signal cur_address   : std_logic_vector(c_bus_size-1 downto 0) := (others => '0');  -- Current index for lookup table
  signal window_factor : std_logic_vector(g_window_width-1 downto 0);  -- Current value of the window
                                        -- factor, signed int
  signal reset         : std_logic;

  component counter is
    generic (
      g_mem_size     : natural;
      g_bus_size     : natural;
      g_switch_delay : natural);
    port (
      clk_i     : in  std_logic;
      index_o   : out std_logic_vector(c_bus_size-1 downto 0);
      ce_i      : in  std_logic;
      switch_o  : out std_logic;
      switch_en_i : in std_logic;
      switch_delay_i : in std_logic_vector(15 downto 0);
      reset_n_i : in  std_logic);
  end component counter;

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
      ce_i      : in  std_logic;
      clk_i     : in  std_logic;
      reset_i   : in  std_logic);
  end component generic_multiplier;

  component sw_windowing_n_251_tukey_0_2
    port (
      clka : in std_logic;
      addra : in std_logic_vector(7 downto 0);
      douta : out std_logic_vector(23 downto 0)
    );
  end component sw_windowing_n_251_tukey_0_2;

begin

  reset <= not reset_n_i;

  cmp_lut : sw_windowing_n_251_tukey_0_2
    port map (
      clka  => clk_i,
      addra => cur_address,
      douta => window_factor
    );

  cmp_index : counter
    generic map (
      g_mem_size     => c_mem_size,
      g_bus_size     => c_bus_size,
      g_switch_delay => g_input_delay
      )
    port map (
      clk_i     => clk_i,
      index_o   => cur_address,
      ce_i      => '1',
      reset_n_i => reset_n_i,
      switch_delay_i => switch_delay_i,
      switch_o  => switch_o,
      switch_en_i => switch_en_i
      );

  dbg_cur_address_o(dbg_cur_address_o'left downto cur_address'left+1)
                                              <= (others =>'0');
  dbg_cur_address_o(cur_address'left downto 0) <= cur_address;

  cmp_multiplier_a : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_window_width,
      g_signed  => true,
      g_p_width => g_output_width)
    port map (
      a_i       => adc_a_i,
      b_i       => window_factor,
      p_o       => a_o,
      ce_i      => '1',
      clk_i     => clk_i,
      reset_i   => reset);

  cmp_multiplier_b : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_window_width,
      g_signed  => true,
      g_p_width => g_output_width)
    port map (
      a_i       => adc_b_i,
      b_i       => window_factor,
      p_o       => b_o,
      ce_i      => '1',
      clk_i     => clk_i,
      reset_i   => reset);

  cmp_multiplier_c : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_window_width,
      g_signed  => true,
      g_p_width => g_output_width)
    port map (
      a_i       => adc_c_i,
      b_i       => window_factor,
      p_o       => c_o,
      ce_i      => '1',
      clk_i     => clk_i,
      reset_i   => reset);

  cmp_multiplier_d : generic_multiplier
    generic map (
      g_a_width => g_input_width,
      g_b_width => g_window_width,
      g_signed  => true,
      g_p_width => g_output_width)
    port map (
      a_i       => adc_d_i,
      b_i       => window_factor,
      p_o       => d_o,
      ce_i      => '1',
      clk_i     => clk_i,
      reset_i   => reset);

end structural;
