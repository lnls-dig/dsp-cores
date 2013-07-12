------------------------------------------------------------------------------
-- Title      : Cross and Uncross Top Entity
------------------------------------------------------------------------------
-- Author     : José Alvim Berkenbrock
-- Company    : CNPEM LNLS-DAC-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description:  This design is the top which put together all cores involved
--              in cross and uncross operation in channel pairs.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-04-09  1.0      jose.berkenbrock      Created
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_cross_top is
generic(
  g_delay_vec_width         : natural range 0 to 16 := 16;
  g_swap_div_freq_vec_width : natural range 0 to 16 := 16
);
port(
  -- Commom signals
  clk_i        :  in   std_logic;
  rst_n_i      :  in   std_logic;

  -- inv_chs_top core signal
  const_aa_i   :  in   std_logic_vector(9 downto 0);
  const_bb_i   :  in   std_logic_vector(9 downto 0);
  const_cc_i   :  in   std_logic_vector(9 downto 0);
  const_dd_i   :  in   std_logic_vector(9 downto 0);
  const_ac_i   :  in   std_logic_vector(9 downto 0);
  const_bd_i   :  in   std_logic_vector(9 downto 0);
  const_ca_i   :  in   std_logic_vector(9 downto 0);
  const_db_i   :  in   std_logic_vector(9 downto 0);

  delay1_i     :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
  delay2_i     :  in   std_logic_vector(g_delay_vec_width-1 downto 0);

  -- Input from ADC FMC board
  cha_i        :  in   std_logic_vector(15 downto 0);
  chb_i        :  in   std_logic_vector(15 downto 0);
  chc_i        :  in   std_logic_vector(15 downto 0);
  chd_i        :  in   std_logic_vector(15 downto 0);

  -- Output to data processing level
  cha_o        :  out  std_logic_vector(15 downto 0);
  chb_o        :  out  std_logic_vector(15 downto 0);
  chc_o        :  out  std_logic_vector(15 downto 0);
  chd_o        :  out  std_logic_vector(15 downto 0);

  -- Swap clock for RFFE
  clk_swap_o   : out std_logic;

  -- swap_cnt_top signal
  mode1_i      :  in    std_logic_vector(1 downto 0);
  mode2_i      :  in    std_logic_vector(1 downto 0);

  swap_div_f_i :  in    std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);

  -- Output to RFFE board
  ctrl1_o      :  out   std_logic_vector(7 downto 0);
  ctrl2_o      :  out   std_logic_vector(7 downto 0)
);
end un_cross_top;

architecture rtl of un_cross_top is

  signal status1 : std_logic;
  signal status2 : std_logic;

  -------------------------------------------------------
  -- components declaration
  -------------------------------------------------------
  component swap_cnt_top
  generic(
    g_swap_div_freq_vec_width : natural range 0 to 16 := g_swap_div_freq_vec_width
  );
  port(
    clk_i                                     : in  std_logic;
    rst_n_i                                   : in  std_logic;

    mode1_i                                   : in  std_logic_vector(1 downto 0);
    mode2_i                                   : in  std_logic_vector(1 downto 0);

    swap_div_f_i                              : in  std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);

    clk_swap_o                                : out std_logic;

    status1_o                                 : out std_logic;
    status2_o                                 : out std_logic;

    ctrl1_o                                   : out std_logic_vector(7 downto 0);
    ctrl2_o                                   : out std_logic_vector(7 downto 0)
  );
  end component;

  component inv_chs_top
  generic(
    g_delay_vec_width : natural range 0 to 16 := g_delay_vec_width
  );
  port(
    clk_i      :  in   std_logic;
    rst_n_i    :  in   std_logic;

    const_aa_i :  in   std_logic_vector(9 downto 0);
    const_bb_i :  in   std_logic_vector(9 downto 0);
    const_cc_i :  in   std_logic_vector(9 downto 0);
    const_dd_i :  in   std_logic_vector(9 downto 0);
    const_ac_i :  in   std_logic_vector(9 downto 0);
    const_bd_i :  in   std_logic_vector(9 downto 0);
    const_ca_i :  in   std_logic_vector(9 downto 0);
    const_db_i :  in   std_logic_vector(9 downto 0);

    delay1_i   :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
    delay2_i   :  in   std_logic_vector(g_delay_vec_width-1 downto 0);

    status1_i  :  in   std_logic;
    status2_i  :  in   std_logic;

    cha_i      :  in   std_logic_vector(15 downto 0);
    chb_i      :  in   std_logic_vector(15 downto 0);
    chc_i      :  in   std_logic_vector(15 downto 0);
    chd_i      :  in   std_logic_vector(15 downto 0);
    cha_o      :  out  std_logic_vector(15 downto 0);
    chb_o      :  out  std_logic_vector(15 downto 0);
    chc_o      :  out  std_logic_vector(15 downto 0);
    chd_o      :  out  std_logic_vector(15 downto 0));
  end component;

begin
  -------------------------------------------------------
  -- components instantiation
  -------------------------------------------------------
  cross_component: swap_cnt_top
  generic map (
    g_swap_div_freq_vec_width => g_swap_div_freq_vec_width
  )
  port map (
    clk_i         =>  clk_i,
    rst_n_i       =>  rst_n_i,

    mode1_i       =>  mode1_i,
    mode2_i       =>  mode2_i,

    swap_div_f_i  =>  swap_div_f_i,

    clk_swap_o    => clk_swap_o,

    status1_o     =>  status1,
    status2_o     =>  status2,

    ctrl1_o       =>  ctrl1_o,
    ctrl2_o       =>  ctrl2_o
  );

  uncross_component: inv_chs_top
  generic map (
    g_delay_vec_width => g_delay_vec_width
  )
  port map (
    clk_i       =>  clk_i,
    rst_n_i     =>  rst_n_i,

    const_aa_i  =>  const_aa_i,
    const_bb_i  =>  const_bb_i,
    const_cc_i  =>  const_cc_i,
    const_dd_i  =>  const_dd_i,
    const_ac_i  =>  const_ac_i,
    const_bd_i  =>  const_bd_i,
    const_ca_i  =>  const_ca_i,
    const_db_i  =>  const_db_i,

    delay1_i    =>  delay1_i,
    delay2_i    =>  delay2_i,

    status1_i   =>  status1,
    status2_i   =>  status2,

    cha_i       =>  cha_i,
    chb_i       =>  chb_i,
    chc_i       =>  chc_i,
    chd_i       =>  chd_i,
    cha_o       =>  cha_o,
    chb_o       =>  chb_o,
    chc_o       =>  chc_o,
    chd_o       =>  chd_o
  );

end;
