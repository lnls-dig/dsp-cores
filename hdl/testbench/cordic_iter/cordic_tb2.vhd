-------------------------------------------------------------------------------
-- Title      : Testbench for design "cordic_iter_slv"
-- Project    :
-------------------------------------------------------------------------------
-- File       : cordic_iter_slv_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-11-23
-- Last update: 2015-11-25
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
-- Date        Version  Author  Description
-- 2015-11-23  1.0      vfinotti        Created
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

library work;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity cordic_tb2 is

end entity cordic_tb2;

-------------------------------------------------------------------------------

architecture behav of cordic_tb2 is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  constant c_CLK_FREQ          : real    := 100.0e6;
  constant c_CYCLES_TO_CE      : natural := 4;
  constant c_CYCLES_TO_CE_DATA : natural := 8;

  constant c_INPUT_FILE  : string  := "vectoring_in.samples";
  constant c_INPUT_WIDTH : natural := 32;

  constant c_OUTPUT_FILE  : string  := "vectoring_out.samples";
  constant c_OUTPUT_WIDTH : natural := 32;

  signal end_of_file : std_logic := '0';

  -- component generics
  constant c_input_width1        : positive := 32;
  constant c_stages             : positive := 15;
  constant c_xy_calc_width      : positive := 32 + natural(ceil(log2(real(4))));
  constant c_x_output_width     : positive := 32;
  constant c_phase_calc_width   : positive := c_input_width1 + natural(ceil(log2(real(c_stages))))+2;
  constant c_phase_output_width : positive := 32;
  constant c_iter_per_clk       : positive := 3;
  constant c_rounding           : boolean  := true;

  -- component ports
  signal s_clk       : std_logic;
  signal s_rst       : std_logic;
  signal s_ce_data_i : std_logic;
  signal s_valid_i   : std_logic;
  signal s_ce        : std_logic;
  signal s_valid_o   : std_logic;

  signal s_stall : std_logic := '0';
  signal s_req   : std_logic := '0';

  signal s_x_i_s     : signed(c_input_width1-1 downto 0);
  signal s_y_i_s     : signed(c_input_width1-1 downto 0);
  signal s_mag_o_s   : signed(c_x_output_width-1 downto 0);
  signal s_phase_o_S : signed(c_phase_output_width-1 downto 0);


begin  -- architecture behav

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

  p_ce_gen (
    clk      => s_clk,
    ce       => s_ce_data_i,
    rst      => s_rst,
    c_CYCLES => c_CYCLES_TO_CE_DATA);

  -- component instantiation
  DUT : cordic
    generic map (
      XY_CALC_WID  => c_xy_calc_width,
      XY_IN_WID    => c_input_width1,
      X_OUT_WID    => c_x_output_width,
      PH_CALC_WID  => c_phase_calc_width,
      PH_OUT_WID   => c_phase_output_width,
      NUM_ITER     => c_stages,
      ITER_PER_CLK => c_iter_per_clk,
      USE_INREG    => false,
      USE_CE       => true,
      ROUNDING     => true)
    port map (
      clk        => s_clk,
      ce         => s_ce,
      b_start_in => s_valid_i,
      s_x_in     => s_x_i_s,
      s_y_in     => s_y_i_s,
      s_x_o      => s_mag_o_s,
      s_ph_o     => s_phase_o_s,
      b_rdy_o    => s_valid_o,
      b_busy_o   => s_stall);

  p_read_tsv_file_signed (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => s_clk,
    rst                => s_rst,
    ce                 => s_ce,
    req                => s_req,
    sample(0)          => s_x_i_s,
    sample(1)          => s_y_i_s,
    valid              => s_valid_i,
    end_of_file        => end_of_file);

  p_write_tsv_file_signed (
    c_OUTPUT_FILE_NAME => c_OUTPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_OUTPUT_WIDTH,
    clk                => s_clk,
    rst                => s_rst,
    ce                 => s_ce,
    sample(0)          => s_mag_o_s,
    sample(1)          => s_phase_o_s,
    valid              => s_valid_o,
    end_of_file        => end_of_file);

  s_req <= not(s_stall);


end architecture behav;

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
