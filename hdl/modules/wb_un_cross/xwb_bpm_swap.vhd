------------------------------------------------------------------------------
-- Title      : Wishbone BPM SWAP interface
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Wishbone interface with BPM Swap core.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-04-11  1.0      jose.berkenbrock      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- DSP Cores
use work.dsp_cores_pkg.all;
-- Register Bank
use work.bpm_swap_wbgen2_pkg.all;

entity xwb_bpm_swap is
generic
(
  g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
  g_address_granularity                     : t_wishbone_address_granularity := WORD
);
port
(
  rst_n_i                                   : in std_logic;
  clk_sys_i                                 : in std_logic;
  fs_rst_n_i                                : in std_logic;
  fs_clk_i                                  : in std_logic;

  -----------------------------
  -- Wishbone signals
  -----------------------------

  wb_slv_i                                  : in t_wishbone_slave_in;
  wb_slv_o                                  : out t_wishbone_slave_out;

  -----------------------------
  -- External ports
  -----------------------------
  -- Input from ADC FMC board
  cha_i                                     : in  std_logic_vector(15 downto 0);
  chb_i                                     : in  std_logic_vector(15 downto 0);
  chc_i                                     : in  std_logic_vector(15 downto 0);
  chd_i                                     : in  std_logic_vector(15 downto 0);

  -- Output to data processing level
  cha_o                                     : out std_logic_vector(15 downto 0);
  chb_o                                     : out std_logic_vector(15 downto 0);
  chc_o                                     : out std_logic_vector(15 downto 0);
  chd_o                                     : out std_logic_vector(15 downto 0);

  mode1_o                                   : out std_logic_vector(1 downto 0);
  mode2_o                                   : out std_logic_vector(1 downto 0);

  wdw_rst_o                                 : out std_logic;     -- Reset Windowing module
  wdw_sw_clk_i                              : in std_logic;      -- Switching clock from Windowing module
  wdw_use_o                                 : out std_logic;     -- Use Windowing module
  wdw_dly_o                                 : out std_logic_vector(15 downto 0); -- Delay to apply the window

  -- Output to RFFE board
  clk_swap_o                                : out std_logic;
  clk_swap_en_o                             : out std_logic;
  flag1_o                                   : out std_logic;
  flag2_o                                   : out std_logic;
  ctrl1_o                                   : out std_logic_vector(7 downto 0);
  ctrl2_o                                   : out std_logic_vector(7 downto 0)
);
end xwb_bpm_swap;

architecture rtl of xwb_bpm_swap is

begin

  cmp_wb_bpm_swap : wb_bpm_swap
  generic map
  (
    g_interface_mode                          => g_interface_mode,
    g_address_granularity                     => g_address_granularity
  )
  port map
  (
    rst_n_i                                   => rst_n_i,
    clk_sys_i                                 => clk_sys_i,
    fs_rst_n_i                                => fs_rst_n_i,
    fs_clk_i                                  => fs_clk_i,

    -----------------------------
    -- Wishbone signals
    -----------------------------

    wb_adr_i                                  => wb_slv_i.adr,
    wb_dat_i                                  => wb_slv_i.dat,
    wb_dat_o                                  => wb_slv_o.dat,
    wb_sel_i                                  => wb_slv_i.sel,
    wb_we_i                                   => wb_slv_i.we,
    wb_cyc_i                                  => wb_slv_i.cyc,
    wb_stb_i                                  => wb_slv_i.stb,
    wb_ack_o                                  => wb_slv_o.ack,
    wb_stall_o                                => wb_slv_o.stall,

    -----------------------------
    -- External ports
    -----------------------------
    -- input from ADC FMC board:
    cha_i                                     => cha_i,
    chb_i                                     => chb_i,
    chc_i                                     => chc_i,
    chd_i                                     => chd_i,
    -- output to data processing level:
    cha_o                                     => cha_o,
    chb_o                                     => chb_o,
    chc_o                                     => chc_o,
    chd_o                                     => chd_o,

    mode1_o                                   => mode1_o,
    mode2_o                                   => mode2_o,

    wdw_rst_o                                => wdw_rst_o,
    wdw_sw_clk_i                             => wdw_sw_clk_i,
    wdw_use_o                                => wdw_use_o,
    wdw_dly_o                                => wdw_dly_o,  

    -- output to RFFE board:
    clk_swap_o                                => clk_swap_o,
    clk_swap_en_o                             => clk_swap_en_o,
    flag1_o                                   => flag1_o,
    flag2_o                                   => flag2_o,
    ctrl1_o                                   => ctrl1_o,
    ctrl2_o                                   => ctrl2_o
  );

end rtl;
