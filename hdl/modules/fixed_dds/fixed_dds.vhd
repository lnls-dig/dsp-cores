-------------------------------------------------------------------------------
-- Title      : Fixed sin-cos DDS
-- Project    : 
-------------------------------------------------------------------------------
-- File       : fixed_dds.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-07
-- Last update: 2014-04-29
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Fixed frequency phase and quadrature DDS for use in tuned DDCs.
-- Moreover, it has an option to dynamically change the output signal phase,
-- according to the phase_i input.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-07  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.genram_pkg.all;
-------------------------------------------------------------------------------

entity fixed_dds is

  generic (
    g_number_of_points : natural := 203;  -- Number of points of sin and cos (each)
    g_output_width     : natural := 16;   -- Output resolution
    g_phase_bus_size   : natural := 8;  -- Number of selectable phases, max 256
    g_sin_file         : string  := "./dds_sin.ram";  -- Files with points data
    g_cos_file         : string  := "./dds_cos.ram"
    );
  port (
    clock_i     : in  std_logic;
    ce_i        : in  std_logic;
    reset_n_i   : in  std_logic;
    phase_sel_i : in  std_logic_vector(g_phase_bus_size-1 downto 0);
    sin_o       : out std_logic_vector(g_output_width-1 downto 0);
    cos_o       : out std_logic_vector(g_output_width-1 downto 0)
    );

end entity fixed_dds;

-------------------------------------------------------------------------------

architecture str of fixed_dds is

  constant c_bus_size : natural := f_log2_size(g_number_of_points)+g_phase_bus_size;
  signal cur_address  : std_logic_vector(c_bus_size-1 downto 0);

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
      aa_i    : in  std_logic_vector(c_bus_size-1 downto 0);
      da_i    : in  std_logic_vector(g_data_width-1 downto 0);
      clkb_i  : in  std_logic;
      ab_i    : in  std_logic_vector(c_bus_size-1 downto 0);
      qb_o    : out std_logic_vector(g_data_width-1 downto 0));
  end component generic_simple_dpram;

  component lut_sweep is
    generic (
      g_phase_bus_size   : natural;
      g_number_of_points : natural;
      g_bus_size         : natural);
    port (
      reset_n_i   : in  std_logic;
      clock_i     : in  std_logic;
      ce_i        : in  std_logic;
      phase_sel_i : in  std_logic_vector(g_phase_bus_size-1 downto 0);
      address_o   : out std_logic_vector(g_bus_size-1 downto 0));
  end component lut_sweep;
  
begin  -- architecture str

  cmp_lut_sweep : lut_sweep
    generic map (
      g_phase_bus_size   => g_phase_bus_size,
      g_number_of_points => g_number_of_points,
      g_bus_size         => c_bus_size)
    port map (
      reset_n_i   => reset_n_i,
      clock_i     => clock_i,
      ce_i        => ce_i,
      phase_sel_i => phase_sel_i,
      address_o   => cur_address);

  cmp_sin_lut : generic_simple_dpram
    generic map (
      g_data_width               => g_output_width,
      g_size                     => g_number_of_points*(2**g_phase_bus_size),
      g_with_byte_enable         => false,
      g_addr_conflict_resolution => "dont_care",
      g_init_file                => g_sin_file,
      g_dual_clock               => false
      )
    port map (
      rst_n_i => reset_n_i,
      clka_i  => clock_i,
      bwea_i  => (others => '0'),
      wea_i   => '0',
      aa_i    => cur_address,
      da_i    => (others => '0'),
      clkb_i  => clock_i,
      ab_i    => cur_address,
      qb_o    => sin_o
      );

  cmp_cos_lut : generic_simple_dpram
    generic map (
      g_data_width               => g_output_width,
      g_size                     => g_number_of_points*(2**g_phase_bus_size),
      g_with_byte_enable         => false,
      g_addr_conflict_resolution => "dont_care",
      g_init_file                => g_cos_file,
      g_dual_clock               => false
      )
    port map (
      rst_n_i => reset_n_i,
      clka_i  => clock_i,
      bwea_i  => (others => '0'),
      wea_i   => '0',
      aa_i    => cur_address,
      da_i    => (others => '0'),
      clkb_i  => clock_i,
      ab_i    => cur_address,
      qb_o    => cos_o
      );

end architecture str;

-------------------------------------------------------------------------------
