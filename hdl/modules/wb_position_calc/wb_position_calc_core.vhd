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

entity wb_position_calc_core is
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

  wb_adr_i                                  : in  std_logic_vector(c_wishbone_address_width-1 downto 0) := (others => '0');
  wb_dat_i                                  : in  std_logic_vector(c_wishbone_data_width-1 downto 0) := (others => '0');
  wb_dat_o                                  : out std_logic_vector(c_wishbone_data_width-1 downto 0);
  wb_sel_i                                  : in  std_logic_vector(c_wishbone_data_width/8-1 downto 0) := (others => '0');
  wb_we_i                                   : in  std_logic := '0';
  wb_cyc_i                                  : in  std_logic := '0';
  wb_stb_i                                  : in  std_logic := '0';
  wb_ack_o                                  : out std_logic;
  wb_stall_o                                : out std_logic;

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
end wb_position_calc_core;

architecture rtl of wb_position_calc_core is

  signal adc_ch0_sp                          : std_logic_vector(15 downto 0);
  signal adc_ch1_sp                          : std_logic_vector(15 downto 0);
  signal adc_ch2_sp                          : std_logic_vector(15 downto 0);
  signal adc_ch3_sp                          : std_logic_vector(15 downto 0);

  signal clk_ce_11120000_int                 : std_logic;
  signal clk_ce_111200000_int                : std_logic;

