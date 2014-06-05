-------------------------------------------------------------------------------
-- Title      : Dual cic filters
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cic_dual.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-26
-- Last update: 2014-06-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Dual cic filters with a commom strobe for I/Q decimation.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-26  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-------------------------------------------------------------------------------

entity cic_dual is

  generic (
    g_input_width  : natural := 16;
    g_output_width : natural := 16;
    g_stages       : natural := 1;      -- aka "N"
    g_delay        : natural := 1;      -- aka "M"
    g_max_rate     : natural := 2048;   -- Max decimation rate
    g_bus_width    : natural := 11      -- Decimation ratio bus width.
    );

  port (
    clock_i : in std_logic;
    reset_i : in std_logic;
    ce_i    : in std_logic;
    I_i     : in std_logic_vector(g_input_width-1 downto 0);
    Q_i     : in std_logic_vector(g_input_width-1 downto 0);
    ratio_i : in std_logic_vector(g_bus_width-1 downto 0);

    I_o     : out std_logic_vector(g_output_width-1 downto 0);
    Q_o     : out std_logic_vector(g_output_width-1 downto 0);
    valid_o : out std_logic
    );

end entity cic_dual;

-------------------------------------------------------------------------------

architecture str of cic_dual is
  signal decimation_strobe : std_logic;

  component cic_decim is
    generic(
      DATAIN_WIDTH  : integer;
      DATAOUT_WIDTH : integer;
      M             : integer;
      N             : integer;
      MAXRATE       : integer;
      bitgrowth     : integer);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      en_i      : in  std_logic;
      data_i    : in  std_logic_vector(DATAIN_WIDTH-1 downto 0);
      data_o    : out std_logic_vector(DATAOUT_WIDTH-1 downto 0);
      act_i     : in  std_logic;
      act_out_i : in  std_logic;
      val_o     : out std_logic);
  end component;

  component strobe_gen is
    generic (
      g_maxrate   : natural;
      g_bus_width : natural);
    port (
      clock_i  : in  std_logic;
      reset_i  : in  std_logic;
      ce_i     : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component strobe_gen;

begin  -- architecture str

  cmp_strobe_gen : strobe_gen
    generic map (
      g_maxrate   => g_max_rate,
      g_bus_width => g_bus_width)
    port map (
      clock_i  => clock_i,
      reset_i  => reset_i,
      ce_i     => ce_i,
      ratio_i  => ratio_i,
      strobe_o => decimation_strobe);

  cmp_cic_decim_I : cic_decim
    generic map (
      DATAIN_WIDTH  => g_input_width,
      DATAOUT_WIDTH => g_output_width,
      M             => g_stages,
      N             => g_delay,
      MAXRATE       => g_max_rate,
      bitgrowth     => integer(ceil(real(g_delay)*log2(real(g_stages)*real(g_max_rate)))))
    port map (
      clk_i     => clock_i,
      rst_i     => reset_i,
      en_i      => ce_i,
      data_i    => I_i,
      data_o    => I_o,
      act_i     => '1',  -- every enabled clock is a new data. Maybe
      -- wire this with a future m_valid_i
      act_out_i => decimation_strobe,
      val_o     => valid_o);

  cmp_cic_decim_Q : cic_decim
    generic map (
      DATAIN_WIDTH  => g_input_width,
      DATAOUT_WIDTH => g_output_width,
      M             => g_stages,
      N             => g_delay,
      MAXRATE       => g_max_rate,
      bitgrowth     => integer(ceil(real(g_delay)*log2(real(g_stages)*real(g_max_rate)))))
    port map (
      clk_i     => clock_i,
      rst_i     => reset_i,
      en_i      => ce_i,
      data_i    => Q_i,
      data_o    => Q_o,
      act_i     => '1',
      act_out_i => decimation_strobe,
      val_o     => open);

end architecture str;

-------------------------------------------------------------------------------
