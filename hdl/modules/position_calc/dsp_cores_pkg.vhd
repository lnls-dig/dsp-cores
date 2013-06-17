library ieee;
use ieee.std_logic_1164.all;

package dsp_cores_pkg is

  --------------------------------------------------------------------
  -- Components
  --------------------------------------------------------------------
  component position_calc
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
  end component;

  component ddc_bpm_476_066_cw
  port (
    adc_ch0_i: in std_logic_vector(15 downto 0);
    adc_ch1_i: in std_logic_vector(15 downto 0);
    adc_ch2_i: in std_logic_vector(15 downto 0);
    adc_ch3_i: in std_logic_vector(15 downto 0);
    ce: in std_logic := '1';
    ce_clr: in std_logic := '1';
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
    fofb_amp_ch0_o: out std_logic_vector(23 downto 0);
    fofb_amp_ch1_o: out std_logic_vector(23 downto 0);
    fofb_amp_ch2_o: out std_logic_vector(23 downto 0);
    fofb_amp_ch3_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch0_i_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch0_q_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch1_i_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch1_q_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch2_i_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch2_q_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch3_i_o: out std_logic_vector(23 downto 0);
    fofb_decim_ch3_q_o: out std_logic_vector(23 downto 0);
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
    tbt_decim_ch0_i_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch0_q_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch1_i_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch1_q_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch2_i_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch2_q_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch3_i_o: out std_logic_vector(23 downto 0);
    tbt_decim_ch3_q_o: out std_logic_vector(23 downto 0);
    x_fofb_o: out std_logic_vector(25 downto 0);
    x_monit_o: out std_logic_vector(25 downto 0);
    x_tbt_o: out std_logic_vector(25 downto 0);
    y_fofb_o: out std_logic_vector(25 downto 0);
    y_monit_o: out std_logic_vector(25 downto 0);
    y_tbt_o: out std_logic_vector(25 downto 0)
  );
  end component;

  component default_clock_driver
  port (
    sysce: in std_logic;
    sysce_clr: in std_logic;
    sysclk: in std_logic;
    ce_1: out std_logic;
    ce_1112: out std_logic;
    ce_11120000: out std_logic;
    ce_1390000: out std_logic;
    ce_2: out std_logic;
    ce_2224: out std_logic;
    ce_22240000: out std_logic;
    ce_2500: out std_logic;
    ce_2780000: out std_logic;
    ce_35: out std_logic;
    ce_5000: out std_logic;
    ce_556: out std_logic;
    ce_5560000: out std_logic;
    ce_70: out std_logic;
    ce_logic_1: out std_logic;
    ce_logic_1390000: out std_logic;
    ce_logic_2: out std_logic;
    ce_logic_2780000: out std_logic;
    ce_logic_556: out std_logic;
    clk_1: out std_logic;
    clk_1112: out std_logic;
    clk_11120000: out std_logic;
    clk_1390000: out std_logic;
    clk_2: out std_logic;
    clk_2224: out std_logic;
    clk_22240000: out std_logic;
    clk_2500: out std_logic;
    clk_2780000: out std_logic;
    clk_35: out std_logic;
    clk_5000: out std_logic;
    clk_556: out std_logic;
    clk_5560000: out std_logic;
    clk_70: out std_logic
  );
  end component;

end dsp_cores_pkg;
