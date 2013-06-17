library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

entity position_calc is
--generic(
--
--);
port(
  adc_ch0_i: in std_logic_vector(15 downto 0);
  adc_ch1_i: in std_logic_vector(15 downto 0);
  adc_ch2_i: in std_logic_vector(15 downto 0);
  adc_ch3_i: in std_logic_vector(15 downto 0);
  clk: in std_logic; -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
  del_sig_div_fofb_thres_i: in std_logic_vector(25 downto 0);
  del_sig_div_monit_thres_i: in std_logic_vector(25 downto 0);
  del_sig_div_tbt_thres_i: in std_logic_vector(25 downto 0);
  ksum: in std_logic_vector(24 downto 0);
  kx: in std_logic_vector(24 downto 0);
  ky: in std_logic_vector(24 downto 0);
  adc_ch0_dbg_data_o: out std_logic_vector(15 downto 0);
  adc_ch1_dbg_data_o: out std_logic_vector(15 downto 0);
  adc_ch2_dbg_data_o: out std_logic_vector(15 downto 0);
  adc_ch3_dbg_data_o: out std_logic_vector(15 downto 0);
  bpf_ch0_o: out std_logic_vector(23 downto 0);
  bpf_ch1_o: out std_logic_vector(23 downto 0);
  bpf_ch2_o: out std_logic_vector(23 downto 0);
  bpf_ch3_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch0_i_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch0_q_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch1_i_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch1_q_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch2_i_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch2_q_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch3_i_o: out std_logic_vector(23 downto 0);
  fofb_decim_ch3_q_o: out std_logic_vector(23 downto 0);
  fofb_amp_ch0_o: out std_logic_vector(23 downto 0);
  fofb_amp_ch1_o: out std_logic_vector(23 downto 0);
  fofb_amp_ch2_o: out std_logic_vector(23 downto 0);
  fofb_amp_ch3_o: out std_logic_vector(23 downto 0);
  mix_ch0_i_o: out std_logic_vector(23 downto 0);
  mix_ch0_q_o: out std_logic_vector(23 downto 0);
  mix_ch1_i_o: out std_logic_vector(23 downto 0);
  mix_ch1_q_o: out std_logic_vector(23 downto 0);
  mix_ch2_i_o: out std_logic_vector(23 downto 0);
  mix_ch2_q_o: out std_logic_vector(23 downto 0);
  mix_ch3_i_o: out std_logic_vector(23 downto 0);
  mix_ch3_q_o: out std_logic_vector(23 downto 0);
  monit_amp_ch0_o: out std_logic_vector(23 downto 0);
  monit_amp_ch1_o: out std_logic_vector(23 downto 0);
  monit_amp_ch2_o: out std_logic_vector(23 downto 0);
  monit_amp_ch3_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch0_i_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch0_q_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch1_i_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch1_q_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch2_i_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch2_q_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch3_i_o: out std_logic_vector(23 downto 0);
  tbt_decim_ch3_q_o: out std_logic_vector(23 downto 0);
  q_fofb_o: out std_logic_vector(25 downto 0);
  q_monit_o: out std_logic_vector(25 downto 0);
  q_tbt_o: out std_logic_vector(25 downto 0);
  sum_fofb_o: out std_logic_vector(25 downto 0);
  sum_monit_o: out std_logic_vector(25 downto 0);
  sum_tbt_o: out std_logic_vector(25 downto 0);
  tbt_amp_ch0_o: out std_logic_vector(23 downto 0);
  tbt_amp_ch1_o: out std_logic_vector(23 downto 0);
  tbt_amp_ch2_o: out std_logic_vector(23 downto 0);
  tbt_amp_ch3_o: out std_logic_vector(23 downto 0);
  x_fofb_o: out std_logic_vector(25 downto 0);
  x_monit_o: out std_logic_vector(25 downto 0);
  x_tbt_o: out std_logic_vector(25 downto 0);
  y_fofb_o: out std_logic_vector(25 downto 0);
  y_monit_o: out std_logic_vector(25 downto 0);
  y_tbt_o: out std_logic_vector(25 downto 0)
);
end position_calc;