begin

  -- FIX ME! Wishbone interface goes directly through here!
  gen_with_switching : if (g_with_switching = 1) generate
    cmp_wb_bpm_swap : wb_bpm_swap
    generic map
    (
      g_interface_mode                          => g_interface_mode,
      g_address_granularity                     => g_address_granularity
    )
    port map
    (
      rst_n_i                                   => rst_n_i,
      clk_sys_i                                 => clk_i,
      fs_clk_i                                  => fs_clk_i,

      -----------------------------
      -- Wishbone signals
      -----------------------------
      wb_adr_i                                  => wb_adr_i,
      wb_dat_i                                  => wb_dat_i,
      wb_dat_o                                  => wb_dat_o,
      wb_sel_i                                  => wb_sel_i,
      wb_we_i                                   => wb_we_i,
      wb_cyc_i                                  => wb_cyc_i,
      wb_stb_i                                  => wb_stb_i,
      wb_ack_o                                  => wb_ack_o,
      wb_stall_o                                => wb_stall_o,

      -----------------------------
      -- External ports
      -----------------------------
      -- Input from ADC FMC board
      cha_i                                     => adc_ch0_i,
      chb_i                                     => adc_ch1_i,
      chc_i                                     => adc_ch2_i,
      chd_i                                     => adc_ch3_i,

      -- Output to data processing level
      cha_o                                     => adc_ch0_sp,
      chb_o                                     => adc_ch1_sp,
      chc_o                                     => adc_ch2_sp,
      chd_o                                     => adc_ch3_sp,

      -- Output to RFFE board
      clk_swap_o                                => clk_swap_o,
      ctrl1_o                                   => ctrl1_o,
      ctrl2_o                                   => ctrl2_o
    );
  end generate;

  -- Bypass switching module
  gen_without_switching : if (g_with_switching = 0) generate
    wb_dat_o <= (others => '0');
    wb_ack_o <= '0';
    wb_stall_o <= '0';
    clk_swap_o <= '0';
    ctrl1_o <= (others => '0');
    ctrl2_o <= (others => '0');

    adc_ch0_sp <= adc_ch0_i;
    adc_ch1_sp <= adc_ch1_i;
    adc_ch2_sp <= adc_ch2_i;
    adc_ch3_sp <= adc_ch3_i;
  end generate;

  cmp_position_calc: position_calc
  --generic map (
  --
  --)
  port map (
    --adc_ch0_i                               => adc_ch0_i,
    --adc_ch1_i                               => adc_ch1_i,
    --adc_ch2_i                               => adc_ch2_i,
    --adc_ch3_i                               => adc_ch3_i,

    adc_ch0_i                               => adc_ch0_sp,
    adc_ch1_i                               => adc_ch1_sp,
    adc_ch2_i                               => adc_ch2_sp,
    adc_ch3_i                               => adc_ch3_sp,

    clk                                     => fs_clk_i,

    del_sig_div_fofb_thres_i                => del_sig_div_fofb_thres_i,
    del_sig_div_monit_thres_i               => del_sig_div_monit_thres_i,
    del_sig_div_tbt_thres_i                 => del_sig_div_tbt_thres_i,

    ksum_i                                  => ksum_i,
    kx_i                                    => kx_i,
    ky_i                                    => ky_i,

    adc_ch0_dbg_data_o                      => adc_ch0_dbg_data_o,
    adc_ch1_dbg_data_o                      => adc_ch1_dbg_data_o,
    adc_ch2_dbg_data_o                      => adc_ch2_dbg_data_o,
    adc_ch3_dbg_data_o                      => adc_ch3_dbg_data_o,

    bpf_ch0_o                               => bpf_ch0_o,
    bpf_ch1_o                               => bpf_ch1_o,
    bpf_ch2_o                               => bpf_ch2_o,
    bpf_ch3_o                               => bpf_ch3_o,

    fofb_amp_ch0_o                          => fofb_amp_ch0_o,
    fofb_amp_ch1_o                          => fofb_amp_ch1_o,
    fofb_amp_ch2_o                          => fofb_amp_ch2_o,
    fofb_amp_ch3_o                          => fofb_amp_ch3_o,

    mix_ch0_i_o                             => mix_ch0_i_o,
    mix_ch0_q_o                             => mix_ch0_q_o,
    mix_ch1_i_o                             => mix_ch1_i_o,
    mix_ch1_q_o                             => mix_ch1_q_o,
    mix_ch2_i_o                             => mix_ch2_i_o,
    mix_ch2_q_o                             => mix_ch2_q_o,
    mix_ch3_i_o                             => mix_ch3_i_o,
    mix_ch3_q_o                             => mix_ch3_q_o,

    tbt_decim_ch0_i_o                       => tbt_decim_ch0_i_o,
    tbt_decim_ch0_q_o                       => tbt_decim_ch0_q_o,
    tbt_decim_ch1_i_o                       => tbt_decim_ch1_i_o,
    tbt_decim_ch1_q_o                       => tbt_decim_ch1_q_o,
    tbt_decim_ch2_i_o                       => tbt_decim_ch2_i_o,
    tbt_decim_ch2_q_o                       => tbt_decim_ch2_q_o,
    tbt_decim_ch3_i_o                       => tbt_decim_ch3_i_o,
    tbt_decim_ch3_q_o                       => tbt_decim_ch3_q_o,

    tbt_decim_q_ch01_incorrect_o            => tbt_decim_q_ch01_incorrect_o,
    tbt_decim_q_ch23_incorrect_o            => tbt_decim_q_ch23_incorrect_o,

    tbt_amp_ch0_o                           => tbt_amp_ch0_o,
    tbt_amp_ch1_o                           => tbt_amp_ch1_o,
    tbt_amp_ch2_o                           => tbt_amp_ch2_o,
    tbt_amp_ch3_o                           => tbt_amp_ch3_o,

    fofb_decim_ch0_i_o                      => fofb_decim_ch0_i_o,
    fofb_decim_ch0_q_o                      => fofb_decim_ch0_q_o,
    fofb_decim_ch1_i_o                      => fofb_decim_ch1_i_o,
    fofb_decim_ch1_q_o                      => fofb_decim_ch1_q_o,
    fofb_decim_ch2_i_o                      => fofb_decim_ch2_i_o,
    fofb_decim_ch2_q_o                      => fofb_decim_ch2_q_o,
    fofb_decim_ch3_i_o                      => fofb_decim_ch3_i_o,
    fofb_decim_ch3_q_o                      => fofb_decim_ch3_q_o,

    fofb_decim_q_01_missing_o               => fofb_decim_q_01_missing_o,
    fofb_decim_q_23_missing_o               => fofb_decim_q_23_missing_o,

    monit_amp_ch0_o                         => monit_amp_ch0_o,
    monit_amp_ch1_o                         => monit_amp_ch1_o,
    monit_amp_ch2_o                         => monit_amp_ch2_o,
    monit_amp_ch3_o                         => monit_amp_ch3_o,

    monit_cic_unexpected_o                  => monit_cic_unexpected_o,
    monit_cfir_incorrect_o                  => monit_cfir_incorrect_o,
    monit_pfir_incorrect_o                  => monit_pfir_incorrect_o,

    x_tbt_o                                 => x_tbt_o,
    y_tbt_o                                 => y_tbt_o,
    q_tbt_o                                 => q_tbt_o,
    sum_tbt_o                               => sum_tbt_o,

    x_fofb_o                                => x_fofb_o,
    y_fofb_o                                => y_fofb_o,
    q_fofb_o                                => q_fofb_o,
    sum_fofb_o                              => sum_fofb_o,

    x_monit_o                               => x_monit_o,
    y_monit_o                               => y_monit_o,
    q_monit_o                               => q_monit_o,
    sum_monit_o                             => sum_monit_o,

    x_monit_1_o                             => x_monit_1_o,
    y_monit_1_o                             => y_monit_1_o,
    q_monit_1_o                             => q_monit_1_o,
    sum_monit_1_o                           => sum_monit_1_o,

    monit_pos_1_incorrect_o                 => monit_pos_1_incorrect_o,

    -- Clock drivers for various rates
    clk_ce_1_o                              => clk_ce_1_o,
    clk_ce_1112_o                           => clk_ce_1112_o,
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

  -- Generate missing clk_ce_11120000
  cmp_xlclockdriver_clk_ce_11120000 : xlclockdriver
    generic map (
      log_2_period => 24,
      period => 11120000,
      use_bufg => 0
    )
    port map (
      sysce => '1',
      sysclk => fs_clk_i,
      sysclr => '0',
      ce => clk_ce_11120000_int,
      clk => open
    );

  clk_ce_11120000_o <= clk_ce_11120000_int;

  -- Generate missing clk_ce_111200000
  cmp_xlclockdriver_clk_ce_111200000 : xlclockdriver
    generic map (
      log_2_period => 24,
      period => 111200000,
      use_bufg => 0
    )
    port map (
      sysce => '1',
      sysclk => fs_clk_i,
      sysclr => '0',
      ce => clk_ce_111200000_int,
      clk => open
    );

  clk_ce_111200000_o <= clk_ce_111200000_int;

end rtl;
