-------------------------------------------------------------------------------
-- Title      : Testbench for design "cordic_core"
-- Project    :
-------------------------------------------------------------------------------
-- File       : cordic_core_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-11-19
-- Last update: 2015-11-24
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Brazilian Synchrotron Light Laboratory, LNLS/CNPEM

-- This program is free software: you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program. If not, see
-- <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2015-11-19  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.test_pkg.all;

-------------------------------------------------------------------------------

entity cordic_core_tb is

end entity cordic_core_tb;

-------------------------------------------------------------------------------

architecture test of cordic_core_tb is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  constant c_CLK_FREQ     : real    := 100.0e6;
  constant c_CYCLES_TO_CE : natural := 4;

  constant c_INPUT_FILE  : string  := "vectoring_in.samples";
  constant c_INPUT_WIDTH : natural := 32;

  constant c_OUTPUT_FILE  : string  := "vectoring_out.samples";
  constant c_OUTPUT_WIDTH : natural := 32;

  signal end_of_file    : std_logic := '0';
  constant cordic_delay : natural   := 27;

  -- component generics
  constant g_stages     : natural := 15;
  constant g_bit_growth : natural := natural(ceil(log2(real(g_stages))));
  constant g_mode       : string  := "rect_to_polar";

  -- component ports
  signal s_x_i     : signed(c_INPUT_WIDTH-1 downto 0);
  signal s_y_i     : signed(c_INPUT_WIDTH-1 downto 0);
  signal s_z_i     : signed(c_INPUT_WIDTH-1 downto 0) := (c_INPUT_WIDTH-1 downto 0 => '0');
  signal s_clk     : std_logic;
  signal s_ce      : std_logic;
  signal s_rst     : std_logic;
  signal s_valid_i : std_logic;
  signal s_x_o     : signed(c_INPUT_WIDTH-1 downto 0);
  signal s_y_o     : signed(c_INPUT_WIDTH-1 downto 0);
  signal s_z_o     : signed(c_INPUT_WIDTH-1 downto 0);
  signal s_valid_o : std_logic;

  signal s_req_data :std_logic := '1';
  signal s_x_i_real :real;
  signal s_y_i_real :real;
  signal s_x_o_real :real;
  signal s_y_o_real :real;

  component cordic_core is
    generic (
      g_stages     : natural;
      g_bit_growth : natural;
      g_mode       : string);
    port (
      x_i     : in  signed;
      y_i     : in  signed;
      z_i     : in  signed;
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      rst_i   : in  std_logic;
      valid_i : in  std_logic;
      x_o     : out signed;
      y_o     : out signed;
      z_o     : out signed;
      valid_o : out std_logic);
  end component cordic_core;

begin  -- architecture test

  p_clk_gen (
    clk    => s_clk,
    c_FREQ => c_CLK_FREQ);

  p_rst_gen (
    clk      => s_clk,
    rst      => s_rst,
    c_CYCLES => 2);

  p_ce_gen (
    clk      => s_clk,
    ce       => s_ce,
    rst      => s_rst,
    c_CYCLES => c_CYCLES_TO_CE);


  p_read_tsv_file_signed (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => s_clk,
    rst                => s_rst,
    ce                 => s_ce,
    req                => s_req_data,
    sample(0)          => s_x_i,
    sample(1)          => s_y_i,
    valid              => s_valid_i,
    end_of_file        => end_of_file);

  -- component instantiation
  DUT : cordic_core
    generic map (
      g_stages     => g_stages,
      g_bit_growth => g_bit_growth,
      g_mode       => g_mode)
    port map (
      x_i     => s_x_i,
      y_i     => s_y_i,
      z_i     => s_z_i,
      clk_i   => s_clk,
      ce_i    => s_ce,
      rst_i   => s_rst,
      valid_i => s_valid_i,
      x_o     => s_x_o,
      y_o     => s_y_o,
      z_o     => s_z_o,
      valid_o => s_valid_o);

  p_write_tsv_file_signed (
    c_OUTPUT_FILE_NAME => c_OUTPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_OUTPUT_WIDTH,
    clk                => s_clk,
    rst                => s_rst,
    ce                 => s_ce,
    sample(0)          => s_x_o,
    sample(1)          => s_z_o,
    valid              => s_valid_o,
    end_of_file        => end_of_file);


end architecture test;

-------------------------------------------------------------------------------

configuration cordic_core_tb_test_cfg of cordic_core_tb is
  for test
  end for;
end cordic_core_tb_test_cfg;

-------------------------------------------------------------------------------
