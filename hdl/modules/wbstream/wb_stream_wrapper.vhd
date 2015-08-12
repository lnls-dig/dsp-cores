-------------------------------------------------------------------------------
-- Title      : Wishbone Stream Project
-- Wrapper    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_wrapper.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-07-28
-- Last update: 2015-08-12
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This is a component that wraps both sink and source in one device.
-- Each core should be wrapped with it.
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
-- 2015-07-28  1.0      vfinotti        Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.wb_stream_pkg.all;


entity wb_stream_wrapper is

  generic (
    g_input_width   : natural := 32;
    g_output_width  : natural := 32;
    g_tgd_width     : natural := 4;
    g_adr_width     : natural := 4;
    --g_input_depth   : natural := 1;
    --g_output_depth  : natural := 1;
    g_input_buffer  : natural := 4;
    g_output_buffer : natural := 2;
    g_ce_core       : natural := 5      -- number of clocks to enable ce_core
    );

  port (
    -- facing the outside
    clk_i : in  std_logic;
    rst_i : in  std_logic;
    ce_i  : in  std_logic;
    snk_i : in  t_wbs_sink_in    := cc_dummy_snk_in;
    snk_o : out t_wbs_sink_out   := cc_dummy_src_in;
    src_i : in  t_wbs_source_in  := cc_dummy_src_in;
    src_o : out t_wbs_source_out := cc_dummy_snk_in;

    -- facing the inside
    dat_o : out std_logic_vector(g_input_width-1 downto 0);
    dat_i : in  std_logic_vector(g_output_width-1 downto 0);

    busy_i : in std_logic;

    valid_o : out std_logic;
    valid_i : in  std_logic;

    ce_core_o : out std_logic
    );

end entity wb_stream_wrapper;

architecture behavior of wb_stream_wrapper is

  -----------------------------------------------------------------------------
  -- Signals and Registers declarations
  -----------------------------------------------------------------------------

  -- Universal signals
  signal clk : std_logic;
  signal rst : std_logic;
  signal ce  : std_logic;


  -- Signals facing outside
  signal out_to_sink_snk : t_wbs_sink_in  := cc_dummy_snk_in;
  signal sink_to_out_snk : t_wbs_sink_out := cc_dummy_src_in;

  signal out_to_source_src : t_wbs_source_in  := cc_dummy_src_in;
  signal source_to_out_src : t_wbs_source_out := cc_dummy_snk_in;

  -- Signals facing inside
  signal sink_to_core_dat   : std_logic_vector(g_input_width-1 downto 0);
  signal sink_to_r_adr      : std_logic_vector(g_adr_width-1 downto 0);
  signal sink_to_r_tgd      : std_logic_vector(g_tgd_width-1 downto 0);
  signal sink_to_core_valid : std_logic;

  signal source_to_or_busy : std_logic;

  signal core_to_source_dat : std_logic_vector(g_output_width-1 downto 0);
  signal core_to_r_valid    : std_logic;
  signal core_to_or_busy    : std_logic;

  signal or_to_sink_busy : std_logic;

  signal wrapper_to_core_ce_core : std_logic;

  -- Registers
  signal r_to_source_adr   : std_logic_vector(g_adr_width-1 downto 0);
  signal r_to_source_tgd   : std_logic_vector(g_tgd_width-1 downto 0);
  signal r_to_source_valid : std_logic;

  -- Auxiliar signals
--  signal ce_core_counter : natural range g_ce_core downto 0 := 0;

  -----------------------------------------------------------------------------
  -- Components declarations
  -----------------------------------------------------------------------------

  component wb_stream_sink is
    generic (
      g_dat_width : natural;
      g_adr_width : natural;
      g_tgd_width : natural);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      ce_i      : in  std_logic;
      snk_i     : in  t_wbs_sink_in;
      snk_o     : out t_wbs_sink_out;
      adr_o     : out std_logic_vector(g_adr_width-1 downto 0);
      dat_o     : out std_logic_vector(g_input_width-1 downto 0);
      tgd_o     : out std_logic_vector(g_tgd_width-1 downto 0);
      dvalid_o  : out std_logic;
      busy_i    : in  std_logic;
      ce_core_i : in  std_logic);
  end component wb_stream_sink;


  component wb_stream_source is
    generic (
      g_dat_width : natural;
      g_adr_width : natural;
      g_tgd_width : natural);
    port (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ce_i     : in  std_logic;
      src_i    : in  t_wbs_source_in;
      src_o    : out t_wbs_source_out;
      adr_i    : in  std_logic_vector(g_adr_width-1 downto 0);
      dat_i    : in  std_logic_vector(g_output_width-1 downto 0);
      tgd_i    : in  std_logic_vector(g_tgd_width-1 downto 0);
      dvalid_i : in  std_logic;
      busy_o   : out std_logic);
  end component wb_stream_source;

