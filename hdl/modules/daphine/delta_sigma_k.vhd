-------------------------------------------------------------------------------
-- Title      : Delta-sigma with k multipliers
-- Project    : 
-------------------------------------------------------------------------------
-- File       : delta_sigma_k.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-26
-- Last update: 2014-05-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Make delta-sigma calculations and multiply end result by K
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-26  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity delta_sigma_k is

  generic (
    g_input_width   : natural := 16;
    g_div_precision : natural := 16;
    g_k_width       : natural := 16;
    g_output_width  : natural := 16;
    );

  port (
    a_i    : in  std_logic_vector(g_input_width-1 downto 0);
    b_i    : in  std_logic_vector(g_input_width-1 downto 0);
    c_i    : in  std_logic_vector(g_input_width-1 downto 0);
    d_i    : in  std_logic_vector(g_input_width-1 downto 0);
    kx_i   : in  std_logic_vector(g_k_width-1 downto 0);
    ky_i   : in  std_logic_vector(g_k_width-1 downto 0);
    ksum_i : in  std_logic_vector(g_k_width-1 downto 0);
    clk_i  : in  std_logic;
    ce_i   : in  std_logic;
    x_o    : out std_logic_vector(g_width-1 downto 0);
    y_o    : out std_logic_vector(g_width-1 downto 0);
    q_o    : out std_logic_vector(g_width-1 downto 0);
    sum_o  : out std_logic_vector(g_width-1 downto 0)
    );

end entity delta_sigma_k;

-------------------------------------------------------------------------------

architecture str of delta_sigma_k is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

end architecture str;

-------------------------------------------------------------------------------
