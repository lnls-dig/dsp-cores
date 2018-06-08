-------------------------------------------------------------------------------
-- Title      : Dual CIC plus cordic for downconversion
-- Project    :
-------------------------------------------------------------------------------
-- File       : cicordic.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-24
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module is intended to make cleaner code by combining two
-- CIC filters and a CORDIC. The decimated i/q are exposed to help debugging.
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-24  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity cicordic is

  generic (
    g_input_width   : natural := 16;
    g_output_width  : natural := 16;
    g_cic_stages    : natural := 3;     -- aka "N"
    g_cic_delay     : natural := 2;     -- aka "M"
    g_cordic_stages : natural := 16;
    );

  port (
    clk_i   : in  std_logic;
    rst_i   : in  std_logic;
    ce_i    : in  std_logic;
    data_i  : in  std_logic_vector;
    ratio_i : in  std_logic_vector;
    ce_o    : out std_logic;
    mag_o   : out std_logic_vector(g_width-1 downto 0);
    phase_o : out std_logic_vector(g_width-1 downto 0)
    );

end entity cicordic;

-------------------------------------------------------------------------------

architecture str of cicordic is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  --TODO: crate cic_dual, with only one counter for two cics
  cmp_fofb_i_cic : cic_dyn
    generic map (
      g_input_width  => c_mixed_width,
      g_output_width => c_decim_width,
      g_stages       => c_cic_stages,
      g_delay        => c_cic_delay,
      g_max_rate     => c_fofb_ratio,
      g_bus_width    => c_cic_fofb_width)
    port map (
      clk_i   => clk,
      rst_i   => '0',
      ce_i    => ce_adc,
      data_i  => full_i(chan),
      ratio_i => c_fofb_ratio_slv,
      data_o  => fofb_i(chan),
      valid_o => ce_fofb(chan));

  cmp_fofb_q_cic : cic_dyn
    generic map (
      g_input_width  => c_mixed_width,
      g_output_width => c_decim_width,
      g_stages       => c_cic_stages,
      g_delay        => c_cic_delay,
      g_max_rate     => c_fofb_ratio,
      g_bus_width    => c_cic_fofb_width)
    port map (
      clk_i   => clk,
      rst_i   => '0',
      ce_i    => ce_adc,
      data_i  => full_q(chan),
      ratio_i => c_fofb_ratio_slv,
      data_o  => fofb_q(chan),
      valid_o => open);


end architecture str;

-------------------------------------------------------------------------------