architecture rtl of position_calc is

  signal ce                                  : std_logic;
  signal ce_clr                              : std_logic;

begin

  --cmp_default_clock_driver : default_clock_driver
  --port map (
  --  sysce: in std_logic;
  --  sysce_clr: in std_logic;
  --  sysclk: in std_logic;
  --  ce_1: out std_logic;
  --  ce_1112: out std_logic;
  --  ce_11120000: out std_logic;
  --  ce_1390000: out std_logic;
  --  ce_2: out std_logic;
  --  ce_2224: out std_logic;
  --  ce_22240000: out std_logic;
  --  ce_2500: out std_logic;
  --  ce_2780000: out std_logic;
  --  ce_35: out std_logic;
  --  ce_5000: out std_logic;
  --  ce_556: out std_logic;
  --  ce_5560000: out std_logic;
  --  ce_70: out std_logic;
  --  ce_logic_1: out std_logic;
  --  ce_logic_1390000: out std_logic;
  --  ce_logic_2: out std_logic;
  --  ce_logic_2780000: out std_logic;
  --  ce_logic_556: out std_logic;
  --  clk_1: out std_logic;
  --  clk_1112: out std_logic;
  --  clk_11120000: out std_logic;
  --  clk_1390000: out std_logic;
  --  clk_2: out std_logic;
  --  clk_2224: out std_logic;
  --  clk_22240000: out std_logic;
  --  clk_2500: out std_logic;
  --  clk_2780000: out std_logic;
  --  clk_35: out std_logic;
  --  clk_5000: out std_logic;
  --  clk_556: out std_logic;
  --  clk_5560000: out std_logic;
  --  clk_70: out std_logic
  --);

  cmp_ddc_bpm_476_066_cw : ddc_bpm_476_066_cw
  port map (
    adc_ch0_i                               => adc_ch0_i,
    adc_ch1_i                               => adc_ch1_i,
    adc_ch2_i                               => adc_ch2_i,
    adc_ch3_i                               => adc_ch3_i,
    ce                                      => ce,
    ce_clr                                  => ce_clr,
    clk                                     => clk,
    del_sig_div_fofb_thres_i                => del_sig_div_fofb_thres_i,
    del_sig_div_monit_thres_i               => del_sig_div_monit_thres_i,
    del_sig_div_tbt_thres_i                 => del_sig_div_tbt_thres_i,
    ksum                                    => ksum,
    kx                                      => kx,
    ky                                      => ky,

    adc_ch0_dbg_data_o                      => adc_ch0_dbg_data_o,
    adc_ch1_dbg_data_o                      => adc_ch1_dbg_data_o,
    adc_ch2_dbg_data_o                      => adc_ch2_dbg_data_o,
    adc_ch3_dbg_data_o                      => adc_ch3_dbg_data_o,

    bpf_ch0_o                               => bpf_ch0_o,
    bpf_ch1_o                               => bpf_ch1_o,
    bpf_ch2_o                               => bpf_ch2_o,
    bpf_ch3_o                               => bpf_ch3_o,

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

    fofb_amp_ch0_o                          => fofb_amp_ch0_o,
    fofb_amp_ch1_o                          => fofb_amp_ch1_o,
    fofb_amp_ch2_o                          => fofb_amp_ch2_o,
    fofb_amp_ch3_o                          => fofb_amp_ch3_o,

    monit_amp_ch0_o                         => monit_amp_ch0_o,
    monit_amp_ch1_o                         => monit_amp_ch1_o,
    monit_amp_ch2_o                         => monit_amp_ch2_o,
    monit_amp_ch3_o                         => monit_amp_ch3_o,

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
    sum_monit_o                             => sum_monit_o
  );

  ce                                        <= '1';
  ce_clr                                    <= '0';

end rtl;