begin

  -----------------------------------------------------------------------------
  -- Combinational logic
  -----------------------------------------------------------------------------

  or_to_sink_busy <= (core_to_or_busy or source_to_or_busy);

  -----------------------------------------------------------------------------
  -- Processes
  -----------------------------------------------------------------------------

  -- purpose: Used to syncronize "adr" and "tgd" signals with their respective "dat"
  -- type   : sequential
  -- inputs : core_to_source_valid, rst
  -- outputs: 
  enable_adr_tgd : process (clk, rst) is
  begin  -- process enable_adr_tgd
    if rising_edge(clk) then
      if rst = '1' then                 -- asynchronous reset (active high)
        r_to_source_tgd <= (others => '0');
        r_to_source_adr <= (others => '0');
      elsif (wrapper_to_core_ce_core = '1') and (sink_to_core_valid = '1') then  -- rising clock edge
        r_to_source_adr <= sink_to_r_adr;
        r_to_source_tgd <= sink_to_r_tgd;
      end if;
    end if;
  end process enable_adr_tgd;


-- purpose: Enables ce_core after a given number of clock cycles
-- type   : sequential
-- inputs : clk, rst, g_ce_core, ce_core_counter
-- outputs: wrapper_to_core_ce_core
  ce_core_process : process (clk, rst) is
    variable ce_core_counter : natural range g_ce_core downto 0 := 0;
    
  begin  -- process ce_core_process
    if rising_edge(clk) then
      if rst = '1' then
        wrapper_to_core_ce_core <= '0';
        ce_core_counter         := 0;
      else
        if ce_core_counter = g_ce_core then
          wrapper_to_core_ce_core <= '1';
          ce_core_counter         := 0;
        else
          wrapper_to_core_ce_core <= '0';
          ce_core_counter         := ce_core_counter + 1;
        end if;
      end if;
    end if;
  end process ce_core_process;

-- purpose: Holds core_to_source_valid value "set" until ce happens
-- type   : sequential
-- inputs : core_to_source_valid, ce, rst, rst
-- outputs: 
  dvalid_process : process (ce, core_to_r_valid, rst) is
  begin  -- process dvalid_process
    if rst = '1' then                   -- asynchronous reset (active high)
      r_to_source_valid <= '0';
    elsif (core_to_r_valid = '1') then  -- rising clock edge
      r_to_source_valid <= '1';
    elsif (ce = '1') then
      r_to_source_valid <= '0';
    end if;
  end process dvalid_process;

-----------------------------------------------------------------------------
-- Component instantiation
-----------------------------------------------------------------------------

  sink : wb_stream_sink
    generic map (
      g_dat_width => g_input_width,
      g_adr_width => g_adr_width,
      g_tgd_width => g_tgd_width)
    port map (
      clk_i     => clk,
      rst_i     => rst,
      ce_i      => ce,
      snk_i     => out_to_sink_snk,
      snk_o     => sink_to_out_snk,
      adr_o     => sink_to_r_adr,
      dat_o     => sink_to_core_dat,
      tgd_o     => sink_to_r_tgd,
      dvalid_o  => sink_to_core_valid,
      busy_i    => or_to_sink_busy,
      ce_core_i => wrapper_to_core_ce_core);


  source : wb_stream_source
    generic map (
      g_dat_width => g_output_width,
      g_adr_width => g_adr_width,
      g_tgd_width => g_tgd_width)
    port map (
      clk_i    => clk,
      rst_i    => rst,
      ce_i     => ce,
      src_i    => out_to_source_src,
      src_o    => source_to_out_src,
      adr_i    => r_to_source_adr,
      dat_i    => core_to_source_dat,
      tgd_i    => r_to_source_tgd,
      dvalid_i => r_to_source_valid,
      busy_o   => source_to_or_busy);


-----------------------------------------------------------------------------
-- Connect signals to entity ports
-----------------------------------------------------------------------------

-- facing the outside
  clk <= clk_i;
  rst <= rst_i;
  ce  <= ce_i;

  out_to_sink_snk   <= snk_i;
  out_to_source_src <= src_i;

  snk_o <= sink_to_out_snk;
  src_o <= source_to_out_src;

-- facing the inside
  core_to_source_dat(g_output_width-1 downto 0) <= dat_i(g_output_width-1 downto 0);
  core_to_or_busy                               <= busy_i;
  core_to_r_valid                               <= valid_i;

  dat_o(g_input_width-1 downto 0) <= sink_to_core_dat(g_input_width-1 downto 0);
  valid_o                         <= sink_to_core_valid;
  ce_core_o                       <= wrapper_to_core_ce_core;

end architecture behavior;
