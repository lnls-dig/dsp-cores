-------------------------------------------------------------------------------
-- Title      : Dual CIC filter- Wishbone Stream version
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_cic_dyn.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-19
-- Last update: 2015-09-03
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Module "cic_dual" wrapped by an wishbone stream wrapper
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
-- 2015-08-19  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

library work;
use work.wb_stream_pkg.all;

-------------------------------------------------------------------------------

entity wbs_cic_dual is

  generic (
    g_input_width  : natural := 64;     -- 2*24
    g_output_width : natural := 64;     -- 2*52
    g_tgd_width    : natural := 4;
    g_adr_width    : natural := 4;
    g_ce_core      : natural := 4;
    g_pipe_depth   : natural := 1;
    -- core specific parameters
    g_stages       : natural := 1;      -- aka "N"
    g_delay        : natural := 1;      -- aka "M"
    g_max_rate     : natural := 2048;   -- Max decimation rate
    g_bus_width    : natural := 11      -- Decimation ratio bus width.
    );

  port (
    clk_i : in  std_logic;
    rst_i : in  std_logic;
    ce_i  : in  std_logic;
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;
    src_i : in  t_wbs_source_in;
    src_o : out t_wbs_source_out);

end entity wbs_cic_dual;

architecture behavior of wbs_cic_dual is

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
  
  signal s_ce_core_smart : std_logic                                := '0';
  signal s_I_i, s_Q_i    : std_logic_vector(g_input_width/2-1 downto 0);
  signal s_I_o, s_Q_o    : std_logic_vector(g_output_width/2-1 downto 0);
  signal ratio_temp      : std_logic_vector(g_bus_width-1 downto 0) := std_logic_vector(to_unsigned(g_max_rate, g_bus_width));


-----------------------------------------------------------------------------
-- Component declarations
-----------------------------------------------------------------------------

  component wb_stream_wrapper is
    generic (
      g_input_width  : natural;
      g_output_width : natural;
      g_tgd_width    : natural;
      g_adr_width    : natural;
      g_ce_core      : natural;
      g_pipe_depth   : natural);
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

  component cic_dual is
    generic (
      g_input_width  : natural;
      g_output_width : natural;
      g_stages       : natural;
      g_delay        : natural;
      g_max_rate     : natural;
      g_bus_width    : natural);
    port (
      clock_i : in std_logic;
      reset_i : in std_logic;
      ce_i    : in std_logic;
      valid_i : in std_logic;
      I_i     : in std_logic_vector;
      Q_i     : in std_logic_vector;
      ratio_i : in std_logic_vector;

      I_o     : out std_logic_vector(g_output_width/2-1 downto 0);
      Q_o     : out std_logic_vector(g_output_width/2-1 downto 0);
      valid_o : out std_logic);
  end component cic_dual;

begin  -- architecture behavior

-----------------------------------------------------------------------------
-- Processes and Procedures
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Combinational logic and other signal atributions
-----------------------------------------------------------------------------


  -- Combinational logic
  s_busy_i        <= '0';
  s_ce_core_smart <= (s_ce_core_o and s_valid_o);  -- Only enable "ce_core" when there is data
 
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
      g_input_width  => g_input_width,
      g_output_width => g_output_width,
      g_tgd_width    => g_tgd_width,
      g_adr_width    => g_adr_width,
      g_pipe_depth   => g_pipe_depth,
      g_ce_core      => g_ce_core)
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

  core : cic_dual
    generic map (
      g_input_width  => g_input_width/2,
      g_output_width => g_output_width/2,
      g_stages       => g_stages,
      g_delay        => g_delay,
      g_max_rate     => g_max_rate,
      g_bus_width    => g_bus_width)
    port map (
      clock_i => s_clk,
      reset_i => s_rst,
      ce_i    => s_ce_core_smart,
      valid_i => s_valid_o,
      I_i     => s_dat_o(g_input_width-1 downto g_input_width/2),
      Q_i     => s_dat_o(g_input_width/2-1 downto 0),
      ratio_i => ratio_temp,  --std_logic_vector(to_unsigned(g_max_rate, g_bus_width)),
      I_o     => s_dat_i(g_output_width-1 downto g_output_width/2),
      Q_o     => s_dat_i(g_output_width/2-1 downto 0),
      valid_o => s_valid_i);

end architecture behavior;
