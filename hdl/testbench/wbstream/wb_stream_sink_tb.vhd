-------------------------------------------------------------------------------
-- Title      : Testbench for design "wb_stream_sink"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_sink_tb.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-22
-- Last update: 2015-07-22
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
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
-- 2015-07-22  1.0      finotti	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.wb_stream_pkg.all;

-------------------------------------------------------------------------------

entity wb_stream_sink_tb is

architecture test of wb_stream_sink_tb is

  --constant c_input_freq : real := 120.0e6;
  --constant clock_period : time := 1.0 sec / (2.0 * c_input_freq);

  --constant c_ce_rate : natural := 4;

  --signal reset : std_logic := '1';
  --signal clock : std_logic := '0';
  --signal rst_n : std_logic;
  --signal ce    : std_logic := '0';
  
  -- component generics
  constant g_data_width   : natural := 32;
  constant g_addr_width   : natural := 4;
  constant g_tgd_width    : natural := 4;
  constant g_buffer_depth : natural := 4;

  -- component ports
  signal clk_i    : std_logic;
  signal rst_i    : std_logic;
  signal snk_i    : t_wbs_sink_in;
  signal snk_o    : t_wbs_sink_out;
  signal addr_o   : std_logic_vector(g_addr_width-1 downto 0);
  signal data_o   : std_logic_vector(g_data_width-1 downto 0);
  signal tgd_o    : std_logic_vector(g_tgd_width-1 downto 0);
  signal dvalid_o : std_logic;
  signal busy_i   : std_logic;

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture test

  -- component instantiation
  DUT: entity work.wb_stream_sink
    generic map (
      g_data_width   => g_data_width,
      g_addr_width   => g_addr_width,
      g_tgd_width    => g_tgd_width,
      g_buffer_depth => g_buffer_depth)
    port map (
      clk_i    => clk_i,
      rst_i    => rst_i,
      snk_i    => snk_i,
      snk_o    => snk_o,
      addr_o   => addr_o,
      data_o   => data_o,
      tgd_o    => tgd_o,
      dvalid_o => dvalid_o,
      busy_i   => busy_i);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    tset

    wait until Clk = '1';
  end process WaveGen_Proc;

  

end architecture test;

-------------------------------------------------------------------------------

configuration wb_stream_sink_tb_test_cfg of wb_stream_sink_tb is
  for test
  end for;
end wb_stream_sink_tb_test_cfg;

-------------------------------------------------------------------------------

end entity wb_stream_sink_tb;

-------------------------------------------------------------------------------
