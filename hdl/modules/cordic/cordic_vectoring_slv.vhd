-------------------------------------------------------------------------------
-- Title      : Vectoring-mode cordic, slv version
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cordic_vectoring_slv.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-13
-- Last update: 2014-09-20
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This is a top-block for vectoring mode using concordic,
-- constrained standard_logic_vector version.
-------------------------------------------------------------------------------
-- This file is part of Concordic.
--
-- Concordic is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- Concordic is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Foobar. If not, see <http://www.gnu.org/licenses/>.
-- Copyright (c) 2014 Aylons Hazzud
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-13  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


-------------------------------------------------------------------------------

entity cordic_vectoring_slv is

  generic (
    g_stages : natural := 20;
    g_width  : natural := 32
    );

  port (
    x_i     : in  std_logic_vector(g_width-1 downto 0) := (others => '0');
    y_i     : in  std_logic_vector(g_width-1 downto 0) := (others => '0');
    clk_i   : in  std_logic;
    ce_i    : in  std_logic;
    valid_i : in  std_logic;
    rst_i   : in  std_logic;
    mag_o   : out std_logic_vector(g_width-1 downto 0) := (others => '0');
    phase_o : out std_logic_vector(g_width-1 downto 0) := (others => '0');
    valid_o : out std_logic
    );

end entity cordic_vectoring_slv;

-------------------------------------------------------------------------------

architecture str of cordic_vectoring_slv is

  signal adjusted_x : signed(g_width-1 downto 0) := (others => '0');
  signal adjusted_y : signed(g_width-1 downto 0) := (others => '0');
  signal adjusted_z : signed(g_width-1 downto 0) := (others => '0');

  signal mag_temp   : signed(g_width-1 downto 0) := (others => '0');
  signal phase_temp : signed(g_width-1 downto 0) := (others => '0');
  signal y_temp     : signed(g_width-1 downto 0) := (others => '0');

  signal valid_temp : std_logic := '0';

  component inversion_stage is
    generic (
      g_mode : string);
    port (
      x_i     : in  signed;
      y_i     : in  signed;
      z_i     : in  signed;
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      rst_i   : in  std_logic;
      x_o     : out signed;
      y_o     : out signed;
      z_o     : out signed;
      valid_o : out std_logic);
  end component inversion_stage;

  component cordic_core is
    generic (
      g_stages     : natural;
      g_mode       : string;
      g_bit_growth : natural);
    port (
      x_i     : in  signed;
      y_i     : in  signed;
      z_i     : in  signed;
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      rst_i   : in  std_logic;
      x_o     : out signed;
      y_o     : out signed;
      z_o     : out signed;
      valid_o : out std_logic);
  end component cordic_core;
  
begin  -- architecture str

  cmp_inversion : inversion_stage
    generic map (
      g_mode => "rect_to_polar")
    port map (
      x_i     => signed(x_i),
      y_i     => signed(y_i),
      z_i     => (g_width-1 downto 0 => '0'),
      clk_i   => clk_i,
      ce_i    => ce_i,
      rst_i   => rst_i,
      valid_i => valid_i,
      x_o     => adjusted_x,
      y_o     => adjusted_y,
      z_o     => adjusted_z,
      valid_o => valid_temp);

  cmp_core : cordic_core
    generic map (
      g_stages => g_stages,
      g_mode   => "rect_to_polar",
      g_bit_growth => natural(ceil(log2(real(g_stages)))))
      port map (
        x_i     => adjusted_x,
        y_i     => adjusted_y,
        z_i     => adjusted_z,
        clk_i   => clk_i,
        ce_i    => ce_i,
        rst_i   => rst_i,
        valid_i => valid_temp,
        x_o     => mag_temp,
        y_o     => y_temp,
        z_o     => phase_temp,
        valid_o => valid_o);

      mag_o   <= std_logic_vector(mag_temp);
      phase_o <= std_logic_vector(phase_temp);

      end architecture str;

-------------------------------------------------------------------------------
