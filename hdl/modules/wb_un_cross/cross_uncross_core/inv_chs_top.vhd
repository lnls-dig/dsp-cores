------------------------------------------------------------------------------
-- Title      : Inverter Channels Top Entity
------------------------------------------------------------------------------
-- Author     : José Alvim Berkenbrock
-- Company    : CNPEM LNLS-DAC-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description:  This design takes the signals from ADC FMC and invert them
--              according to control signals status[2..1]_i from swap_cnt_test
--              block.
--               This mechaninsm is necessary to compensate delay propagation
--              at ADC module.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-02-18  1.0      jose.berkenbrock      Created
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inv_chs_top is
generic(
    g_delay_vec_width : natural range 0 to 16 := 10
    );
port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    const_aa_i                              :  in   std_logic_vector(9 downto 0);
    const_bb_i                              :  in   std_logic_vector(9 downto 0);
    const_cc_i                              :  in   std_logic_vector(9 downto 0);
    const_dd_i                              :  in   std_logic_vector(9 downto 0);
    const_ac_i                              :  in   std_logic_vector(9 downto 0);
    const_bd_i                              :  in   std_logic_vector(9 downto 0);
    const_ca_i                              :  in   std_logic_vector(9 downto 0);
    const_db_i                              :  in   std_logic_vector(9 downto 0);
    delay1_i                                :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
    delay2_i                                :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
-- input from rf_ch_swap core:
    status1_i                               :  in   std_logic;
    status2_i                               :  in   std_logic;
-- input from ADC FMC board:
    cha_i                                   :  in   std_logic_vector(15 downto 0);
    chb_i                                   :  in   std_logic_vector(15 downto 0);
    chc_i                                   :  in   std_logic_vector(15 downto 0);
    chd_i                                   :  in   std_logic_vector(15 downto 0);
-- output to data processing level:
    cha_o                                   :  out  std_logic_vector(15 downto 0);
    chb_o                                   :  out  std_logic_vector(15 downto 0);
    chc_o                                   :  out  std_logic_vector(15 downto 0);
    chd_o                                   :  out  std_logic_vector(15 downto 0));
end inv_chs_top;

architecture rtl of inv_chs_top is

signal en1      : std_logic;
signal en2      : std_logic;
signal s_cha    : std_logic_vector(15 downto 0);
signal s_chb    : std_logic_vector(15 downto 0);
signal s_chc    : std_logic_vector(15 downto 0);
signal s_chd    : std_logic_vector(15 downto 0);
----------------------------------------------------------------
-- Components Declaration
----------------------------------------------------------------
component inv_ch
--generic(
--);
  port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    en_i                                    :  in   std_logic;

    ch1_i                                   :  in   std_logic_vector(15 downto 0);
    ch2_i                                   :  in   std_logic_vector(15 downto 0);

    ch1_o                                   :  out  std_logic_vector(15 downto 0);
    ch2_o                                   :  out  std_logic_vector(15 downto 0)
  );
end component;
----------------------------------------------------------------
component delay_inv_ch
generic(
    g_delay_vec_width : natural range 0 to 16 := g_delay_vec_width
  );
port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    trg_i                                   :  in   std_logic;     --  trigger
    cnt_lmt_i                               :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
    --  counter                              limit
    en_o                                    :  out  std_logic
  );
end component;
----------------------------------------------------------------
component multiplier_16x10_DSP
port (
    clk : in  std_logic;
    a   : in  std_logic_vector(15 downto 0);
    b   : in  std_logic_vector(9 downto 0);
    p   : out std_logic_vector(25 downto 0)
    );
end component;
----------------------------------------------------------------
component dyn_mult_2chs
port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    en_i                                    :  in   std_logic;

    const_11_i                              :  in   std_logic_vector(9 downto 0);
    const_22_i                              :  in   std_logic_vector(9 downto 0);
    const_12_i                              :  in   std_logic_vector(9 downto 0);
    const_21_i                              :  in   std_logic_vector(9 downto 0);

    ch1_i                                   :  in   std_logic_vector(15 downto 0);
    ch2_i                                   :  in   std_logic_vector(15 downto 0);

    ch1_o                                   :  out  std_logic_vector(15 downto 0);
    ch2_o                                   :  out  std_logic_vector(15 downto 0)
    );
end component;
----------------------------------------------------------------
begin
----------------------------------------------------------------
-- Components instantiation
----------------------------------------------------------------
  delay_inst_1: delay_inv_ch
    port map (
       clk_i      =>   clk_i,
       rst_n_i    =>   rst_n_i,
       trg_i      =>   status1_i,
       cnt_lmt_i  =>   delay1_i,
       en_o       =>   en1
    );

  delay_inst_2: delay_inv_ch
    port map (
       clk_i      =>   clk_i,
       rst_n_i    =>   rst_n_i,
       trg_i      =>   status2_i,
       cnt_lmt_i  =>   delay2_i,
       en_o       =>   en2
    );

  inv_ch_inst_1: inv_ch
    port map (
       clk_i      =>   clk_i,
       rst_n_i    =>   rst_n_i,
       en_i       =>   en1,
       ch1_i      =>   cha_i,
       ch2_i      =>   chc_i,
       ch1_o      =>   s_cha,
       ch2_o      =>   s_chc
    );

  inv_ch_inst_2: inv_ch
    port map (
      clk_i      =>   clk_i,
      rst_n_i    =>   rst_n_i,
      en_i       =>   en2,
      ch1_i      =>   chb_i,
      ch2_i      =>   chd_i,
      ch1_o      =>   s_chb,
      ch2_o      =>   s_chd
    );

  mult_ch_pair1: dyn_mult_2chs
    port map (
      clk_i      =>   clk_i,
      rst_n_i    =>   rst_n_i,
      en_i       =>   en1,
      const_11_i =>   const_aa_i,
      const_22_i =>   const_cc_i,
      const_12_i =>   const_ac_i,
      const_21_i =>   const_ca_i,
      ch1_i      =>   s_cha,
      ch2_i      =>   s_chc,
      ch1_o      =>   cha_o,
      ch2_o      =>   chc_o
    );

  mult_ch_pair2: dyn_mult_2chs
    port map (
      clk_i      =>   clk_i,
      rst_n_i    =>   rst_n_i,
      en_i       =>   en2,
      const_11_i =>   const_bb_i,
      const_22_i =>   const_dd_i,
      const_12_i =>   const_bd_i,
      const_21_i =>   const_db_i,
      ch1_i      =>   s_chb,
      ch2_i      =>   s_chd,
      ch1_o      =>   chb_o,
      ch2_o      =>   chd_o
    );

end;
