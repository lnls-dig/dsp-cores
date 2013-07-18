------------------------------------------------------------------------------
-- Title      : Wishbone Position Calculation Core
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2013-07-02
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Core Module for position calculation with de-cross, amplitude compensation
-- and delay tuning.
-------------------------------------------------------------------------------
-- Copyright (c) 2012 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-07-02  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- DSP Cores
use work.dsp_cores_pkg.all;
-- Position Calc
use work.position_calc_core_pkg.all;

entity xwb_position_calc_core is
generic
(
  g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
  g_address_granularity                     : t_wishbone_address_granularity := WORD;
  g_with_switching                          : natural := 0
);
port
(
  rst_n_i                                   : in std_logic;
  clk_i                                     : in std_logic; -- Wishbone clock
  fs_clk_i                                  : in std_logic; -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)

  -----------------------------
  -- Wishbone signals
  -----------------------------
  wb_slv_i                                  : in t_wishbone_slave_in;
  wb_slv_o                                  : out t_wishbone_slave_out;

  -----------------------------
  -- Raw ADC signals
  -----------------------------
  adc_ch0_i                                 : in std_logic_vector(15 downto 0);
  adc_ch1_i                                 : in std_logic_vector(15 downto 0);
  adc_ch2_i                                 : in std_logic_vector(15 downto 0);
  adc_ch3_i                                 : in std_logic_vector(15 downto 0);

  -----------------------------
  -- DSP config parameter signals
  -----------------------------
  del_sig_div_fofb_thres_i                  : in std_logic_vector(25 downto 0);
  del_sig_div_monit_thres_i                 : in std_logic_vector(25 downto 0);
  del_sig_div_tbt_thres_i                   : in std_logic_vector(25 downto 0);

  ksum_i                                    : in std_logic_vector(24 downto 0);
  kx_i                                      : in std_logic_vector(24 downto 0);
  ky_i                                      : in std_logic_vector(24 downto 0);

  -----------------------------
  -- Position calculation at various rates
  -----------------------------
  adc_ch0_dbg_data_o                        : out std_logic_vector(15 downto 0);
  adc_ch1_dbg_data_o                        : out std_logic_vector(15 downto 0);
  adc_ch2_dbg_data_o                        : out std_logic_vector(15 downto 0);
  adc_ch3_dbg_data_o                        : out std_logic_vector(15 downto 0);

  bpf_ch0_o                                 : out std_logic_vector(23 downto 0);
  bpf_ch1_o                                 : out std_logic_vector(23 downto 0);
  bpf_ch2_o                                 : out std_logic_vector(23 downto 0);
  bpf_ch3_o                                 : out std_logic_vector(23 downto 0);

  fofb_amp_ch0_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_ch1_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_ch2_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_ch3_o                            : out std_logic_vector(23 downto 0);

  mix_ch0_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch0_q_o                               : out std_logic_vector(23 downto 0);
  mix_ch1_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch1_q_o                               : out std_logic_vector(23 downto 0);
  mix_ch2_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch2_q_o                               : out std_logic_vector(23 downto 0);
  mix_ch3_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch3_q_o                               : out std_logic_vector(23 downto 0);

  tbt_decim_ch0_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch0_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch1_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch1_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch2_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch2_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch3_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch3_q_o                         : out std_logic_vector(23 downto 0);

  tbt_decim_q_ch01_incorrect_o              : out std_logic;
  tbt_decim_q_ch23_incorrect_o              : out std_logic;

  tbt_amp_ch0_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_ch1_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_ch2_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_ch3_o                             : out std_logic_vector(23 downto 0);

  fofb_decim_ch0_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch0_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch1_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch1_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch2_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch2_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch3_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch3_q_o                        : out std_logic_vector(23 downto 0);

  fofb_decim_q_01_missing_o                 : out std_logic;
  fofb_decim_q_23_missing_o                 : out std_logic;

  monit_amp_ch0_o                           : out std_logic_vector(23 downto 0);
  monit_amp_ch1_o                           : out std_logic_vector(23 downto 0);
  monit_amp_ch2_o                           : out std_logic_vector(23 downto 0);
  monit_amp_ch3_o                           : out std_logic_vector(23 downto 0);

  monit_cic_unexpected_o                    : out std_logic;
  monit_cfir_incorrect_o                    : out std_logic;
  monit_pfir_incorrect_o                    : out std_logic;

  x_tbt_o                                   : out std_logic_vector(25 downto 0);
  y_tbt_o                                   : out std_logic_vector(25 downto 0);
  q_tbt_o                                   : out std_logic_vector(25 downto 0);
  sum_tbt_o                                 : out std_logic_vector(25 downto 0);

  x_fofb_o                                  : out std_logic_vector(25 downto 0);
  y_fofb_o                                  : out std_logic_vector(25 downto 0);
  q_fofb_o                                  : out std_logic_vector(25 downto 0);
  sum_fofb_o                                : out std_logic_vector(25 downto 0);

  x_monit_o                                 : out std_logic_vector(25 downto 0);
  y_monit_o                                 : out std_logic_vector(25 downto 0);
  q_monit_o                                 : out std_logic_vector(25 downto 0);
  sum_monit_o                               : out std_logic_vector(25 downto 0);

  x_monit_1_o                               : out std_logic_vector(25 downto 0);
  y_monit_1_o                               : out std_logic_vector(25 downto 0);
  q_monit_1_o                               : out std_logic_vector(25 downto 0);
  sum_monit_1_o                             : out std_logic_vector(25 downto 0);

  monit_pos_1_incorrect_o                   : out std_logic;

  -----------------------------
  -- Output to RFFE board
  -----------------------------
  clk_swap_o                                : out std_logic;
  ctrl1_o                                   : out std_logic_vector(7 downto 0);
  ctrl2_o                                   : out std_logic_vector(7 downto 0);

  -----------------------------
  -- Clock drivers for various rates
  -----------------------------
  clk_ce_1_o                                : out std_logic;
  clk_ce_1112_o                             : out std_logic;
  clk_ce_11120000_o                         : out std_logic;
  clk_ce_111200000_o                        : out std_logic;
  clk_ce_1390000_o                          : out std_logic;
  clk_ce_2_o                                : out std_logic;
  clk_ce_2224_o                             : out std_logic;
  clk_ce_22240000_o                         : out std_logic;
  clk_ce_222400000_o                        : out std_logic;
  clk_ce_2780000_o                          : out std_logic;
  clk_ce_35_o                               : out std_logic;
  clk_ce_5000_o                             : out std_logic;
  clk_ce_556_o                              : out std_logic;
  clk_ce_5560000_o                          : out std_logic;
  clk_ce_70_o                               : out std_logic
);
end xwb_position_calc_core;

