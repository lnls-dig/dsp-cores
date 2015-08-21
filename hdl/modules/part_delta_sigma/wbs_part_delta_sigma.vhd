-------------------------------------------------------------------------------
-- Title      : Partial Delta_Sigma Calculator - Wishbone Stream version
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_part_delta_sigma.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-17
-- Last update: 2015-08-17
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Module "part_delta_sigma" wrapped by an wishbone stream wrapper
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
-- 2015-08-17  1.0      vfinotti	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

library work;
use work.wb_stream_pkg.all;

-------------------------------------------------------------------------------

entity wbs_part_delta_sigma is

  generic (
    g_input_width   : natural := 64;
    g_output_width  : natural := 64;
    g_tgd_width     : natural := 4;
    g_adr_width     : natural := 4;
    g_input_buffer  : natural := 4;
    g_output_buffer : natural := 2;
    g_ce_core       : natural := 5;
    -- core specific parameters
    g_num_iter      : natural := 16;
    g_iter_per_clk  : natural := 2);

  port (
    clk_i : in  std_logic;
    rst_i : in  std_logic;
    ce_i  : in  std_logic;
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;
    src_i : in  t_wbs_source_in;
    src_o : out t_wbs_source_out);

end entity wbs_part_delta_sigma;

architecture behavior of wbs_part_delta_sigma is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------

  -- Global signals
  signal s_clk : std_ulogic := '0';     -- clock signal
  signal s_rst : std_ulogic := '1';     -- reset signal
  signal s_ce  : std_ulogic := '0';     -- clock enable

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  -- component ports
  signal s_snk_i     : t_wbs_sink_in    := cc_dummy_snk_in;
  signal s_snk_o     : t_wbs_sink_out   := cc_dummy_src_in;
  signal s_src_i     : t_wbs_source_in  := cc_dummy_src_in;
  signal s_src_o     : t_wbs_source_out := cc_dummy_snk_in;
  signal s_dat_o     : std_logic_vector(g_input_width-1 downto 0);
  signal s_dat_i     : std_logic_vector(g_output_width-1 downto 0);
  signal s_busy_i    : std_logic;
  signal s_valid_o   : std_logic;
  signal s_valid_i   : std_logic;
  signal s_ce_core_o : std_logic;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  constant c_ITER         : positive := g_num_iter;  -- number of cordic steps
  constant c_ITER_PER_CLK : positive := g_iter_per_clk;  -- number of iterations per clock cycle

  constant c_INPUT_WIDTH    : positive := g_input_width/2;
  constant c_OUTPUT_WIDTH   : positive := g_output_width/2;
  constant c_INTERNAL_WIDTH : positive := (g_output_width/2 + positive(log2(real(c_ITER))) + 2);  -- output_width + log2(c_ITER) + 2

  constant c_PHASE_OUTPUT_WIDTH   : positive := g_output_width/2;  -- width of phase output
  constant c_PHASE_INTERNAL_WIDTH : positive := g_output_width/2 + 2;  -- width of cordic phase --
                                        -- was 34 for 32 output_width

  constant c_USE_CE    : boolean := true;  -- clock enable in cordic
  constant c_ROUNDING  : boolean := true;  -- enable rounding in cordic
  constant c_USE_INREG : boolean := true;  -- use input register

  signal s_x : signed(c_INPUT_WIDTH-1 downto 0);  -- x from the input
  signal s_y : signed(c_INPUT_WIDTH-1 downto 0);  -- y from the input

  signal s_mag   : signed(c_OUTPUT_WIDTH-1 downto 0);  -- magnitude from X output in
                                                       -- cordic
  signal s_phase : signed(c_PHASE_OUTPUT_WIDTH-1 downto 0);  -- phase from PH output of cordic

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component wb_stream_wrapper is
    generic (
      g_input_width   : natural;
      g_output_width  : natural;
      g_tgd_width     : natural;
      g_adr_width     : natural;
      g_input_buffer  : natural;
      g_output_buffer : natural;
      g_ce_core       : natural);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      ce_i      : in  std_logic;
      snk_i     : in  t_wbs_sink_in;
      snk_o     : out t_wbs_sink_out;
      src_i     : in  t_wbs_source_in;
      src_o     : out t_wbs_source_out;
      dat_o     : out std_logic_vector;
      dat_i     : in  std_logic_vector;
      busy_i    : in  std_logic;
      valid_o   : out std_logic;
      valid_i   : in  std_logic;
      ce_core_o : out std_logic);
  end component wb_stream_wrapper;

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

begin  -- architecture behavior

  -----------------------------------------------------------------------------
  -- Processes and Procedures
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- Combinational logic and other signal atributions
  -----------------------------------------------------------------------------

  -- Conversion between data types
  s_x <= signed(s_dat_o((g_input_width/2)-1 downto 0));
  s_y <= signed(s_dat_o((g_input_width)-1 downto (g_input_width/2)));

  s_dat_i((g_input_width/2)-1 downto 0)             <= std_logic_vector(s_mag);
  s_dat_i(g_input_width-1 downto g_input_width/2) <= std_logic_vector(s_phase);

  -- Conecting ports and signals
  s_clk   <= clk_i;
  s_rst   <= rst_i;
  s_ce    <= ce_i;
  s_snk_i <= snk_i;
  snk_o   <= s_snk_o;
  s_src_i <= src_i;
  src_o   <= s_src_o;


  -----------------------------------------------------------------------------
  -- Port Maps
  -----------------------------------------------------------------------------

  wrapper : wb_stream_wrapper
    generic map (
      g_input_width   => g_input_width,
      g_output_width  => g_output_width,
      g_tgd_width     => g_tgd_width,
      g_adr_width     => g_adr_width,
      g_input_buffer  => g_input_buffer,
      g_output_buffer => g_output_buffer,
      g_ce_core       => g_ce_core)
    port map (
      clk_i     => s_clk,
      rst_i     => s_rst,
      ce_i      => s_ce,
      snk_i     => s_snk_i,
      snk_o     => s_snk_o,
      src_i     => s_src_i,
      src_o     => s_src_o,
      -- ports connected to core
      dat_o     => s_dat_o,
      dat_i     => s_dat_i,
      busy_i    => s_busy_i,
      valid_o   => s_valid_o,
      valid_i   => s_valid_i,
      ce_core_o => s_ce_core_o);

  cord : cordic
    generic map (
      XY_CALC_WID  => 38, --c_INTERNAL_WIDTH,
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
      clk        => s_clk,
      ce         => s_ce_core_o,
      b_start_in => s_valid_o,
      b_busy_o   => s_busy_i,
      s_x_in     => s_x,
      s_y_in     => s_y,
      s_x_o      => s_mag,
      s_ph_o     => s_phase,
      b_rdy_o    => s_valid_i);


end architecture behavior;
