-------------------------------------------------------------------------------
-- Title      : Testbench for design "wbs_cordic_iter"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_cordic_iter_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-06
-- Last update: 2015-08-14
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
-- 2015-08-06  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.wb_stream_pkg.all;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity wbs_cordic_iter_top is

  generic (
    g_input_width   : natural := 4; --64
    g_output_width  : natural := 4; --64
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
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;
    src_i : in  t_wbs_source_in;
    src_o : out t_wbs_source_out);

end entity wbs_cordic_iter_top;

architecture top of wbs_cordic_iter_top is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------

  -- Test_pkg constants
  constant c_CYCLES_TO_CE : natural := 20;  -- number of clock cycles before reset

  -- Test_pkg signals

  -- component generics
  --constant g_input_width   : natural := 64;
  --constant g_output_width  : natural := 64;
  --constant g_tgd_width     : natural := 10;
  --constant g_adr_width     : natural := 4;
  --constant g_input_buffer  : natural := 4;
  --constant g_output_buffer : natural := 2;
  --constant g_ce_core       : natural := 5;
  --constant g_num_iter      : natural := 16;
  --constant g_iter_per_clk  : natural := 2;

  -- component ports
  signal s_clk   : std_logic        := '0';
  signal s_rst   : std_logic        := '1';
  signal s_ce    : std_logic        := '0';
  signal s_snk_i : t_wbs_sink_in    := cc_dummy_snk_in;
  signal s_snk_o : t_wbs_sink_out   := cc_dummy_src_in;
  signal s_src_i : t_wbs_source_in  := cc_dummy_src_in;
  signal s_src_o : t_wbs_source_out := cc_dummy_snk_in;

  -- auxiliar signals

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component wbs_cordic_iter is
    generic (
      g_input_width   : natural;
      g_output_width  : natural;
      g_tgd_width     : natural;
      g_adr_width     : natural;
      g_input_buffer  : natural;
      g_output_buffer : natural;
      g_ce_core       : natural;
      g_num_iter      : natural;
      g_iter_per_clk  : natural);
    port (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
      snk_i : in  t_wbs_sink_in;
      snk_o : out t_wbs_sink_out;
      src_i : in  t_wbs_source_in;
      src_o : out t_wbs_source_out);
  end component wbs_cordic_iter;

  component ce_gen is
    generic (
      g_clk_num : positive);
    port (
      clk_i : in  std_ulogic;
      rst_i : in  std_ulogic;
      ce_o  : out std_ulogic);
  end component ce_gen;


begin  -- architecture top

  -----------------------------------------------------------------------------
  -- Processes and Procedures
  -----------------------------------------------------------------------------


  -----------------------------------------------------------------------------
  -- Component instantiation
  -----------------------------------------------------------------------------

  cmp_ce_gen : ce_gen
    generic map (
      g_clk_num => c_CYCLES_TO_CE)
    port map (
      clk_i => s_clk,
      rst_i => s_rst,
      ce_o  => s_ce);

  cmp_wbs_cordic_iter : wbs_cordic_iter
    generic map (
      g_input_width   => g_input_width,
      g_output_width  => g_output_width,
      g_tgd_width     => g_tgd_width,
      g_adr_width     => g_adr_width,
      g_input_buffer  => g_input_buffer,
      g_output_buffer => g_output_buffer,
      g_ce_core       => g_ce_core,
      g_num_iter      => g_num_iter,
      g_iter_per_clk  => g_iter_per_clk)
    port map (
      clk_i => s_clk,
      rst_i => s_rst,
      ce_i  => s_ce,
      snk_i => s_snk_i,
      snk_o => s_snk_o,
      src_i => s_src_i,
      src_o => s_src_o);  


  -----------------------------------------------------------------------------
  -- Combinational logic and other signal atributions
  -----------------------------------------------------------------------------

  s_clk   <= clk_i;
  s_rst   <= rst_i;
  s_snk_i <= snk_i;
  snk_o   <= s_snk_o;
  s_src_i <= src_i;
  src_o   <= s_src_o;

end architecture top;