architecture rtl of xwb_position_calc_core is

begin

  cmp_wb_position_calc_core : wb_position_calc_core
  generic map
  (
    g_interface_mode                          => g_interface_mode,
    g_address_granularity                     => g_address_granularity,
    g_with_switching                          => g_with_switching
  )
  port map
  (
    rst_n_i                                   => rst_n_i,
    clk_i                                     => clk_i,
    fs_clk_i                                  => fs_clk_i,  -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)

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
    -- Raw ADC signals
    -----------------------------
    adc_ch0_i                                 => adc_ch0_i,
    adc_ch1_i                                 => adc_ch1_i,
    adc_ch2_i                                 => adc_ch2_i,
    adc_ch3_i                                 => adc_ch3_i,

    -----------------------------
    -- DSP config parameter signals
    -----------------------------
    del_sig_div_fofb_thres_i                  =>  del_sig_div_fofb_thres_i,
    del_sig_div_monit_thres_i                 =>  del_sig_div_monit_thres_i,
    del_sig_div_tbt_thres_i                   =>  del_sig_div_tbt_thres_i,

    ksum_i                                    =>  ksum_i,
    kx_i                                      =>  kx_i,
    ky_i                                      =>  ky_i,

    -----------------------------
    -- Position calculation at various rates
    -----------------------------
    adc_ch0_dbg_data_o                        => adc_ch0_dbg_data_o,
    adc_ch1_dbg_data_o                        => adc_ch1_dbg_data_o,
    adc_ch2_dbg_data_o                        => adc_ch2_dbg_data_o,
    adc_ch3_dbg_data_o                        => adc_ch3_dbg_data_o,

    bpf_ch0_o                                 => bpf_ch0_o,
    bpf_ch1_o                                 => bpf_ch1_o,
    bpf_ch2_o                                 => bpf_ch2_o,
    bpf_ch3_o                                 => bpf_ch3_o,

    fofb_amp_ch0_o                            => fofb_amp_ch0_o,
    fofb_amp_ch1_o                            => fofb_amp_ch1_o,
    fofb_amp_ch2_o                            => fofb_amp_ch2_o,
    fofb_amp_ch3_o                            => fofb_amp_ch3_o,

    mix_ch0_i_o                               => mix_ch0_i_o,
    mix_ch0_q_o                               => mix_ch0_q_o,
    mix_ch1_i_o                               => mix_ch1_i_o,
    mix_ch1_q_o                               => mix_ch1_q_o,
    mix_ch2_i_o                               => mix_ch2_i_o,
    mix_ch2_q_o                               => mix_ch2_q_o,
    mix_ch3_i_o                               => mix_ch3_i_o,
    mix_ch3_q_o                               => mix_ch3_q_o,

    tbt_decim_ch0_i_o                         => tbt_decim_ch0_i_o,
    tbt_decim_ch0_q_o                         => tbt_decim_ch0_q_o,
    tbt_decim_ch1_i_o                         => tbt_decim_ch1_i_o,
    tbt_decim_ch1_q_o                         => tbt_decim_ch1_q_o,
    tbt_decim_ch2_i_o                         => tbt_decim_ch2_i_o,
    tbt_decim_ch2_q_o                         => tbt_decim_ch2_q_o,
    tbt_decim_ch3_i_o                         => tbt_decim_ch3_i_o,
    tbt_decim_ch3_q_o                         => tbt_decim_ch3_q_o,

    tbt_decim_q_ch01_incorrect_o              => tbt_decim_q_ch01_incorrect_o,
    tbt_decim_q_ch23_incorrect_o              => tbt_decim_q_ch23_incorrect_o,

    tbt_amp_ch0_o                             => tbt_amp_ch0_o,
    tbt_amp_ch1_o                             => tbt_amp_ch1_o,
    tbt_amp_ch2_o                             => tbt_amp_ch2_o,
    tbt_amp_ch3_o                             => tbt_amp_ch3_o,

    fofb_decim_ch0_i_o                        => fofb_decim_ch0_i_o,
    fofb_decim_ch0_q_o                        => fofb_decim_ch0_q_o,
    fofb_decim_ch1_i_o                        => fofb_decim_ch1_i_o,
    fofb_decim_ch1_q_o                        => fofb_decim_ch1_q_o,
    fofb_decim_ch2_i_o                        => fofb_decim_ch2_i_o,
    fofb_decim_ch2_q_o                        => fofb_decim_ch2_q_o,
    fofb_decim_ch3_i_o                        => fofb_decim_ch3_i_o,
    fofb_decim_ch3_q_o                        => fofb_decim_ch3_q_o,

    fofb_decim_q_01_missing_o                 => fofb_decim_q_01_missing_o,
    fofb_decim_q_23_missing_o                 => fofb_decim_q_23_missing_o,

    monit_amp_ch0_o                           => monit_amp_ch0_o,
    monit_amp_ch1_o                           => monit_amp_ch1_o,
    monit_amp_ch2_o                           => monit_amp_ch2_o,
    monit_amp_ch3_o                           => monit_amp_ch3_o,

    monit_cic_unexpected_o                    => monit_cic_unexpected_o,
    monit_cfir_incorrect_o                    => monit_cfir_incorrect_o,
    monit_pfir_incorrect_o                    => monit_pfir_incorrect_o,

    x_tbt_o                                   => x_tbt_o,
    y_tbt_o                                   => y_tbt_o,
    q_tbt_o                                   => q_tbt_o,
    sum_tbt_o                                 => sum_tbt_o,

    x_fofb_o                                  => x_fofb_o,
    y_fofb_o                                  => y_fofb_o,
    q_fofb_o                                  => q_fofb_o,
    sum_fofb_o                                => sum_fofb_o,

    x_monit_o                                 => x_monit_o,
    y_monit_o                                 => y_monit_o,
    q_monit_o                                 => q_monit_o,
    sum_monit_o                               => sum_monit_o,

    x_monit_1_o                               => x_monit_1_o,
    y_monit_1_o                               => y_monit_1_o,
    q_monit_1_o                               => q_monit_1_o,
    sum_monit_1_o                             => sum_monit_1_o,

    monit_pos_1_incorrect_o                   => monit_pos_1_incorrect_o,

    -----------------------------
    -- Output to RFFE board
    -----------------------------
    clk_swap_o                              => clk_swap_o,
    ctrl1_o                                 => ctrl1_o,
    ctrl2_o                                 => ctrl2_o,

    -----------------------------
    -- Clock drivers for various rates
    -----------------------------
    clk_ce_1_o                              => clk_ce_1_o,
    clk_ce_1112_o                           => clk_ce_1112_o,
    clk_ce_11120000_o                       => clk_ce_11120000_o,
    clk_ce_111200000_o                      => clk_ce_111200000_o,
    clk_ce_1390000_o                        => clk_ce_1390000_o,
    clk_ce_2_o                              => clk_ce_2_o,
    clk_ce_2224_o                           => clk_ce_2224_o,
    clk_ce_22240000_o                       => clk_ce_22240000_o,
    clk_ce_222400000_o                      => clk_ce_222400000_o,
    clk_ce_2780000_o                        => clk_ce_2780000_o,
    clk_ce_35_o                             => clk_ce_35_o,
    clk_ce_5000_o                           => clk_ce_5000_o,
    clk_ce_556_o                            => clk_ce_556_o,
    clk_ce_5560000_o                        => clk_ce_5560000_o,
    clk_ce_70_o                             => clk_ce_70_o
  );

end rtl;
