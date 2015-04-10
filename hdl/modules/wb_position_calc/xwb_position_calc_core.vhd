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
  g_with_extra_wb_reg                       : boolean := false;
  g_rffe_version			                : string  := "V2";

  -- input sizes
  g_input_width                             : natural := 16;
  g_mixed_width                             : natural := 16;
  g_adc_ratio                               : natural := 2;

  -- mixer
  g_dds_width                               : natural := 16;
  g_dds_points                              : natural := 35;
  g_sin_file                                : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_sin.nif";
  g_cos_file                                : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_cos.nif";

  -- CIC setup
  g_tbt_cic_delay                           : natural := 1;
  g_tbt_cic_stages                          : natural := 2;
  g_tbt_ratio                               : natural := 35;  -- ratio between
  g_tbt_decim_width                         : natural := 32;

  g_fofb_cic_delay                          : natural := 1;
  g_fofb_cic_stages                         : natural := 2;
  g_fofb_ratio                              : natural := 980;  -- ratio between adc and fofb rates
  g_fofb_decim_width                        : natural := 32;

  g_monit1_cic_delay                        : natural := 1;
  g_monit1_cic_stages                       : natural := 1;
  g_monit1_ratio                            : natural := 100;  --ratio between fofb and monit 1

  g_monit2_cic_delay                        : natural := 1;
  g_monit2_cic_stages                       : natural := 1;
  g_monit2_ratio                            : natural := 100; -- ratio between monit 1 and 2

  g_monit_decim_width                       : natural := 32;

  -- width of K constants
  g_k_width                                 : natural := 16;

  --width for IQ output
  g_IQ_width                                : natural := 32
);
port
(
  rst_n_i                                   : in std_logic;
  clk_i                                     : in std_logic; -- Wishbone clock
  fs_rst_n_i                                : in std_logic; -- FS reset
  fs_rst2x_n_i                              : in std_logic; -- FS 2x reset
  fs_clk_i                                  : in std_logic; -- clock period = 8.8823218389287 ns (112.583175675676 Mhz)
  fs_clk2x_i                                : in std_logic; -- clock period = 4.4411609194644 ns (225.166351351351 Mhz)

  -----------------------------
  -- Wishbone signals
  -----------------------------
  wb_slv_i                                  : in t_wishbone_slave_in;
  wb_slv_o                                  : out t_wishbone_slave_out;

  -----------------------------
  -- Raw ADC signals
  -----------------------------

  adc_ch0_i                                 : in std_logic_vector(g_input_width-1 downto 0);
  adc_ch1_i                                 : in std_logic_vector(g_input_width-1 downto 0);
  adc_ch2_i                                 : in std_logic_vector(g_input_width-1 downto 0);
  adc_ch3_i                                 : in std_logic_vector(g_input_width-1 downto 0);

  -----------------------------
  -- Position calculation at various rates
  -----------------------------

  adc_ch0_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch1_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch2_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch3_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);

  -----------------------------
  -- MIX Data
  -----------------------------

  mix_ch0_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch0_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch1_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch1_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch2_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch2_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch3_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch3_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_valid_o                               : out std_logic;

  -----------------------------
  -- TBT Data
  -----------------------------

  tbt_decim_ch0_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch0_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch1_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch1_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch2_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch2_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch3_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch3_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_valid_o                         : out std_logic;

  tbt_amp_ch0_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_ch1_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_ch2_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_ch3_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_valid_o                           : out std_logic;

  tbt_pha_ch0_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_ch1_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_ch2_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_ch3_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_valid_o                           : out std_logic;

  -----------------------------
  -- FOFB Data
  -----------------------------

  fofb_decim_ch0_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch0_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch1_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch1_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch2_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch2_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch3_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch3_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_valid_o                        : out std_logic;

  fofb_amp_ch0_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_ch1_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_ch2_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_ch3_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_valid_o                          : out std_logic;

  fofb_pha_ch0_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_ch1_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_ch2_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_ch3_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_valid_o                          : out std_logic;

  -----------------------------
  -- Monit. Data
  -----------------------------

  monit_amp_ch0_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch1_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch2_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch3_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_valid_o                         : out std_logic;

  -----------------------------
  -- Position Data
  -----------------------------

  pos_x_tbt_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_y_tbt_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_q_tbt_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_sum_tbt_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_tbt_valid_o                           : out std_logic;

  pos_x_fofb_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_y_fofb_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_q_fofb_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_sum_fofb_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_fofb_valid_o                          : out std_logic;

  pos_x_monit_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_y_monit_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_q_monit_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_sum_monit_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_monit_valid_o                         : out std_logic;

  -----------------------------
  -- Output to RFFE board
  -----------------------------

  clk_swap_o                                : out std_logic;
  flag1_o                                   : out std_logic;
  flag2_o                                   : out std_logic;
  ctrl1_o                                   : out std_logic_vector(7 downto 0);
  ctrl2_o                                   : out std_logic_vector(7 downto 0);

  -----------------------------
  -- Clock drivers for various rates
  -----------------------------

  ce_adc_o                                  : out std_logic;
  ce_tbt_o                                  : out std_logic;
  ce_monit_o                                : out std_logic;
  ce_fofb_o                                 : out std_logic;

  dbg_cur_address_o                         : out std_logic_vector(31 downto 0);
  dbg_adc_ch0_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch1_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch2_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch3_cond_o                        : out std_logic_vector(g_input_width-1 downto 0)
);
end xwb_position_calc_core;

