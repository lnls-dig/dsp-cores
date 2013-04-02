library ieee;
use ieee.std_logic_1164.all;

package dsp_cores_pkg is

  --------------------------------------------------------------------
  -- Components
  --------------------------------------------------------------------
  component ddc_bpm_476_066_sim_1mdb_cw
  port (
    adc_ch0_i: in std_logic_vector(15 downto 0);
    adc_ch1_i: in std_logic_vector(15 downto 0);
    adc_ch2_i: in std_logic_vector(15 downto 0);
    adc_ch3_i: in std_logic_vector(15 downto 0);
    ce: in std_logic := '1';
    ce_clr: in std_logic := '1';
    clk: in std_logic; -- clock period = 8.8823218389287 ns (112.58317567567562 Mhz)
    del_sig_div_thres_i: in std_logic_vector(26 downto 0);
    adc_ch0_dbg_data_o: out std_logic_vector(15 downto 0);
    adc_ch1_dbg_data_o: out std_logic_vector(15 downto 0);
    adc_ch2_dbg_data_o: out std_logic_vector(15 downto 0);
    adc_ch3_dbg_data_o: out std_logic_vector(15 downto 0);
    bpf_ch0_o: out std_logic_vector(24 downto 0);
    bpf_ch1_o: out std_logic_vector(24 downto 0);
    bpf_ch2_o: out std_logic_vector(24 downto 0);
    bpf_ch3_o: out std_logic_vector(24 downto 0);
    mix_ch0_i_o: out std_logic_vector(24 downto 0);
    mix_ch0_q_o: out std_logic_vector(24 downto 0);
    mix_ch1_i_o: out std_logic_vector(24 downto 0);
    mix_ch1_q_o: out std_logic_vector(24 downto 0);
    mix_ch2_i_o: out std_logic_vector(24 downto 0);
    mix_ch2_q_o: out std_logic_vector(24 downto 0);
    mix_ch3_i_o: out std_logic_vector(24 downto 0);
    mix_ch3_q_o: out std_logic_vector(24 downto 0);
    poly35_ch0_i_o: out std_logic_vector(24 downto 0);
    poly35_ch0_q_o: out std_logic_vector(24 downto 0);
    poly35_ch1_i_o: out std_logic_vector(24 downto 0);
    poly35_ch1_q_o: out std_logic_vector(24 downto 0);
    poly35_ch2_i_o: out std_logic_vector(24 downto 0);
    poly35_ch2_q_o: out std_logic_vector(24 downto 0);
    poly35_ch3_i_o: out std_logic_vector(24 downto 0);
    poly35_ch3_q_o: out std_logic_vector(24 downto 0);
    q_tbt_o: out std_logic_vector(22 downto 0);
    sum_tbt_o: out std_logic_vector(26 downto 0);
    tbt_amp_ch0_o: out std_logic_vector(24 downto 0);
    tbt_amp_ch1_o: out std_logic_vector(24 downto 0);
    tbt_amp_ch2_o: out std_logic_vector(24 downto 0);
    tbt_amp_ch3_o: out std_logic_vector(24 downto 0);
    x_tbt_o: out std_logic_vector(22 downto 0);
    y_tbt_o: out std_logic_vector(22 downto 0)
  );
  end component;

  component default_clock_driver
  port (
    sysce: in std_logic;
    sysce_clr: in std_logic;
    sysclk: in std_logic;
    ce_1: out std_logic;
    ce_35: out std_logic;
    ce_logic_1: out std_logic;
    clk_1: out std_logic;
    clk_35: out std_logic
  );
  end component;



end dsp_cores_pkg;
