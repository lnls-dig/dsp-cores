-------------------------------------------------------------------------------
-- Title      : Mixer -  Wishbone Stream version
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_mixer.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-19
-- Last update: 2015-08-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Module "mixer" wrapped by an wishbone stream wrapper
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


entity wbs_mixer is

  generic (
    g_input_width      : natural := 16;
    g_output_width     : natural := 64;
    g_tgd_width        : natural := 4;
    g_adr_width        : natural := 4;
    g_ce_core          : natural := 4;
    g_pipe_depth       : natural := 7;
    -- core specific parameters
    g_sin_file         : string  := "./dds_sin.nif";
    g_cos_file         : string  := "./dds_cos.nif";
    g_number_of_points : natural := 35;
    g_dds_width        : natural := 16;
    g_mult_levels      : natural := 7
    );

  port (
    clk_i : in  std_logic;
    rst_i : in  std_logic;
    ce_i  : in  std_logic;
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;
    src_i : in  t_wbs_source_in;
    src_o : out t_wbs_source_out);

end entity wbs_mixer;

architecture behavior of wbs_mixer is

-----------------------------------------------------------------------------
-- Signal declarations
-----------------------------------------------------------------------------

  -- Global signals
  signal s_clk : std_ulogic := '0';     -- clock signal
  signal s_rst : std_ulogic := '1';     -- reset signal
  signal s_ce  : std_ulogic := '0';     -- clock enable

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

  -- wrapper signals
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

  signal temp_i, temp_o : std_logic_vector(1 downto 0) := (others => '0');
  signal ce_temp        : std_logic                    := '0';
  signal r_valid_i      : std_logic                    := '0';


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

  component mixer is
    generic (
      g_sin_file         : string;
      g_cos_file         : string;
      g_number_of_points : natural;
      g_input_width      : natural;
      g_dds_width        : natural;
      g_output_width     : natural;
      g_mult_levels      : natural);
    port (
      reset_i  : in  std_logic;
      clock_i  : in  std_logic;
      ce_i     : in  std_logic;
      signal_i : in  std_logic_vector(g_input_width-1 downto 0);
      I_out    : out std_logic_vector(g_output_width-1 downto 0);
      Q_out    : out std_logic_vector(g_output_width-1 downto 0));
  end component mixer;

  component pipeline is
    generic (
      g_width : natural;
      g_depth : natural);
    port (
      data_i : in  std_logic_vector(g_width-1 downto 0);
      clk_i  : in  std_logic;
      ce_i   : in  std_logic;
      data_o : out std_logic_vector(g_width-1 downto 0));
  end component pipeline;

begin  -- architecture behavior

-----------------------------------------------------------------------------
-- Processes and Procedures
-----------------------------------------------------------------------------

  -- purpose: Process that allows sink and core to run with different "ce"
  -- type   : sequential
  -- inputs : (ce_i, ce_core_i), rst_i, ce_core_i, busy_i, update_out
  -- outputs: r_dvalid_o
  --dvalid_logic : process (s_clk) is
  --begin  -- process dvalid_logic
  --  if rising_edge(s_clk) then
  --    if s_rst = '1' then               -- asynchronous reset (active high)
  --      r_valid_i <= '0';
  --    elsif (s_ce = '1') then           -- assert valid/invalid data

  --      r_valid_i <= s_valid_i;         -- normal operation

  --    elsif (s_ce_core_o = '1') then      -- consume data
  --      r_valid_i <= '0';
  --    end if;
  --  -- r_dvalid_i <= update_out;
  --  end if;  -- clk_i
  --end process dvalid_logic;

-----------------------------------------------------------------------------
-- Combinational logic and other signal atributions
-----------------------------------------------------------------------------


  -- Combinational logic
  --s_dat_i((g_input_width/2)-1 downto 0)           <= std_logic_vector(s_mag);
  --s_dat_i(g_input_width-1 downto g_input_width/2) <= std_logic_vector(s_phase);
  s_busy_i  <= '0';                     -- always processes data in one clk
  s_valid_i <= '1';                     -- always has new data

  --temp_o(0) <= s_valid_o;
  --s_valid_i <= temp_i(0);
  
  ce_temp   <= (s_ce_core_o and s_valid_o); --or r_valid_i;



  -- Connecting external ports and signals
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

  pipe_dvalid : pipeline
    generic map (
      g_width    => 2,
      g_depth => g_pipe_depth)
    port map (
      data_i => temp_o,                 --s_valid_o,
      clk_i  => s_clk,
      ce_i   => s_ce,
      data_o => temp_i);                --s_valid_i);

  wrapper : wb_stream_wrapper
    generic map (
      g_input_width  => g_input_width,
      g_output_width => g_output_width,
      g_tgd_width    => g_tgd_width,
      g_adr_width    => g_adr_width,
      g_ce_core      => g_ce_core,
      g_pipe_depth   => g_pipe_depth)
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

  core : mixer
    generic map (
      g_sin_file         => g_sin_file,
      g_cos_file         => g_cos_file,
      g_number_of_points => g_number_of_points,
      g_input_width      => g_input_width,
      g_dds_width        => g_dds_width,
      g_output_width     => g_output_width/2,
      g_mult_levels      => g_mult_levels)
    port map (
      reset_i  => s_rst,
      clock_i  => s_clk,
      ce_i     => ce_temp,
      signal_i => s_dat_o(g_input_width-1 downto 0),
      I_out    => s_dat_i(g_output_width-1 downto g_output_width/2),
      Q_out    => s_dat_i(g_output_width/2-1 downto 0));
end architecture behavior;
