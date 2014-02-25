-------------------------------------------------------------------------------
-- Title      : Input Conditioner
-- Project    : 
-------------------------------------------------------------------------------
-- File       : input_conditioner.vhd
-- Author     : Gustavo BM Bruno
-- Company    : 
-- Created    : 2014-01-30
-- Last update: 2014-02-21
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
    g_clk_freq : real := 120.0e6;       -- System clock frequency
    g_sw_freq  : real := 100.0e3);      -- Desired switching frequency
  port (
    reset_n_i     : in  std_logic;      -- Reset data
    clk_i         : in  std_logic;      -- Main clock
    adc_data_i    : in  std_logic_vector(15 downto 0);  -- Raw data from the ADC
    switch_o      : out std_logic;      -- Switch position output
    data_output_o : out std_logic_vector(23 downto 0));  -- Windowed output data

end entity input_conditioner;

architecture structural of input_conditioner is
  constant mem_size : natural := natural(g_clk_freq/(g_sw_freq*2.0)) + 1;
  constant bus_size : natural := f_log2_size(mem_size);

  signal cur_address   : std_logic_vector(bus_size-1 downto 0) := (others => '0');  -- Current index for lookup table
  signal window_factor : std_logic_vector(23 downto 0);  -- Current value of the window
                                                         -- factor, signed int
  component generic_simple_dpram is
    generic (
      g_data_width               : natural;
      g_size                     : natural;
      g_with_byte_enable         : boolean;
      g_addr_conflict_resolution : string;
      g_init_file                : string;
      g_dual_clock               : boolean);
    port (
      rst_n_i : in  std_logic                                        := '1';
      clka_i  : in  std_logic;
      bwea_i  : in  std_logic_vector((g_data_width+7)/8 -1 downto 0) := f_gen_dummy_vec('1', (g_data_width+7)/8);
      wea_i   : in  std_logic;
      aa_i    : in  std_logic_vector(bus_size-1 downto 0);
      da_i    : in  std_logic_vector(g_data_width -1 downto 0);
      clkb_i  : in  std_logic;
      ab_i    : in  std_logic_vector(bus_size-1 downto 0);
      qb_o    : out std_logic_vector(g_data_width -1 downto 0));
  end component generic_simple_dpram;

  component multiplier_s24_s24_s24 is
    port (
      clk  : in  std_logic;
      a    : in  std_logic_vector(23 downto 0);
      b    : in  std_logic_vector(23 downto 0);
      sclr : in  std_logic;
      ce   : in  std_logic;
      p    : out std_logic_vector(23 downto 0));
  end component multiplier_s24_s24_s24;

  component counter is
    generic (
      mem_size : natural;
      bus_size : natural);
    port (
      clk_i     : in  std_logic;
      index_o   : out std_logic_vector(bus_size-1 downto 0);
      ce_i      : in  std_logic;
      switch_o  : out std_logic;
      reset_n_i : in  std_logic);
  end component counter;

begin

  cmp_lut : generic_simple_dpram
    generic map (
      g_data_width               => 24,
      g_size                     => mem_size,
      g_with_byte_enable         => false,
      g_addr_conflict_resolution => "dont_care",
      g_init_file                => "./window.nif",
      g_dual_clock               => false
      )
    port map (
      rst_n_i => reset_n_i,
      clka_i  => clk_i,
      bwea_i  => (others => '0'),
      wea_i   => '0',
      aa_i    => cur_address,
      da_i    => (others => '0'),
      clkb_i  => clk_i,
      ab_i    => cur_address,
      qb_o    => window_factor
      );

  cmp_index : counter
    generic map (
      mem_size => mem_size,
      bus_size => bus_size
      )
    port map (
      clk_i     => clk_i,
      index_o   => cur_address,
      ce_i      => '1',
      reset_n_i => reset_n_i,
      switch_o  => switch_o
      );

  cpm_mult : multiplier_s24_s24_s24
    port map (
      clk            => clk_i,
      a(23 downto 8) => adc_data_i,
      a(7 downto 0)  => (others => '0'),
      b              => window_factor,
      sclr           => '0',
      ce             => '1',
      p              => data_output_o);

end structural;
