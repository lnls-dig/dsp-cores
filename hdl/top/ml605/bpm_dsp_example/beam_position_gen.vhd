-------------------------------------------------------------------------------
-- Title      : Beam position generator for BPM testbench
-- Project    : BPM DSP-cores
-------------------------------------------------------------------------------
-- File       : beam_position.vhd
-- Author     : Gustavo BM Bruno
-- Company    : 
-- Created    : 2014-01-10
-- Last update: 2014-01-13
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module generates beam position information to be used in
-- the BPM DSP-core testbench. This information may be used for validation and
-- core latency measurement.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-10  1.0      aylons	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;


entity beam_position_gen is
  generic(
    g_resolution : natural := 16;
    g_frequency  : natural := 2e3;
    g_clock      : natural := 130e6
    );
  port(
    rst: in std_logic;
    clk: in std_logic; -- main clock
    beam_position: out std_logic_vector(g_resolution-1 downto 0)
    );

 end entity beam_position_gen;

 architecture rtl of beam_position_gen is

   --Signals
   --Calculated constants
   --Phase increment, according to Xilinx's DDS datasheet
   constant c_THETA : integer := integer(g_frequency*(2**20)/g_clock);

   --Components
   component dds_beam_position
     port (
       clk: in std_logic;
       pinc_in: in std_logic_vector(19 downto 0);
       cosine: out std_logic_vector(15 downto 0));
   end component;

begin

  cmp_dds_beam_position : dds_beam_position
    port map (
      clk                => clk,
      pinc_in            => std_logic_vector(to_unsigned(c_THETA, 20)),
      cosine             => beam_position
      );

end rtl;
