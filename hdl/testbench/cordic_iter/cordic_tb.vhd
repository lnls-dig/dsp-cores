-------------------------------------------------------------------------------
-- Title      : Testbench for CORDIC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cordic_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2015-05-06
-- Last update: 2015-05-28
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This testbench depends on GNU Octave .m files to generate
-- signals and to check them in the output. A Modelsim-compatible TCL run.do
-- file invokes GNU Octave to both generate the input data and to check outputs.
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Aylons

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
-- 2015-05-06  1.0      aylons  Created
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

entity cordic_tb is

end entity cordic_tb;

architecture test of cordic_tb is

  constant c_CLK_FREQ        : real    := 100.0e6;  -- input clock frequency
  constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset
  constant c_CYCLES_TO_CE    : natural := 10;  -- number of clock cycles before reset

  constant c_INPUT_FILE  : string := "input.samples";
  constant c_OUTPUT_FILE : string := "output.samples";

  constant c_INPUT_WIDTH          : positive := 32;
  constant c_OUTPUT_WIDTH         : positive := 32;
  constant c_INTERNAL_WIDTH       : positive := 38;  -- output_width + log2(c_ITER) +
                                                     -- 2

  constant c_PHASE_OUTPUT_WIDTH   : positive := 32;  -- width of phase output
  constant c_PHASE_INTERNAL_WIDTH : positive := 34;  -- width of cordic phase

  constant c_ITER         : positive := 16;  -- number of cordic steps
  constant c_ITER_PER_CLK : positive := 2;  -- number of iterations per clock cycle

  constant c_USE_CE    : boolean := true;  -- clock enable in cordic
  constant c_ROUNDING  : boolean := true;  -- enable rounding in cordic
  constant c_USE_INREG : boolean := true;  -- use input register

  signal clk : std_ulogic := '0';       -- clock signal
  signal rst : std_ulogic := '1';       -- reset signal
  signal ce  : std_ulogic := '0';       -- clock enable

  signal valid_in     : std_ulogic;     -- signals valid input data
  signal valid_out    : std_ulogic;     -- signals new valid output
  signal cordic_busy  : std_ulogic;  -- signals cordic not ready for new inputs
  signal cordic_ready : std_ulogic;     -- negated cordic_busy
  signal end_of_file  : std_ulogic;

  signal x : signed(c_INPUT_WIDTH-1 downto 0);  -- x from the input
  signal y : signed(c_INPUT_WIDTH-1 downto 0);  -- y from the input

  signal mag   : signed(c_OUTPUT_WIDTH-1 downto 0);  -- magnitude from X output in
                                                     -- cordic
  signal phase : signed(c_PHASE_OUTPUT_WIDTH-1 downto 0);  -- phase from PH output of cordic

  component cordic is
    generic (
      XY_CALC_WID  : positive;
      XY_IN_WID    : positive;
      X_OUT_WID    : positive;
      PH_CALC_WID  : positive;
      PH_OUT_WID   : positive;
      NUM_ITER     : positive;
      ITER_PER_CLK : positive;
      USE_INREG    : boolean;
      USE_CE       : boolean;
      ROUNDING     : boolean);
    port (
      clk        : in  std_logic;
      ce         : in  std_logic;
      b_start_in : in  std_logic;
      s_x_in     : in  signed (XY_IN_WID-1 downto 0);
      s_y_in     : in  signed (XY_IN_WID-1 downto 0);
      s_x_o      : out signed (X_OUT_WID-1 downto 0);
      s_ph_o     : out signed (PH_OUT_WID-1 downto 0);
      b_rdy_o    : out std_logic;
      b_busy_o   : out std_logic);
  end component cordic;

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
    ce       => ce,
    rst      => rst,
    c_CYCLES => c_CYCLES_TO_CE);


  p_read_tsv_file_signed (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => clk,
    rst                => rst,
    ce                 => ce,
    req                => cordic_ready,
    sample(0)          => x,
    sample(1)          => y,
    valid              => valid_in,
    end_of_file        => end_of_file);

  cordic_ready <= not cordic_busy;
  uut : cordic
    generic map (
      XY_CALC_WID  => c_INTERNAL_WIDTH,
      XY_IN_WID    => c_INPUT_WIDTH,
      X_OUT_WID    => c_OUTPUT_WIDTH,
      PH_CALC_WID  => c_PHASE_INTERNAL_WIDTH,
      PH_OUT_WID   => c_PHASE_OUTPUT_WIDTH,
      NUM_ITER     => c_ITER,
      ITER_PER_CLK => c_ITER_PER_CLK,
      USE_INREG    => c_USE_INREG,
      USE_CE       => c_USE_CE,
      ROUNDING     => c_ROUNDING)
    port map (
      clk        => clk,
      ce         => ce,
      b_start_in => valid_in,
      b_busy_o   => cordic_busy,
      s_x_in     => x,
      s_y_in     => y,
      s_x_o      => mag,
      s_ph_o     => phase,
      b_rdy_o    => valid_out);


  p_write_tsv_file_signed (
    c_OUTPUT_FILE_NAME => c_OUTPUT_FILE,
    c_SAMPLES_PER_LINE => 2,
    c_OUTPUT_WIDTH     => c_OUTPUT_WIDTH,
    clk                => clk,
    rst                => rst,
    ce                 => ce,
    sample(0)          => mag,
    sample(1)          => phase,
    valid              => valid_out,
    end_of_file        => end_of_file);


end architecture test;
