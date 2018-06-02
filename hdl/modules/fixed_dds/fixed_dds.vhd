-------------------------------------------------------------------------------
-- Title      : Fixed sin-cos DDS
-- Project    :
-------------------------------------------------------------------------------
-- File       : fixed_dds.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-03-07
-- Last update: 2015-10-15
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
use work.dsp_cores_pkg.all;
-------------------------------------------------------------------------------

entity fixed_dds is

  generic (
    g_number_of_points : natural := 203;  -- Number of points of sin and cos (each)
    g_output_width     : natural := 16;   -- Output resolution
    g_sin_file         : string  := "./dds_sin.ram";  -- Files with points data
    g_cos_file         : string  := "./dds_cos.ram"
    );
  port (
    clk_i       : in  std_logic;
    ce_i        : in  std_logic;
    rst_i       : in  std_logic;
    valid_i     : in  std_logic;
    sin_o       : out std_logic_vector(g_output_width-1 downto 0);
    cos_o       : out std_logic_vector(g_output_width-1 downto 0);
    valid_o     : out std_logic);

end entity fixed_dds;

-------------------------------------------------------------------------------

architecture str of fixed_dds is

  constant c_bus_size     : natural := f_log2_size(g_number_of_points);
  signal cur_address      : std_logic_vector(c_bus_size-1 downto 0);
  signal rst_n            : std_logic;
  signal cos_reg, sin_reg : std_logic_vector(g_output_width-1 downto 0);
  signal cur_address_valid    : std_logic_vector(0 downto 0);
  signal cur_address_valid_d2 : std_logic_vector(0 downto 0);
  signal valid_out_int        : std_logic_vector(0 downto 0);

begin  -- architecture str

  cmp_lut_sweep : lut_sweep
    generic map (
      g_number_of_points => g_number_of_points,
      g_bus_size         => c_bus_size)
    port map (
      rst_i       => rst_i,
      clk_i       => clk_i,
      ce_i        => ce_i,
      valid_i     => valid_i,
      address_o   => cur_address,
      valid_o     => cur_address_valid(0));

  rst_n   <= not(rst_i);

  -- FIXME. LUT is configured to have a read latency of 2.
  -- We need to compensate for that. However, this behavior
  -- can change if we add additional pipeline register and
  -- we wouldn't know about it.
  cmp_reg_cur_address_valid : pipeline
    generic map (
      g_width => 1,
      g_depth => 2)
    port map (
      data_i => cur_address_valid,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => cur_address_valid_d2
  );

  cmp_sin_lut : dds_sin_lut
  port map (
    clka    => clk_i,
    addra   => cur_address,
    douta   => sin_reg
  );

  cmp_cos_lut : dds_cos_lut
  port map (
    clka    => clk_i,
    addra   => cur_address,
    douta   => cos_reg
  );

  cmp_reg_sin : pipeline
    generic map (
      g_width => g_output_width,
      g_depth => 2)
    port map (
      data_i => sin_reg,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => sin_o);

  cmp_reg_cos : pipeline
    generic map (
      g_width => g_output_width,
      g_depth => 2)
    port map (
      data_i => cos_reg,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => cos_o);

  cmp_cur_address_reg_2 : pipeline
    generic map (
      g_width => 1,
      g_depth => 2)
    port map (
      data_i => cur_address_valid_d2,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => valid_out_int);

    valid_o <= valid_out_int(0);

end architecture str;

-------------------------------------------------------------------------------