architecture rtl of xwb_position_calc_core is

begin

  cmp_wb_position_calc_core : wb_position_calc_core
  generic map
  (
    g_interface_mode                        => g_interface_mode,
    g_address_granularity                   => g_address_granularity,
    g_with_extra_wb_reg                     => g_with_extra_wb_reg,
    g_rffe_version                          => g_rffe_version
  )
  port map
  (
    rst_n_i                                 => rst_n_i,
    clk_i                                   => clk_i,
    fs_rst_n_i                              => fs_rst_n_i,
    fs_rst2x_n_i                            => fs_rst2x_n_i,
    fs_clk_i                                => fs_clk_i,    -- clock period = 8.8823218389287 ns (112.583175675676 Mhz)
    fs_clk2x_i                              => fs_clk2x_i,  -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)

    -----------------------------
    -- Wishbone signals
    -----------------------------

    wb_adr_i                                => wb_slv_i.adr,
    wb_dat_i                                => wb_slv_i.dat,
    wb_dat_o                                => wb_slv_o.dat,
    wb_sel_i                                => wb_slv_i.sel,
    wb_we_i                                 => wb_slv_i.we,
    wb_cyc_i                                => wb_slv_i.cyc,
    wb_stb_i                                => wb_slv_i.stb,
    wb_ack_o                                => wb_slv_o.ack,
    wb_stall_o                              => wb_slv_o.stall,

    -----------------------------
    -- Raw ADC signals
    -----------------------------

    adc_ch0_i                                => adc_ch0_i,
    adc_ch1_i                                => adc_ch1_i,
    adc_ch2_i                                => adc_ch2_i,
    adc_ch3_i                                => adc_ch3_i,

    -----------------------------
    -- Position calculation at various rates
    -----------------------------

    adc_ch0_swap_o                           => adc_ch0_swap_o,
    adc_ch1_swap_o                           => adc_ch1_swap_o,
    adc_ch2_swap_o                           => adc_ch2_swap_o,
    adc_ch3_swap_o                           => adc_ch3_swap_o,

    -----------------------------
    -- MIX Data
    -----------------------------

    mix_ch0_i_o                              => mix_ch0_i_o,
    mix_ch0_q_o                              => mix_ch0_q_o,
    mix_ch1_i_o                              => mix_ch1_i_o,
    mix_ch1_q_o                              => mix_ch1_q_o,
    mix_ch2_i_o                              => mix_ch2_i_o,
    mix_ch2_q_o                              => mix_ch2_q_o,
    mix_ch3_i_o                              => mix_ch3_i_o,
    mix_ch3_q_o                              => mix_ch3_q_o,
    mix_valid_o                              => mix_valid_o,

    -----------------------------
    -- TBT Data
    -----------------------------

    tbt_decim_ch0_i_o                        => tbt_decim_ch0_i_o,
    tbt_decim_ch0_q_o                        => tbt_decim_ch0_q_o,
    tbt_decim_ch1_i_o                        => tbt_decim_ch1_i_o,
    tbt_decim_ch1_q_o                        => tbt_decim_ch1_q_o,
    tbt_decim_ch2_i_o                        => tbt_decim_ch2_i_o,
    tbt_decim_ch2_q_o                        => tbt_decim_ch2_q_o,
    tbt_decim_ch3_i_o                        => tbt_decim_ch3_i_o,
    tbt_decim_ch3_q_o                        => tbt_decim_ch3_q_o,
    tbt_decim_valid_o                        => tbt_decim_valid_o,

    tbt_amp_ch0_o                            => tbt_amp_ch0_o,
    tbt_amp_ch1_o                            => tbt_amp_ch1_o,
    tbt_amp_ch2_o                            => tbt_amp_ch2_o,
    tbt_amp_ch3_o                            => tbt_amp_ch3_o,
    tbt_amp_valid_o                          => tbt_amp_valid_o,

    tbt_pha_ch0_o                            => tbt_pha_ch0_o,
    tbt_pha_ch1_o                            => tbt_pha_ch1_o,
    tbt_pha_ch2_o                            => tbt_pha_ch2_o,
    tbt_pha_ch3_o                            => tbt_pha_ch3_o,
    tbt_pha_valid_o                          => tbt_pha_valid_o,

    -----------------------------
    -- FOFB Data
    -----------------------------

    fofb_decim_ch0_i_o                       => fofb_decim_ch0_i_o,
    fofb_decim_ch0_q_o                       => fofb_decim_ch0_q_o,
    fofb_decim_ch1_i_o                       => fofb_decim_ch1_i_o,
    fofb_decim_ch1_q_o                       => fofb_decim_ch1_q_o,
    fofb_decim_ch2_i_o                       => fofb_decim_ch2_i_o,
    fofb_decim_ch2_q_o                       => fofb_decim_ch2_q_o,
    fofb_decim_ch3_i_o                       => fofb_decim_ch3_i_o,
    fofb_decim_ch3_q_o                       => fofb_decim_ch3_q_o,
    fofb_decim_valid_o                       => fofb_decim_valid_o,

    fofb_amp_ch0_o                           => fofb_amp_ch0_o,
    fofb_amp_ch1_o                           => fofb_amp_ch1_o,
    fofb_amp_ch2_o                           => fofb_amp_ch2_o,
    fofb_amp_ch3_o                           => fofb_amp_ch3_o,
    fofb_amp_valid_o                         => fofb_amp_valid_o,

    fofb_pha_ch0_o                           => fofb_pha_ch0_o,
    fofb_pha_ch1_o                           => fofb_pha_ch1_o,
    fofb_pha_ch2_o                           => fofb_pha_ch2_o,
    fofb_pha_ch3_o                           => fofb_pha_ch3_o,
    fofb_pha_valid_o                         => fofb_pha_valid_o,

    -----------------------------
    -- Monit. Data
    -----------------------------

    monit_amp_ch0_o                          => monit_amp_ch0_o,
    monit_amp_ch1_o                          => monit_amp_ch1_o,
    monit_amp_ch2_o                          => monit_amp_ch2_o,
    monit_amp_ch3_o                          => monit_amp_ch3_o,
    monit_amp_valid_o                        => monit_amp_valid_o,

    -----------------------------
    -- Position Data
    -----------------------------

    pos_x_tbt_o                              => pos_x_tbt_o,
    pos_y_tbt_o                              => pos_y_tbt_o,
    pos_q_tbt_o                              => pos_q_tbt_o,
    pos_sum_tbt_o                            => pos_sum_tbt_o,
    pos_tbt_valid_o                          => pos_tbt_valid_o,

    pos_x_fofb_o                             => pos_x_fofb_o,
    pos_y_fofb_o                             => pos_y_fofb_o,
    pos_q_fofb_o                             => pos_q_fofb_o,
    pos_sum_fofb_o                           => pos_sum_fofb_o,
    pos_fofb_valid_o                         => pos_fofb_valid_o,

    pos_x_monit_o                            => pos_x_monit_o,
    pos_y_monit_o                            => pos_y_monit_o,
    pos_q_monit_o                            => pos_q_monit_o,
    pos_sum_monit_o                          => pos_sum_monit_o,
    pos_monit_valid_o                        => pos_monit_valid_o,

    -----------------------------
    -- Output to RFFE board
    -----------------------------

    clk_swap_o                               => clk_swap_o,
    flag1_o                                  => flag1_o,
    flag2_o                                  => flag2_o,
    ctrl1_o                                  => ctrl1_o,
    ctrl2_o                                  => ctrl2_o,

    -----------------------------
    -- Clock drivers for various rates
    -----------------------------

    ce_adc_o                                 => ce_adc_o,
    ce_tbt_o                                 => ce_tbt_o,
    ce_monit_o                               => ce_monit_o,
    ce_fofb_o                                => ce_fofb_o,

    dbg_cur_address_o                        => dbg_cur_address_o,
    dbg_adc_ch0_cond_o                       => dbg_adc_ch0_cond_o,
    dbg_adc_ch1_cond_o                       => dbg_adc_ch1_cond_o,
    dbg_adc_ch2_cond_o                       => dbg_adc_ch2_cond_o,
    dbg_adc_ch3_cond_o                       => dbg_adc_ch3_cond_o
  );

end rtl;
