-------------------------------------------------------------------------------
-- Title      : Cordic SLV testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cordic_slv_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2015-06-11
-- Last update: 2015-06-12
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: SLV version of cordic_tb.
-------------------------------------------------------------------------------
-- Copyright (c) 2015     

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
-- 2015-06-11  1.0      aylons  Created
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

entity cordic_slv_tb is

end entity cordic_slv_tb;

architecture test of cordic_slv_tb is

  constant c_CLK_FREQ        : real    := 100.0e6;  -- input clock frequency
  constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset

  constant c_CYCLES_TO_CE_INPUT  : natural := 100;  -- number of clock cycles for
                                                    -- input ce
  constant c_CYCLES_TO_CE_CORDIC : natural := 4;  -- number of clock cycles for
                                                  -- cordic ce

  constant c_INPUT_FILE  : string := "input.samples";
  constant c_OUTPUT_FILE : string := "output.samples";

  constant c_INPUT_WIDTH    : positive := 32;
  constant c_OUTPUT_WIDTH   : positive := 32;
  constant c_INTERNAL_WIDTH : positive := 38;  -- output_width + log2(c_ITER) +
                                               -- 2

  constant c_PHASE_OUTPUT_WIDTH   : positive := 32;  -- width of phase output
  constant c_PHASE_INTERNAL_WIDTH : positive := 34;  -- width of cordic phase

  constant c_ITER         : positive := 16;  -- number of cordic steps
  constant c_ITER_PER_CLK : positive := 2;  -- number of iterations per clock cycle

  constant c_USE_CE    : boolean := true;  -- clock enable in cordic
  constant c_ROUNDING  : boolean := true;  -- enable rounding in cordic
  constant c_USE_INREG : boolean := true;  -- use input register

  signal clk       : std_ulogic := '0';  -- clock signal
  signal rst       : std_ulogic := '1';  -- reset signal
  signal ce_input  : std_ulogic := '0';  -- clock enable
  signal ce_cordic : std_ulogic := '0';  -- clock enable

  signal valid_in     : std_ulogic;     -- signals valid input data
  signal valid_out    : std_ulogic;     -- signals new valid output
  signal cordic_busy  : std_ulogic;  -- signals cordic not ready for new inputs
  signal cordic_ready : std_ulogic;     -- negated cordic_busy
  signal end_of_file  : std_ulogic;

  signal x : signed(c_INPUT_WIDTH-1 downto 0);  -- x from the input
  signal y : signed(c_INPUT_WIDTH-1 downto 0);  -- y from the input

  signal x_slv : std_logic_vector(c_INPUT_WIDTH-1 downto 0);  -- x from the input
  signal y_slv : std_logic_vector(c_INPUT_WIDTH-1 downto 0);  -- y from the input

  signal mag   : signed(c_OUTPUT_WIDTH-1 downto 0);  -- magnitude from X output in
                                                     -- cordic
  signal phase : signed(c_PHASE_OUTPUT_WIDTH-1 downto 0);  -- phase from PH output of cordic

  signal mag_slv   : std_logic_vector(c_OUTPUT_WIDTH-1 downto 0);  -- magnitude from X output in
                                                                   -- cordic
  signal phase_slv : std_logic_vector(c_PHASE_OUTPUT_WIDTH-1 downto 0);  -- phase from PH output of cordic


  component cordic_iter_slv is
    generic (
      g_input_width        : positive;
      g_xy_calc_width      : positive;
      g_x_output_width     : positive;
      g_phase_calc_width   : positive;
      g_phase_output_width : positive;
      g_stages             : positive;
      g_iter_per_clk       : positive;
      g_rounding           : boolean);
    port (
      clk_i     : in  std_logic;
      ce_data_i : in  std_logic;
      valid_i   : in  std_logic;
      ce_i      : in  std_logic;
      x_i       : in  std_logic_vector;
      y_i       : in  std_logic_vector;
      mag_o     : out std_logic_vector;
      phase_o   : out std_logic_vector;
      valid_o   : out std_logic);
  end component cordic_iter_slv;

begin  -- architecture test

  p_clk_gen (
    clk    => clk,
    c_FREQ => c_CLK_FREQ);

  p_rst_gen (
    clk      => clk,
    rst      => rst,
    c_CYCLES => 2);

  p_ce_gen (
    clk      => clk,
    ce       => ce_input,
    rst      => rst,
    c_CYCLES => c_CYCLES_TO_CE_INPUT);

  p_ce_gen (
    clk      => clk,
    ce       => ce_cordic,
    rst      => rst,
    c_CYCLES => c_CYCLES_TO_CE_CORDIC);

  p_read_tsv_file_signed (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, not the procedure
    clk                => clk,
    rst                => rst,
    ce                 => ce_input,
    req                => ce_input,
    sample(0)          => x,
    sample(1)          => y,
    valid              => valid_in,
    end_of_file        => end_of_file);

  x_slv <= std_logic_vector(x);
  y_slv <= std_logic_vector(y);

  uut : cordic_iter_slv
    generic map (
      g_input_width        => c_INPUT_WIDTH,
      g_xy_calc_width      => c_INTERNAL_WIDTH,
      g_x_output_width     => c_OUTPUT_WIDTH,
      g_phase_calc_width   => c_PHASE_INTERNAL_WIDTH,
      g_phase_output_width => c_PHASE_OUTPUT_WIDTH,
      g_stages             => c_ITER,
      g_iter_per_clk       => c_ITER_PER_CLK,
      g_rounding           => c_ROUNDING)
    port map (
      clk_i     => clk,
      ce_data_i => ce_input,
      valid_i   => valid_in,
      ce_i      => ce_cordic,
      x_i       => x_slv,
      y_i       => y_slv,
      mag_o     => mag_slv,
      phase_o   => phase_slv,
      valid_o   => valid_out);

  mag   <= signed(mag_slv);
  phase <= signed(phase_slv);

  p_write_tsv_file_signed (
    c_OUTPUT_FILE_NAME => c_OUTPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_OUTPUT_WIDTH,
    clk                => clk,
    rst                => rst,
    ce                 => ce_cordic,
    sample(0)          => mag,
    sample(1)          => phase,
    valid              => valid_out,
    end_of_file        => end_of_file);


end architecture test;
