library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/BPF"

entity bpf_entity_d31c4af409 is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_logic_2: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    din_ch0: in std_logic_vector(15 downto 0); 
    din_ch1: in std_logic_vector(15 downto 0); 
    din_ch2: in std_logic_vector(15 downto 0); 
    din_ch3: in std_logic_vector(15 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0); 
    dout_ch2: out std_logic_vector(23 downto 0); 
    dout_ch3: out std_logic_vector(23 downto 0)
  );
end bpf_entity_d31c4af409;

architecture structural of bpf_entity_d31c4af409 is
  signal bpf_fpga_m_axis_data_tdata_path0_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path1_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path2_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path3_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tvalid_net: std_logic;
  signal ce_1_sg_x0: std_logic;
  signal ce_2_sg_x0: std_logic;
  signal ce_logic_2_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal clk_2_sg_x0: std_logic;
  signal register1_q_net_x1: std_logic_vector(15 downto 0);
  signal register1_q_net_x2: std_logic_vector(23 downto 0);
  signal register2_q_net_x1: std_logic_vector(15 downto 0);
  signal register2_q_net_x2: std_logic_vector(23 downto 0);
  signal register3_q_net_x1: std_logic_vector(15 downto 0);
  signal register3_q_net_x2: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(15 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x0 <= ce_1;
  ce_2_sg_x0 <= ce_2;
  ce_logic_2_sg_x0 <= ce_logic_2;
  clk_1_sg_x0 <= clk_1;
  clk_2_sg_x0 <= clk_2;
  register_q_net_x1 <= din_ch0;
  register1_q_net_x1 <= din_ch1;
  register2_q_net_x1 <= din_ch2;
  register3_q_net_x1 <= din_ch3;
  dout_ch0 <= register_q_net_x2;
  dout_ch1 <= register1_q_net_x2;
  dout_ch2 <= register2_q_net_x2;
  dout_ch3 <= register3_q_net_x2;

  bpf_fpga: entity work.xlfir_compiler_5c49e68d4a338363199fcba5a3e22356
    port map (
      ce => ce_1_sg_x0,
      ce_2 => ce_2_sg_x0,
      ce_logic_2 => ce_logic_2_sg_x0,
      clk => clk_1_sg_x0,
      clk_2 => clk_2_sg_x0,
      clk_logic_2 => clk_2_sg_x0,
      s_axis_data_tdata_path0 => register3_q_net_x1,
      s_axis_data_tdata_path1 => register2_q_net_x1,
      s_axis_data_tdata_path2 => register1_q_net_x1,
      s_axis_data_tdata_path3 => register_q_net_x1,
      src_ce => ce_2_sg_x0,
      src_clk => clk_2_sg_x0,
      m_axis_data_tdata_path0 => bpf_fpga_m_axis_data_tdata_path0_net,
      m_axis_data_tdata_path1 => bpf_fpga_m_axis_data_tdata_path1_net,
      m_axis_data_tdata_path2 => bpf_fpga_m_axis_data_tdata_path2_net,
      m_axis_data_tdata_path3 => bpf_fpga_m_axis_data_tdata_path3_net,
      m_axis_data_tvalid => bpf_fpga_m_axis_data_tvalid_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x0,
      clk => clk_2_sg_x0,
      d => reinterpret_output_port_net,
      en(0) => bpf_fpga_m_axis_data_tvalid_net,
      rst => "0",
      q => register1_q_net_x2
    );

  register2: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x0,
      clk => clk_2_sg_x0,
      d => reinterpret2_output_port_net,
      en(0) => bpf_fpga_m_axis_data_tvalid_net,
      rst => "0",
      q => register2_q_net_x2
    );

  register3: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x0,
      clk => clk_2_sg_x0,
      d => reinterpret3_output_port_net,
      en(0) => bpf_fpga_m_axis_data_tvalid_net,
      rst => "0",
      q => register3_q_net_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x0,
      clk => clk_2_sg_x0,
      d => reinterpret4_output_port_net,
      en(0) => bpf_fpga_m_axis_data_tvalid_net,
      rst => "0",
      q => register_q_net_x2
    );

  reinterpret: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path2_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret2: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path1_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path0_net,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path3_net,
      output_port => reinterpret4_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/DDS_sub/TDM_dds_ch01_cosine"

entity tdm_dds_ch01_cosine_entity_4b8bfc9243 is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    din_ch0: in std_logic_vector(23 downto 0); 
    din_ch1: in std_logic_vector(23 downto 0); 
    rst: in std_logic; 
    dout: out std_logic_vector(23 downto 0)
  );
end tdm_dds_ch01_cosine_entity_4b8bfc9243;

architecture structural of tdm_dds_ch01_cosine_entity_4b8bfc9243 is
  signal ce_1_sg_x1: std_logic;
  signal ce_2_sg_x1: std_logic;
  signal ce_logic_1_sg_x0: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal clk_2_sg_x1: std_logic;
  signal clock_enable_probe_q_net: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal dds_ch0_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch1_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal mux_sel1_op_net: std_logic;
  signal mux_y_net: std_logic_vector(23 downto 0);
  signal register2_q_net: std_logic_vector(23 downto 0);
  signal register3_q_net: std_logic_vector(23 downto 0);
  signal register4_q_net: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal up_sample_ch0_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch1_q_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x1 <= ce_1;
  ce_2_sg_x1 <= ce_2;
  ce_logic_1_sg_x0 <= ce_logic_1;
  clk_1_sg_x1 <= clk_1;
  clk_2_sg_x1 <= clk_2;
  dds_ch0_m_axis_data_tdata_cosine_net_x0 <= din_ch0;
  dds_ch1_m_axis_data_tdata_cosine_net_x0 <= din_ch1;
  constant11_op_net_x0 <= rst;
  dout <= register_q_net_x0;

  clock_enable_probe: entity work.xlceprobe
    generic map (
      d_width => 24,
      q_width => 1
    )
    port map (
      ce => ce_logic_1_sg_x0,
      clk => clk_1_sg_x1,
      d => register2_q_net,
      q(0) => clock_enable_probe_q_net
    );

  mux: entity work.mux_a2121d82da
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register2_q_net,
      d1 => register3_q_net,
      sel(0) => register4_q_net,
      y => mux_y_net
    );

  mux_sel1: entity work.counter_41314d726b
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      en(0) => clock_enable_probe_q_net,
      rst(0) => constant11_op_net_x0,
      op(0) => mux_sel1_op_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => up_sample_ch0_q_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => up_sample_ch1_q_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d(0) => mux_sel1_op_net,
      en => "1",
      rst => "0",
      q(0) => register4_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => mux_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  up_sample_ch0: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => dds_ch0_m_axis_data_tdata_cosine_net_x0,
      dest_ce => ce_1_sg_x1,
      dest_clk => clk_1_sg_x1,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x1,
      src_clk => clk_2_sg_x1,
      src_clr => '0',
      q => up_sample_ch0_q_net
    );

  up_sample_ch1: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => dds_ch1_m_axis_data_tdata_cosine_net_x0,
      dest_ce => ce_1_sg_x1,
      dest_clk => clk_1_sg_x1,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x1,
      src_clk => clk_2_sg_x1,
      src_clr => '0',
      q => up_sample_ch1_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/DDS_sub"

entity dds_sub_entity_a4b6b880f6 is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    dds_config_valid_ch0_i: in std_logic; 
    dds_config_valid_ch1_i: in std_logic; 
    dds_config_valid_ch2_i: in std_logic; 
    dds_config_valid_ch3_i: in std_logic; 
    dds_pinc_ch0_i: in std_logic_vector(29 downto 0); 
    dds_pinc_ch1_i: in std_logic_vector(29 downto 0); 
    dds_pinc_ch2_i: in std_logic_vector(29 downto 0); 
    dds_pinc_ch3_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch0_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch1_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch2_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch3_i: in std_logic_vector(29 downto 0); 
    dds_01_cosine: out std_logic_vector(23 downto 0); 
    dds_01_sine: out std_logic_vector(23 downto 0); 
    dds_23_cosine: out std_logic_vector(23 downto 0); 
    dds_23_sine: out std_logic_vector(23 downto 0)
  );
end dds_sub_entity_a4b6b880f6;

architecture structural of dds_sub_entity_a4b6b880f6 is
  signal ce_1_sg_x5: std_logic;
  signal ce_2_sg_x5: std_logic;
  signal ce_logic_1_sg_x4: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal clk_2_sg_x5: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal constant15_op_net: std_logic;
  signal constant16_op_net_x0: std_logic;
  signal constant17_op_net_x0: std_logic;
  signal constant3_op_net: std_logic;
  signal constant7_op_net_x0: std_logic;
  signal dds_ch0_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch0_m_axis_data_tdata_sine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch1_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch1_m_axis_data_tdata_sine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch2_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch2_m_axis_data_tdata_sine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch3_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_ch3_m_axis_data_tdata_sine_net_x0: std_logic_vector(23 downto 0);
  signal dds_config_valid_ch0_i_net_x0: std_logic;
  signal dds_config_valid_ch1_i_net_x0: std_logic;
  signal dds_config_valid_ch2_i_net_x0: std_logic;
  signal dds_config_valid_ch3_i_net_x0: std_logic;
  signal dds_pinc_ch0_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_pinc_ch1_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_pinc_ch2_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_pinc_ch3_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_poff_ch0_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_poff_ch1_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_poff_ch2_i_net_x0: std_logic_vector(29 downto 0);
  signal dds_poff_ch3_i_net_x0: std_logic_vector(29 downto 0);
  signal register_q_net_x4: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x5 <= ce_1;
  ce_2_sg_x5 <= ce_2;
  ce_logic_1_sg_x4 <= ce_logic_1;
  clk_1_sg_x5 <= clk_1;
  clk_2_sg_x5 <= clk_2;
  dds_config_valid_ch0_i_net_x0 <= dds_config_valid_ch0_i;
  dds_config_valid_ch1_i_net_x0 <= dds_config_valid_ch1_i;
  dds_config_valid_ch2_i_net_x0 <= dds_config_valid_ch2_i;
  dds_config_valid_ch3_i_net_x0 <= dds_config_valid_ch3_i;
  dds_pinc_ch0_i_net_x0 <= dds_pinc_ch0_i;
  dds_pinc_ch1_i_net_x0 <= dds_pinc_ch1_i;
  dds_pinc_ch2_i_net_x0 <= dds_pinc_ch2_i;
  dds_pinc_ch3_i_net_x0 <= dds_pinc_ch3_i;
  dds_poff_ch0_i_net_x0 <= dds_poff_ch0_i;
  dds_poff_ch1_i_net_x0 <= dds_poff_ch1_i;
  dds_poff_ch2_i_net_x0 <= dds_poff_ch2_i;
  dds_poff_ch3_i_net_x0 <= dds_poff_ch3_i;
  dds_01_cosine <= register_q_net_x4;
  dds_01_sine <= register_q_net_x5;
  dds_23_cosine <= register_q_net_x6;
  dds_23_sine <= register_q_net_x7;

  constant11: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant11_op_net_x0
    );

  constant15: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant15_op_net
    );

  constant16: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant16_op_net_x0
    );

  constant17: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant17_op_net_x0
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  constant7: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant7_op_net_x0
    );

  dds_ch0: entity work.xldds_compiler_6ef2934d572b7cd1757292caa5710be5
    port map (
      ce => ce_2_sg_x5,
      clk => clk_2_sg_x5,
      m_axis_data_tready => constant3_op_net,
      s_axis_config_tdata_pinc => dds_pinc_ch0_i_net_x0,
      s_axis_config_tdata_poff => dds_poff_ch0_i_net_x0,
      s_axis_config_tvalid => dds_config_valid_ch0_i_net_x0,
      m_axis_data_tdata_cosine => dds_ch0_m_axis_data_tdata_cosine_net_x0,
      m_axis_data_tdata_sine => dds_ch0_m_axis_data_tdata_sine_net_x0
    );

  dds_ch1: entity work.xldds_compiler_6ef2934d572b7cd1757292caa5710be5
    port map (
      ce => ce_2_sg_x5,
      clk => clk_2_sg_x5,
      m_axis_data_tready => constant3_op_net,
      s_axis_config_tdata_pinc => dds_pinc_ch1_i_net_x0,
      s_axis_config_tdata_poff => dds_poff_ch1_i_net_x0,
      s_axis_config_tvalid => dds_config_valid_ch1_i_net_x0,
      m_axis_data_tdata_cosine => dds_ch1_m_axis_data_tdata_cosine_net_x0,
      m_axis_data_tdata_sine => dds_ch1_m_axis_data_tdata_sine_net_x0
    );

  dds_ch2: entity work.xldds_compiler_6ef2934d572b7cd1757292caa5710be5
    port map (
      ce => ce_2_sg_x5,
      clk => clk_2_sg_x5,
      m_axis_data_tready => constant3_op_net,
      s_axis_config_tdata_pinc => dds_pinc_ch2_i_net_x0,
      s_axis_config_tdata_poff => dds_poff_ch2_i_net_x0,
      s_axis_config_tvalid => dds_config_valid_ch2_i_net_x0,
      m_axis_data_tdata_cosine => dds_ch2_m_axis_data_tdata_cosine_net_x0,
      m_axis_data_tdata_sine => dds_ch2_m_axis_data_tdata_sine_net_x0
    );

  dds_ch3: entity work.xldds_compiler_6ef2934d572b7cd1757292caa5710be5
    port map (
      ce => ce_2_sg_x5,
      clk => clk_2_sg_x5,
      m_axis_data_tready => constant15_op_net,
      s_axis_config_tdata_pinc => dds_pinc_ch3_i_net_x0,
      s_axis_config_tdata_poff => dds_poff_ch3_i_net_x0,
      s_axis_config_tvalid => dds_config_valid_ch3_i_net_x0,
      m_axis_data_tdata_cosine => dds_ch3_m_axis_data_tdata_cosine_net_x0,
      m_axis_data_tdata_sine => dds_ch3_m_axis_data_tdata_sine_net_x0
    );

  tdm_dds_ch01_cosine_4b8bfc9243: entity work.tdm_dds_ch01_cosine_entity_4b8bfc9243
    port map (
      ce_1 => ce_1_sg_x5,
      ce_2 => ce_2_sg_x5,
      ce_logic_1 => ce_logic_1_sg_x4,
      clk_1 => clk_1_sg_x5,
      clk_2 => clk_2_sg_x5,
      din_ch0 => dds_ch0_m_axis_data_tdata_cosine_net_x0,
      din_ch1 => dds_ch1_m_axis_data_tdata_cosine_net_x0,
      rst => constant11_op_net_x0,
      dout => register_q_net_x4
    );

  tdm_dds_ch01_sine_1129eb9762: entity work.tdm_dds_ch01_cosine_entity_4b8bfc9243
    port map (
      ce_1 => ce_1_sg_x5,
      ce_2 => ce_2_sg_x5,
      ce_logic_1 => ce_logic_1_sg_x4,
      clk_1 => clk_1_sg_x5,
      clk_2 => clk_2_sg_x5,
      din_ch0 => dds_ch0_m_axis_data_tdata_sine_net_x0,
      din_ch1 => dds_ch1_m_axis_data_tdata_sine_net_x0,
      rst => constant7_op_net_x0,
      dout => register_q_net_x5
    );

  tdm_dds_ch23_cosine_398d5cee32: entity work.tdm_dds_ch01_cosine_entity_4b8bfc9243
    port map (
      ce_1 => ce_1_sg_x5,
      ce_2 => ce_2_sg_x5,
      ce_logic_1 => ce_logic_1_sg_x4,
      clk_1 => clk_1_sg_x5,
      clk_2 => clk_2_sg_x5,
      din_ch0 => dds_ch2_m_axis_data_tdata_cosine_net_x0,
      din_ch1 => dds_ch3_m_axis_data_tdata_cosine_net_x0,
      rst => constant16_op_net_x0,
      dout => register_q_net_x6
    );

  tdm_dds_ch23_sine_782ff6a42a: entity work.tdm_dds_ch01_cosine_entity_4b8bfc9243
    port map (
      ce_1 => ce_1_sg_x5,
      ce_2 => ce_2_sg_x5,
      ce_logic_1 => ce_logic_1_sg_x4,
      clk_1 => clk_1_sg_x5,
      clk_2 => clk_2_sg_x5,
      din_ch0 => dds_ch2_m_axis_data_tdata_sine_net_x0,
      din_ch1 => dds_ch3_m_axis_data_tdata_sine_net_x0,
      rst => constant17_op_net_x0,
      dout => register_q_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/TDDM_fofb_amp_4ch/TDDM_fofb_amp0"

entity tddm_fofb_amp0_entity_fd74c6ad6e is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ch_in: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0)
  );
end tddm_fofb_amp0_entity_fd74c6ad6e;

architecture structural of tddm_fofb_amp0_entity_fd74c6ad6e is
  signal ce_1112_sg_x0: std_logic;
  signal ce_2224_sg_x0: std_logic;
  signal clk_1112_sg_x0: std_logic;
  signal clk_2224_sg_x0: std_logic;
  signal constant1_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register5_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1112_sg_x0 <= ce_1112;
  ce_2224_sg_x0 <= ce_2224;
  register1_q_net_x1 <= ch_in;
  clk_1112_sg_x0 <= clk_1112;
  clk_2224_sg_x0 <= clk_2224;
  register5_q_net_x0 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;

  constant1: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_2224_sg_x0,
      dest_clk => clk_2224_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1112_sg_x0,
      src_clk => clk_1112_sg_x0,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_2224_sg_x0,
      dest_clk => clk_2224_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1112_sg_x0,
      src_clk => clk_1112_sg_x0,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x0,
      clk => clk_1112_sg_x0,
      d => register5_q_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x0,
      clk => clk_1112_sg_x0,
      d => register5_q_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x1,
      b(0) => constant_op_net,
      ce => ce_1112_sg_x0,
      clk => clk_1112_sg_x0,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x1,
      b(0) => constant1_op_net,
      ce => ce_1112_sg_x0,
      clk => clk_1112_sg_x0,
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/TDDM_fofb_amp_4ch"

entity tddm_fofb_amp_4ch_entity_2cc521a83f is
  port (
    amp_in0: in std_logic_vector(23 downto 0); 
    amp_in1: in std_logic_vector(23 downto 0); 
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ch_in0: in std_logic; 
    ch_in1: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    amp_out0: out std_logic_vector(23 downto 0); 
    amp_out1: out std_logic_vector(23 downto 0); 
    amp_out2: out std_logic_vector(23 downto 0); 
    amp_out3: out std_logic_vector(23 downto 0)
  );
end tddm_fofb_amp_4ch_entity_2cc521a83f;

architecture structural of tddm_fofb_amp_4ch_entity_2cc521a83f is
  signal ce_1112_sg_x2: std_logic;
  signal ce_2224_sg_x2: std_logic;
  signal clk_1112_sg_x2: std_logic;
  signal clk_2224_sg_x2: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal register5_q_net_x3: std_logic_vector(23 downto 0);

begin
  register5_q_net_x2 <= amp_in0;
  register5_q_net_x3 <= amp_in1;
  ce_1112_sg_x2 <= ce_1112;
  ce_2224_sg_x2 <= ce_2224;
  register1_q_net_x3 <= ch_in0;
  register1_q_net_x4 <= ch_in1;
  clk_1112_sg_x2 <= clk_1112;
  clk_2224_sg_x2 <= clk_2224;
  amp_out0 <= down_sample2_q_net_x2;
  amp_out1 <= down_sample1_q_net_x2;
  amp_out2 <= down_sample2_q_net_x3;
  amp_out3 <= down_sample1_q_net_x3;

  tddm_fofb_amp0_fd74c6ad6e: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x2,
      ce_2224 => ce_2224_sg_x2,
      ch_in => register1_q_net_x3,
      clk_1112 => clk_1112_sg_x2,
      clk_2224 => clk_2224_sg_x2,
      din => register5_q_net_x2,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_fofb_amp1_61cbc8ec65: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x2,
      ce_2224 => ce_2224_sg_x2,
      ch_in => register1_q_net_x4,
      clk_1112 => clk_1112_sg_x2,
      clk_2224 => clk_2224_sg_x2,
      din => register5_q_net_x3,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_CORDIC/TDDM_tbt_cordic0/TDDM_tbt_cordic1"

entity tddm_tbt_cordic1_entity_b60a69fd9b is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ch_in: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic1_entity_b60a69fd9b;

architecture structural of tddm_tbt_cordic1_entity_b60a69fd9b is
  signal ce_1112_sg_x4: std_logic;
  signal ce_2224_sg_x4: std_logic;
  signal clk_1112_sg_x4: std_logic;
  signal clk_2224_sg_x4: std_logic;
  signal constant1_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x5: std_logic;
  signal register4_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1112_sg_x4 <= ce_1112;
  ce_2224_sg_x4 <= ce_2224;
  register1_q_net_x5 <= ch_in;
  clk_1112_sg_x4 <= clk_1112;
  clk_2224_sg_x4 <= clk_2224;
  register4_q_net_x0 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;

  constant1: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 24
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_2224_sg_x4,
      dest_clk => clk_2224_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1112_sg_x4,
      src_clk => clk_1112_sg_x4,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_2224_sg_x4,
      dest_clk => clk_2224_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1112_sg_x4,
      src_clk => clk_1112_sg_x4,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x4,
      clk => clk_1112_sg_x4,
      d => register4_q_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x4,
      clk => clk_1112_sg_x4,
      d => register4_q_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x5,
      b(0) => constant_op_net,
      ce => ce_1112_sg_x4,
      clk => clk_1112_sg_x4,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x5,
      b(0) => constant1_op_net,
      ce => ce_1112_sg_x4,
      clk => clk_1112_sg_x4,
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_CORDIC/TDDM_tbt_cordic0"

entity tddm_tbt_cordic0_entity_38de3613fe is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    fofb_cordic_ch_in: in std_logic; 
    fofb_cordic_din: in std_logic_vector(23 downto 0); 
    fofb_cordic_pin: in std_logic_vector(23 downto 0); 
    fofb_cordic_data0_out: out std_logic_vector(23 downto 0); 
    fofb_cordic_data1_out: out std_logic_vector(23 downto 0); 
    fofb_cordic_phase0_out: out std_logic_vector(23 downto 0); 
    fofb_cordic_phase1_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic0_entity_38de3613fe;

architecture structural of tddm_tbt_cordic0_entity_38de3613fe is
  signal ce_1112_sg_x5: std_logic;
  signal ce_2224_sg_x5: std_logic;
  signal clk_1112_sg_x5: std_logic;
  signal clk_2224_sg_x5: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register1_q_net_x6: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x4: std_logic_vector(23 downto 0);

begin
  ce_1112_sg_x5 <= ce_1112;
  ce_2224_sg_x5 <= ce_2224;
  clk_1112_sg_x5 <= clk_1112;
  clk_2224_sg_x5 <= clk_2224;
  register1_q_net_x6 <= fofb_cordic_ch_in;
  register5_q_net_x4 <= fofb_cordic_din;
  register4_q_net_x1 <= fofb_cordic_pin;
  fofb_cordic_data0_out <= down_sample2_q_net_x2;
  fofb_cordic_data1_out <= down_sample1_q_net_x2;
  fofb_cordic_phase0_out <= down_sample2_q_net_x3;
  fofb_cordic_phase1_out <= down_sample1_q_net_x3;

  tddm_fofb_cordic0_int_516d0c2a22: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x5,
      ce_2224 => ce_2224_sg_x5,
      ch_in => register1_q_net_x6,
      clk_1112 => clk_1112_sg_x5,
      clk_2224 => clk_2224_sg_x5,
      din => register5_q_net_x4,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_cordic1_b60a69fd9b: entity work.tddm_tbt_cordic1_entity_b60a69fd9b
    port map (
      ce_1112 => ce_1112_sg_x5,
      ce_2224 => ce_2224_sg_x5,
      ch_in => register1_q_net_x6,
      clk_1112 => clk_1112_sg_x5,
      clk_2224 => clk_2224_sg_x5,
      din => register4_q_net_x1,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_CORDIC"

entity fofb_cordic_entity_fad57e49ce is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ch_in: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in: in std_logic_vector(24 downto 0); 
    q_in: in std_logic_vector(24 downto 0); 
    valid_in: in std_logic; 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    tddm_tbt_cordic0: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic0_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic0_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic0_x2: out std_logic_vector(23 downto 0)
  );
end fofb_cordic_entity_fad57e49ce;

architecture structural of fofb_cordic_entity_fad57e49ce is
  signal ce_1112_sg_x6: std_logic;
  signal ce_2224_sg_x6: std_logic;
  signal clk_1112_sg_x6: std_logic;
  signal clk_2224_sg_x6: std_logic;
  signal delay_q_net_x0: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_phase_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register1_q_net_x7: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x5: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_1112_sg_x6 <= ce_1112;
  ce_2224_sg_x6 <= ce_2224;
  delay_q_net_x0 <= ch_in;
  clk_1112_sg_x6 <= clk_1112;
  clk_2224_sg_x6 <= clk_2224;
  register_q_net_x2 <= i_in;
  register_q_net_x1 <= q_in;
  register1_q_net_x0 <= valid_in;
  amp_out <= register5_q_net_x5;
  ch_out <= register1_q_net_x7;
  tddm_tbt_cordic0 <= down_sample1_q_net_x4;
  tddm_tbt_cordic0_x0 <= down_sample2_q_net_x4;
  tddm_tbt_cordic0_x1 <= down_sample1_q_net_x5;
  tddm_tbt_cordic0_x2 <= down_sample2_q_net_x5;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_1112_sg_x6,
      clk => clk_1112_sg_x6,
      s_axis_cartesian_tdata_imag => register_q_net_x1,
      s_axis_cartesian_tdata_real => register_q_net_x2,
      s_axis_cartesian_tuser_user(0) => delay_q_net_x0,
      s_axis_cartesian_tvalid => register1_q_net_x0,
      m_axis_dout_tdata_phase => rect2pol_m_axis_dout_tdata_phase_net,
      m_axis_dout_tdata_real => rect2pol_m_axis_dout_tdata_real_net,
      m_axis_dout_tuser_cartesian_tuser(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      m_axis_dout_tvalid => rect2pol_m_axis_dout_tvalid_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1112_sg_x6,
      clk => clk_1112_sg_x6,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x7
    );

  register4: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x6,
      clk => clk_1112_sg_x6,
      d => reinterpret2_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register4_q_net_x1
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x6,
      clk => clk_1112_sg_x6,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x5
    );

  reinterpret2: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_phase_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_real_net,
      output_port => reinterpret3_output_port_net
    );

  tddm_tbt_cordic0_38de3613fe: entity work.tddm_tbt_cordic0_entity_38de3613fe
    port map (
      ce_1112 => ce_1112_sg_x6,
      ce_2224 => ce_2224_sg_x6,
      clk_1112 => clk_1112_sg_x6,
      clk_2224 => clk_2224_sg_x6,
      fofb_cordic_ch_in => register1_q_net_x7,
      fofb_cordic_din => register5_q_net_x5,
      fofb_cordic_pin => register4_q_net_x1,
      fofb_cordic_data0_out => down_sample2_q_net_x4,
      fofb_cordic_data1_out => down_sample1_q_net_x4,
      fofb_cordic_phase0_out => down_sample2_q_net_x5,
      fofb_cordic_phase1_out => down_sample1_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp/TDDM_fofb_cic0"

entity tddm_fofb_cic0_entity_6b909292ff is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    fofb_ch_in: in std_logic; 
    fofb_i_in: in std_logic_vector(23 downto 0); 
    fofb_q_in: in std_logic_vector(23 downto 0); 
    cic_fofb_ch0_i_out: out std_logic_vector(23 downto 0); 
    cic_fofb_ch0_q_out: out std_logic_vector(23 downto 0); 
    cic_fofb_ch1_i_out: out std_logic_vector(23 downto 0); 
    cic_fofb_ch1_q_out: out std_logic_vector(23 downto 0)
  );
end tddm_fofb_cic0_entity_6b909292ff;

architecture structural of tddm_fofb_cic0_entity_6b909292ff is
  signal ce_1112_sg_x9: std_logic;
  signal ce_2224_sg_x9: std_logic;
  signal clk_1112_sg_x9: std_logic;
  signal clk_2224_sg_x9: std_logic;
  signal delay_q_net_x3: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);

begin
  ce_1112_sg_x9 <= ce_1112;
  ce_2224_sg_x9 <= ce_2224;
  clk_1112_sg_x9 <= clk_1112;
  clk_2224_sg_x9 <= clk_2224;
  delay_q_net_x3 <= fofb_ch_in;
  reinterpret_output_port_net_x3 <= fofb_i_in;
  reinterpret_output_port_net_x2 <= fofb_q_in;
  cic_fofb_ch0_i_out <= down_sample2_q_net_x2;
  cic_fofb_ch0_q_out <= down_sample2_q_net_x3;
  cic_fofb_ch1_i_out <= down_sample1_q_net_x2;
  cic_fofb_ch1_q_out <= down_sample1_q_net_x3;

  tddm_fofb_cic0_i_06b84397ec: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x9,
      ce_2224 => ce_2224_sg_x9,
      ch_in => delay_q_net_x3,
      clk_1112 => clk_1112_sg_x9,
      clk_2224 => clk_2224_sg_x9,
      din => reinterpret_output_port_net_x3,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_fofb_cic0_q_a6a1d7c301: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x9,
      ce_2224 => ce_2224_sg_x9,
      ch_in => delay_q_net_x3,
      clk_1112 => clk_1112_sg_x9,
      clk_2224 => clk_2224_sg_x9,
      din => reinterpret_output_port_net_x2,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp/Trunc"

entity trunc_entity_937044c900 is
  port (
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end trunc_entity_937044c900;

architecture structural of trunc_entity_937044c900 is
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal slice_y_net: std_logic_vector(23 downto 0);

begin
  register_q_net_x2 <= din;
  dout <= reinterpret_output_port_net_x3;

  reinterpret: entity work.reinterpret_4bf1ad328a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net_x3
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 24,
      x_width => 25,
      y_width => 24
    )
    port map (
      x => register_q_net_x2,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp/cic_fofb/Reg"

entity reg_entity_71dd029fba is
  port (
    ce_1112: in std_logic; 
    clk_1112: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0)
  );
end reg_entity_71dd029fba;

architecture structural of reg_entity_71dd029fba is
  signal ce_1112_sg_x10: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_q_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_1112_sg_x10: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal register_q_net_x3: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(24 downto 0);

begin
  ce_1112_sg_x10 <= ce_1112;
  clk_1112_sg_x10 <= clk_1112;
  cic_fofb_q_m_axis_data_tdata_data_net_x0 <= din;
  cic_fofb_q_m_axis_data_tvalid_net_x0 <= en;
  dout <= register_q_net_x3;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1112_sg_x10,
      clk => clk_1112_sg_x10,
      clr => '0',
      din => reinterpret2_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x10,
      clk => clk_1112_sg_x10,
      d => convert_dout_net,
      en(0) => cic_fofb_q_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x3
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret2_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp/cic_fofb/Reg1"

entity reg1_entity_b079f30e3c is
  port (
    ce_1112: in std_logic; 
    clk_1112: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end reg1_entity_b079f30e3c;

architecture structural of reg1_entity_b079f30e3c is
  signal ce_1112_sg_x11: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_1112_sg_x11: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register_q_net_x4: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(24 downto 0);

begin
  ce_1112_sg_x11 <= ce_1112;
  clk_1112_sg_x11 <= clk_1112;
  cic_fofb_i_m_axis_data_tdata_data_net_x0 <= din;
  cic_fofb_i_m_axis_data_tvalid_net_x0 <= en;
  dout <= register_q_net_x4;
  valid_out <= register1_q_net_x1;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1112_sg_x11,
      clk => clk_1112_sg_x11,
      clr => '0',
      din => reinterpret2_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1112_sg_x11,
      clk => clk_1112_sg_x11,
      d(0) => cic_fofb_i_m_axis_data_tvalid_net_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x11,
      clk => clk_1112_sg_x11,
      d => convert_dout_net,
      en(0) => cic_fofb_i_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x4
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret2_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp/cic_fofb"

entity cic_fofb_entity_2ed6a6e00c is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    cic_fofb_q_x0: out std_logic; 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end cic_fofb_entity_2ed6a6e00c;

architecture structural of cic_fofb_entity_2ed6a6e00c is
  signal ce_1112_sg_x12: std_logic;
  signal ce_1_sg_x6: std_logic;
  signal ce_logic_1_sg_x5: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net: std_logic;
  signal cic_fofb_i_m_axis_data_tvalid_net_x0: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x0: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_q_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_1112_sg_x12: std_logic;
  signal clk_1_sg_x6: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x4: std_logic;
  signal register1_q_net_x2: std_logic;
  signal register3_q_net_x0: std_logic;
  signal register4_q_net_x0: std_logic_vector(23 downto 0);
  signal register5_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(24 downto 0);
  signal register_q_net_x6: std_logic_vector(24 downto 0);
  signal relational2_op_net: std_logic;

begin
  ce_1_sg_x6 <= ce_1;
  ce_1112_sg_x12 <= ce_1112;
  ce_logic_1_sg_x5 <= ce_logic_1;
  register3_q_net_x0 <= ch_in;
  clk_1_sg_x6 <= clk_1;
  clk_1112_sg_x12 <= clk_1112;
  register4_q_net_x0 <= i_in;
  register5_q_net_x0 <= q_in;
  ch_out <= delay_q_net_x4;
  cic_fofb_q_x0 <= cic_fofb_q_event_tlast_missing_net_x0;
  i_out <= register_q_net_x6;
  q_out <= register_q_net_x5;
  valid_out <= register1_q_net_x2;

  cic_fofb_i: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x6,
      ce_1112 => ce_1112_sg_x12,
      ce_logic_1 => ce_logic_1_sg_x5,
      clk => clk_1_sg_x6,
      clk_1112 => clk_1112_sg_x12,
      clk_logic_1 => clk_1_sg_x6,
      s_axis_data_tdata_data => register4_q_net_x0,
      s_axis_data_tlast => relational2_op_net,
      m_axis_data_tdata_data => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      m_axis_data_tuser_chan_out(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net,
      m_axis_data_tvalid => cic_fofb_i_m_axis_data_tvalid_net_x0
    );

  cic_fofb_q: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x6,
      ce_1112 => ce_1112_sg_x12,
      ce_logic_1 => ce_logic_1_sg_x5,
      clk => clk_1_sg_x6,
      clk_1112 => clk_1112_sg_x12,
      clk_logic_1 => clk_1_sg_x6,
      s_axis_data_tdata_data => register5_q_net_x0,
      s_axis_data_tlast => relational2_op_net,
      event_tlast_missing => cic_fofb_q_event_tlast_missing_net_x0,
      m_axis_data_tdata_data => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_fofb_q_m_axis_data_tvalid_net_x0
    );

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1112_sg_x12,
      clk => clk_1112_sg_x12,
      d(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net,
      en => '1',
      rst => '1',
      q(0) => delay_q_net_x4
    );

  reg1_b079f30e3c: entity work.reg1_entity_b079f30e3c
    port map (
      ce_1112 => ce_1112_sg_x12,
      clk_1112 => clk_1112_sg_x12,
      din => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      en => cic_fofb_i_m_axis_data_tvalid_net_x0,
      dout => register_q_net_x6,
      valid_out => register1_q_net_x2
    );

  reg_71dd029fba: entity work.reg_entity_71dd029fba
    port map (
      ce_1112 => ce_1112_sg_x12,
      clk_1112 => clk_1112_sg_x12,
      din => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      en => cic_fofb_q_m_axis_data_tvalid_net_x0,
      dout => register_q_net_x5
    );

  relational2: entity work.relational_d29d27b7b3
    port map (
      a(0) => register3_q_net_x0,
      b => constant1_op_net,
      ce => ce_1_sg_x6,
      clk => clk_1_sg_x6,
      clr => '0',
      op(0) => relational2_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp"

entity fofb_amp_entity_078cdb1842 is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    cic_fofb: out std_logic; 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    tddm_fofb_cic0: out std_logic_vector(23 downto 0); 
    tddm_fofb_cic0_x0: out std_logic_vector(23 downto 0); 
    tddm_fofb_cic0_x1: out std_logic_vector(23 downto 0); 
    tddm_fofb_cic0_x2: out std_logic_vector(23 downto 0); 
    valid_out: out std_logic
  );
end fofb_amp_entity_078cdb1842;

architecture structural of fofb_amp_entity_078cdb1842 is
  signal ce_1112_sg_x13: std_logic;
  signal ce_1_sg_x7: std_logic;
  signal ce_2224_sg_x10: std_logic;
  signal ce_logic_1_sg_x6: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x1: std_logic;
  signal clk_1112_sg_x13: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal clk_2224_sg_x10: std_logic;
  signal delay_q_net_x5: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register3_q_net_x1: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(24 downto 0);
  signal register_q_net_x8: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x7 <= ce_1;
  ce_1112_sg_x13 <= ce_1112;
  ce_2224_sg_x10 <= ce_2224;
  ce_logic_1_sg_x6 <= ce_logic_1;
  register3_q_net_x1 <= ch_in;
  clk_1_sg_x7 <= clk_1;
  clk_1112_sg_x13 <= clk_1112;
  clk_2224_sg_x10 <= clk_2224;
  register4_q_net_x1 <= i_in;
  register5_q_net_x1 <= q_in;
  ch_out <= delay_q_net_x5;
  cic_fofb <= cic_fofb_q_event_tlast_missing_net_x1;
  i_out <= register_q_net_x8;
  q_out <= register_q_net_x7;
  tddm_fofb_cic0 <= down_sample1_q_net_x4;
  tddm_fofb_cic0_x0 <= down_sample2_q_net_x4;
  tddm_fofb_cic0_x1 <= down_sample1_q_net_x5;
  tddm_fofb_cic0_x2 <= down_sample2_q_net_x5;
  valid_out <= register1_q_net_x3;

  cic_fofb_2ed6a6e00c: entity work.cic_fofb_entity_2ed6a6e00c
    port map (
      ce_1 => ce_1_sg_x7,
      ce_1112 => ce_1112_sg_x13,
      ce_logic_1 => ce_logic_1_sg_x6,
      ch_in => register3_q_net_x1,
      clk_1 => clk_1_sg_x7,
      clk_1112 => clk_1112_sg_x13,
      i_in => register4_q_net_x1,
      q_in => register5_q_net_x1,
      ch_out => delay_q_net_x5,
      cic_fofb_q_x0 => cic_fofb_q_event_tlast_missing_net_x1,
      i_out => register_q_net_x8,
      q_out => register_q_net_x7,
      valid_out => register1_q_net_x3
    );

  tddm_fofb_cic0_6b909292ff: entity work.tddm_fofb_cic0_entity_6b909292ff
    port map (
      ce_1112 => ce_1112_sg_x13,
      ce_2224 => ce_2224_sg_x10,
      clk_1112 => clk_1112_sg_x13,
      clk_2224 => clk_2224_sg_x10,
      fofb_ch_in => delay_q_net_x5,
      fofb_i_in => reinterpret_output_port_net_x4,
      fofb_q_in => reinterpret_output_port_net_x3,
      cic_fofb_ch0_i_out => down_sample2_q_net_x4,
      cic_fofb_ch0_q_out => down_sample2_q_net_x5,
      cic_fofb_ch1_i_out => down_sample1_q_net_x4,
      cic_fofb_ch1_q_out => down_sample1_q_net_x5
    );

  trunc1_aa1190b826: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x8,
      dout => reinterpret_output_port_net_x4
    );

  trunc_937044c900: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x7,
      dout => reinterpret_output_port_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0"

entity fofb_amp0_entity_95b23bfc2c is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    fofb_amp: out std_logic_vector(23 downto 0); 
    fofb_amp_x0: out std_logic_vector(23 downto 0); 
    fofb_amp_x1: out std_logic_vector(23 downto 0); 
    fofb_amp_x2: out std_logic_vector(23 downto 0); 
    fofb_amp_x3: out std_logic; 
    fofb_cordic: out std_logic_vector(23 downto 0); 
    fofb_cordic_x0: out std_logic_vector(23 downto 0); 
    fofb_cordic_x1: out std_logic_vector(23 downto 0); 
    fofb_cordic_x2: out std_logic_vector(23 downto 0)
  );
end fofb_amp0_entity_95b23bfc2c;

architecture structural of fofb_amp0_entity_95b23bfc2c is
  signal ce_1112_sg_x14: std_logic;
  signal ce_1_sg_x8: std_logic;
  signal ce_2224_sg_x11: std_logic;
  signal ce_logic_1_sg_x7: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x2: std_logic;
  signal clk_1112_sg_x14: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal clk_2224_sg_x11: std_logic;
  signal delay_q_net_x5: std_logic;
  signal down_sample1_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x9: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x9: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register3_q_net_x2: std_logic;
  signal register4_q_net_x2: std_logic_vector(23 downto 0);
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(24 downto 0);
  signal register_q_net_x8: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x8 <= ce_1;
  ce_1112_sg_x14 <= ce_1112;
  ce_2224_sg_x11 <= ce_2224;
  ce_logic_1_sg_x7 <= ce_logic_1;
  register3_q_net_x2 <= ch_in;
  clk_1_sg_x8 <= clk_1;
  clk_1112_sg_x14 <= clk_1112;
  clk_2224_sg_x11 <= clk_2224;
  register4_q_net_x2 <= i_in;
  register5_q_net_x2 <= q_in;
  amp_out <= register5_q_net_x6;
  ch_out <= register1_q_net_x8;
  fofb_amp <= down_sample1_q_net_x10;
  fofb_amp_x0 <= down_sample2_q_net_x10;
  fofb_amp_x1 <= down_sample1_q_net_x11;
  fofb_amp_x2 <= down_sample2_q_net_x11;
  fofb_amp_x3 <= cic_fofb_q_event_tlast_missing_net_x2;
  fofb_cordic <= down_sample1_q_net_x8;
  fofb_cordic_x0 <= down_sample2_q_net_x8;
  fofb_cordic_x1 <= down_sample1_q_net_x9;
  fofb_cordic_x2 <= down_sample2_q_net_x9;

  fofb_amp_078cdb1842: entity work.fofb_amp_entity_078cdb1842
    port map (
      ce_1 => ce_1_sg_x8,
      ce_1112 => ce_1112_sg_x14,
      ce_2224 => ce_2224_sg_x11,
      ce_logic_1 => ce_logic_1_sg_x7,
      ch_in => register3_q_net_x2,
      clk_1 => clk_1_sg_x8,
      clk_1112 => clk_1112_sg_x14,
      clk_2224 => clk_2224_sg_x11,
      i_in => register4_q_net_x2,
      q_in => register5_q_net_x2,
      ch_out => delay_q_net_x5,
      cic_fofb => cic_fofb_q_event_tlast_missing_net_x2,
      i_out => register_q_net_x8,
      q_out => register_q_net_x7,
      tddm_fofb_cic0 => down_sample1_q_net_x10,
      tddm_fofb_cic0_x0 => down_sample2_q_net_x10,
      tddm_fofb_cic0_x1 => down_sample1_q_net_x11,
      tddm_fofb_cic0_x2 => down_sample2_q_net_x11,
      valid_out => register1_q_net_x3
    );

  fofb_cordic_fad57e49ce: entity work.fofb_cordic_entity_fad57e49ce
    port map (
      ce_1112 => ce_1112_sg_x14,
      ce_2224 => ce_2224_sg_x11,
      ch_in => delay_q_net_x5,
      clk_1112 => clk_1112_sg_x14,
      clk_2224 => clk_2224_sg_x11,
      i_in => register_q_net_x8,
      q_in => register_q_net_x7,
      valid_in => register1_q_net_x3,
      amp_out => register5_q_net_x6,
      ch_out => register1_q_net_x8,
      tddm_tbt_cordic0 => down_sample1_q_net_x8,
      tddm_tbt_cordic0_x0 => down_sample2_q_net_x8,
      tddm_tbt_cordic0_x1 => down_sample1_q_net_x9,
      tddm_tbt_cordic0_x2 => down_sample2_q_net_x9
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp1/FOFB_CORDIC"

entity fofb_cordic_entity_e4c0810ec7 is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ch_in: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in: in std_logic_vector(24 downto 0); 
    q_in: in std_logic_vector(24 downto 0); 
    valid_in: in std_logic; 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    tddm_fofb_cordic1: out std_logic_vector(23 downto 0); 
    tddm_fofb_cordic1_x0: out std_logic_vector(23 downto 0); 
    tddm_fofb_cordic1_x1: out std_logic_vector(23 downto 0); 
    tddm_fofb_cordic1_x2: out std_logic_vector(23 downto 0)
  );
end fofb_cordic_entity_e4c0810ec7;

architecture structural of fofb_cordic_entity_e4c0810ec7 is
  signal ce_1112_sg_x18: std_logic;
  signal ce_2224_sg_x15: std_logic;
  signal clk_1112_sg_x18: std_logic;
  signal clk_2224_sg_x15: std_logic;
  signal delay_q_net_x0: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_phase_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_1112_sg_x18 <= ce_1112;
  ce_2224_sg_x15 <= ce_2224;
  delay_q_net_x0 <= ch_in;
  clk_1112_sg_x18 <= clk_1112;
  clk_2224_sg_x15 <= clk_2224;
  register_q_net_x2 <= i_in;
  register_q_net_x1 <= q_in;
  register1_q_net_x0 <= valid_in;
  amp_out <= register5_q_net_x6;
  ch_out <= register1_q_net_x8;
  tddm_fofb_cordic1 <= down_sample1_q_net_x4;
  tddm_fofb_cordic1_x0 <= down_sample2_q_net_x4;
  tddm_fofb_cordic1_x1 <= down_sample1_q_net_x5;
  tddm_fofb_cordic1_x2 <= down_sample2_q_net_x5;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_1112_sg_x18,
      clk => clk_1112_sg_x18,
      s_axis_cartesian_tdata_imag => register_q_net_x1,
      s_axis_cartesian_tdata_real => register_q_net_x2,
      s_axis_cartesian_tuser_user(0) => delay_q_net_x0,
      s_axis_cartesian_tvalid => register1_q_net_x0,
      m_axis_dout_tdata_phase => rect2pol_m_axis_dout_tdata_phase_net,
      m_axis_dout_tdata_real => rect2pol_m_axis_dout_tdata_real_net,
      m_axis_dout_tuser_cartesian_tuser(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      m_axis_dout_tvalid => rect2pol_m_axis_dout_tvalid_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1112_sg_x18,
      clk => clk_1112_sg_x18,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x8
    );

  register4: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x18,
      clk => clk_1112_sg_x18,
      d => reinterpret2_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register4_q_net_x1
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x18,
      clk => clk_1112_sg_x18,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x6
    );

  reinterpret2: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_phase_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_real_net,
      output_port => reinterpret3_output_port_net
    );

  tddm_fofb_cordic1_77b64089dc: entity work.tddm_tbt_cordic0_entity_38de3613fe
    port map (
      ce_1112 => ce_1112_sg_x18,
      ce_2224 => ce_2224_sg_x15,
      clk_1112 => clk_1112_sg_x18,
      clk_2224 => clk_2224_sg_x15,
      fofb_cordic_ch_in => register1_q_net_x8,
      fofb_cordic_din => register5_q_net_x6,
      fofb_cordic_pin => register4_q_net_x1,
      fofb_cordic_data0_out => down_sample2_q_net_x4,
      fofb_cordic_data1_out => down_sample1_q_net_x4,
      fofb_cordic_phase0_out => down_sample2_q_net_x5,
      fofb_cordic_phase1_out => down_sample1_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp1/FOFB_amp/cic_fofb/Reg"

entity reg_entity_9227840bc1 is
  port (
    ce_1112: in std_logic; 
    clk_1112: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0)
  );
end reg_entity_9227840bc1;

architecture structural of reg_entity_9227840bc1 is
  signal ce_1112_sg_x22: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_q_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_1112_sg_x22: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal register_q_net_x3: std_logic_vector(24 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(24 downto 0);

begin
  ce_1112_sg_x22 <= ce_1112;
  clk_1112_sg_x22 <= clk_1112;
  cic_fofb_q_m_axis_data_tdata_data_net_x0 <= din;
  cic_fofb_q_m_axis_data_tvalid_net_x0 <= en;
  dout <= register_q_net_x3;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1112_sg_x22,
      clk => clk_1112_sg_x22,
      clr => '0',
      din => reinterpret1_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x22,
      clk => clk_1112_sg_x22,
      d => convert_dout_net,
      en(0) => cic_fofb_q_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x3
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp1/FOFB_amp/cic_fofb"

entity cic_fofb_entity_579902476d is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    cic_fofb_q_x0: out std_logic; 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end cic_fofb_entity_579902476d;

architecture structural of cic_fofb_entity_579902476d is
  signal ce_1112_sg_x24: std_logic;
  signal ce_1_sg_x9: std_logic;
  signal ce_logic_1_sg_x8: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net: std_logic;
  signal cic_fofb_i_m_axis_data_tvalid_net_x0: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x0: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_q_m_axis_data_tvalid_net_x0: std_logic;
  signal clk_1112_sg_x24: std_logic;
  signal clk_1_sg_x9: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal delay_q_net_x4: std_logic;
  signal register1_q_net_x2: std_logic;
  signal register3_q_net_x0: std_logic;
  signal register4_q_net_x0: std_logic_vector(23 downto 0);
  signal register5_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(24 downto 0);
  signal register_q_net_x6: std_logic_vector(24 downto 0);
  signal relational2_op_net: std_logic;

begin
  ce_1_sg_x9 <= ce_1;
  ce_1112_sg_x24 <= ce_1112;
  ce_logic_1_sg_x8 <= ce_logic_1;
  register3_q_net_x0 <= ch_in;
  clk_1_sg_x9 <= clk_1;
  clk_1112_sg_x24 <= clk_1112;
  register4_q_net_x0 <= i_in;
  register5_q_net_x0 <= q_in;
  ch_out <= delay_q_net_x4;
  cic_fofb_q_x0 <= cic_fofb_q_event_tlast_missing_net_x0;
  i_out <= register_q_net_x6;
  q_out <= register_q_net_x5;
  valid_out <= register1_q_net_x2;

  cic_fofb_i: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x9,
      ce_1112 => ce_1112_sg_x24,
      ce_logic_1 => ce_logic_1_sg_x8,
      clk => clk_1_sg_x9,
      clk_1112 => clk_1112_sg_x24,
      clk_logic_1 => clk_1_sg_x9,
      s_axis_data_tdata_data => register4_q_net_x0,
      s_axis_data_tlast => relational2_op_net,
      m_axis_data_tdata_data => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      m_axis_data_tuser_chan_out(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net,
      m_axis_data_tvalid => cic_fofb_i_m_axis_data_tvalid_net_x0
    );

  cic_fofb_q: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x9,
      ce_1112 => ce_1112_sg_x24,
      ce_logic_1 => ce_logic_1_sg_x8,
      clk => clk_1_sg_x9,
      clk_1112 => clk_1112_sg_x24,
      clk_logic_1 => clk_1_sg_x9,
      s_axis_data_tdata_data => register5_q_net_x0,
      s_axis_data_tlast => relational2_op_net,
      event_tlast_missing => cic_fofb_q_event_tlast_missing_net_x0,
      m_axis_data_tdata_data => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_fofb_q_m_axis_data_tvalid_net_x0
    );

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1112_sg_x24,
      clk => clk_1112_sg_x24,
      d(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net,
      en => '1',
      rst => '1',
      q(0) => delay_q_net_x4
    );

  reg1_a7f8551690: entity work.reg1_entity_b079f30e3c
    port map (
      ce_1112 => ce_1112_sg_x24,
      clk_1112 => clk_1112_sg_x24,
      din => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      en => cic_fofb_i_m_axis_data_tvalid_net_x0,
      dout => register_q_net_x6,
      valid_out => register1_q_net_x2
    );

  reg_9227840bc1: entity work.reg_entity_9227840bc1
    port map (
      ce_1112 => ce_1112_sg_x24,
      clk_1112 => clk_1112_sg_x24,
      din => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      en => cic_fofb_q_m_axis_data_tvalid_net_x0,
      dout => register_q_net_x5
    );

  relational2: entity work.relational_d29d27b7b3
    port map (
      a(0) => register3_q_net_x0,
      b => constant1_op_net,
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      clr => '0',
      op(0) => relational2_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp1/FOFB_amp"

entity fofb_amp_entity_f70fcc8ed9 is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    cic_fofb: out std_logic; 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    tddm_fofb_cic1: out std_logic_vector(23 downto 0); 
    tddm_fofb_cic1_x0: out std_logic_vector(23 downto 0); 
    tddm_fofb_cic1_x1: out std_logic_vector(23 downto 0); 
    tddm_fofb_cic1_x2: out std_logic_vector(23 downto 0); 
    valid_out: out std_logic
  );
end fofb_amp_entity_f70fcc8ed9;

architecture structural of fofb_amp_entity_f70fcc8ed9 is
  signal ce_1112_sg_x25: std_logic;
  signal ce_1_sg_x10: std_logic;
  signal ce_2224_sg_x19: std_logic;
  signal ce_logic_1_sg_x9: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x1: std_logic;
  signal clk_1112_sg_x25: std_logic;
  signal clk_1_sg_x10: std_logic;
  signal clk_2224_sg_x19: std_logic;
  signal delay_q_net_x5: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register3_q_net_x1: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(24 downto 0);
  signal register_q_net_x8: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x10 <= ce_1;
  ce_1112_sg_x25 <= ce_1112;
  ce_2224_sg_x19 <= ce_2224;
  ce_logic_1_sg_x9 <= ce_logic_1;
  register3_q_net_x1 <= ch_in;
  clk_1_sg_x10 <= clk_1;
  clk_1112_sg_x25 <= clk_1112;
  clk_2224_sg_x19 <= clk_2224;
  register4_q_net_x1 <= i_in;
  register5_q_net_x1 <= q_in;
  ch_out <= delay_q_net_x5;
  cic_fofb <= cic_fofb_q_event_tlast_missing_net_x1;
  i_out <= register_q_net_x8;
  q_out <= register_q_net_x7;
  tddm_fofb_cic1 <= down_sample1_q_net_x4;
  tddm_fofb_cic1_x0 <= down_sample2_q_net_x4;
  tddm_fofb_cic1_x1 <= down_sample1_q_net_x5;
  tddm_fofb_cic1_x2 <= down_sample2_q_net_x5;
  valid_out <= register1_q_net_x3;

  cic_fofb_579902476d: entity work.cic_fofb_entity_579902476d
    port map (
      ce_1 => ce_1_sg_x10,
      ce_1112 => ce_1112_sg_x25,
      ce_logic_1 => ce_logic_1_sg_x9,
      ch_in => register3_q_net_x1,
      clk_1 => clk_1_sg_x10,
      clk_1112 => clk_1112_sg_x25,
      i_in => register4_q_net_x1,
      q_in => register5_q_net_x1,
      ch_out => delay_q_net_x5,
      cic_fofb_q_x0 => cic_fofb_q_event_tlast_missing_net_x1,
      i_out => register_q_net_x8,
      q_out => register_q_net_x7,
      valid_out => register1_q_net_x3
    );

  tddm_fofb_cic1_4a640315a5: entity work.tddm_fofb_cic0_entity_6b909292ff
    port map (
      ce_1112 => ce_1112_sg_x25,
      ce_2224 => ce_2224_sg_x19,
      clk_1112 => clk_1112_sg_x25,
      clk_2224 => clk_2224_sg_x19,
      fofb_ch_in => delay_q_net_x5,
      fofb_i_in => reinterpret_output_port_net_x4,
      fofb_q_in => reinterpret_output_port_net_x3,
      cic_fofb_ch0_i_out => down_sample2_q_net_x4,
      cic_fofb_ch0_q_out => down_sample2_q_net_x5,
      cic_fofb_ch1_i_out => down_sample1_q_net_x4,
      cic_fofb_ch1_q_out => down_sample1_q_net_x5
    );

  trunc1_88c1ef2019: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x8,
      dout => reinterpret_output_port_net_x4
    );

  trunc_042ccf74b4: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x7,
      dout => reinterpret_output_port_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp1"

entity fofb_amp1_entity_a049562dde is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    fofb_amp: out std_logic_vector(23 downto 0); 
    fofb_amp_x0: out std_logic_vector(23 downto 0); 
    fofb_amp_x1: out std_logic_vector(23 downto 0); 
    fofb_amp_x2: out std_logic_vector(23 downto 0); 
    fofb_amp_x3: out std_logic; 
    fofb_cordic: out std_logic_vector(23 downto 0); 
    fofb_cordic_x0: out std_logic_vector(23 downto 0); 
    fofb_cordic_x1: out std_logic_vector(23 downto 0); 
    fofb_cordic_x2: out std_logic_vector(23 downto 0)
  );
end fofb_amp1_entity_a049562dde;

architecture structural of fofb_amp1_entity_a049562dde is
  signal ce_1112_sg_x26: std_logic;
  signal ce_1_sg_x11: std_logic;
  signal ce_2224_sg_x20: std_logic;
  signal ce_logic_1_sg_x10: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x2: std_logic;
  signal clk_1112_sg_x26: std_logic;
  signal clk_1_sg_x11: std_logic;
  signal clk_2224_sg_x20: std_logic;
  signal delay_q_net_x5: std_logic;
  signal down_sample1_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x9: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x9: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x9: std_logic;
  signal register3_q_net_x2: std_logic;
  signal register4_q_net_x2: std_logic_vector(23 downto 0);
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal register5_q_net_x7: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(24 downto 0);
  signal register_q_net_x8: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x11 <= ce_1;
  ce_1112_sg_x26 <= ce_1112;
  ce_2224_sg_x20 <= ce_2224;
  ce_logic_1_sg_x10 <= ce_logic_1;
  register3_q_net_x2 <= ch_in;
  clk_1_sg_x11 <= clk_1;
  clk_1112_sg_x26 <= clk_1112;
  clk_2224_sg_x20 <= clk_2224;
  register4_q_net_x2 <= i_in;
  register5_q_net_x2 <= q_in;
  amp_out <= register5_q_net_x7;
  ch_out <= register1_q_net_x9;
  fofb_amp <= down_sample1_q_net_x10;
  fofb_amp_x0 <= down_sample2_q_net_x10;
  fofb_amp_x1 <= down_sample1_q_net_x11;
  fofb_amp_x2 <= down_sample2_q_net_x11;
  fofb_amp_x3 <= cic_fofb_q_event_tlast_missing_net_x2;
  fofb_cordic <= down_sample1_q_net_x8;
  fofb_cordic_x0 <= down_sample2_q_net_x8;
  fofb_cordic_x1 <= down_sample1_q_net_x9;
  fofb_cordic_x2 <= down_sample2_q_net_x9;

  fofb_amp_f70fcc8ed9: entity work.fofb_amp_entity_f70fcc8ed9
    port map (
      ce_1 => ce_1_sg_x11,
      ce_1112 => ce_1112_sg_x26,
      ce_2224 => ce_2224_sg_x20,
      ce_logic_1 => ce_logic_1_sg_x10,
      ch_in => register3_q_net_x2,
      clk_1 => clk_1_sg_x11,
      clk_1112 => clk_1112_sg_x26,
      clk_2224 => clk_2224_sg_x20,
      i_in => register4_q_net_x2,
      q_in => register5_q_net_x2,
      ch_out => delay_q_net_x5,
      cic_fofb => cic_fofb_q_event_tlast_missing_net_x2,
      i_out => register_q_net_x8,
      q_out => register_q_net_x7,
      tddm_fofb_cic1 => down_sample1_q_net_x10,
      tddm_fofb_cic1_x0 => down_sample2_q_net_x10,
      tddm_fofb_cic1_x1 => down_sample1_q_net_x11,
      tddm_fofb_cic1_x2 => down_sample2_q_net_x11,
      valid_out => register1_q_net_x3
    );

  fofb_cordic_e4c0810ec7: entity work.fofb_cordic_entity_e4c0810ec7
    port map (
      ce_1112 => ce_1112_sg_x26,
      ce_2224 => ce_2224_sg_x20,
      ch_in => delay_q_net_x5,
      clk_1112 => clk_1112_sg_x26,
      clk_2224 => clk_2224_sg_x20,
      i_in => register_q_net_x8,
      q_in => register_q_net_x7,
      valid_in => register1_q_net_x3,
      amp_out => register5_q_net_x7,
      ch_out => register1_q_net_x9,
      tddm_fofb_cordic1 => down_sample1_q_net_x8,
      tddm_fofb_cordic1_x0 => down_sample2_q_net_x8,
      tddm_fofb_cordic1_x1 => down_sample1_q_net_x9,
      tddm_fofb_cordic1_x2 => down_sample2_q_net_x9
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp"

entity fofb_amp_entity_8b25d4b0b6 is
  port (
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in0: in std_logic; 
    ch_in1: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    i_in0: in std_logic_vector(23 downto 0); 
    i_in1: in std_logic_vector(23 downto 0); 
    q_in0: in std_logic_vector(23 downto 0); 
    q_in1: in std_logic_vector(23 downto 0); 
    amp_out0: out std_logic_vector(23 downto 0); 
    amp_out1: out std_logic_vector(23 downto 0); 
    amp_out2: out std_logic_vector(23 downto 0); 
    amp_out3: out std_logic_vector(23 downto 0); 
    fofb_amp0: out std_logic_vector(23 downto 0); 
    fofb_amp0_x0: out std_logic_vector(23 downto 0); 
    fofb_amp0_x1: out std_logic_vector(23 downto 0); 
    fofb_amp0_x2: out std_logic_vector(23 downto 0); 
    fofb_amp0_x3: out std_logic_vector(23 downto 0); 
    fofb_amp0_x4: out std_logic_vector(23 downto 0); 
    fofb_amp0_x5: out std_logic_vector(23 downto 0); 
    fofb_amp0_x6: out std_logic_vector(23 downto 0); 
    fofb_amp0_x7: out std_logic; 
    fofb_amp1: out std_logic_vector(23 downto 0); 
    fofb_amp1_x0: out std_logic_vector(23 downto 0); 
    fofb_amp1_x1: out std_logic_vector(23 downto 0); 
    fofb_amp1_x2: out std_logic_vector(23 downto 0); 
    fofb_amp1_x3: out std_logic_vector(23 downto 0); 
    fofb_amp1_x4: out std_logic_vector(23 downto 0); 
    fofb_amp1_x5: out std_logic_vector(23 downto 0); 
    fofb_amp1_x6: out std_logic_vector(23 downto 0); 
    fofb_amp1_x7: out std_logic
  );
end fofb_amp_entity_8b25d4b0b6;

architecture structural of fofb_amp_entity_8b25d4b0b6 is
  signal ce_1112_sg_x27: std_logic;
  signal ce_1_sg_x12: std_logic;
  signal ce_2224_sg_x21: std_logic;
  signal ce_logic_1_sg_x11: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x4: std_logic;
  signal cic_fofb_q_event_tlast_missing_net_x5: std_logic;
  signal clk_1112_sg_x27: std_logic;
  signal clk_1_sg_x12: std_logic;
  signal clk_2224_sg_x21: std_logic;
  signal down_sample1_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x22: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x23: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x24: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x25: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x22: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x23: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x24: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x25: std_logic_vector(23 downto 0);
  signal register1_q_net_x8: std_logic;
  signal register1_q_net_x9: std_logic;
  signal register3_q_net_x4: std_logic;
  signal register3_q_net_x5: std_logic;
  signal register4_q_net_x4: std_logic_vector(23 downto 0);
  signal register4_q_net_x5: std_logic_vector(23 downto 0);
  signal register5_q_net_x4: std_logic_vector(23 downto 0);
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal register5_q_net_x7: std_logic_vector(23 downto 0);
  signal register5_q_net_x8: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x12 <= ce_1;
  ce_1112_sg_x27 <= ce_1112;
  ce_2224_sg_x21 <= ce_2224;
  ce_logic_1_sg_x11 <= ce_logic_1;
  register3_q_net_x4 <= ch_in0;
  register3_q_net_x5 <= ch_in1;
  clk_1_sg_x12 <= clk_1;
  clk_1112_sg_x27 <= clk_1112;
  clk_2224_sg_x21 <= clk_2224;
  register4_q_net_x4 <= i_in0;
  register4_q_net_x5 <= i_in1;
  register5_q_net_x4 <= q_in0;
  register5_q_net_x8 <= q_in1;
  amp_out0 <= down_sample2_q_net_x16;
  amp_out1 <= down_sample1_q_net_x16;
  amp_out2 <= down_sample2_q_net_x17;
  amp_out3 <= down_sample1_q_net_x17;
  fofb_amp0 <= down_sample1_q_net_x18;
  fofb_amp0_x0 <= down_sample2_q_net_x18;
  fofb_amp0_x1 <= down_sample1_q_net_x19;
  fofb_amp0_x2 <= down_sample2_q_net_x19;
  fofb_amp0_x3 <= down_sample1_q_net_x20;
  fofb_amp0_x4 <= down_sample2_q_net_x20;
  fofb_amp0_x5 <= down_sample1_q_net_x21;
  fofb_amp0_x6 <= down_sample2_q_net_x21;
  fofb_amp0_x7 <= cic_fofb_q_event_tlast_missing_net_x4;
  fofb_amp1 <= down_sample1_q_net_x22;
  fofb_amp1_x0 <= down_sample2_q_net_x22;
  fofb_amp1_x1 <= down_sample1_q_net_x23;
  fofb_amp1_x2 <= down_sample2_q_net_x23;
  fofb_amp1_x3 <= down_sample1_q_net_x24;
  fofb_amp1_x4 <= down_sample2_q_net_x24;
  fofb_amp1_x5 <= down_sample1_q_net_x25;
  fofb_amp1_x6 <= down_sample2_q_net_x25;
  fofb_amp1_x7 <= cic_fofb_q_event_tlast_missing_net_x5;

  fofb_amp0_95b23bfc2c: entity work.fofb_amp0_entity_95b23bfc2c
    port map (
      ce_1 => ce_1_sg_x12,
      ce_1112 => ce_1112_sg_x27,
      ce_2224 => ce_2224_sg_x21,
      ce_logic_1 => ce_logic_1_sg_x11,
      ch_in => register3_q_net_x4,
      clk_1 => clk_1_sg_x12,
      clk_1112 => clk_1112_sg_x27,
      clk_2224 => clk_2224_sg_x21,
      i_in => register4_q_net_x4,
      q_in => register5_q_net_x4,
      amp_out => register5_q_net_x6,
      ch_out => register1_q_net_x8,
      fofb_amp => down_sample1_q_net_x20,
      fofb_amp_x0 => down_sample2_q_net_x20,
      fofb_amp_x1 => down_sample1_q_net_x21,
      fofb_amp_x2 => down_sample2_q_net_x21,
      fofb_amp_x3 => cic_fofb_q_event_tlast_missing_net_x4,
      fofb_cordic => down_sample1_q_net_x18,
      fofb_cordic_x0 => down_sample2_q_net_x18,
      fofb_cordic_x1 => down_sample1_q_net_x19,
      fofb_cordic_x2 => down_sample2_q_net_x19
    );

  fofb_amp1_a049562dde: entity work.fofb_amp1_entity_a049562dde
    port map (
      ce_1 => ce_1_sg_x12,
      ce_1112 => ce_1112_sg_x27,
      ce_2224 => ce_2224_sg_x21,
      ce_logic_1 => ce_logic_1_sg_x11,
      ch_in => register3_q_net_x5,
      clk_1 => clk_1_sg_x12,
      clk_1112 => clk_1112_sg_x27,
      clk_2224 => clk_2224_sg_x21,
      i_in => register4_q_net_x5,
      q_in => register5_q_net_x8,
      amp_out => register5_q_net_x7,
      ch_out => register1_q_net_x9,
      fofb_amp => down_sample1_q_net_x24,
      fofb_amp_x0 => down_sample2_q_net_x24,
      fofb_amp_x1 => down_sample1_q_net_x25,
      fofb_amp_x2 => down_sample2_q_net_x25,
      fofb_amp_x3 => cic_fofb_q_event_tlast_missing_net_x5,
      fofb_cordic => down_sample1_q_net_x22,
      fofb_cordic_x0 => down_sample2_q_net_x22,
      fofb_cordic_x1 => down_sample1_q_net_x23,
      fofb_cordic_x2 => down_sample2_q_net_x23
    );

  tddm_fofb_amp_4ch_2cc521a83f: entity work.tddm_fofb_amp_4ch_entity_2cc521a83f
    port map (
      amp_in0 => register5_q_net_x6,
      amp_in1 => register5_q_net_x7,
      ce_1112 => ce_1112_sg_x27,
      ce_2224 => ce_2224_sg_x21,
      ch_in0 => register1_q_net_x8,
      ch_in1 => register1_q_net_x9,
      clk_1112 => clk_1112_sg_x27,
      clk_2224 => clk_2224_sg_x21,
      amp_out0 => down_sample2_q_net_x16,
      amp_out1 => down_sample1_q_net_x16,
      amp_out2 => down_sample2_q_net_x17,
      amp_out3 => down_sample1_q_net_x17
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/K_fofb_mult3/Cast_truncate1"

entity cast_truncate1_entity_56731b7870 is
  port (
    in1: in std_logic_vector(49 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end cast_truncate1_entity_56731b7870;

architecture structural of cast_truncate1_entity_56731b7870 is
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);
  signal slice_y_net: std_logic_vector(25 downto 0);

begin
  kx_tbt_p_net_x0 <= in1;
  out1 <= reinterpret_output_port_net_x0;

  reinterpret: entity work.reinterpret_9934b94a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 49,
      x_width => 50,
      y_width => 26
    )
    port map (
      x => kx_tbt_p_net_x0,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/K_fofb_mult3"

entity k_fofb_mult3_entity_697accc8e2 is
  port (
    ce_2: in std_logic; 
    ce_2224: in std_logic; 
    clk_2: in std_logic; 
    clk_2224: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end k_fofb_mult3_entity_697accc8e2;

architecture structural of k_fofb_mult3_entity_697accc8e2 is
  signal assert10_dout_net_x0: std_logic;
  signal assert5_dout_net_x0: std_logic_vector(24 downto 0);
  signal ce_2224_sg_x22: std_logic;
  signal ce_2_sg_x6: std_logic;
  signal clk_2224_sg_x22: std_logic;
  signal clk_2_sg_x6: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal kx_i_net_x0: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x6 <= ce_2;
  ce_2224_sg_x22 <= ce_2224;
  clk_2_sg_x6 <= clk_2;
  clk_2224_sg_x22 <= clk_2224;
  assert5_dout_net_x0 <= in1;
  kx_i_net_x0 <= in2;
  assert10_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_56731b7870: entity work.cast_truncate1_entity_56731b7870
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_2224_sg_x22,
      clk => clk_2224_sg_x22,
      d(0) => assert10_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 24,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 0,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 24,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => assert5_dout_net_x0,
      b => kx_i_net_x0,
      ce => ce_2_sg_x6,
      clk => clk_2_sg_x6,
      clr => '0',
      core_ce => ce_2_sg_x6,
      core_clk => clk_2_sg_x6,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x6,
      clk => clk_2_sg_x6,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/K_monit_1_mult"

entity k_monit_1_mult_entity_016885a3ac is
  port (
    ce_2: in std_logic; 
    ce_222400000: in std_logic; 
    clk_2: in std_logic; 
    clk_222400000: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end k_monit_1_mult_entity_016885a3ac;

architecture structural of k_monit_1_mult_entity_016885a3ac is
  signal ce_222400000_sg_x0: std_logic;
  signal ce_2_sg_x9: std_logic;
  signal clk_222400000_sg_x0: std_logic;
  signal clk_2_sg_x9: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal kx_i_net_x2: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);
  signal ufix_to_bool_dout_net_x0: std_logic;

begin
  ce_2_sg_x9 <= ce_2;
  ce_222400000_sg_x0 <= ce_222400000;
  clk_2_sg_x9 <= clk_2;
  clk_222400000_sg_x0 <= clk_222400000;
  reinterpret3_output_port_net_x0 <= in1;
  kx_i_net_x2 <= in2;
  ufix_to_bool_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_fe5c8d5ea5: entity work.cast_truncate1_entity_56731b7870
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_222400000_sg_x0,
      clk => clk_222400000_sg_x0,
      d(0) => ufix_to_bool_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 24,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 0,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 24,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => reinterpret3_output_port_net_x0,
      b => kx_i_net_x2,
      ce => ce_2_sg_x9,
      clk => clk_2_sg_x9,
      clr => '0',
      core_ce => ce_2_sg_x9,
      core_clk => clk_2_sg_x9,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x9,
      clk => clk_2_sg_x9,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/K_monit_mult3"

entity k_monit_mult3_entity_8a778fb5f4 is
  port (
    ce_2: in std_logic; 
    ce_22240000: in std_logic; 
    clk_2: in std_logic; 
    clk_22240000: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end k_monit_mult3_entity_8a778fb5f4;

architecture structural of k_monit_mult3_entity_8a778fb5f4 is
  signal assert10_dout_net_x0: std_logic;
  signal assert5_dout_net_x0: std_logic_vector(24 downto 0);
  signal ce_22240000_sg_x0: std_logic;
  signal ce_2_sg_x12: std_logic;
  signal clk_22240000_sg_x0: std_logic;
  signal clk_2_sg_x12: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal kx_i_net_x4: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x12 <= ce_2;
  ce_22240000_sg_x0 <= ce_22240000;
  clk_2_sg_x12 <= clk_2;
  clk_22240000_sg_x0 <= clk_22240000;
  assert5_dout_net_x0 <= in1;
  kx_i_net_x4 <= in2;
  assert10_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_47fd83104e: entity work.cast_truncate1_entity_56731b7870
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_22240000_sg_x0,
      clk => clk_22240000_sg_x0,
      d(0) => assert10_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 24,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 0,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 24,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => assert5_dout_net_x0,
      b => kx_i_net_x4,
      ce => ce_2_sg_x12,
      clk => clk_2_sg_x12,
      clr => '0',
      core_ce => ce_2_sg_x12,
      core_clk => clk_2_sg_x12,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x12,
      clk => clk_2_sg_x12,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/K_tbt_mult"

entity k_tbt_mult_entity_b8fafff255 is
  port (
    ce_2: in std_logic; 
    ce_70: in std_logic; 
    clk_2: in std_logic; 
    clk_70: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end k_tbt_mult_entity_b8fafff255;

architecture structural of k_tbt_mult_entity_b8fafff255 is
  signal assert10_dout_net_x0: std_logic;
  signal assert5_dout_net_x0: std_logic_vector(24 downto 0);
  signal ce_2_sg_x15: std_logic;
  signal ce_70_sg_x0: std_logic;
  signal clk_2_sg_x15: std_logic;
  signal clk_70_sg_x0: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal kx_i_net_x6: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x15 <= ce_2;
  ce_70_sg_x0 <= ce_70;
  clk_2_sg_x15 <= clk_2;
  clk_70_sg_x0 <= clk_70;
  assert5_dout_net_x0 <= in1;
  kx_i_net_x6 <= in2;
  assert10_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_4592ea30ee: entity work.cast_truncate1_entity_56731b7870
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_70_sg_x0,
      clk => clk_70_sg_x0,
      d(0) => assert10_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 24,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 0,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 24,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => assert5_dout_net_x0,
      b => kx_i_net_x6,
      ce => ce_2_sg_x15,
      clk => clk_2_sg_x15,
      clr => '0',
      core_ce => ce_2_sg_x15,
      core_clk => clk_2_sg_x15,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x15,
      clk => clk_2_sg_x15,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_fofb_mult4/Cast_truncate1"

entity cast_truncate1_entity_18a9b21a64 is
  port (
    in1: in std_logic_vector(49 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end cast_truncate1_entity_18a9b21a64;

architecture structural of cast_truncate1_entity_18a9b21a64 is
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);
  signal slice_y_net: std_logic_vector(25 downto 0);

begin
  kx_tbt_p_net_x0 <= in1;
  out1 <= reinterpret_output_port_net_x0;

  reinterpret: entity work.reinterpret_9934b94a22
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => slice_y_net,
      output_port => reinterpret_output_port_net_x0
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 49,
      x_width => 50,
      y_width => 26
    )
    port map (
      x => kx_tbt_p_net_x0,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_fofb_mult4"

entity ksum_fofb_mult4_entity_ac3ed97096 is
  port (
    ce_2: in std_logic; 
    ce_2224: in std_logic; 
    clk_2: in std_logic; 
    clk_2224: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end ksum_fofb_mult4_entity_ac3ed97096;

architecture structural of ksum_fofb_mult4_entity_ac3ed97096 is
  signal assert11_dout_net_x0: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x0: std_logic;
  signal ce_2224_sg_x25: std_logic;
  signal ce_2_sg_x18: std_logic;
  signal clk_2224_sg_x25: std_logic;
  signal clk_2_sg_x18: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal ksum_i_net_x0: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x18 <= ce_2;
  ce_2224_sg_x25 <= ce_2224;
  clk_2_sg_x18 <= clk_2;
  clk_2224_sg_x25 <= clk_2224;
  assert11_dout_net_x0 <= in1;
  ksum_i_net_x0 <= in2;
  assert12_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_18a9b21a64: entity work.cast_truncate1_entity_18a9b21a64
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
      d(0) => assert12_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 21,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 44,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => assert11_dout_net_x0,
      b => ksum_i_net_x0,
      ce => ce_2_sg_x18,
      clk => clk_2_sg_x18,
      clr => '0',
      core_ce => ce_2_sg_x18,
      core_clk => clk_2_sg_x18,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x18,
      clk => clk_2_sg_x18,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_monit_1_mult1"

entity ksum_monit_1_mult1_entity_c66dc07078 is
  port (
    ce_2: in std_logic; 
    ce_222400000: in std_logic; 
    clk_2: in std_logic; 
    clk_222400000: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end ksum_monit_1_mult1_entity_c66dc07078;

architecture structural of ksum_monit_1_mult1_entity_c66dc07078 is
  signal ce_222400000_sg_x3: std_logic;
  signal ce_2_sg_x19: std_logic;
  signal clk_222400000_sg_x3: std_logic;
  signal clk_2_sg_x19: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal ksum_i_net_x1: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret4_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);
  signal ufix_to_bool3_dout_net_x0: std_logic;

begin
  ce_2_sg_x19 <= ce_2;
  ce_222400000_sg_x3 <= ce_222400000;
  clk_2_sg_x19 <= clk_2;
  clk_222400000_sg_x3 <= clk_222400000;
  reinterpret4_output_port_net_x0 <= in1;
  ksum_i_net_x1 <= in2;
  ufix_to_bool3_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_92cc22397d: entity work.cast_truncate1_entity_18a9b21a64
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_222400000_sg_x3,
      clk => clk_222400000_sg_x3,
      d(0) => ufix_to_bool3_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 21,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 44,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => reinterpret4_output_port_net_x0,
      b => ksum_i_net_x1,
      ce => ce_2_sg_x19,
      clk => clk_2_sg_x19,
      clr => '0',
      core_ce => ce_2_sg_x19,
      core_clk => clk_2_sg_x19,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x19,
      clk => clk_2_sg_x19,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_monit_mult2"

entity ksum_monit_mult2_entity_31877b6d2b is
  port (
    ce_2: in std_logic; 
    ce_22240000: in std_logic; 
    clk_2: in std_logic; 
    clk_22240000: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end ksum_monit_mult2_entity_31877b6d2b;

architecture structural of ksum_monit_mult2_entity_31877b6d2b is
  signal assert11_dout_net_x0: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x0: std_logic;
  signal ce_22240000_sg_x3: std_logic;
  signal ce_2_sg_x20: std_logic;
  signal clk_22240000_sg_x3: std_logic;
  signal clk_2_sg_x20: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal ksum_i_net_x2: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x20 <= ce_2;
  ce_22240000_sg_x3 <= ce_22240000;
  clk_2_sg_x20 <= clk_2;
  clk_22240000_sg_x3 <= clk_22240000;
  assert11_dout_net_x0 <= in1;
  ksum_i_net_x2 <= in2;
  assert12_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_4c5b033963: entity work.cast_truncate1_entity_18a9b21a64
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_22240000_sg_x3,
      clk => clk_22240000_sg_x3,
      d(0) => assert12_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 21,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 44,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => assert11_dout_net_x0,
      b => ksum_i_net_x2,
      ce => ce_2_sg_x20,
      clk => clk_2_sg_x20,
      clr => '0',
      core_ce => ce_2_sg_x20,
      core_clk => clk_2_sg_x20,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x20,
      clk => clk_2_sg_x20,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_tbt_mult3"

entity ksum_tbt_mult3_entity_e0be30d675 is
  port (
    ce_2: in std_logic; 
    ce_70: in std_logic; 
    clk_2: in std_logic; 
    clk_70: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    vld_in: in std_logic; 
    out1: out std_logic_vector(25 downto 0); 
    vld_out: out std_logic
  );
end ksum_tbt_mult3_entity_e0be30d675;

architecture structural of ksum_tbt_mult3_entity_e0be30d675 is
  signal assert11_dout_net_x0: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x0: std_logic;
  signal ce_2_sg_x21: std_logic;
  signal ce_70_sg_x3: std_logic;
  signal clk_2_sg_x21: std_logic;
  signal clk_70_sg_x3: std_logic;
  signal delay1_q_net_x0: std_logic;
  signal ksum_i_net_x3: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x21 <= ce_2;
  ce_70_sg_x3 <= ce_70;
  clk_2_sg_x21 <= clk_2;
  clk_70_sg_x3 <= clk_70;
  assert11_dout_net_x0 <= in1;
  ksum_i_net_x3 <= in2;
  assert12_dout_net_x0 <= vld_in;
  out1 <= register_q_net_x0;
  vld_out <= delay1_q_net_x0;

  cast_truncate1_91bc0d396f: entity work.cast_truncate1_entity_18a9b21a64
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x0
    );

  delay1: entity work.xldelay
    generic map (
      latency => 9,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_70_sg_x3,
      clk => clk_70_sg_x3,
      d(0) => assert12_dout_net_x0,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  kx_tbt: entity work.xlmult
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 21,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 23,
      b_width => 25,
      c_a_type => 0,
      c_a_width => 25,
      c_b_type => 0,
      c_b_width => 25,
      c_baat => 25,
      c_output_width => 50,
      c_type => 0,
      core_name0 => "mult_11_2_6d8e463c710483da",
      extra_registers => 0,
      multsign => 2,
      overflow => 1,
      p_arith => xlSigned,
      p_bin_pt => 44,
      p_width => 50,
      quantization => 1
    )
    port map (
      a => assert11_dout_net_x0,
      b => ksum_i_net_x3,
      ce => ce_2_sg_x21,
      clk => clk_2_sg_x21,
      clr => '0',
      core_ce => ce_2_sg_x21,
      core_clk => clk_2_sg_x21,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x21,
      clk => clk_2_sg_x21,
      d => reinterpret_output_port_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Mixer/CMixer_0/DataReg_En"

entity datareg_en_entity_5c82ef2965 is
  port (
    ce_2: in std_logic; 
    clk_2: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(23 downto 0); 
    valid: out std_logic
  );
end datareg_en_entity_5c82ef2965;

architecture structural of datareg_en_entity_5c82ef2965 is
  signal ce_2_sg_x22: std_logic;
  signal clk_2_sg_x22: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal constant12_op_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);

begin
  ce_2_sg_x22 <= ce_2;
  clk_2_sg_x22 <= clk_2;
  constant12_op_net_x0 <= din;
  constant11_op_net_x0 <= en;
  dout <= register_q_net_x0;
  valid <= register1_q_net_x0;

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_2_sg_x22,
      clk => clk_2_sg_x22,
      d(0) => constant11_op_net_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x22,
      clk => clk_2_sg_x22,
      d => constant12_op_net_x0,
      en(0) => constant11_op_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Mixer/CMixer_0/DataReg_En1"

entity datareg_en1_entity_8d533fde9e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(23 downto 0)
  );
end datareg_en1_entity_8d533fde9e;

architecture structural of datareg_en1_entity_8d533fde9e is
  signal ce_1_sg_x13: std_logic;
  signal clk_1_sg_x13: std_logic;
  signal constant11_op_net_x1: std_logic;
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x13 <= ce_1;
  clk_1_sg_x13 <= clk_1;
  register_q_net_x1 <= din;
  constant11_op_net_x1 <= en;
  dout <= register_q_net_x2;

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x13,
      clk => clk_1_sg_x13,
      d => register_q_net_x1,
      en(0) => constant11_op_net_x1,
      rst => "0",
      q => register_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Mixer/CMixer_0"

entity cmixer_0_entity_f630e8d7ec is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    dds_cosine: in std_logic_vector(23 downto 0); 
    dds_msine: in std_logic_vector(23 downto 0); 
    dds_valid: in std_logic; 
    din_i: in std_logic_vector(23 downto 0); 
    din_q: in std_logic_vector(23 downto 0); 
    en: in std_logic; 
    ch_out: out std_logic; 
    i_out: out std_logic_vector(23 downto 0); 
    q_out: out std_logic_vector(23 downto 0)
  );
end cmixer_0_entity_f630e8d7ec;

architecture structural of cmixer_0_entity_f630e8d7ec is
  signal a_i: std_logic_vector(23 downto 0);
  signal a_r: std_logic_vector(23 downto 0);
  signal b_i: std_logic_vector(23 downto 0);
  signal b_r: std_logic_vector(23 downto 0);
  signal ce_1_sg_x14: std_logic;
  signal ce_2_sg_x23: std_logic;
  signal clk_1_sg_x14: std_logic;
  signal clk_2_sg_x23: std_logic;
  signal complexmult_m_axis_dout_tdata_imag_net: std_logic_vector(23 downto 0);
  signal complexmult_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal complexmult_m_axis_dout_tuser_net: std_logic;
  signal complexmult_m_axis_dout_tvalid_net: std_logic;
  signal constant11_op_net_x2: std_logic;
  signal constant12_op_net_x1: std_logic_vector(23 downto 0);
  signal constant15_op_net_x0: std_logic;
  signal convert1_dout_net: std_logic_vector(23 downto 0);
  signal convert2_dout_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register1_q_net_x1: std_logic;
  signal register3_q_net_x5: std_logic;
  signal register4_q_net_x5: std_logic_vector(23 downto 0);
  signal register5_q_net_x5: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);
  signal register_q_net_x8: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x14 <= ce_1;
  ce_2_sg_x23 <= ce_2;
  register1_q_net_x1 <= ch_in;
  clk_1_sg_x14 <= clk_1;
  clk_2_sg_x23 <= clk_2;
  register_q_net_x6 <= dds_cosine;
  register_q_net_x7 <= dds_msine;
  constant15_op_net_x0 <= dds_valid;
  register_q_net_x8 <= din_i;
  constant12_op_net_x1 <= din_q;
  constant11_op_net_x2 <= en;
  ch_out <= register3_q_net_x5;
  i_out <= register4_q_net_x5;
  q_out <= register5_q_net_x5;

  complexmult: entity work.xlcomplex_multiplier_9420c9297365b1438cc1e8469b8205e1
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      s_axis_a_tdata_imag => a_i,
      s_axis_a_tdata_real => a_r,
      s_axis_a_tvalid => constant15_op_net_x0,
      s_axis_b_tdata_imag => b_i,
      s_axis_b_tdata_real => b_r,
      s_axis_b_tuser(0) => register_q_net,
      s_axis_b_tvalid => register1_q_net_x0,
      m_axis_dout_tdata_imag => complexmult_m_axis_dout_tdata_imag_net,
      m_axis_dout_tdata_real => complexmult_m_axis_dout_tdata_real_net,
      m_axis_dout_tuser(0) => complexmult_m_axis_dout_tuser_net,
      m_axis_dout_tvalid => complexmult_m_axis_dout_tvalid_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      clr => '0',
      din => reinterpret1_output_port_net,
      en => "1",
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 19,
      din_width => 24,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert2_dout_net
    );

  datareg_en1_8d533fde9e: entity work.datareg_en1_entity_8d533fde9e
    port map (
      ce_1 => ce_1_sg_x14,
      clk_1 => clk_1_sg_x14,
      din => register_q_net_x8,
      en => constant11_op_net_x2,
      dout => register_q_net_x2
    );

  datareg_en_5c82ef2965: entity work.datareg_en_entity_5c82ef2965
    port map (
      ce_2 => ce_2_sg_x23,
      clk_2 => clk_2_sg_x23,
      din => constant12_op_net_x1,
      en => constant11_op_net_x2,
      dout => register_q_net_x0,
      valid => register1_q_net_x0
    );

  delay: entity work.delay_961b43f67a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => register_q_net_x0,
      q => b_i
    );

  delay1: entity work.delay_961b43f67a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d => register_q_net_x2,
      q => b_r
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d => register_q_net_x6,
      en(0) => constant15_op_net_x0,
      rst => "0",
      q => a_r
    );

  register2: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d => register_q_net_x7,
      en(0) => constant15_op_net_x0,
      rst => "0",
      q => a_i
    );

  register3: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d(0) => complexmult_m_axis_dout_tuser_net,
      en(0) => complexmult_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register3_q_net_x5
    );

  register4: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d => convert1_dout_net,
      en(0) => complexmult_m_axis_dout_tvalid_net,
      rst => "0",
      q => register4_q_net_x5
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d => convert2_dout_net,
      en(0) => complexmult_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x5
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x14,
      clk => clk_1_sg_x14,
      d(0) => register1_q_net_x1,
      en(0) => constant11_op_net_x2,
      rst => "0",
      q(0) => register_q_net
    );

  reinterpret: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => complexmult_m_axis_dout_tdata_imag_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => complexmult_m_axis_dout_tdata_real_net,
      output_port => reinterpret1_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Mixer/TDDM_Mixer/TDDM_Mixer0_i"

entity tddm_mixer0_i_entity_f95b8f24ad is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0)
  );
end tddm_mixer0_i_entity_f95b8f24ad;

architecture structural of tddm_mixer0_i_entity_f95b8f24ad is
  signal ce_1_sg_x17: std_logic;
  signal ce_2_sg_x26: std_logic;
  signal clk_1_sg_x17: std_logic;
  signal clk_2_sg_x26: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register3_q_net_x6: std_logic;
  signal register4_q_net_x6: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x17 <= ce_1;
  ce_2_sg_x26 <= ce_2;
  register3_q_net_x6 <= ch_in;
  clk_1_sg_x17 <= clk_1;
  clk_2_sg_x26 <= clk_2;
  register4_q_net_x6 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_2_sg_x26,
      dest_clk => clk_2_sg_x26,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x17,
      src_clk => clk_1_sg_x17,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_2_sg_x26,
      dest_clk => clk_2_sg_x26,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x17,
      src_clk => clk_1_sg_x17,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      d => register4_q_net_x6,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      d => register4_q_net_x6,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => register3_q_net_x6,
      b(0) => constant_op_net,
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_d29d27b7b3
    port map (
      a(0) => register3_q_net_x6,
      b => constant1_op_net,
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Mixer/TDDM_Mixer"

entity tddm_mixer_entity_8537ade7b6 is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    mix0_ch_in: in std_logic; 
    mix0_i_in: in std_logic_vector(23 downto 0); 
    mix0_q_in: in std_logic_vector(23 downto 0); 
    mix1_ch_in: in std_logic; 
    mix1_i_in: in std_logic_vector(23 downto 0); 
    mix1_q_in: in std_logic_vector(23 downto 0); 
    mix_ch0_i_out: out std_logic_vector(23 downto 0); 
    mix_ch0_q_out: out std_logic_vector(23 downto 0); 
    mix_ch1_i_out: out std_logic_vector(23 downto 0); 
    mix_ch1_q_out: out std_logic_vector(23 downto 0); 
    mix_ch2_i_out: out std_logic_vector(23 downto 0); 
    mix_ch2_q_out: out std_logic_vector(23 downto 0); 
    mix_ch3_i_out: out std_logic_vector(23 downto 0); 
    mix_ch3_q_out: out std_logic_vector(23 downto 0)
  );
end tddm_mixer_entity_8537ade7b6;

architecture structural of tddm_mixer_entity_8537ade7b6 is
  signal ce_1_sg_x21: std_logic;
  signal ce_2_sg_x30: std_logic;
  signal clk_1_sg_x21: std_logic;
  signal clk_2_sg_x30: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x7: std_logic_vector(23 downto 0);
  signal register3_q_net_x10: std_logic;
  signal register3_q_net_x9: std_logic;
  signal register4_q_net_x8: std_logic_vector(23 downto 0);
  signal register4_q_net_x9: std_logic_vector(23 downto 0);
  signal register5_q_net_x11: std_logic_vector(23 downto 0);
  signal register5_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x21 <= ce_1;
  ce_2_sg_x30 <= ce_2;
  clk_1_sg_x21 <= clk_1;
  clk_2_sg_x30 <= clk_2;
  register3_q_net_x9 <= mix0_ch_in;
  register4_q_net_x8 <= mix0_i_in;
  register5_q_net_x7 <= mix0_q_in;
  register3_q_net_x10 <= mix1_ch_in;
  register4_q_net_x9 <= mix1_i_in;
  register5_q_net_x11 <= mix1_q_in;
  mix_ch0_i_out <= down_sample2_q_net_x4;
  mix_ch0_q_out <= down_sample2_q_net_x5;
  mix_ch1_i_out <= down_sample1_q_net_x4;
  mix_ch1_q_out <= down_sample1_q_net_x5;
  mix_ch2_i_out <= down_sample2_q_net_x6;
  mix_ch2_q_out <= down_sample2_q_net_x7;
  mix_ch3_i_out <= down_sample1_q_net_x6;
  mix_ch3_q_out <= down_sample1_q_net_x7;

  tddm_mixer0_i_f95b8f24ad: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x21,
      ce_2 => ce_2_sg_x30,
      ch_in => register3_q_net_x9,
      clk_1 => clk_1_sg_x21,
      clk_2 => clk_2_sg_x30,
      din => register4_q_net_x8,
      dout_ch0 => down_sample2_q_net_x4,
      dout_ch1 => down_sample1_q_net_x4
    );

  tddm_mixer0_q_2c5e18f496: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x21,
      ce_2 => ce_2_sg_x30,
      ch_in => register3_q_net_x9,
      clk_1 => clk_1_sg_x21,
      clk_2 => clk_2_sg_x30,
      din => register5_q_net_x7,
      dout_ch0 => down_sample2_q_net_x5,
      dout_ch1 => down_sample1_q_net_x5
    );

  tddm_mixer1_i_1afc4ccdba: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x21,
      ce_2 => ce_2_sg_x30,
      ch_in => register3_q_net_x10,
      clk_1 => clk_1_sg_x21,
      clk_2 => clk_2_sg_x30,
      din => register4_q_net_x9,
      dout_ch0 => down_sample2_q_net_x6,
      dout_ch1 => down_sample1_q_net_x6
    );

  tddm_mixer1_q_ee4acbed30: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x21,
      ce_2 => ce_2_sg_x30,
      ch_in => register3_q_net_x10,
      clk_1 => clk_1_sg_x21,
      clk_2 => clk_2_sg_x30,
      din => register5_q_net_x11,
      dout_ch0 => down_sample2_q_net_x7,
      dout_ch1 => down_sample1_q_net_x7
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Mixer"

entity mixer_entity_a1cd828545 is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ch_in0: in std_logic; 
    ch_in1: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    dds_cosine_0: in std_logic_vector(23 downto 0); 
    dds_cosine_1: in std_logic_vector(23 downto 0); 
    dds_msine_0: in std_logic_vector(23 downto 0); 
    dds_msine_1: in std_logic_vector(23 downto 0); 
    dds_valid_0: in std_logic; 
    dds_valid_1: in std_logic; 
    din0: in std_logic_vector(23 downto 0); 
    din1: in std_logic_vector(23 downto 0); 
    ch_out0: out std_logic; 
    ch_out1: out std_logic; 
    i_out0: out std_logic_vector(23 downto 0); 
    i_out1: out std_logic_vector(23 downto 0); 
    q_out0: out std_logic_vector(23 downto 0); 
    q_out1: out std_logic_vector(23 downto 0); 
    tddm_mixer: out std_logic_vector(23 downto 0); 
    tddm_mixer_x0: out std_logic_vector(23 downto 0); 
    tddm_mixer_x1: out std_logic_vector(23 downto 0); 
    tddm_mixer_x2: out std_logic_vector(23 downto 0); 
    tddm_mixer_x3: out std_logic_vector(23 downto 0); 
    tddm_mixer_x4: out std_logic_vector(23 downto 0); 
    tddm_mixer_x5: out std_logic_vector(23 downto 0); 
    tddm_mixer_x6: out std_logic_vector(23 downto 0)
  );
end mixer_entity_a1cd828545;

architecture structural of mixer_entity_a1cd828545 is
  signal ce_1_sg_x22: std_logic;
  signal ce_2_sg_x31: std_logic;
  signal clk_1_sg_x22: std_logic;
  signal clk_2_sg_x31: std_logic;
  signal constant11_op_net_x2: std_logic;
  signal constant12_op_net_x1: std_logic_vector(23 downto 0);
  signal constant15_op_net_x1: std_logic;
  signal constant1_op_net_x2: std_logic;
  signal constant2_op_net_x1: std_logic_vector(23 downto 0);
  signal constant3_op_net_x1: std_logic;
  signal down_sample1_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x9: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x9: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register3_q_net_x11: std_logic;
  signal register3_q_net_x12: std_logic;
  signal register4_q_net_x10: std_logic_vector(23 downto 0);
  signal register4_q_net_x11: std_logic_vector(23 downto 0);
  signal register5_q_net_x12: std_logic_vector(23 downto 0);
  signal register5_q_net_x8: std_logic_vector(23 downto 0);
  signal register_q_net_x12: std_logic_vector(23 downto 0);
  signal register_q_net_x13: std_logic_vector(23 downto 0);
  signal register_q_net_x14: std_logic_vector(23 downto 0);
  signal register_q_net_x15: std_logic_vector(23 downto 0);
  signal register_q_net_x16: std_logic_vector(23 downto 0);
  signal register_q_net_x17: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x22 <= ce_1;
  ce_2_sg_x31 <= ce_2;
  register1_q_net_x3 <= ch_in0;
  register1_q_net_x4 <= ch_in1;
  clk_1_sg_x22 <= clk_1;
  clk_2_sg_x31 <= clk_2;
  register_q_net_x12 <= dds_cosine_0;
  register_q_net_x14 <= dds_cosine_1;
  register_q_net_x13 <= dds_msine_0;
  register_q_net_x15 <= dds_msine_1;
  constant15_op_net_x1 <= dds_valid_0;
  constant3_op_net_x1 <= dds_valid_1;
  register_q_net_x16 <= din0;
  register_q_net_x17 <= din1;
  ch_out0 <= register3_q_net_x11;
  ch_out1 <= register3_q_net_x12;
  i_out0 <= register4_q_net_x10;
  i_out1 <= register4_q_net_x11;
  q_out0 <= register5_q_net_x8;
  q_out1 <= register5_q_net_x12;
  tddm_mixer <= down_sample1_q_net_x8;
  tddm_mixer_x0 <= down_sample2_q_net_x8;
  tddm_mixer_x1 <= down_sample1_q_net_x9;
  tddm_mixer_x2 <= down_sample2_q_net_x9;
  tddm_mixer_x3 <= down_sample1_q_net_x10;
  tddm_mixer_x4 <= down_sample2_q_net_x10;
  tddm_mixer_x5 <= down_sample1_q_net_x11;
  tddm_mixer_x6 <= down_sample2_q_net_x11;

  cmixer_0_f630e8d7ec: entity work.cmixer_0_entity_f630e8d7ec
    port map (
      ce_1 => ce_1_sg_x22,
      ce_2 => ce_2_sg_x31,
      ch_in => register1_q_net_x3,
      clk_1 => clk_1_sg_x22,
      clk_2 => clk_2_sg_x31,
      dds_cosine => register_q_net_x12,
      dds_msine => register_q_net_x13,
      dds_valid => constant15_op_net_x1,
      din_i => register_q_net_x16,
      din_q => constant12_op_net_x1,
      en => constant11_op_net_x2,
      ch_out => register3_q_net_x11,
      i_out => register4_q_net_x10,
      q_out => register5_q_net_x8
    );

  cmixer_1_61bfc18f90: entity work.cmixer_0_entity_f630e8d7ec
    port map (
      ce_1 => ce_1_sg_x22,
      ce_2 => ce_2_sg_x31,
      ch_in => register1_q_net_x4,
      clk_1 => clk_1_sg_x22,
      clk_2 => clk_2_sg_x31,
      dds_cosine => register_q_net_x14,
      dds_msine => register_q_net_x15,
      dds_valid => constant3_op_net_x1,
      din_i => register_q_net_x17,
      din_q => constant2_op_net_x1,
      en => constant1_op_net_x2,
      ch_out => register3_q_net_x12,
      i_out => register4_q_net_x11,
      q_out => register5_q_net_x12
    );

  constant1: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net_x2
    );

  constant11: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant11_op_net_x2
    );

  constant12: entity work.constant_f394f3309c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant12_op_net_x1
    );

  constant2: entity work.constant_f394f3309c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net_x1
    );

  tddm_mixer_8537ade7b6: entity work.tddm_mixer_entity_8537ade7b6
    port map (
      ce_1 => ce_1_sg_x22,
      ce_2 => ce_2_sg_x31,
      clk_1 => clk_1_sg_x22,
      clk_2 => clk_2_sg_x31,
      mix0_ch_in => register3_q_net_x11,
      mix0_i_in => register4_q_net_x10,
      mix0_q_in => register5_q_net_x8,
      mix1_ch_in => register3_q_net_x12,
      mix1_i_in => register4_q_net_x11,
      mix1_q_in => register5_q_net_x12,
      mix_ch0_i_out => down_sample2_q_net_x8,
      mix_ch0_q_out => down_sample2_q_net_x9,
      mix_ch1_i_out => down_sample1_q_net_x8,
      mix_ch1_q_out => down_sample1_q_net_x9,
      mix_ch2_i_out => down_sample2_q_net_x10,
      mix_ch2_q_out => down_sample2_q_net_x11,
      mix_ch3_i_out => down_sample1_q_net_x10,
      mix_ch3_q_out => down_sample1_q_net_x11
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast2/format1"

entity format1_entity_4e0a69646b is
  port (
    ce_5560000: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end format1_entity_4e0a69646b;

architecture structural of format1_entity_4e0a69646b is
  signal ce_5560000_sg_x0: std_logic;
  signal clk_5560000_sg_x0: std_logic;
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal monit_pfir_m_axis_data_tdata_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(24 downto 0);

begin
  ce_5560000_sg_x0 <= ce_5560000;
  clk_5560000_sg_x0 <= clk_5560000;
  monit_pfir_m_axis_data_tdata_net_x0 <= din;
  dout <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 21,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_5560000_sg_x0,
      clk => clk_5560000_sg_x0,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => monit_pfir_m_axis_data_tdata_net_x0,
      output_port => reinterpret_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast2"

entity cast2_entity_4b7421c7c9 is
  port (
    ce_5560000: in std_logic; 
    clk_5560000: in std_logic; 
    data_in: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end cast2_entity_4b7421c7c9;

architecture structural of cast2_entity_4b7421c7c9 is
  signal ce_5560000_sg_x1: std_logic;
  signal clk_5560000_sg_x1: std_logic;
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal monit_pfir_m_axis_data_tdata_net_x1: std_logic_vector(24 downto 0);
  signal monit_pfir_m_axis_data_tvalid_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);

begin
  ce_5560000_sg_x1 <= ce_5560000;
  clk_5560000_sg_x1 <= clk_5560000;
  monit_pfir_m_axis_data_tdata_net_x1 <= data_in;
  monit_pfir_m_axis_data_tvalid_net_x0 <= en;
  out_x0 <= register_q_net_x0;

  format1_4e0a69646b: entity work.format1_entity_4e0a69646b
    port map (
      ce_5560000 => ce_5560000_sg_x1,
      clk_5560000 => clk_5560000_sg_x1,
      din => monit_pfir_m_axis_data_tdata_net_x1,
      dout => convert_dout_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_5560000_sg_x1,
      clk => clk_5560000_sg_x1,
      d => convert_dout_net_x0,
      en(0) => monit_pfir_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast4/format1"

entity format1_entity_3cf61b0d44 is
  port (
    ce_2780000: in std_logic; 
    clk_2780000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end format1_entity_3cf61b0d44;

architecture structural of format1_entity_3cf61b0d44 is
  signal ce_2780000_sg_x0: std_logic;
  signal clk_2780000_sg_x0: std_logic;
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal monit_cfir_m_axis_data_tdata_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(24 downto 0);

begin
  ce_2780000_sg_x0 <= ce_2780000;
  clk_2780000_sg_x0 <= clk_2780000;
  monit_cfir_m_axis_data_tdata_net_x0 <= din;
  dout <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 21,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_2780000_sg_x0,
      clk => clk_2780000_sg_x0,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => monit_cfir_m_axis_data_tdata_net_x0,
      output_port => reinterpret_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast4"

entity cast4_entity_4ed908d7fc is
  port (
    ce_2780000: in std_logic; 
    clk_2780000: in std_logic; 
    data_in: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end cast4_entity_4ed908d7fc;

architecture structural of cast4_entity_4ed908d7fc is
  signal ce_2780000_sg_x1: std_logic;
  signal clk_2780000_sg_x1: std_logic;
  signal convert_dout_net_x0: std_logic_vector(23 downto 0);
  signal monit_cfir_m_axis_data_tdata_net_x1: std_logic_vector(24 downto 0);
  signal monit_cfir_m_axis_data_tvalid_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);

begin
  ce_2780000_sg_x1 <= ce_2780000;
  clk_2780000_sg_x1 <= clk_2780000;
  monit_cfir_m_axis_data_tdata_net_x1 <= data_in;
  monit_cfir_m_axis_data_tvalid_net_x0 <= en;
  out_x0 <= register_q_net_x0;

  format1_3cf61b0d44: entity work.format1_entity_3cf61b0d44
    port map (
      ce_2780000 => ce_2780000_sg_x1,
      clk_2780000 => clk_2780000_sg_x1,
      din => monit_cfir_m_axis_data_tdata_net_x1,
      dout => convert_dout_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_2780000_sg_x1,
      clk => clk_2780000_sg_x1,
      d => convert_dout_net_x0,
      en(0) => monit_cfir_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Reg1"

entity reg1_entity_8661a44192 is
  port (
    ce_1390000: in std_logic; 
    clk_1390000: in std_logic; 
    din: in std_logic_vector(85 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(23 downto 0)
  );
end reg1_entity_8661a44192;

architecture structural of reg1_entity_8661a44192 is
  signal ce_1390000_sg_x0: std_logic;
  signal clk_1390000_sg_x0: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal monit_cic_m_axis_data_tdata_data_net_x0: std_logic_vector(85 downto 0);
  signal monit_cic_m_axis_data_tvalid_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(85 downto 0);

begin
  ce_1390000_sg_x0 <= ce_1390000;
  clk_1390000_sg_x0 <= clk_1390000;
  monit_cic_m_axis_data_tdata_data_net_x0 <= din;
  monit_cic_m_axis_data_tvalid_net_x0 <= en;
  dout <= register_q_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 83,
      din_width => 86,
      dout_arith => 2,
      dout_bin_pt => 22,
      dout_width => 24,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_1390000_sg_x0,
      clk => clk_1390000_sg_x0,
      clr => '0',
      din => reinterpret2_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1390000_sg_x0,
      clk => clk_1390000_sg_x0,
      d => convert_dout_net,
      en(0) => monit_cic_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

  reinterpret2: entity work.reinterpret_3cddc67241
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => monit_cic_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret2_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/TDDM_monit_amp_c/TDDM_monit_amp_c_int"

entity tddm_monit_amp_c_int_entity_554a834349 is
  port (
    ce_22240000: in std_logic; 
    ce_5560000: in std_logic; 
    ch_in: in std_logic_vector(1 downto 0); 
    clk_22240000: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0); 
    dout_ch2: out std_logic_vector(23 downto 0); 
    dout_ch3: out std_logic_vector(23 downto 0)
  );
end tddm_monit_amp_c_int_entity_554a834349;

architecture structural of tddm_monit_amp_c_int_entity_554a834349 is
  signal ce_22240000_sg_x4: std_logic;
  signal ce_5560000_sg_x2: std_logic;
  signal clk_22240000_sg_x4: std_logic;
  signal clk_5560000_sg_x2: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic_vector(1 downto 0);
  signal constant4_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal delay2_q_net_x0: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register2_q_net: std_logic_vector(23 downto 0);
  signal register3_q_net: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_22240000_sg_x4 <= ce_22240000;
  ce_5560000_sg_x2 <= ce_5560000;
  delay2_q_net_x0 <= ch_in;
  clk_22240000_sg_x4 <= clk_22240000;
  clk_5560000_sg_x2 <= clk_5560000;
  register_q_net_x1 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;
  dout_ch2 <= down_sample3_q_net_x0;
  dout_ch3 <= down_sample4_q_net_x0;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant3: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant_x0: entity work.constant_3a9a3daeb9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_22240000_sg_x4,
      dest_clk => clk_22240000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5560000_sg_x2,
      src_clk => clk_5560000_sg_x2,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_22240000_sg_x4,
      dest_clk => clk_22240000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5560000_sg_x2,
      src_clk => clk_5560000_sg_x2,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  down_sample3: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register2_q_net,
      dest_ce => ce_22240000_sg_x4,
      dest_clk => clk_22240000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5560000_sg_x2,
      src_clk => clk_5560000_sg_x2,
      src_clr => '0',
      q => down_sample3_q_net_x0
    );

  down_sample4: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register3_q_net,
      dest_ce => ce_22240000_sg_x4,
      dest_clk => clk_22240000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5560000_sg_x2,
      src_clk => clk_5560000_sg_x2,
      src_clr => '0',
      q => down_sample4_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      d => register_q_net_x1,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      d => register_q_net_x1,
      en(0) => relational2_op_net,
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      d => register_q_net_x1,
      en(0) => relational3_op_net,
      rst => "0",
      q => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      d => register_q_net_x1,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_367321bc0c
    port map (
      a => delay2_q_net_x0,
      b => constant_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_367321bc0c
    port map (
      a => delay2_q_net_x0,
      b => constant1_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_367321bc0c
    port map (
      a => delay2_q_net_x0,
      b => constant3_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_367321bc0c
    port map (
      a => delay2_q_net_x0,
      b => constant4_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational3_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/TDDM_monit_amp_c"

entity tddm_monit_amp_c_entity_5b2613eff7 is
  port (
    ce_22240000: in std_logic; 
    ce_5560000: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5560000: in std_logic; 
    monit_ch_in: in std_logic_vector(1 downto 0); 
    monit_din: in std_logic_vector(23 downto 0); 
    monit_ch0_out: out std_logic_vector(23 downto 0); 
    monit_ch1_out: out std_logic_vector(23 downto 0); 
    monit_ch2_out: out std_logic_vector(23 downto 0); 
    monit_ch3_out: out std_logic_vector(23 downto 0)
  );
end tddm_monit_amp_c_entity_5b2613eff7;

architecture structural of tddm_monit_amp_c_entity_5b2613eff7 is
  signal ce_22240000_sg_x5: std_logic;
  signal ce_5560000_sg_x3: std_logic;
  signal clk_22240000_sg_x5: std_logic;
  signal clk_5560000_sg_x3: std_logic;
  signal delay2_q_net_x1: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);

begin
  ce_22240000_sg_x5 <= ce_22240000;
  ce_5560000_sg_x3 <= ce_5560000;
  clk_22240000_sg_x5 <= clk_22240000;
  clk_5560000_sg_x3 <= clk_5560000;
  delay2_q_net_x1 <= monit_ch_in;
  register_q_net_x2 <= monit_din;
  monit_ch0_out <= down_sample2_q_net_x1;
  monit_ch1_out <= down_sample1_q_net_x1;
  monit_ch2_out <= down_sample3_q_net_x1;
  monit_ch3_out <= down_sample4_q_net_x1;

  tddm_monit_amp_c_int_554a834349: entity work.tddm_monit_amp_c_int_entity_554a834349
    port map (
      ce_22240000 => ce_22240000_sg_x5,
      ce_5560000 => ce_5560000_sg_x3,
      ch_in => delay2_q_net_x1,
      clk_22240000 => clk_22240000_sg_x5,
      clk_5560000 => clk_5560000_sg_x3,
      din => register_q_net_x2,
      dout_ch0 => down_sample2_q_net_x1,
      dout_ch1 => down_sample1_q_net_x1,
      dout_ch2 => down_sample3_q_net_x1,
      dout_ch3 => down_sample4_q_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c"

entity monit_amp_c_entity_c83793ea71 is
  port (
    ce_1: in std_logic; 
    ce_1390000: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2780000: in std_logic; 
    ce_556: in std_logic; 
    ce_5560000: in std_logic; 
    ce_logic_1390000: in std_logic; 
    ce_logic_2780000: in std_logic; 
    ce_logic_556: in std_logic; 
    ch_in: in std_logic_vector(1 downto 0); 
    clk_1: in std_logic; 
    clk_1390000: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2780000: in std_logic; 
    clk_556: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out_x1: out std_logic_vector(1 downto 0); 
    monit_cfir_x0: out std_logic; 
    monit_cic_x0: out std_logic; 
    monit_pfir_x0: out std_logic; 
    tddm_monit_amp_c: out std_logic_vector(23 downto 0); 
    tddm_monit_amp_c_x0: out std_logic_vector(23 downto 0); 
    tddm_monit_amp_c_x1: out std_logic_vector(23 downto 0); 
    tddm_monit_amp_c_x2: out std_logic_vector(23 downto 0)
  );
end monit_amp_c_entity_c83793ea71;

architecture structural of monit_amp_c_entity_c83793ea71 is
  signal ce_1390000_sg_x1: std_logic;
  signal ce_1_sg_x23: std_logic;
  signal ce_22240000_sg_x6: std_logic;
  signal ce_2780000_sg_x2: std_logic;
  signal ce_5560000_sg_x4: std_logic;
  signal ce_556_sg_x0: std_logic;
  signal ce_logic_1390000_sg_x0: std_logic;
  signal ce_logic_2780000_sg_x0: std_logic;
  signal ce_logic_556_sg_x0: std_logic;
  signal ch_out_x0: std_logic_vector(1 downto 0);
  signal clk_1390000_sg_x1: std_logic;
  signal clk_1_sg_x23: std_logic;
  signal clk_22240000_sg_x6: std_logic;
  signal clk_2780000_sg_x2: std_logic;
  signal clk_5560000_sg_x4: std_logic;
  signal clk_556_sg_x0: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal delay1_q_net: std_logic_vector(23 downto 0);
  signal delay2_q_net_x2: std_logic_vector(1 downto 0);
  signal delay3_q_net: std_logic_vector(23 downto 0);
  signal delay_q_net: std_logic_vector(1 downto 0);
  signal dout_x0: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x2: std_logic_vector(23 downto 0);
  signal monit_cfir_event_s_data_chanid_incorrect_net_x0: std_logic;
  signal monit_cfir_m_axis_data_tdata_net_x1: std_logic_vector(24 downto 0);
  signal monit_cfir_m_axis_data_tuser_chanid_net: std_logic_vector(1 downto 0);
  signal monit_cfir_m_axis_data_tvalid_net_x0: std_logic;
  signal monit_cic_event_tlast_unexpected_net_x0: std_logic;
  signal monit_cic_m_axis_data_tdata_data_net_x0: std_logic_vector(85 downto 0);
  signal monit_cic_m_axis_data_tuser_chan_out_net: std_logic_vector(1 downto 0);
  signal monit_cic_m_axis_data_tvalid_net_x0: std_logic;
  signal monit_pfir_event_s_data_chanid_incorrect_net_x0: std_logic;
  signal monit_pfir_m_axis_data_tdata_net_x1: std_logic_vector(24 downto 0);
  signal monit_pfir_m_axis_data_tuser_chanid_net: std_logic_vector(1 downto 0);
  signal monit_pfir_m_axis_data_tvalid_net_x0: std_logic;
  signal register3_q_net: std_logic_vector(1 downto 0);
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x3: std_logic_vector(23 downto 0);
  signal relational2_op_net: std_logic;

begin
  ce_1_sg_x23 <= ce_1;
  ce_1390000_sg_x1 <= ce_1390000;
  ce_22240000_sg_x6 <= ce_22240000;
  ce_2780000_sg_x2 <= ce_2780000;
  ce_556_sg_x0 <= ce_556;
  ce_5560000_sg_x4 <= ce_5560000;
  ce_logic_1390000_sg_x0 <= ce_logic_1390000;
  ce_logic_2780000_sg_x0 <= ce_logic_2780000;
  ce_logic_556_sg_x0 <= ce_logic_556;
  ch_out_x0 <= ch_in;
  clk_1_sg_x23 <= clk_1;
  clk_1390000_sg_x1 <= clk_1390000;
  clk_22240000_sg_x6 <= clk_22240000;
  clk_2780000_sg_x2 <= clk_2780000;
  clk_556_sg_x0 <= clk_556;
  clk_5560000_sg_x4 <= clk_5560000;
  dout_x0 <= din;
  amp_out <= register_q_net_x3;
  ch_out_x1 <= delay2_q_net_x2;
  monit_cfir_x0 <= monit_cfir_event_s_data_chanid_incorrect_net_x0;
  monit_cic_x0 <= monit_cic_event_tlast_unexpected_net_x0;
  monit_pfir_x0 <= monit_pfir_event_s_data_chanid_incorrect_net_x0;
  tddm_monit_amp_c <= down_sample1_q_net_x2;
  tddm_monit_amp_c_x0 <= down_sample2_q_net_x2;
  tddm_monit_amp_c_x1 <= down_sample3_q_net_x2;
  tddm_monit_amp_c_x2 <= down_sample4_q_net_x2;

  cast2_4b7421c7c9: entity work.cast2_entity_4b7421c7c9
    port map (
      ce_5560000 => ce_5560000_sg_x4,
      clk_5560000 => clk_5560000_sg_x4,
      data_in => monit_pfir_m_axis_data_tdata_net_x1,
      en => monit_pfir_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x3
    );

  cast4_4ed908d7fc: entity work.cast4_entity_4ed908d7fc
    port map (
      ce_2780000 => ce_2780000_sg_x2,
      clk_2780000 => clk_2780000_sg_x2,
      data_in => monit_cfir_m_axis_data_tdata_net_x1,
      en => monit_cfir_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x0
    );

  constant1: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 2
    )
    port map (
      ce => ce_1390000_sg_x1,
      clk => clk_1390000_sg_x1,
      d => monit_cic_m_axis_data_tuser_chan_out_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_556_sg_x0,
      clk => clk_556_sg_x0,
      d => dout_x0,
      en => '1',
      rst => '1',
      q => delay1_q_net
    );

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 2
    )
    port map (
      ce => ce_5560000_sg_x4,
      clk => clk_5560000_sg_x4,
      d => monit_pfir_m_axis_data_tuser_chanid_net,
      en => '1',
      rst => '1',
      q => delay2_q_net_x2
    );

  delay3: entity work.xldelay
    generic map (
      latency => 2,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1390000_sg_x1,
      clk => clk_1390000_sg_x1,
      d => register_q_net_x1,
      en => '1',
      rst => '1',
      q => delay3_q_net
    );

  monit_cfir: entity work.xlfir_compiler_65e3dc2de4cbc4151d5f0ef80691da61
    port map (
      ce => ce_1_sg_x23,
      ce_1390000 => ce_1390000_sg_x1,
      ce_2780000 => ce_2780000_sg_x2,
      ce_logic_1390000 => ce_logic_1390000_sg_x0,
      clk => clk_1_sg_x23,
      clk_1390000 => clk_1390000_sg_x1,
      clk_2780000 => clk_2780000_sg_x2,
      clk_logic_1390000 => clk_1390000_sg_x1,
      s_axis_data_tdata => delay3_q_net,
      s_axis_data_tuser_chanid => delay_q_net,
      src_ce => ce_1390000_sg_x1,
      src_clk => clk_1390000_sg_x1,
      event_s_data_chanid_incorrect => monit_cfir_event_s_data_chanid_incorrect_net_x0,
      m_axis_data_tdata => monit_cfir_m_axis_data_tdata_net_x1,
      m_axis_data_tuser_chanid => monit_cfir_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => monit_cfir_m_axis_data_tvalid_net_x0
    );

  monit_cic: entity work.xlcic_compiler_d242d339cba52806c866b8c35a6b5919
    port map (
      ce => ce_1_sg_x23,
      ce_1390000 => ce_1390000_sg_x1,
      ce_556 => ce_556_sg_x0,
      ce_logic_556 => ce_logic_556_sg_x0,
      clk => clk_1_sg_x23,
      clk_1390000 => clk_1390000_sg_x1,
      clk_556 => clk_556_sg_x0,
      clk_logic_556 => clk_556_sg_x0,
      s_axis_data_tdata_data => delay1_q_net,
      s_axis_data_tlast => relational2_op_net,
      event_tlast_unexpected => monit_cic_event_tlast_unexpected_net_x0,
      m_axis_data_tdata_data => monit_cic_m_axis_data_tdata_data_net_x0,
      m_axis_data_tuser_chan_out => monit_cic_m_axis_data_tuser_chan_out_net,
      m_axis_data_tvalid => monit_cic_m_axis_data_tvalid_net_x0
    );

  monit_pfir: entity work.xlfir_compiler_0056cabdbc14829b23232c505569667a
    port map (
      ce => ce_1_sg_x23,
      ce_2780000 => ce_2780000_sg_x2,
      ce_5560000 => ce_5560000_sg_x4,
      ce_logic_2780000 => ce_logic_2780000_sg_x0,
      clk => clk_1_sg_x23,
      clk_2780000 => clk_2780000_sg_x2,
      clk_5560000 => clk_5560000_sg_x4,
      clk_logic_2780000 => clk_2780000_sg_x2,
      s_axis_data_tdata => register_q_net_x0,
      s_axis_data_tuser_chanid => register3_q_net,
      src_ce => ce_2780000_sg_x2,
      src_clk => clk_2780000_sg_x2,
      event_s_data_chanid_incorrect => monit_pfir_event_s_data_chanid_incorrect_net_x0,
      m_axis_data_tdata => monit_pfir_m_axis_data_tdata_net_x1,
      m_axis_data_tuser_chanid => monit_pfir_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => monit_pfir_m_axis_data_tvalid_net_x0
    );

  reg1_8661a44192: entity work.reg1_entity_8661a44192
    port map (
      ce_1390000 => ce_1390000_sg_x1,
      clk_1390000 => clk_1390000_sg_x1,
      din => monit_cic_m_axis_data_tdata_data_net_x0,
      en => monit_cic_m_axis_data_tvalid_net_x0,
      dout => register_q_net_x1
    );

  register3: entity work.xlregister
    generic map (
      d_width => 2,
      init_value => b"00"
    )
    port map (
      ce => ce_2780000_sg_x2,
      clk => clk_2780000_sg_x2,
      d => monit_cfir_m_axis_data_tuser_chanid_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  relational2: entity work.relational_83ca2c6a3c
    port map (
      a => ch_out_x0,
      b => constant1_op_net,
      ce => ce_556_sg_x0,
      clk => clk_556_sg_x0,
      clr => '0',
      op(0) => relational2_op_net
    );

  tddm_monit_amp_c_5b2613eff7: entity work.tddm_monit_amp_c_entity_5b2613eff7
    port map (
      ce_22240000 => ce_22240000_sg_x6,
      ce_5560000 => ce_5560000_sg_x4,
      clk_22240000 => clk_22240000_sg_x6,
      clk_5560000 => clk_5560000_sg_x4,
      monit_ch_in => delay2_q_net_x2,
      monit_din => register_q_net_x3,
      monit_ch0_out => down_sample2_q_net_x2,
      monit_ch1_out => down_sample1_q_net_x2,
      monit_ch2_out => down_sample3_q_net_x2,
      monit_ch3_out => down_sample4_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/TDDM_monit_amp_out"

entity tddm_monit_amp_out_entity_521eb373cc is
  port (
    ce_22240000: in std_logic; 
    ce_5560000: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5560000: in std_logic; 
    monit_amp_ch_in: in std_logic_vector(1 downto 0); 
    monit_amp_din: in std_logic_vector(23 downto 0); 
    monit_amp_data0_out: out std_logic_vector(23 downto 0); 
    monit_amp_data1_out: out std_logic_vector(23 downto 0); 
    monit_amp_data2_out: out std_logic_vector(23 downto 0); 
    monit_amp_data3_out: out std_logic_vector(23 downto 0)
  );
end tddm_monit_amp_out_entity_521eb373cc;

architecture structural of tddm_monit_amp_out_entity_521eb373cc is
  signal ce_22240000_sg_x8: std_logic;
  signal ce_5560000_sg_x6: std_logic;
  signal clk_22240000_sg_x8: std_logic;
  signal clk_5560000_sg_x6: std_logic;
  signal delay2_q_net_x4: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(23 downto 0);

begin
  ce_22240000_sg_x8 <= ce_22240000;
  ce_5560000_sg_x6 <= ce_5560000;
  clk_22240000_sg_x8 <= clk_22240000;
  clk_5560000_sg_x6 <= clk_5560000;
  delay2_q_net_x4 <= monit_amp_ch_in;
  register_q_net_x5 <= monit_amp_din;
  monit_amp_data0_out <= down_sample2_q_net_x1;
  monit_amp_data1_out <= down_sample1_q_net_x1;
  monit_amp_data2_out <= down_sample3_q_net_x1;
  monit_amp_data3_out <= down_sample4_q_net_x1;

  tddm_monit_amp_out_int_b60196c7a6: entity work.tddm_monit_amp_c_int_entity_554a834349
    port map (
      ce_22240000 => ce_22240000_sg_x8,
      ce_5560000 => ce_5560000_sg_x6,
      ch_in => delay2_q_net_x4,
      clk_22240000 => clk_22240000_sg_x8,
      clk_5560000 => clk_5560000_sg_x6,
      din => register_q_net_x5,
      dout_ch0 => down_sample2_q_net_x1,
      dout_ch1 => down_sample1_q_net_x1,
      dout_ch2 => down_sample3_q_net_x1,
      dout_ch3 => down_sample4_q_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp"

entity monit_amp_entity_44da74e268 is
  port (
    ce_1: in std_logic; 
    ce_1390000: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2780000: in std_logic; 
    ce_556: in std_logic; 
    ce_5560000: in std_logic; 
    ce_logic_1390000: in std_logic; 
    ce_logic_2780000: in std_logic; 
    ce_logic_556: in std_logic; 
    ch_in: in std_logic_vector(1 downto 0); 
    clk_1: in std_logic; 
    clk_1390000: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2780000: in std_logic; 
    clk_556: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    amp_out0: out std_logic_vector(23 downto 0); 
    amp_out1: out std_logic_vector(23 downto 0); 
    amp_out2: out std_logic_vector(23 downto 0); 
    amp_out3: out std_logic_vector(23 downto 0); 
    monit_amp_c: out std_logic_vector(23 downto 0); 
    monit_amp_c_x0: out std_logic_vector(23 downto 0); 
    monit_amp_c_x1: out std_logic_vector(23 downto 0); 
    monit_amp_c_x2: out std_logic_vector(23 downto 0); 
    monit_amp_c_x3: out std_logic; 
    monit_amp_c_x4: out std_logic; 
    monit_amp_c_x5: out std_logic
  );
end monit_amp_entity_44da74e268;

architecture structural of monit_amp_entity_44da74e268 is
  signal ce_1390000_sg_x2: std_logic;
  signal ce_1_sg_x24: std_logic;
  signal ce_22240000_sg_x9: std_logic;
  signal ce_2780000_sg_x3: std_logic;
  signal ce_5560000_sg_x7: std_logic;
  signal ce_556_sg_x1: std_logic;
  signal ce_logic_1390000_sg_x1: std_logic;
  signal ce_logic_2780000_sg_x1: std_logic;
  signal ce_logic_556_sg_x1: std_logic;
  signal ch_out_x1: std_logic_vector(1 downto 0);
  signal clk_1390000_sg_x2: std_logic;
  signal clk_1_sg_x24: std_logic;
  signal clk_22240000_sg_x9: std_logic;
  signal clk_2780000_sg_x3: std_logic;
  signal clk_5560000_sg_x7: std_logic;
  signal clk_556_sg_x1: std_logic;
  signal delay2_q_net_x4: std_logic_vector(1 downto 0);
  signal dout_x1: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x4: std_logic_vector(23 downto 0);
  signal monit_cfir_event_s_data_chanid_incorrect_net_x1: std_logic;
  signal monit_cic_event_tlast_unexpected_net_x1: std_logic;
  signal monit_pfir_event_s_data_chanid_incorrect_net_x1: std_logic;
  signal register_q_net_x5: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x24 <= ce_1;
  ce_1390000_sg_x2 <= ce_1390000;
  ce_22240000_sg_x9 <= ce_22240000;
  ce_2780000_sg_x3 <= ce_2780000;
  ce_556_sg_x1 <= ce_556;
  ce_5560000_sg_x7 <= ce_5560000;
  ce_logic_1390000_sg_x1 <= ce_logic_1390000;
  ce_logic_2780000_sg_x1 <= ce_logic_2780000;
  ce_logic_556_sg_x1 <= ce_logic_556;
  ch_out_x1 <= ch_in;
  clk_1_sg_x24 <= clk_1;
  clk_1390000_sg_x2 <= clk_1390000;
  clk_22240000_sg_x9 <= clk_22240000;
  clk_2780000_sg_x3 <= clk_2780000;
  clk_556_sg_x1 <= clk_556;
  clk_5560000_sg_x7 <= clk_5560000;
  dout_x1 <= din;
  amp_out0 <= down_sample2_q_net_x4;
  amp_out1 <= down_sample1_q_net_x4;
  amp_out2 <= down_sample3_q_net_x4;
  amp_out3 <= down_sample4_q_net_x4;
  monit_amp_c <= down_sample1_q_net_x3;
  monit_amp_c_x0 <= down_sample2_q_net_x3;
  monit_amp_c_x1 <= down_sample3_q_net_x3;
  monit_amp_c_x2 <= down_sample4_q_net_x3;
  monit_amp_c_x3 <= monit_cfir_event_s_data_chanid_incorrect_net_x1;
  monit_amp_c_x4 <= monit_cic_event_tlast_unexpected_net_x1;
  monit_amp_c_x5 <= monit_pfir_event_s_data_chanid_incorrect_net_x1;

  monit_amp_c_c83793ea71: entity work.monit_amp_c_entity_c83793ea71
    port map (
      ce_1 => ce_1_sg_x24,
      ce_1390000 => ce_1390000_sg_x2,
      ce_22240000 => ce_22240000_sg_x9,
      ce_2780000 => ce_2780000_sg_x3,
      ce_556 => ce_556_sg_x1,
      ce_5560000 => ce_5560000_sg_x7,
      ce_logic_1390000 => ce_logic_1390000_sg_x1,
      ce_logic_2780000 => ce_logic_2780000_sg_x1,
      ce_logic_556 => ce_logic_556_sg_x1,
      ch_in => ch_out_x1,
      clk_1 => clk_1_sg_x24,
      clk_1390000 => clk_1390000_sg_x2,
      clk_22240000 => clk_22240000_sg_x9,
      clk_2780000 => clk_2780000_sg_x3,
      clk_556 => clk_556_sg_x1,
      clk_5560000 => clk_5560000_sg_x7,
      din => dout_x1,
      amp_out => register_q_net_x5,
      ch_out_x1 => delay2_q_net_x4,
      monit_cfir_x0 => monit_cfir_event_s_data_chanid_incorrect_net_x1,
      monit_cic_x0 => monit_cic_event_tlast_unexpected_net_x1,
      monit_pfir_x0 => monit_pfir_event_s_data_chanid_incorrect_net_x1,
      tddm_monit_amp_c => down_sample1_q_net_x3,
      tddm_monit_amp_c_x0 => down_sample2_q_net_x3,
      tddm_monit_amp_c_x1 => down_sample3_q_net_x3,
      tddm_monit_amp_c_x2 => down_sample4_q_net_x3
    );

  tddm_monit_amp_out_521eb373cc: entity work.tddm_monit_amp_out_entity_521eb373cc
    port map (
      ce_22240000 => ce_22240000_sg_x9,
      ce_5560000 => ce_5560000_sg_x7,
      clk_22240000 => clk_22240000_sg_x9,
      clk_5560000 => clk_5560000_sg_x7,
      monit_amp_ch_in => delay2_q_net_x4,
      monit_amp_din => register_q_net_x5,
      monit_amp_data0_out => down_sample2_q_net_x4,
      monit_amp_data1_out => down_sample1_q_net_x4,
      monit_amp_data2_out => down_sample3_q_net_x4,
      monit_amp_data3_out => down_sample4_q_net_x4
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_CORDIC/TDDM_tbt_cordic/TDDM_tbt_cordic"

entity tddm_tbt_cordic_entity_5b94be40c5 is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ch_in: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic_entity_5b94be40c5;

architecture structural of tddm_tbt_cordic_entity_5b94be40c5 is
  signal ce_35_sg_x0: std_logic;
  signal ce_70_sg_x4: std_logic;
  signal clk_35_sg_x0: std_logic;
  signal clk_70_sg_x4: std_logic;
  signal constant1_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register5_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_35_sg_x0 <= ce_35;
  ce_70_sg_x4 <= ce_70;
  register1_q_net_x1 <= ch_in;
  clk_35_sg_x0 <= clk_35;
  clk_70_sg_x4 <= clk_70;
  register5_q_net_x0 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;

  constant1: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register1_q_net_x0,
      dest_ce => ce_70_sg_x4,
      dest_clk => clk_70_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x0,
      src_clk => clk_35_sg_x0,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_70_sg_x4,
      dest_clk => clk_70_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x0,
      src_clk => clk_35_sg_x0,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x0,
      clk => clk_35_sg_x0,
      d => register5_q_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x0,
      clk => clk_35_sg_x0,
      d => register5_q_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x1,
      b(0) => constant_op_net,
      ce => ce_35_sg_x0,
      clk => clk_35_sg_x0,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x1,
      b(0) => constant1_op_net,
      ce => ce_35_sg_x0,
      clk => clk_35_sg_x0,
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_CORDIC/TDDM_tbt_cordic/TDDM_tbt_cordic1"

entity tddm_tbt_cordic1_entity_d3f44a687c is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ch_in: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic1_entity_d3f44a687c;

architecture structural of tddm_tbt_cordic1_entity_d3f44a687c is
  signal ce_35_sg_x1: std_logic;
  signal ce_70_sg_x5: std_logic;
  signal clk_35_sg_x1: std_logic;
  signal clk_70_sg_x5: std_logic;
  signal constant1_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register4_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_35_sg_x1 <= ce_35;
  ce_70_sg_x5 <= ce_70;
  register1_q_net_x2 <= ch_in;
  clk_35_sg_x1 <= clk_35;
  clk_70_sg_x5 <= clk_70;
  register4_q_net_x0 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;

  constant1: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 24
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_70_sg_x5,
      dest_clk => clk_70_sg_x5,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x1,
      src_clk => clk_35_sg_x1,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_70_sg_x5,
      dest_clk => clk_70_sg_x5,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x1,
      src_clk => clk_35_sg_x1,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      d => register4_q_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      d => register4_q_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x2,
      b(0) => constant_op_net,
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_a892e1bf40
    port map (
      a(0) => register1_q_net_x2,
      b(0) => constant1_op_net,
      ce => ce_35_sg_x1,
      clk => clk_35_sg_x1,
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_CORDIC/TDDM_tbt_cordic"

entity tddm_tbt_cordic_entity_18d3979a26 is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    tbt_cordic_ch_in: in std_logic; 
    tbt_cordic_din: in std_logic_vector(23 downto 0); 
    tbt_cordic_pin: in std_logic_vector(23 downto 0); 
    tbt_cordic_data0_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_data1_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_phase0_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_phase1_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic_entity_18d3979a26;

architecture structural of tddm_tbt_cordic_entity_18d3979a26 is
  signal ce_35_sg_x2: std_logic;
  signal ce_70_sg_x6: std_logic;
  signal clk_35_sg_x2: std_logic;
  signal clk_70_sg_x6: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x1: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x2 <= ce_35;
  ce_70_sg_x6 <= ce_70;
  clk_35_sg_x2 <= clk_35;
  clk_70_sg_x6 <= clk_70;
  register1_q_net_x3 <= tbt_cordic_ch_in;
  register5_q_net_x1 <= tbt_cordic_din;
  register4_q_net_x1 <= tbt_cordic_pin;
  tbt_cordic_data0_out <= down_sample2_q_net_x2;
  tbt_cordic_data1_out <= down_sample1_q_net_x2;
  tbt_cordic_phase0_out <= down_sample2_q_net_x3;
  tbt_cordic_phase1_out <= down_sample1_q_net_x3;

  tddm_tbt_cordic1_d3f44a687c: entity work.tddm_tbt_cordic1_entity_d3f44a687c
    port map (
      ce_35 => ce_35_sg_x2,
      ce_70 => ce_70_sg_x6,
      ch_in => register1_q_net_x3,
      clk_35 => clk_35_sg_x2,
      clk_70 => clk_70_sg_x6,
      din => register4_q_net_x1,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

  tddm_tbt_cordic_5b94be40c5: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x2,
      ce_70 => ce_70_sg_x6,
      ch_in => register1_q_net_x3,
      clk_35 => clk_35_sg_x2,
      clk_70 => clk_70_sg_x6,
      din => register5_q_net_x1,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_CORDIC"

entity tbt_cordic_entity_232cb2e43e is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ch_in: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in: in std_logic_vector(24 downto 0); 
    q_in: in std_logic_vector(24 downto 0); 
    valid_in: in std_logic; 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    tddm_tbt_cordic: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic_x2: out std_logic_vector(23 downto 0)
  );
end tbt_cordic_entity_232cb2e43e;

architecture structural of tbt_cordic_entity_232cb2e43e is
  signal ce_35_sg_x3: std_logic;
  signal ce_70_sg_x7: std_logic;
  signal clk_35_sg_x3: std_logic;
  signal clk_70_sg_x7: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_phase_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register2_q_net_x0: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x3 <= ce_35;
  ce_70_sg_x7 <= ce_70;
  register2_q_net_x0 <= ch_in;
  clk_35_sg_x3 <= clk_35;
  clk_70_sg_x7 <= clk_70;
  register_q_net_x1 <= i_in;
  register_q_net_x2 <= q_in;
  register1_q_net_x0 <= valid_in;
  amp_out <= register5_q_net_x2;
  ch_out <= register1_q_net_x4;
  tddm_tbt_cordic <= down_sample1_q_net_x4;
  tddm_tbt_cordic_x0 <= down_sample2_q_net_x4;
  tddm_tbt_cordic_x1 <= down_sample1_q_net_x5;
  tddm_tbt_cordic_x2 <= down_sample2_q_net_x5;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
      s_axis_cartesian_tdata_imag => register_q_net_x2,
      s_axis_cartesian_tdata_real => register_q_net_x1,
      s_axis_cartesian_tuser_user(0) => register2_q_net_x0,
      s_axis_cartesian_tvalid => register1_q_net_x0,
      m_axis_dout_tdata_phase => rect2pol_m_axis_dout_tdata_phase_net,
      m_axis_dout_tdata_real => rect2pol_m_axis_dout_tdata_real_net,
      m_axis_dout_tuser_cartesian_tuser(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      m_axis_dout_tvalid => rect2pol_m_axis_dout_tvalid_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x4
    );

  register4: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
      d => reinterpret2_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register4_q_net_x1
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x2
    );

  reinterpret2: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_phase_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_real_net,
      output_port => reinterpret3_output_port_net
    );

  tddm_tbt_cordic_18d3979a26: entity work.tddm_tbt_cordic_entity_18d3979a26
    port map (
      ce_35 => ce_35_sg_x3,
      ce_70 => ce_70_sg_x7,
      clk_35 => clk_35_sg_x3,
      clk_70 => clk_70_sg_x7,
      tbt_cordic_ch_in => register1_q_net_x4,
      tbt_cordic_din => register5_q_net_x2,
      tbt_cordic_pin => register4_q_net_x1,
      tbt_cordic_data0_out => down_sample2_q_net_x4,
      tbt_cordic_data1_out => down_sample1_q_net_x4,
      tbt_cordic_phase0_out => down_sample2_q_net_x5,
      tbt_cordic_phase1_out => down_sample1_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_poly_decim/Reg1"

entity reg1_entity_c0124f1ecd is
  port (
    ce_35: in std_logic; 
    clk_35: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0)
  );
end reg1_entity_c0124f1ecd;

architecture structural of reg1_entity_c0124f1ecd is
  signal ce_35_sg_x4: std_logic;
  signal clk_35_sg_x4: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path0_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tvalid_net_x0: std_logic;

begin
  ce_35_sg_x4 <= ce_35;
  clk_35_sg_x4 <= clk_35;
  tbt_poly_m_axis_data_tdata_path0_net_x0 <= din;
  tbt_poly_m_axis_data_tvalid_net_x0 <= en;
  dout <= register_q_net_x2;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_35_sg_x4,
      clk => clk_35_sg_x4,
      clr => '0',
      din => reinterpret2_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x4,
      clk => clk_35_sg_x4,
      d => convert_dout_net,
      en(0) => tbt_poly_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x2
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => tbt_poly_m_axis_data_tdata_path0_net_x0,
      output_port => reinterpret2_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_poly_decim/Reg2"

entity reg2_entity_b776b02b7b is
  port (
    ce_35: in std_logic; 
    clk_35: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end reg2_entity_b776b02b7b;

architecture structural of reg2_entity_b776b02b7b is
  signal ce_35_sg_x5: std_logic;
  signal clk_35_sg_x5: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register_q_net_x3: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path1_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_35_sg_x5 <= ce_35;
  clk_35_sg_x5 <= clk_35;
  tbt_poly_m_axis_data_tdata_path1_net_x0 <= din;
  tbt_poly_m_axis_data_tvalid_net_x1 <= en;
  dout <= register_q_net_x3;
  valid_out <= register1_q_net_x1;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 23,
      din_width => 25,
      dout_arith => 2,
      dout_bin_pt => 23,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_35_sg_x5,
      clk => clk_35_sg_x5,
      clr => '0',
      din => reinterpret2_output_port_net,
      en => "1",
      dout => convert_dout_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x5,
      clk => clk_35_sg_x5,
      d(0) => tbt_poly_m_axis_data_tvalid_net_x1,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x5,
      clk => clk_35_sg_x5,
      d => convert_dout_net,
      en(0) => tbt_poly_m_axis_data_tvalid_net_x1,
      rst => "0",
      q => register_q_net_x3
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => tbt_poly_m_axis_data_tdata_path1_net_x0,
      output_port => reinterpret2_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_poly_decim/TDDM_TBT/TDDM_tbt_poly_i"

entity tddm_tbt_poly_i_entity_469601736c is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ch_in: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    din: in std_logic_vector(23 downto 0); 
    dout_ch0: out std_logic_vector(23 downto 0); 
    dout_ch1: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_poly_i_entity_469601736c;

architecture structural of tddm_tbt_poly_i_entity_469601736c is
  signal ce_35_sg_x6: std_logic;
  signal ce_70_sg_x8: std_logic;
  signal clk_35_sg_x6: std_logic;
  signal clk_70_sg_x8: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register2_q_net_x1: std_logic;
  signal register_q_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_35_sg_x6 <= ce_35;
  ce_70_sg_x8 <= ce_70;
  register2_q_net_x1 <= ch_in;
  clk_35_sg_x6 <= clk_35;
  clk_70_sg_x8 <= clk_70;
  reinterpret_output_port_net_x0 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_70_sg_x8,
      dest_clk => clk_70_sg_x8,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x6,
      src_clk => clk_35_sg_x6,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register_q_net,
      dest_ce => ce_70_sg_x8,
      dest_clk => clk_70_sg_x8,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x6,
      src_clk => clk_35_sg_x6,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x6,
      clk => clk_35_sg_x6,
      d => reinterpret_output_port_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x6,
      clk => clk_35_sg_x6,
      d => reinterpret_output_port_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => register2_q_net_x1,
      b(0) => constant_op_net,
      ce => ce_35_sg_x6,
      clk => clk_35_sg_x6,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_d29d27b7b3
    port map (
      a(0) => register2_q_net_x1,
      b => constant1_op_net,
      ce => ce_35_sg_x6,
      clk => clk_35_sg_x6,
      clr => '0',
      op(0) => relational1_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_poly_decim/TDDM_TBT"

entity tddm_tbt_entity_9ac9f65b0b is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    tbt_ch_in: in std_logic; 
    tbt_i_in: in std_logic_vector(23 downto 0); 
    tbt_q_in: in std_logic_vector(23 downto 0); 
    poly35_ch0_i_out: out std_logic_vector(23 downto 0); 
    poly35_ch0_q_out: out std_logic_vector(23 downto 0); 
    poly35_ch1_i_out: out std_logic_vector(23 downto 0); 
    poly35_ch1_q_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_entity_9ac9f65b0b;

architecture structural of tddm_tbt_entity_9ac9f65b0b is
  signal ce_35_sg_x8: std_logic;
  signal ce_70_sg_x10: std_logic;
  signal clk_35_sg_x8: std_logic;
  signal clk_70_sg_x10: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register2_q_net_x3: std_logic;
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x8 <= ce_35;
  ce_70_sg_x10 <= ce_70;
  clk_35_sg_x8 <= clk_35;
  clk_70_sg_x10 <= clk_70;
  register2_q_net_x3 <= tbt_ch_in;
  reinterpret_output_port_net_x3 <= tbt_i_in;
  reinterpret_output_port_net_x2 <= tbt_q_in;
  poly35_ch0_i_out <= down_sample2_q_net_x2;
  poly35_ch0_q_out <= down_sample2_q_net_x3;
  poly35_ch1_i_out <= down_sample1_q_net_x2;
  poly35_ch1_q_out <= down_sample1_q_net_x3;

  tddm_tbt_poly_i_469601736c: entity work.tddm_tbt_poly_i_entity_469601736c
    port map (
      ce_35 => ce_35_sg_x8,
      ce_70 => ce_70_sg_x10,
      ch_in => register2_q_net_x3,
      clk_35 => clk_35_sg_x8,
      clk_70 => clk_70_sg_x10,
      din => reinterpret_output_port_net_x3,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_poly_q_8011b4e29e: entity work.tddm_tbt_poly_i_entity_469601736c
    port map (
      ce_35 => ce_35_sg_x8,
      ce_70 => ce_70_sg_x10,
      ch_in => register2_q_net_x3,
      clk_35 => clk_35_sg_x8,
      clk_70 => clk_70_sg_x10,
      din => reinterpret_output_port_net_x2,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_poly_decim"

entity tbt_poly_decim_entity_4477ec06c2 is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    tbt_poly_x0: out std_logic; 
    tddm_tbt: out std_logic_vector(23 downto 0); 
    tddm_tbt_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_x2: out std_logic_vector(23 downto 0); 
    valid_out: out std_logic
  );
end tbt_poly_decim_entity_4477ec06c2;

architecture structural of tbt_poly_decim_entity_4477ec06c2 is
  signal ce_1_sg_x25: std_logic;
  signal ce_35_sg_x9: std_logic;
  signal ce_70_sg_x11: std_logic;
  signal ce_logic_1_sg_x12: std_logic;
  signal clk_1_sg_x25: std_logic;
  signal clk_35_sg_x9: std_logic;
  signal clk_70_sg_x11: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register2_q_net_x4: std_logic;
  signal register3_q_net_x12: std_logic;
  signal register4_q_net_x11: std_logic_vector(23 downto 0);
  signal register5_q_net_x9: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(24 downto 0);
  signal register_q_net_x6: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);
  signal tbt_poly_event_s_data_chanid_incorrect_net_x0: std_logic;
  signal tbt_poly_m_axis_data_tdata_path0_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path1_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_1_sg_x25 <= ce_1;
  ce_35_sg_x9 <= ce_35;
  ce_70_sg_x11 <= ce_70;
  ce_logic_1_sg_x12 <= ce_logic_1;
  register3_q_net_x12 <= ch_in;
  clk_1_sg_x25 <= clk_1;
  clk_35_sg_x9 <= clk_35;
  clk_70_sg_x11 <= clk_70;
  register4_q_net_x11 <= i_in;
  register5_q_net_x9 <= q_in;
  ch_out <= register2_q_net_x4;
  i_out <= register_q_net_x5;
  q_out <= register_q_net_x6;
  tbt_poly_x0 <= tbt_poly_event_s_data_chanid_incorrect_net_x0;
  tddm_tbt <= down_sample1_q_net_x4;
  tddm_tbt_x0 <= down_sample2_q_net_x4;
  tddm_tbt_x1 <= down_sample1_q_net_x5;
  tddm_tbt_x2 <= down_sample2_q_net_x5;
  valid_out <= register1_q_net_x2;

  reg1_c0124f1ecd: entity work.reg1_entity_c0124f1ecd
    port map (
      ce_35 => ce_35_sg_x9,
      clk_35 => clk_35_sg_x9,
      din => tbt_poly_m_axis_data_tdata_path0_net_x0,
      en => tbt_poly_m_axis_data_tvalid_net_x1,
      dout => register_q_net_x5
    );

  reg2_b776b02b7b: entity work.reg2_entity_b776b02b7b
    port map (
      ce_35 => ce_35_sg_x9,
      clk_35 => clk_35_sg_x9,
      din => tbt_poly_m_axis_data_tdata_path1_net_x0,
      en => tbt_poly_m_axis_data_tvalid_net_x1,
      dout => register_q_net_x6,
      valid_out => register1_q_net_x2
    );

  register2: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x9,
      clk => clk_35_sg_x9,
      d(0) => tbt_poly_m_axis_data_tuser_chanid_net,
      en => "1",
      rst => "0",
      q(0) => register2_q_net_x4
    );

  tbt_poly: entity work.xlfir_compiler_cb59bf20628cd53f2fe06f08cc2c9b7e
    port map (
      ce => ce_1_sg_x25,
      ce_35 => ce_35_sg_x9,
      ce_logic_1 => ce_logic_1_sg_x12,
      clk => clk_1_sg_x25,
      clk_35 => clk_35_sg_x9,
      clk_logic_1 => clk_1_sg_x25,
      s_axis_data_tdata_path0 => register4_q_net_x11,
      s_axis_data_tdata_path1 => register5_q_net_x9,
      s_axis_data_tuser_chanid(0) => register3_q_net_x12,
      src_ce => ce_1_sg_x25,
      src_clk => clk_1_sg_x25,
      event_s_data_chanid_incorrect => tbt_poly_event_s_data_chanid_incorrect_net_x0,
      m_axis_data_tdata_path0 => tbt_poly_m_axis_data_tdata_path0_net_x0,
      m_axis_data_tdata_path1 => tbt_poly_m_axis_data_tdata_path1_net_x0,
      m_axis_data_tuser_chanid(0) => tbt_poly_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => tbt_poly_m_axis_data_tvalid_net_x1
    );

  tddm_tbt_9ac9f65b0b: entity work.tddm_tbt_entity_9ac9f65b0b
    port map (
      ce_35 => ce_35_sg_x9,
      ce_70 => ce_70_sg_x11,
      clk_35 => clk_35_sg_x9,
      clk_70 => clk_70_sg_x11,
      tbt_ch_in => register2_q_net_x4,
      tbt_i_in => reinterpret_output_port_net_x4,
      tbt_q_in => reinterpret_output_port_net_x3,
      poly35_ch0_i_out => down_sample2_q_net_x4,
      poly35_ch0_q_out => down_sample2_q_net_x5,
      poly35_ch1_i_out => down_sample1_q_net_x4,
      poly35_ch1_q_out => down_sample1_q_net_x5
    );

  trunc1_841a61ebcc: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x5,
      dout => reinterpret_output_port_net_x4
    );

  trunc_e5eda8a5ac: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x6,
      dout => reinterpret_output_port_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0"

entity tbt_amp0_entity_88b1c45f0e is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    tbt_cordic: out std_logic_vector(23 downto 0); 
    tbt_cordic_x0: out std_logic_vector(23 downto 0); 
    tbt_cordic_x1: out std_logic_vector(23 downto 0); 
    tbt_cordic_x2: out std_logic_vector(23 downto 0); 
    tbt_poly_decim: out std_logic; 
    tbt_poly_decim_x0: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x1: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x2: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x3: out std_logic_vector(23 downto 0)
  );
end tbt_amp0_entity_88b1c45f0e;

architecture structural of tbt_amp0_entity_88b1c45f0e is
  signal ce_1_sg_x26: std_logic;
  signal ce_35_sg_x10: std_logic;
  signal ce_70_sg_x12: std_logic;
  signal ce_logic_1_sg_x13: std_logic;
  signal clk_1_sg_x26: std_logic;
  signal clk_35_sg_x10: std_logic;
  signal clk_70_sg_x12: std_logic;
  signal down_sample1_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x9: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x9: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register1_q_net_x5: std_logic;
  signal register2_q_net_x4: std_logic;
  signal register3_q_net_x13: std_logic;
  signal register4_q_net_x12: std_logic_vector(23 downto 0);
  signal register5_q_net_x10: std_logic_vector(23 downto 0);
  signal register5_q_net_x11: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(24 downto 0);
  signal register_q_net_x6: std_logic_vector(24 downto 0);
  signal tbt_poly_event_s_data_chanid_incorrect_net_x1: std_logic;

begin
  ce_1_sg_x26 <= ce_1;
  ce_35_sg_x10 <= ce_35;
  ce_70_sg_x12 <= ce_70;
  ce_logic_1_sg_x13 <= ce_logic_1;
  register3_q_net_x13 <= ch_in;
  clk_1_sg_x26 <= clk_1;
  clk_35_sg_x10 <= clk_35;
  clk_70_sg_x12 <= clk_70;
  register4_q_net_x12 <= i_in;
  register5_q_net_x10 <= q_in;
  amp_out <= register5_q_net_x11;
  ch_out <= register1_q_net_x5;
  tbt_cordic <= down_sample1_q_net_x8;
  tbt_cordic_x0 <= down_sample2_q_net_x8;
  tbt_cordic_x1 <= down_sample1_q_net_x9;
  tbt_cordic_x2 <= down_sample2_q_net_x9;
  tbt_poly_decim <= tbt_poly_event_s_data_chanid_incorrect_net_x1;
  tbt_poly_decim_x0 <= down_sample1_q_net_x10;
  tbt_poly_decim_x1 <= down_sample2_q_net_x10;
  tbt_poly_decim_x2 <= down_sample1_q_net_x11;
  tbt_poly_decim_x3 <= down_sample2_q_net_x11;

  tbt_cordic_232cb2e43e: entity work.tbt_cordic_entity_232cb2e43e
    port map (
      ce_35 => ce_35_sg_x10,
      ce_70 => ce_70_sg_x12,
      ch_in => register2_q_net_x4,
      clk_35 => clk_35_sg_x10,
      clk_70 => clk_70_sg_x12,
      i_in => register_q_net_x5,
      q_in => register_q_net_x6,
      valid_in => register1_q_net_x2,
      amp_out => register5_q_net_x11,
      ch_out => register1_q_net_x5,
      tddm_tbt_cordic => down_sample1_q_net_x8,
      tddm_tbt_cordic_x0 => down_sample2_q_net_x8,
      tddm_tbt_cordic_x1 => down_sample1_q_net_x9,
      tddm_tbt_cordic_x2 => down_sample2_q_net_x9
    );

  tbt_poly_decim_4477ec06c2: entity work.tbt_poly_decim_entity_4477ec06c2
    port map (
      ce_1 => ce_1_sg_x26,
      ce_35 => ce_35_sg_x10,
      ce_70 => ce_70_sg_x12,
      ce_logic_1 => ce_logic_1_sg_x13,
      ch_in => register3_q_net_x13,
      clk_1 => clk_1_sg_x26,
      clk_35 => clk_35_sg_x10,
      clk_70 => clk_70_sg_x12,
      i_in => register4_q_net_x12,
      q_in => register5_q_net_x10,
      ch_out => register2_q_net_x4,
      i_out => register_q_net_x5,
      q_out => register_q_net_x6,
      tbt_poly_x0 => tbt_poly_event_s_data_chanid_incorrect_net_x1,
      tddm_tbt => down_sample1_q_net_x10,
      tddm_tbt_x0 => down_sample2_q_net_x10,
      tddm_tbt_x1 => down_sample1_q_net_x11,
      tddm_tbt_x2 => down_sample2_q_net_x11,
      valid_out => register1_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp1/TBT_CORDIC/TDDM_tbt_cordic"

entity tddm_tbt_cordic_entity_9e99bd206d is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    tbt_cordic_ch_in: in std_logic; 
    tbt_cordic_din: in std_logic_vector(23 downto 0); 
    tbt_cordic_pin: in std_logic_vector(23 downto 0); 
    tbt_cordic_ch2_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_ch3_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_phase0_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_phase1_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic_entity_9e99bd206d;

architecture structural of tddm_tbt_cordic_entity_9e99bd206d is
  signal ce_35_sg_x13: std_logic;
  signal ce_70_sg_x15: std_logic;
  signal clk_35_sg_x13: std_logic;
  signal clk_70_sg_x15: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x1: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x13 <= ce_35;
  ce_70_sg_x15 <= ce_70;
  clk_35_sg_x13 <= clk_35;
  clk_70_sg_x15 <= clk_70;
  register1_q_net_x3 <= tbt_cordic_ch_in;
  register5_q_net_x1 <= tbt_cordic_din;
  register4_q_net_x1 <= tbt_cordic_pin;
  tbt_cordic_ch2_out <= down_sample2_q_net_x2;
  tbt_cordic_ch3_out <= down_sample1_q_net_x2;
  tbt_cordic_phase0_out <= down_sample2_q_net_x3;
  tbt_cordic_phase1_out <= down_sample1_q_net_x3;

  tddm_tbt_cordic1_d22fbdac88: entity work.tddm_tbt_cordic1_entity_d3f44a687c
    port map (
      ce_35 => ce_35_sg_x13,
      ce_70 => ce_70_sg_x15,
      ch_in => register1_q_net_x3,
      clk_35 => clk_35_sg_x13,
      clk_70 => clk_70_sg_x15,
      din => register4_q_net_x1,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

  tddm_tbt_cordic_f04a48283a: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x13,
      ce_70 => ce_70_sg_x15,
      ch_in => register1_q_net_x3,
      clk_35 => clk_35_sg_x13,
      clk_70 => clk_70_sg_x15,
      din => register5_q_net_x1,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp1/TBT_CORDIC"

entity tbt_cordic_entity_9dc3371de2 is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ch_in: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in: in std_logic_vector(24 downto 0); 
    q_in: in std_logic_vector(24 downto 0); 
    valid_in: in std_logic; 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    tddm_tbt_cordic: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_cordic_x2: out std_logic_vector(23 downto 0)
  );
end tbt_cordic_entity_9dc3371de2;

architecture structural of tbt_cordic_entity_9dc3371de2 is
  signal ce_35_sg_x14: std_logic;
  signal ce_70_sg_x16: std_logic;
  signal clk_35_sg_x14: std_logic;
  signal clk_70_sg_x16: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_phase_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register2_q_net_x0: std_logic;
  signal register4_q_net_x1: std_logic_vector(23 downto 0);
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x14 <= ce_35;
  ce_70_sg_x16 <= ce_70;
  register2_q_net_x0 <= ch_in;
  clk_35_sg_x14 <= clk_35;
  clk_70_sg_x16 <= clk_70;
  register_q_net_x1 <= i_in;
  register_q_net_x2 <= q_in;
  register1_q_net_x0 <= valid_in;
  amp_out <= register5_q_net_x2;
  ch_out <= register1_q_net_x4;
  tddm_tbt_cordic <= down_sample1_q_net_x4;
  tddm_tbt_cordic_x0 <= down_sample2_q_net_x4;
  tddm_tbt_cordic_x1 <= down_sample1_q_net_x5;
  tddm_tbt_cordic_x2 <= down_sample2_q_net_x5;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_35_sg_x14,
      clk => clk_35_sg_x14,
      s_axis_cartesian_tdata_imag => register_q_net_x2,
      s_axis_cartesian_tdata_real => register_q_net_x1,
      s_axis_cartesian_tuser_user(0) => register2_q_net_x0,
      s_axis_cartesian_tvalid => register1_q_net_x0,
      m_axis_dout_tdata_phase => rect2pol_m_axis_dout_tdata_phase_net,
      m_axis_dout_tdata_real => rect2pol_m_axis_dout_tdata_real_net,
      m_axis_dout_tuser_cartesian_tuser(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      m_axis_dout_tvalid => rect2pol_m_axis_dout_tvalid_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x14,
      clk => clk_35_sg_x14,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x4
    );

  register4: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x14,
      clk => clk_35_sg_x14,
      d => reinterpret2_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register4_q_net_x1
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x14,
      clk => clk_35_sg_x14,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x2
    );

  reinterpret2: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_phase_net,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => rect2pol_m_axis_dout_tdata_real_net,
      output_port => reinterpret3_output_port_net
    );

  tddm_tbt_cordic_9e99bd206d: entity work.tddm_tbt_cordic_entity_9e99bd206d
    port map (
      ce_35 => ce_35_sg_x14,
      ce_70 => ce_70_sg_x16,
      clk_35 => clk_35_sg_x14,
      clk_70 => clk_70_sg_x16,
      tbt_cordic_ch_in => register1_q_net_x4,
      tbt_cordic_din => register5_q_net_x2,
      tbt_cordic_pin => register4_q_net_x1,
      tbt_cordic_ch2_out => down_sample2_q_net_x4,
      tbt_cordic_ch3_out => down_sample1_q_net_x4,
      tbt_cordic_phase0_out => down_sample2_q_net_x5,
      tbt_cordic_phase1_out => down_sample1_q_net_x5
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp1/TBT_poly_decim/TDDM_TBT"

entity tddm_tbt_entity_1f4b61e651 is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    tbt_ch_in: in std_logic; 
    tbt_i_in: in std_logic_vector(23 downto 0); 
    tbt_q_in: in std_logic_vector(23 downto 0); 
    poly35_ch2_i_out: out std_logic_vector(23 downto 0); 
    poly35_ch2_q_out: out std_logic_vector(23 downto 0); 
    poly35_ch3_i_out: out std_logic_vector(23 downto 0); 
    poly35_ch3_q_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_entity_1f4b61e651;

architecture structural of tddm_tbt_entity_1f4b61e651 is
  signal ce_35_sg_x19: std_logic;
  signal ce_70_sg_x19: std_logic;
  signal clk_35_sg_x19: std_logic;
  signal clk_70_sg_x19: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register2_q_net_x3: std_logic;
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x19 <= ce_35;
  ce_70_sg_x19 <= ce_70;
  clk_35_sg_x19 <= clk_35;
  clk_70_sg_x19 <= clk_70;
  register2_q_net_x3 <= tbt_ch_in;
  reinterpret_output_port_net_x3 <= tbt_i_in;
  reinterpret_output_port_net_x2 <= tbt_q_in;
  poly35_ch2_i_out <= down_sample2_q_net_x2;
  poly35_ch2_q_out <= down_sample2_q_net_x3;
  poly35_ch3_i_out <= down_sample1_q_net_x2;
  poly35_ch3_q_out <= down_sample1_q_net_x3;

  tddm_tbt_poly_i_b74b709553: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x19,
      ce_70 => ce_70_sg_x19,
      ch_in => register2_q_net_x3,
      clk_35 => clk_35_sg_x19,
      clk_70 => clk_70_sg_x19,
      din => reinterpret_output_port_net_x3,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_poly_q_4f85d7362a: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x19,
      ce_70 => ce_70_sg_x19,
      ch_in => register2_q_net_x3,
      clk_35 => clk_35_sg_x19,
      clk_70 => clk_70_sg_x19,
      din => reinterpret_output_port_net_x2,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp1/TBT_poly_decim"

entity tbt_poly_decim_entity_bb6f6b5b6a is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    tbt_poly_x0: out std_logic; 
    tddm_tbt: out std_logic_vector(23 downto 0); 
    tddm_tbt_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_x2: out std_logic_vector(23 downto 0); 
    valid_out: out std_logic
  );
end tbt_poly_decim_entity_bb6f6b5b6a;

architecture structural of tbt_poly_decim_entity_bb6f6b5b6a is
  signal ce_1_sg_x27: std_logic;
  signal ce_35_sg_x20: std_logic;
  signal ce_70_sg_x20: std_logic;
  signal ce_logic_1_sg_x14: std_logic;
  signal clk_1_sg_x27: std_logic;
  signal clk_35_sg_x20: std_logic;
  signal clk_70_sg_x20: std_logic;
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register2_q_net_x4: std_logic;
  signal register3_q_net_x13: std_logic;
  signal register4_q_net_x12: std_logic_vector(23 downto 0);
  signal register5_q_net_x13: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(24 downto 0);
  signal register_q_net_x6: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);
  signal tbt_poly_event_s_data_chanid_incorrect_net_x0: std_logic;
  signal tbt_poly_m_axis_data_tdata_path0_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path1_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_1_sg_x27 <= ce_1;
  ce_35_sg_x20 <= ce_35;
  ce_70_sg_x20 <= ce_70;
  ce_logic_1_sg_x14 <= ce_logic_1;
  register3_q_net_x13 <= ch_in;
  clk_1_sg_x27 <= clk_1;
  clk_35_sg_x20 <= clk_35;
  clk_70_sg_x20 <= clk_70;
  register4_q_net_x12 <= i_in;
  register5_q_net_x13 <= q_in;
  ch_out <= register2_q_net_x4;
  i_out <= register_q_net_x5;
  q_out <= register_q_net_x6;
  tbt_poly_x0 <= tbt_poly_event_s_data_chanid_incorrect_net_x0;
  tddm_tbt <= down_sample1_q_net_x4;
  tddm_tbt_x0 <= down_sample2_q_net_x4;
  tddm_tbt_x1 <= down_sample1_q_net_x5;
  tddm_tbt_x2 <= down_sample2_q_net_x5;
  valid_out <= register1_q_net_x2;

  reg1_9d12977a4c: entity work.reg1_entity_c0124f1ecd
    port map (
      ce_35 => ce_35_sg_x20,
      clk_35 => clk_35_sg_x20,
      din => tbt_poly_m_axis_data_tdata_path0_net_x0,
      en => tbt_poly_m_axis_data_tvalid_net_x1,
      dout => register_q_net_x5
    );

  reg2_89251a4665: entity work.reg2_entity_b776b02b7b
    port map (
      ce_35 => ce_35_sg_x20,
      clk_35 => clk_35_sg_x20,
      din => tbt_poly_m_axis_data_tdata_path1_net_x0,
      en => tbt_poly_m_axis_data_tvalid_net_x1,
      dout => register_q_net_x6,
      valid_out => register1_q_net_x2
    );

  register2: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_35_sg_x20,
      clk => clk_35_sg_x20,
      d(0) => tbt_poly_m_axis_data_tuser_chanid_net,
      en => "1",
      rst => "0",
      q(0) => register2_q_net_x4
    );

  tbt_poly: entity work.xlfir_compiler_cb59bf20628cd53f2fe06f08cc2c9b7e
    port map (
      ce => ce_1_sg_x27,
      ce_35 => ce_35_sg_x20,
      ce_logic_1 => ce_logic_1_sg_x14,
      clk => clk_1_sg_x27,
      clk_35 => clk_35_sg_x20,
      clk_logic_1 => clk_1_sg_x27,
      s_axis_data_tdata_path0 => register4_q_net_x12,
      s_axis_data_tdata_path1 => register5_q_net_x13,
      s_axis_data_tuser_chanid(0) => register3_q_net_x13,
      src_ce => ce_1_sg_x27,
      src_clk => clk_1_sg_x27,
      event_s_data_chanid_incorrect => tbt_poly_event_s_data_chanid_incorrect_net_x0,
      m_axis_data_tdata_path0 => tbt_poly_m_axis_data_tdata_path0_net_x0,
      m_axis_data_tdata_path1 => tbt_poly_m_axis_data_tdata_path1_net_x0,
      m_axis_data_tuser_chanid(0) => tbt_poly_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => tbt_poly_m_axis_data_tvalid_net_x1
    );

  tddm_tbt_1f4b61e651: entity work.tddm_tbt_entity_1f4b61e651
    port map (
      ce_35 => ce_35_sg_x20,
      ce_70 => ce_70_sg_x20,
      clk_35 => clk_35_sg_x20,
      clk_70 => clk_70_sg_x20,
      tbt_ch_in => register2_q_net_x4,
      tbt_i_in => reinterpret_output_port_net_x4,
      tbt_q_in => reinterpret_output_port_net_x3,
      poly35_ch2_i_out => down_sample2_q_net_x4,
      poly35_ch2_q_out => down_sample2_q_net_x5,
      poly35_ch3_i_out => down_sample1_q_net_x4,
      poly35_ch3_q_out => down_sample1_q_net_x5
    );

  trunc1_c3e3bdeec5: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x5,
      dout => reinterpret_output_port_net_x4
    );

  trunc_6a2a4db298: entity work.trunc_entity_937044c900
    port map (
      din => register_q_net_x6,
      dout => reinterpret_output_port_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp1"

entity tbt_amp1_entity_6e98f85f9f is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in: in std_logic_vector(23 downto 0); 
    q_in: in std_logic_vector(23 downto 0); 
    amp_out: out std_logic_vector(23 downto 0); 
    ch_out: out std_logic; 
    tbt_cordic: out std_logic_vector(23 downto 0); 
    tbt_cordic_x0: out std_logic_vector(23 downto 0); 
    tbt_cordic_x1: out std_logic_vector(23 downto 0); 
    tbt_cordic_x2: out std_logic_vector(23 downto 0); 
    tbt_poly_decim: out std_logic; 
    tbt_poly_decim_x0: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x1: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x2: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x3: out std_logic_vector(23 downto 0)
  );
end tbt_amp1_entity_6e98f85f9f;

architecture structural of tbt_amp1_entity_6e98f85f9f is
  signal ce_1_sg_x28: std_logic;
  signal ce_35_sg_x21: std_logic;
  signal ce_70_sg_x21: std_logic;
  signal ce_logic_1_sg_x15: std_logic;
  signal clk_1_sg_x28: std_logic;
  signal clk_35_sg_x21: std_logic;
  signal clk_70_sg_x21: std_logic;
  signal down_sample1_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x9: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x10: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x9: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register1_q_net_x5: std_logic;
  signal register2_q_net_x4: std_logic;
  signal register3_q_net_x14: std_logic;
  signal register4_q_net_x13: std_logic_vector(23 downto 0);
  signal register5_q_net_x14: std_logic_vector(23 downto 0);
  signal register5_q_net_x3: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(24 downto 0);
  signal register_q_net_x6: std_logic_vector(24 downto 0);
  signal tbt_poly_event_s_data_chanid_incorrect_net_x1: std_logic;

begin
  ce_1_sg_x28 <= ce_1;
  ce_35_sg_x21 <= ce_35;
  ce_70_sg_x21 <= ce_70;
  ce_logic_1_sg_x15 <= ce_logic_1;
  register3_q_net_x14 <= ch_in;
  clk_1_sg_x28 <= clk_1;
  clk_35_sg_x21 <= clk_35;
  clk_70_sg_x21 <= clk_70;
  register4_q_net_x13 <= i_in;
  register5_q_net_x14 <= q_in;
  amp_out <= register5_q_net_x3;
  ch_out <= register1_q_net_x5;
  tbt_cordic <= down_sample1_q_net_x8;
  tbt_cordic_x0 <= down_sample2_q_net_x8;
  tbt_cordic_x1 <= down_sample1_q_net_x9;
  tbt_cordic_x2 <= down_sample2_q_net_x9;
  tbt_poly_decim <= tbt_poly_event_s_data_chanid_incorrect_net_x1;
  tbt_poly_decim_x0 <= down_sample1_q_net_x10;
  tbt_poly_decim_x1 <= down_sample2_q_net_x10;
  tbt_poly_decim_x2 <= down_sample1_q_net_x11;
  tbt_poly_decim_x3 <= down_sample2_q_net_x11;

  tbt_cordic_9dc3371de2: entity work.tbt_cordic_entity_9dc3371de2
    port map (
      ce_35 => ce_35_sg_x21,
      ce_70 => ce_70_sg_x21,
      ch_in => register2_q_net_x4,
      clk_35 => clk_35_sg_x21,
      clk_70 => clk_70_sg_x21,
      i_in => register_q_net_x5,
      q_in => register_q_net_x6,
      valid_in => register1_q_net_x2,
      amp_out => register5_q_net_x3,
      ch_out => register1_q_net_x5,
      tddm_tbt_cordic => down_sample1_q_net_x8,
      tddm_tbt_cordic_x0 => down_sample2_q_net_x8,
      tddm_tbt_cordic_x1 => down_sample1_q_net_x9,
      tddm_tbt_cordic_x2 => down_sample2_q_net_x9
    );

  tbt_poly_decim_bb6f6b5b6a: entity work.tbt_poly_decim_entity_bb6f6b5b6a
    port map (
      ce_1 => ce_1_sg_x28,
      ce_35 => ce_35_sg_x21,
      ce_70 => ce_70_sg_x21,
      ce_logic_1 => ce_logic_1_sg_x15,
      ch_in => register3_q_net_x14,
      clk_1 => clk_1_sg_x28,
      clk_35 => clk_35_sg_x21,
      clk_70 => clk_70_sg_x21,
      i_in => register4_q_net_x13,
      q_in => register5_q_net_x14,
      ch_out => register2_q_net_x4,
      i_out => register_q_net_x5,
      q_out => register_q_net_x6,
      tbt_poly_x0 => tbt_poly_event_s_data_chanid_incorrect_net_x1,
      tddm_tbt => down_sample1_q_net_x10,
      tddm_tbt_x0 => down_sample2_q_net_x10,
      tddm_tbt_x1 => down_sample1_q_net_x11,
      tddm_tbt_x2 => down_sample2_q_net_x11,
      valid_out => register1_q_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TDDM_tbt_amp_4ch"

entity tddm_tbt_amp_4ch_entity_9f3ac0073e is
  port (
    amp_in0: in std_logic_vector(23 downto 0); 
    amp_in1: in std_logic_vector(23 downto 0); 
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ch_in0: in std_logic; 
    ch_in1: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    amp_out0: out std_logic_vector(23 downto 0); 
    amp_out1: out std_logic_vector(23 downto 0); 
    amp_out2: out std_logic_vector(23 downto 0); 
    amp_out3: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_amp_4ch_entity_9f3ac0073e;

architecture structural of tddm_tbt_amp_4ch_entity_9f3ac0073e is
  signal ce_35_sg_x24: std_logic;
  signal ce_70_sg_x24: std_logic;
  signal clk_35_sg_x24: std_logic;
  signal clk_70_sg_x24: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register1_q_net_x8: std_logic;
  signal register1_q_net_x9: std_logic;
  signal register5_q_net_x13: std_logic_vector(23 downto 0);
  signal register5_q_net_x5: std_logic_vector(23 downto 0);

begin
  register5_q_net_x13 <= amp_in0;
  register5_q_net_x5 <= amp_in1;
  ce_35_sg_x24 <= ce_35;
  ce_70_sg_x24 <= ce_70;
  register1_q_net_x8 <= ch_in0;
  register1_q_net_x9 <= ch_in1;
  clk_35_sg_x24 <= clk_35;
  clk_70_sg_x24 <= clk_70;
  amp_out0 <= down_sample2_q_net_x2;
  amp_out1 <= down_sample1_q_net_x2;
  amp_out2 <= down_sample2_q_net_x3;
  amp_out3 <= down_sample1_q_net_x3;

  tddm_tbt_amp0_8f2b25894a: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x24,
      ce_70 => ce_70_sg_x24,
      ch_in => register1_q_net_x8,
      clk_35 => clk_35_sg_x24,
      clk_70 => clk_70_sg_x24,
      din => register5_q_net_x13,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_amp1_0c4a2e4770: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x24,
      ce_70 => ce_70_sg_x24,
      ch_in => register1_q_net_x9,
      clk_35 => clk_35_sg_x24,
      clk_70 => clk_70_sg_x24,
      din => register5_q_net_x5,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp"

entity tbt_amp_entity_cbd277bb0c is
  port (
    ce_1: in std_logic; 
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ch_in0: in std_logic; 
    ch_in1: in std_logic; 
    clk_1: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    i_in0: in std_logic_vector(23 downto 0); 
    i_in1: in std_logic_vector(23 downto 0); 
    q_in0: in std_logic_vector(23 downto 0); 
    q_in1: in std_logic_vector(23 downto 0); 
    amp_out0: out std_logic_vector(23 downto 0); 
    amp_out1: out std_logic_vector(23 downto 0); 
    amp_out2: out std_logic_vector(23 downto 0); 
    amp_out3: out std_logic_vector(23 downto 0); 
    tbt_amp0: out std_logic_vector(23 downto 0); 
    tbt_amp0_x0: out std_logic_vector(23 downto 0); 
    tbt_amp0_x1: out std_logic_vector(23 downto 0); 
    tbt_amp0_x2: out std_logic_vector(23 downto 0); 
    tbt_amp0_x3: out std_logic; 
    tbt_amp0_x4: out std_logic_vector(23 downto 0); 
    tbt_amp0_x5: out std_logic_vector(23 downto 0); 
    tbt_amp0_x6: out std_logic_vector(23 downto 0); 
    tbt_amp0_x7: out std_logic_vector(23 downto 0); 
    tbt_amp1: out std_logic_vector(23 downto 0); 
    tbt_amp1_x0: out std_logic_vector(23 downto 0); 
    tbt_amp1_x1: out std_logic_vector(23 downto 0); 
    tbt_amp1_x2: out std_logic_vector(23 downto 0); 
    tbt_amp1_x3: out std_logic; 
    tbt_amp1_x4: out std_logic_vector(23 downto 0); 
    tbt_amp1_x5: out std_logic_vector(23 downto 0); 
    tbt_amp1_x6: out std_logic_vector(23 downto 0); 
    tbt_amp1_x7: out std_logic_vector(23 downto 0)
  );
end tbt_amp_entity_cbd277bb0c;

architecture structural of tbt_amp_entity_cbd277bb0c is
  signal ce_1_sg_x29: std_logic;
  signal ce_35_sg_x25: std_logic;
  signal ce_70_sg_x25: std_logic;
  signal ce_logic_1_sg_x16: std_logic;
  signal clk_1_sg_x29: std_logic;
  signal clk_35_sg_x25: std_logic;
  signal clk_70_sg_x25: std_logic;
  signal down_sample1_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x22: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x23: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x24: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x25: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x22: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x23: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x24: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x25: std_logic_vector(23 downto 0);
  signal register1_q_net_x8: std_logic;
  signal register1_q_net_x9: std_logic;
  signal register3_q_net_x15: std_logic;
  signal register3_q_net_x16: std_logic;
  signal register4_q_net_x14: std_logic_vector(23 downto 0);
  signal register4_q_net_x15: std_logic_vector(23 downto 0);
  signal register5_q_net_x13: std_logic_vector(23 downto 0);
  signal register5_q_net_x15: std_logic_vector(23 downto 0);
  signal register5_q_net_x16: std_logic_vector(23 downto 0);
  signal register5_q_net_x5: std_logic_vector(23 downto 0);
  signal tbt_poly_event_s_data_chanid_incorrect_net_x3: std_logic;
  signal tbt_poly_event_s_data_chanid_incorrect_net_x4: std_logic;

begin
  ce_1_sg_x29 <= ce_1;
  ce_35_sg_x25 <= ce_35;
  ce_70_sg_x25 <= ce_70;
  ce_logic_1_sg_x16 <= ce_logic_1;
  register3_q_net_x15 <= ch_in0;
  register3_q_net_x16 <= ch_in1;
  clk_1_sg_x29 <= clk_1;
  clk_35_sg_x25 <= clk_35;
  clk_70_sg_x25 <= clk_70;
  register4_q_net_x14 <= i_in0;
  register4_q_net_x15 <= i_in1;
  register5_q_net_x15 <= q_in0;
  register5_q_net_x16 <= q_in1;
  amp_out0 <= down_sample2_q_net_x24;
  amp_out1 <= down_sample1_q_net_x24;
  amp_out2 <= down_sample2_q_net_x25;
  amp_out3 <= down_sample1_q_net_x25;
  tbt_amp0 <= down_sample1_q_net_x16;
  tbt_amp0_x0 <= down_sample2_q_net_x16;
  tbt_amp0_x1 <= down_sample1_q_net_x17;
  tbt_amp0_x2 <= down_sample2_q_net_x17;
  tbt_amp0_x3 <= tbt_poly_event_s_data_chanid_incorrect_net_x3;
  tbt_amp0_x4 <= down_sample1_q_net_x18;
  tbt_amp0_x5 <= down_sample2_q_net_x18;
  tbt_amp0_x6 <= down_sample1_q_net_x19;
  tbt_amp0_x7 <= down_sample2_q_net_x19;
  tbt_amp1 <= down_sample1_q_net_x20;
  tbt_amp1_x0 <= down_sample2_q_net_x20;
  tbt_amp1_x1 <= down_sample1_q_net_x21;
  tbt_amp1_x2 <= down_sample2_q_net_x21;
  tbt_amp1_x3 <= tbt_poly_event_s_data_chanid_incorrect_net_x4;
  tbt_amp1_x4 <= down_sample1_q_net_x22;
  tbt_amp1_x5 <= down_sample2_q_net_x22;
  tbt_amp1_x6 <= down_sample1_q_net_x23;
  tbt_amp1_x7 <= down_sample2_q_net_x23;

  tbt_amp0_88b1c45f0e: entity work.tbt_amp0_entity_88b1c45f0e
    port map (
      ce_1 => ce_1_sg_x29,
      ce_35 => ce_35_sg_x25,
      ce_70 => ce_70_sg_x25,
      ce_logic_1 => ce_logic_1_sg_x16,
      ch_in => register3_q_net_x15,
      clk_1 => clk_1_sg_x29,
      clk_35 => clk_35_sg_x25,
      clk_70 => clk_70_sg_x25,
      i_in => register4_q_net_x14,
      q_in => register5_q_net_x15,
      amp_out => register5_q_net_x13,
      ch_out => register1_q_net_x8,
      tbt_cordic => down_sample1_q_net_x16,
      tbt_cordic_x0 => down_sample2_q_net_x16,
      tbt_cordic_x1 => down_sample1_q_net_x17,
      tbt_cordic_x2 => down_sample2_q_net_x17,
      tbt_poly_decim => tbt_poly_event_s_data_chanid_incorrect_net_x3,
      tbt_poly_decim_x0 => down_sample1_q_net_x18,
      tbt_poly_decim_x1 => down_sample2_q_net_x18,
      tbt_poly_decim_x2 => down_sample1_q_net_x19,
      tbt_poly_decim_x3 => down_sample2_q_net_x19
    );

  tbt_amp1_6e98f85f9f: entity work.tbt_amp1_entity_6e98f85f9f
    port map (
      ce_1 => ce_1_sg_x29,
      ce_35 => ce_35_sg_x25,
      ce_70 => ce_70_sg_x25,
      ce_logic_1 => ce_logic_1_sg_x16,
      ch_in => register3_q_net_x16,
      clk_1 => clk_1_sg_x29,
      clk_35 => clk_35_sg_x25,
      clk_70 => clk_70_sg_x25,
      i_in => register4_q_net_x15,
      q_in => register5_q_net_x16,
      amp_out => register5_q_net_x5,
      ch_out => register1_q_net_x9,
      tbt_cordic => down_sample1_q_net_x20,
      tbt_cordic_x0 => down_sample2_q_net_x20,
      tbt_cordic_x1 => down_sample1_q_net_x21,
      tbt_cordic_x2 => down_sample2_q_net_x21,
      tbt_poly_decim => tbt_poly_event_s_data_chanid_incorrect_net_x4,
      tbt_poly_decim_x0 => down_sample1_q_net_x22,
      tbt_poly_decim_x1 => down_sample2_q_net_x22,
      tbt_poly_decim_x2 => down_sample1_q_net_x23,
      tbt_poly_decim_x3 => down_sample2_q_net_x23
    );

  tddm_tbt_amp_4ch_9f3ac0073e: entity work.tddm_tbt_amp_4ch_entity_9f3ac0073e
    port map (
      amp_in0 => register5_q_net_x13,
      amp_in1 => register5_q_net_x5,
      ce_35 => ce_35_sg_x25,
      ce_70 => ce_70_sg_x25,
      ch_in0 => register1_q_net_x8,
      ch_in1 => register1_q_net_x9,
      clk_35 => clk_35_sg_x25,
      clk_70 => clk_70_sg_x25,
      amp_out0 => down_sample2_q_net_x24,
      amp_out1 => down_sample1_q_net_x24,
      amp_out2 => down_sample2_q_net_x25,
      amp_out3 => down_sample1_q_net_x25
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM_mix/TDM_mix_ch0_1"

entity tdm_mix_ch0_1_entity_b9bb73dd5f is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    din_ch0: in std_logic_vector(23 downto 0); 
    din_ch1: in std_logic_vector(23 downto 0); 
    rst: in std_logic; 
    ch_out: out std_logic; 
    dout: out std_logic_vector(23 downto 0)
  );
end tdm_mix_ch0_1_entity_b9bb73dd5f;

architecture structural of tdm_mix_ch0_1_entity_b9bb73dd5f is
  signal ce_1_sg_x30: std_logic;
  signal ce_2_sg_x32: std_logic;
  signal ce_logic_1_sg_x17: std_logic;
  signal clk_1_sg_x30: std_logic;
  signal clk_2_sg_x32: std_logic;
  signal clock_enable_probe_q_net: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal mux_sel1_op_net: std_logic;
  signal mux_y_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x4: std_logic_vector(23 downto 0);
  signal register1_q_net_x5: std_logic;
  signal register_q_net_x17: std_logic_vector(23 downto 0);
  signal register_q_net_x3: std_logic_vector(23 downto 0);
  signal up_sample_ch0_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch1_q_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x30 <= ce_1;
  ce_2_sg_x32 <= ce_2;
  ce_logic_1_sg_x17 <= ce_logic_1;
  clk_1_sg_x30 <= clk_1;
  clk_2_sg_x32 <= clk_2;
  register_q_net_x3 <= din_ch0;
  register1_q_net_x4 <= din_ch1;
  constant10_op_net_x0 <= rst;
  ch_out <= register1_q_net_x5;
  dout <= register_q_net_x17;

  clock_enable_probe: entity work.xlceprobe
    generic map (
      d_width => 24,
      q_width => 1
    )
    port map (
      ce => ce_logic_1_sg_x17,
      clk => clk_1_sg_x30,
      d => up_sample_ch0_q_net,
      q(0) => clock_enable_probe_q_net
    );

  mux: entity work.mux_a2121d82da
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => up_sample_ch0_q_net,
      d1 => up_sample_ch1_q_net,
      sel(0) => mux_sel1_op_net,
      y => mux_y_net
    );

  mux_sel1: entity work.counter_41314d726b
    port map (
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      clr => '0',
      en(0) => clock_enable_probe_q_net,
      rst(0) => constant10_op_net_x0,
      op(0) => mux_sel1_op_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      d(0) => mux_sel1_op_net,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x5
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x30,
      clk => clk_1_sg_x30,
      d => mux_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x17
    );

  up_sample_ch0: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register_q_net_x3,
      dest_ce => ce_1_sg_x30,
      dest_clk => clk_1_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x32,
      src_clk => clk_2_sg_x32,
      src_clr => '0',
      q => up_sample_ch0_q_net
    );

  up_sample_ch1: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => register1_q_net_x4,
      dest_ce => ce_1_sg_x30,
      dest_clk => clk_1_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x32,
      src_clk => clk_2_sg_x32,
      src_clr => '0',
      q => up_sample_ch1_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM_mix"

entity tdm_mix_entity_54ce67e6e8 is
  port (
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_logic_1: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    din_ch0: in std_logic_vector(23 downto 0); 
    din_ch1: in std_logic_vector(23 downto 0); 
    din_ch2: in std_logic_vector(23 downto 0); 
    din_ch3: in std_logic_vector(23 downto 0); 
    ch_out0: out std_logic; 
    ch_out1: out std_logic; 
    dout0: out std_logic_vector(23 downto 0); 
    dout1: out std_logic_vector(23 downto 0)
  );
end tdm_mix_entity_54ce67e6e8;

architecture structural of tdm_mix_entity_54ce67e6e8 is
  signal ce_1_sg_x32: std_logic;
  signal ce_2_sg_x34: std_logic;
  signal ce_logic_1_sg_x19: std_logic;
  signal clk_1_sg_x32: std_logic;
  signal clk_2_sg_x34: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal register1_q_net_x7: std_logic_vector(23 downto 0);
  signal register1_q_net_x8: std_logic;
  signal register1_q_net_x9: std_logic;
  signal register2_q_net_x4: std_logic_vector(23 downto 0);
  signal register3_q_net_x4: std_logic_vector(23 downto 0);
  signal register_q_net_x19: std_logic_vector(23 downto 0);
  signal register_q_net_x20: std_logic_vector(23 downto 0);
  signal register_q_net_x21: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x32 <= ce_1;
  ce_2_sg_x34 <= ce_2;
  ce_logic_1_sg_x19 <= ce_logic_1;
  clk_1_sg_x32 <= clk_1;
  clk_2_sg_x34 <= clk_2;
  register_q_net_x19 <= din_ch0;
  register1_q_net_x7 <= din_ch1;
  register2_q_net_x4 <= din_ch2;
  register3_q_net_x4 <= din_ch3;
  ch_out0 <= register1_q_net_x8;
  ch_out1 <= register1_q_net_x9;
  dout0 <= register_q_net_x20;
  dout1 <= register_q_net_x21;

  constant10: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant10_op_net_x0
    );

  constant11: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant11_op_net_x0
    );

  tdm_mix_ch0_1_b9bb73dd5f: entity work.tdm_mix_ch0_1_entity_b9bb73dd5f
    port map (
      ce_1 => ce_1_sg_x32,
      ce_2 => ce_2_sg_x34,
      ce_logic_1 => ce_logic_1_sg_x19,
      clk_1 => clk_1_sg_x32,
      clk_2 => clk_2_sg_x34,
      din_ch0 => register_q_net_x19,
      din_ch1 => register1_q_net_x7,
      rst => constant10_op_net_x0,
      ch_out => register1_q_net_x8,
      dout => register_q_net_x20
    );

  tdm_mix_ch0_2_e9327141fc: entity work.tdm_mix_ch0_1_entity_b9bb73dd5f
    port map (
      ce_1 => ce_1_sg_x32,
      ce_2 => ce_2_sg_x34,
      ce_logic_1 => ce_logic_1_sg_x19,
      clk_1 => clk_1_sg_x32,
      clk_2 => clk_2_sg_x34,
      din_ch0 => register2_q_net_x4,
      din_ch1 => register3_q_net_x4,
      rst => constant11_op_net_x0,
      ch_out => register1_q_net_x9,
      dout => register_q_net_x21
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM_monit"

entity tdm_monit_entity_6e38292ecb is
  port (
    ce_1: in std_logic; 
    ce_2224: in std_logic; 
    ce_556: in std_logic; 
    ce_logic_556: in std_logic; 
    clk_1: in std_logic; 
    clk_2224: in std_logic; 
    clk_556: in std_logic; 
    din_ch0: in std_logic_vector(23 downto 0); 
    din_ch1: in std_logic_vector(23 downto 0); 
    din_ch2: in std_logic_vector(23 downto 0); 
    din_ch3: in std_logic_vector(23 downto 0); 
    rst: in std_logic; 
    ch_out: out std_logic_vector(1 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end tdm_monit_entity_6e38292ecb;

architecture structural of tdm_monit_entity_6e38292ecb is
  signal ce_1_sg_x33: std_logic;
  signal ce_2224_sg_x26: std_logic;
  signal ce_556_sg_x2: std_logic;
  signal ce_logic_556_sg_x2: std_logic;
  signal ch_out_x2: std_logic_vector(1 downto 0);
  signal clk_1_sg_x33: std_logic;
  signal clk_2224_sg_x26: std_logic;
  signal clk_556_sg_x2: std_logic;
  signal clock_enable_probe_q_net: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal dout_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x19: std_logic_vector(23 downto 0);
  signal mux_sel_op_net: std_logic_vector(1 downto 0);
  signal mux_y_net: std_logic_vector(23 downto 0);
  signal up_sample_ch0_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch1_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch2_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch3_q_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x33 <= ce_1;
  ce_2224_sg_x26 <= ce_2224;
  ce_556_sg_x2 <= ce_556;
  ce_logic_556_sg_x2 <= ce_logic_556;
  clk_1_sg_x33 <= clk_1;
  clk_2224_sg_x26 <= clk_2224;
  clk_556_sg_x2 <= clk_556;
  down_sample2_q_net_x18 <= din_ch0;
  down_sample1_q_net_x18 <= din_ch1;
  down_sample2_q_net_x19 <= din_ch2;
  down_sample1_q_net_x19 <= din_ch3;
  constant10_op_net_x0 <= rst;
  ch_out <= ch_out_x2;
  dout <= dout_x2;

  clock_enable_probe: entity work.xlceprobe
    generic map (
      d_width => 24,
      q_width => 1
    )
    port map (
      ce => ce_logic_556_sg_x2,
      clk => clk_556_sg_x2,
      d => up_sample_ch0_q_net,
      q(0) => clock_enable_probe_q_net
    );

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 2,
      ds_ratio => 556,
      latency => 1,
      phase => 555,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 2
    )
    port map (
      d => mux_sel_op_net,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x33,
      src_clk => clk_1_sg_x33,
      src_clr => '0',
      q => ch_out_x2
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      ds_ratio => 556,
      latency => 1,
      phase => 555,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => mux_y_net,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x33,
      src_clk => clk_1_sg_x33,
      src_clr => '0',
      q => dout_x2
    );

  mux: entity work.mux_f062741975
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => up_sample_ch0_q_net,
      d1 => up_sample_ch1_q_net,
      d2 => up_sample_ch2_q_net,
      d3 => up_sample_ch3_q_net,
      sel => mux_sel_op_net,
      y => mux_y_net
    );

  mux_sel: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_3166d4cc5b09c744",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x33,
      clk => clk_1_sg_x33,
      clr => '0',
      en(0) => clock_enable_probe_q_net,
      rst(0) => constant10_op_net_x0,
      op => mux_sel_op_net
    );

  up_sample_ch0: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => down_sample2_q_net_x18,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x26,
      src_clk => clk_2224_sg_x26,
      src_clr => '0',
      q => up_sample_ch0_q_net
    );

  up_sample_ch1: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => down_sample1_q_net_x18,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x26,
      src_clk => clk_2224_sg_x26,
      src_clr => '0',
      q => up_sample_ch1_q_net
    );

  up_sample_ch2: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => down_sample2_q_net_x19,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x26,
      src_clk => clk_2224_sg_x26,
      src_clr => '0',
      q => up_sample_ch2_q_net
    );

  up_sample_ch3: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 24,
      latency => 0,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 24
    )
    port map (
      d => down_sample1_q_net_x19,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x26,
      src_clk => clk_2224_sg_x26,
      src_clr => '0',
      q => up_sample_ch3_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM_monit_1/downsample"

entity downsample_entity_f33f90217c is
  port (
    ce_1: in std_logic; 
    ce_2500: in std_logic; 
    ce_5560000: in std_logic; 
    clk_1: in std_logic; 
    clk_2500: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(1 downto 0); 
    dout: out std_logic_vector(1 downto 0)
  );
end downsample_entity_f33f90217c;

architecture structural of downsample_entity_f33f90217c is
  signal ce_1_sg_x34: std_logic;
  signal ce_2500_sg_x0: std_logic;
  signal ce_5560000_sg_x8: std_logic;
  signal clk_1_sg_x34: std_logic;
  signal clk_2500_sg_x0: std_logic;
  signal clk_5560000_sg_x8: std_logic;
  signal delay_q_net_x0: std_logic_vector(1 downto 0);
  signal down_sample5_q_net: std_logic_vector(1 downto 0);
  signal down_sample_q_net: std_logic_vector(1 downto 0);
  signal mux_sel_op_net_x0: std_logic_vector(1 downto 0);

begin
  ce_1_sg_x34 <= ce_1;
  ce_2500_sg_x0 <= ce_2500;
  ce_5560000_sg_x8 <= ce_5560000;
  clk_1_sg_x34 <= clk_1;
  clk_2500_sg_x0 <= clk_2500;
  clk_5560000_sg_x8 <= clk_5560000;
  mux_sel_op_net_x0 <= din;
  dout <= delay_q_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 2
    )
    port map (
      ce => ce_5560000_sg_x8,
      clk => clk_5560000_sg_x8,
      d => down_sample_q_net,
      en => '1',
      rst => '1',
      q => delay_q_net_x0
    );

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 2,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 2
    )
    port map (
      d => down_sample5_q_net,
      dest_ce => ce_5560000_sg_x8,
      dest_clk => clk_5560000_sg_x8,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2500_sg_x0,
      src_clk => clk_2500_sg_x0,
      src_clr => '0',
      q => down_sample_q_net
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 2,
      ds_ratio => 2500,
      latency => 1,
      phase => 2499,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 2
    )
    port map (
      d => mux_sel_op_net_x0,
      dest_ce => ce_2500_sg_x0,
      dest_clk => clk_2500_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x34,
      src_clk => clk_1_sg_x34,
      src_clr => '0',
      q => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM_monit_1/downsample1"

entity downsample1_entity_312d531c6b is
  port (
    ce_1: in std_logic; 
    ce_2500: in std_logic; 
    ce_5560000: in std_logic; 
    clk_1: in std_logic; 
    clk_2500: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(25 downto 0); 
    dout: out std_logic_vector(25 downto 0)
  );
end downsample1_entity_312d531c6b;

architecture structural of downsample1_entity_312d531c6b is
  signal ce_1_sg_x35: std_logic;
  signal ce_2500_sg_x1: std_logic;
  signal ce_5560000_sg_x9: std_logic;
  signal clk_1_sg_x35: std_logic;
  signal clk_2500_sg_x1: std_logic;
  signal clk_5560000_sg_x9: std_logic;
  signal delay_q_net_x0: std_logic_vector(25 downto 0);
  signal down_sample5_q_net: std_logic_vector(25 downto 0);
  signal down_sample_q_net: std_logic_vector(25 downto 0);
  signal mux_y_net_x0: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x35 <= ce_1;
  ce_2500_sg_x1 <= ce_2500;
  ce_5560000_sg_x9 <= ce_5560000;
  clk_1_sg_x35 <= clk_1;
  clk_2500_sg_x1 <= clk_2500;
  clk_5560000_sg_x9 <= clk_5560000;
  mux_y_net_x0 <= din;
  dout <= delay_q_net_x0;

  delay: entity work.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_5560000_sg_x9,
      clk => clk_5560000_sg_x9,
      d => down_sample_q_net,
      en => '1',
      rst => '1',
      q => delay_q_net_x0
    );

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => down_sample5_q_net,
      dest_ce => ce_5560000_sg_x9,
      dest_clk => clk_5560000_sg_x9,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2500_sg_x1,
      src_clk => clk_2500_sg_x1,
      src_clr => '0',
      q => down_sample_q_net
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      ds_ratio => 2500,
      latency => 1,
      phase => 2499,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => mux_y_net_x0,
      dest_ce => ce_2500_sg_x1,
      dest_clk => clk_2500_sg_x1,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x35,
      src_clk => clk_1_sg_x35,
      src_clr => '0',
      q => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM_monit_1"

entity tdm_monit_1_entity_746ecf54b0 is
  port (
    ce_1: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2500: in std_logic; 
    ce_5560000: in std_logic; 
    ce_logic_5560000: in std_logic; 
    clk_1: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2500: in std_logic; 
    clk_5560000: in std_logic; 
    din_ch0: in std_logic_vector(25 downto 0); 
    din_ch1: in std_logic_vector(25 downto 0); 
    din_ch2: in std_logic_vector(25 downto 0); 
    din_ch3: in std_logic_vector(25 downto 0); 
    rst: in std_logic; 
    ch_out: out std_logic_vector(1 downto 0); 
    dout: out std_logic_vector(25 downto 0)
  );
end tdm_monit_1_entity_746ecf54b0;

architecture structural of tdm_monit_1_entity_746ecf54b0 is
  signal ce_1_sg_x36: std_logic;
  signal ce_22240000_sg_x10: std_logic;
  signal ce_2500_sg_x2: std_logic;
  signal ce_5560000_sg_x10: std_logic;
  signal ce_logic_5560000_sg_x0: std_logic;
  signal clk_1_sg_x36: std_logic;
  signal clk_22240000_sg_x10: std_logic;
  signal clk_2500_sg_x2: std_logic;
  signal clk_5560000_sg_x10: std_logic;
  signal clock_enable_probe_q_net: std_logic;
  signal concat1_y_net_x0: std_logic_vector(25 downto 0);
  signal concat2_y_net_x0: std_logic_vector(25 downto 0);
  signal concat3_y_net_x0: std_logic_vector(25 downto 0);
  signal concat_y_net_x0: std_logic_vector(25 downto 0);
  signal constant11_op_net_x0: std_logic;
  signal delay_q_net_x2: std_logic_vector(1 downto 0);
  signal delay_q_net_x3: std_logic_vector(25 downto 0);
  signal mux_sel_op_net_x0: std_logic_vector(1 downto 0);
  signal mux_y_net_x0: std_logic_vector(25 downto 0);
  signal up_sample_ch0_q_net: std_logic_vector(25 downto 0);
  signal up_sample_ch1_q_net: std_logic_vector(25 downto 0);
  signal up_sample_ch2_q_net: std_logic_vector(25 downto 0);
  signal up_sample_ch3_q_net: std_logic_vector(25 downto 0);

begin
  ce_1_sg_x36 <= ce_1;
  ce_22240000_sg_x10 <= ce_22240000;
  ce_2500_sg_x2 <= ce_2500;
  ce_5560000_sg_x10 <= ce_5560000;
  ce_logic_5560000_sg_x0 <= ce_logic_5560000;
  clk_1_sg_x36 <= clk_1;
  clk_22240000_sg_x10 <= clk_22240000;
  clk_2500_sg_x2 <= clk_2500;
  clk_5560000_sg_x10 <= clk_5560000;
  concat_y_net_x0 <= din_ch0;
  concat1_y_net_x0 <= din_ch1;
  concat2_y_net_x0 <= din_ch2;
  concat3_y_net_x0 <= din_ch3;
  constant11_op_net_x0 <= rst;
  ch_out <= delay_q_net_x2;
  dout <= delay_q_net_x3;

  clock_enable_probe: entity work.xlceprobe
    generic map (
      d_width => 26,
      q_width => 1
    )
    port map (
      ce => ce_logic_5560000_sg_x0,
      clk => clk_5560000_sg_x10,
      d => up_sample_ch0_q_net,
      q(0) => clock_enable_probe_q_net
    );

  downsample1_312d531c6b: entity work.downsample1_entity_312d531c6b
    port map (
      ce_1 => ce_1_sg_x36,
      ce_2500 => ce_2500_sg_x2,
      ce_5560000 => ce_5560000_sg_x10,
      clk_1 => clk_1_sg_x36,
      clk_2500 => clk_2500_sg_x2,
      clk_5560000 => clk_5560000_sg_x10,
      din => mux_y_net_x0,
      dout => delay_q_net_x3
    );

  downsample_f33f90217c: entity work.downsample_entity_f33f90217c
    port map (
      ce_1 => ce_1_sg_x36,
      ce_2500 => ce_2500_sg_x2,
      ce_5560000 => ce_5560000_sg_x10,
      clk_1 => clk_1_sg_x36,
      clk_2500 => clk_2500_sg_x2,
      clk_5560000 => clk_5560000_sg_x10,
      din => mux_sel_op_net_x0,
      dout => delay_q_net_x2
    );

  mux: entity work.mux_187c900130
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => up_sample_ch0_q_net,
      d1 => up_sample_ch1_q_net,
      d2 => up_sample_ch2_q_net,
      d3 => up_sample_ch3_q_net,
      sel => mux_sel_op_net_x0,
      y => mux_y_net_x0
    );

  mux_sel: entity work.xlcounter_free
    generic map (
      core_name0 => "cntr_11_0_3166d4cc5b09c744",
      op_arith => xlUnsigned,
      op_width => 2
    )
    port map (
      ce => ce_1_sg_x36,
      clk => clk_1_sg_x36,
      clr => '0',
      en(0) => clock_enable_probe_q_net,
      rst(0) => constant11_op_net_x0,
      op => mux_sel_op_net_x0
    );

  up_sample_ch0: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      latency => 0,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => concat_y_net_x0,
      dest_ce => ce_5560000_sg_x10,
      dest_clk => clk_5560000_sg_x10,
      dest_clr => '0',
      en => "1",
      src_ce => ce_22240000_sg_x10,
      src_clk => clk_22240000_sg_x10,
      src_clr => '0',
      q => up_sample_ch0_q_net
    );

  up_sample_ch1: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      latency => 0,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => concat1_y_net_x0,
      dest_ce => ce_5560000_sg_x10,
      dest_clk => clk_5560000_sg_x10,
      dest_clr => '0',
      en => "1",
      src_ce => ce_22240000_sg_x10,
      src_clk => clk_22240000_sg_x10,
      src_clr => '0',
      q => up_sample_ch1_q_net
    );

  up_sample_ch2: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      latency => 0,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => concat2_y_net_x0,
      dest_ce => ce_5560000_sg_x10,
      dest_clk => clk_5560000_sg_x10,
      dest_clr => '0',
      en => "1",
      src_ce => ce_22240000_sg_x10,
      src_clk => clk_22240000_sg_x10,
      src_clr => '0',
      q => up_sample_ch2_q_net
    );

  up_sample_ch3: entity work.xlusamp
    generic map (
      copy_samples => 1,
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      latency => 0,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => concat3_y_net_x0,
      dest_ce => ce_5560000_sg_x10,
      dest_clk => clk_5560000_sg_x10,
      dest_clr => '0',
      en => "1",
      src_ce => ce_22240000_sg_x10,
      src_clk => clk_22240000_sg_x10,
      src_clr => '0',
      q => up_sample_ch3_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/convert_filt"

entity convert_filt_entity_fda412c1bf is
  port (
    din: in std_logic_vector(25 downto 0); 
    dout: out std_logic_vector(24 downto 0)
  );
end convert_filt_entity_fda412c1bf;

architecture structural of convert_filt_entity_fda412c1bf is
  signal delay_q_net_x4: std_logic_vector(25 downto 0);
  signal extractor1_dout_net: std_logic_vector(24 downto 0);
  signal reinterpret5_output_port_net_x0: std_logic_vector(24 downto 0);

begin
  delay_q_net_x4 <= din;
  dout <= reinterpret5_output_port_net_x0;

  extractor1: entity work.bitbasher_a756ba0096
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => delay_q_net_x4,
      dout => extractor1_dout_net
    );

  reinterpret5: entity work.reinterpret_60ea556961
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => extractor1_dout_net,
      output_port => reinterpret5_output_port_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/DataReg_En"

entity datareg_en_entity_79473f9ed1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0); 
    valid: out std_logic
  );
end datareg_en_entity_79473f9ed1;

architecture structural of datareg_en_entity_79473f9ed1 is
  signal ce_1_sg_x37: std_logic;
  signal clk_1_sg_x37: std_logic;
  signal divider_dout_valid_x0: std_logic;
  signal divider_full_x0: std_logic_vector(24 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x37 <= ce_1;
  clk_1_sg_x37 <= clk_1;
  divider_full_x0 <= din;
  divider_dout_valid_x0 <= en;
  dout <= register_q_net_x0;
  valid <= register1_q_net_x0;

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x37,
      clk => clk_1_sg_x37,
      d(0) => divider_dout_valid_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x37,
      clk => clk_1_sg_x37,
      d => divider_full_x0,
      en(0) => divider_dout_valid_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/DataReg_En3"

entity datareg_en3_entity_6643090018 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(24 downto 0); 
    valid: out std_logic
  );
end datareg_en3_entity_6643090018;

architecture structural of datareg_en3_entity_6643090018 is
  signal ce_1_sg_x40: std_logic;
  signal clk_1_sg_x40: std_logic;
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x40 <= ce_1;
  clk_1_sg_x40 <= clk_1;
  convert_dout_net_x0 <= din;
  delay1_q_net_x0 <= en;
  dout <= register_q_net_x0;
  valid <= register1_q_net_x0;

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      d(0) => delay1_q_net_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      d => convert_dout_net_x0,
      en(0) => delay1_q_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/fifo_fofb_q/pulse_stretcher"

entity pulse_stretcher_entity_6e743f7335 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    clr: in std_logic; 
    pulse_in: in std_logic; 
    extd_out_x0: out std_logic
  );
end pulse_stretcher_entity_6e743f7335;

architecture structural of pulse_stretcher_entity_6e743f7335 is
  signal and_clr: std_logic;
  signal assert1_dout_net_x0: std_logic;
  signal ce_1_sg_x41: std_logic;
  signal clk_1_sg_x41: std_logic;
  signal extd_out_x1: std_logic;
  signal not_clr: std_logic;
  signal or_feedback: std_logic;
  signal out_reg: std_logic;
  signal register_q_net_x0: std_logic;

begin
  ce_1_sg_x41 <= ce_1;
  clk_1_sg_x41 <= clk_1;
  assert1_dout_net_x0 <= clr;
  register_q_net_x0 <= pulse_in;
  extd_out_x0 <= extd_out_x1;

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      clr => '0',
      ip(0) => assert1_dout_net_x0,
      op(0) => not_clr
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => out_reg,
      d1(0) => not_clr,
      y(0) => and_clr
    );

  logical2: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register_q_net_x0,
      d1(0) => and_clr,
      y(0) => or_feedback
    );

  logical3: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register_q_net_x0,
      d1(0) => out_reg,
      y(0) => extd_out_x1
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x41,
      clk => clk_1_sg_x41,
      d(0) => or_feedback,
      en => "1",
      rst => "0",
      q(0) => out_reg
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/fifo_fofb_q"

entity fifo_fofb_q_entity_6e49a095d8 is
  port (
    ce_1: in std_logic; 
    ce_2224: in std_logic; 
    clk_1: in std_logic; 
    clk_2224: in std_logic; 
    from_fifo: in std_logic; 
    re: in std_logic; 
    to_fifo: in std_logic; 
    we_x0: in std_logic; 
    logical2_x0: out std_logic; 
    logical_x0: out std_logic; 
    valid_out: out std_logic
  );
end fifo_fofb_q_entity_6e49a095d8;

architecture structural of fifo_fofb_q_entity_6e49a095d8 is
  signal assert1_dout_net_x1: std_logic;
  signal assert_dout_net_x0: std_logic;
  signal ce_1_sg_x42: std_logic;
  signal ce_2224_sg_x27: std_logic;
  signal clk_1_sg_x42: std_logic;
  signal clk_2224_sg_x27: std_logic;
  signal dividend_valid: std_logic;
  signal empty_x0: std_logic;
  signal extd_out_x2: std_logic;
  signal full_x0: std_logic;
  signal inverter2_op_net: std_logic;
  signal logical2_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;
  signal we_x1: std_logic;

begin
  ce_1_sg_x42 <= ce_1;
  ce_2224_sg_x27 <= ce_2224;
  clk_1_sg_x42 <= clk_1;
  clk_2224_sg_x27 <= clk_2224;
  empty_x0 <= from_fifo;
  assert1_dout_net_x1 <= re;
  full_x0 <= to_fifo;
  assert_dout_net_x0 <= we_x0;
  logical2_x0 <= logical2_y_net_x0;
  logical_x0 <= we_x1;
  valid_out <= extd_out_x2;

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_2224_sg_x27,
      clk => clk_2224_sg_x27,
      clr => '0',
      ip(0) => full_x0,
      op(0) => inverter2_op_net
    );

  inverter4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      clr => '0',
      ip(0) => empty_x0,
      op(0) => dividend_valid
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => assert_dout_net_x0,
      d1(0) => inverter2_op_net,
      y(0) => we_x1
    );

  logical2: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => assert1_dout_net_x1,
      d1(0) => dividend_valid,
      y(0) => logical2_y_net_x0
    );

  pulse_stretcher_6e743f7335: entity work.pulse_stretcher_entity_6e743f7335
    port map (
      ce_1 => ce_1_sg_x42,
      clk_1 => clk_1_sg_x42,
      clr => assert1_dout_net_x1,
      pulse_in => register_q_net_x0,
      extd_out_x0 => extd_out_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x42,
      clk => clk_1_sg_x42,
      d(0) => logical2_y_net_x0,
      en => "1",
      rst => "0",
      q(0) => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/pulse_stretcher"

entity pulse_stretcher_entity_9893378b63 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    clr: in std_logic; 
    pulse_in: in std_logic; 
    extd_out: out std_logic
  );
end pulse_stretcher_entity_9893378b63;

architecture structural of pulse_stretcher_entity_9893378b63 is
  signal ce1_q_net_x0: std_logic;
  signal ce_1_sg_x49: std_logic;
  signal clk_1_sg_x49: std_logic;
  signal inverter_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical2_y_net: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal register1_q_net_x1: std_logic;
  signal register_q_net: std_logic;

begin
  ce_1_sg_x49 <= ce_1;
  clk_1_sg_x49 <= clk_1;
  ce1_q_net_x0 <= clr;
  register1_q_net_x1 <= pulse_in;
  extd_out <= logical3_y_net_x0;

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x49,
      clk => clk_1_sg_x49,
      clr => '0',
      ip(0) => ce1_q_net_x0,
      op(0) => inverter_op_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register_q_net,
      d1(0) => inverter_op_net,
      y(0) => logical1_y_net
    );

  logical2: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register1_q_net_x1,
      d1(0) => logical1_y_net,
      y(0) => logical2_y_net
    );

  logical3: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register1_q_net_x1,
      d1(0) => register_q_net,
      y(0) => logical3_y_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x49,
      clk => clk_1_sg_x49,
      d(0) => logical2_y_net,
      en => "1",
      rst => "0",
      q(0) => register_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb"

entity delta_sigma_fofb_entity_ee61e649ea is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    c: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_2224: in std_logic; 
    ce_logic_2224: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    clk_2224: in std_logic; 
    d: in std_logic_vector(23 downto 0); 
    ds_thres: in std_logic_vector(25 downto 0); 
    from_fifo: in std_logic_vector(25 downto 0); 
    from_fifo_x0: in std_logic; 
    from_fifo_x1: in std_logic_vector(25 downto 0); 
    from_fifo_x2: in std_logic; 
    from_fifo_x3: in std_logic_vector(25 downto 0); 
    from_fifo_x4: in std_logic; 
    from_fifo_x5: in std_logic_vector(25 downto 0); 
    from_fifo_x6: in std_logic; 
    to_fifo: in std_logic; 
    to_fifo_x0: in std_logic; 
    to_fifo_x1: in std_logic; 
    to_fifo_x2: in std_logic; 
    fifo_fofb_q: out std_logic; 
    fifo_fofb_q_x0: out std_logic; 
    fifo_fofb_sum: out std_logic; 
    fifo_fofb_sum_x0: out std_logic; 
    fifo_fofb_x: out std_logic; 
    fifo_fofb_x_x0: out std_logic; 
    fifo_fofb_y: out std_logic; 
    fifo_fofb_y_x0: out std_logic; 
    q: out std_logic_vector(24 downto 0); 
    q_valid: out std_logic; 
    register10_x0: out std_logic_vector(25 downto 0); 
    register7_x0: out std_logic_vector(25 downto 0); 
    register9_x0: out std_logic_vector(25 downto 0); 
    sum_d_s_fpga: out std_logic_vector(25 downto 0); 
    sum_valid: out std_logic; 
    sum_x0: out std_logic_vector(24 downto 0); 
    x: out std_logic_vector(24 downto 0); 
    x_valid: out std_logic; 
    y: out std_logic_vector(24 downto 0); 
    y_valid: out std_logic
  );
end delta_sigma_fofb_entity_ee61e649ea;

architecture structural of delta_sigma_fofb_entity_ee61e649ea is
  signal a_plus_b_s_net: std_logic_vector(24 downto 0);
  signal a_plus_c_s_net: std_logic_vector(24 downto 0);
  signal a_plus_d_s_net: std_logic_vector(24 downto 0);
  signal assert10_dout_net_x1: std_logic;
  signal assert11_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x1: std_logic;
  signal assert1_dout_net_x1: std_logic;
  signal assert3_dout_net_x1: std_logic;
  signal assert4_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic;
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert9_dout_net_x1: std_logic;
  signal assert_dout_net_x3: std_logic;
  signal b_plus_c_s_net: std_logic_vector(24 downto 0);
  signal b_plus_d_s_net: std_logic_vector(24 downto 0);
  signal c_plus_d_s_net: std_logic_vector(24 downto 0);
  signal ce1_q_net_x3: std_logic;
  signal ce_1_sg_x53: std_logic;
  signal ce_2224_sg_x31: std_logic;
  signal ce_2_sg_x35: std_logic;
  signal ce_logic_2224_sg_x0: std_logic;
  signal clk_1_sg_x53: std_logic;
  signal clk_2224_sg_x31: std_logic;
  signal clk_2_sg_x35: std_logic;
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal del_sig_div_fofb_thres_i_net_x0: std_logic_vector(25 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal delay_q_net: std_logic_vector(25 downto 0);
  signal delta_q_s_net: std_logic_vector(25 downto 0);
  signal delta_x_s_net: std_logic_vector(25 downto 0);
  signal delta_y_s_net: std_logic_vector(25 downto 0);
  signal din_x0: std_logic_vector(25 downto 0);
  signal dividend_data_x3: std_logic_vector(25 downto 0);
  signal dividend_data_x4: std_logic_vector(25 downto 0);
  signal dividend_data_x5: std_logic_vector(25 downto 0);
  signal dividend_data_x6: std_logic_vector(25 downto 0);
  signal dividend_ready: std_logic;
  signal dividend_ready_x0: std_logic;
  signal divider_dout_frac: std_logic_vector(24 downto 0);
  signal divider_dout_valid_x0: std_logic;
  signal divider_full_x0: std_logic_vector(24 downto 0);
  signal divisor_data_x1: std_logic_vector(25 downto 0);
  signal divisor_data_x2: std_logic_vector(25 downto 0);
  signal divisor_ready: std_logic;
  signal down_sample1_q_net: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample2_q_net: std_logic;
  signal down_sample2_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample3_q_net: std_logic_vector(24 downto 0);
  signal down_sample4_q_net: std_logic;
  signal down_sample5_q_net: std_logic_vector(24 downto 0);
  signal down_sample6_q_net: std_logic;
  signal down_sample7_q_net: std_logic_vector(24 downto 0);
  signal down_sample8_q_net: std_logic;
  signal down_sample_q_net: std_logic_vector(25 downto 0);
  signal empty_x4: std_logic;
  signal empty_x5: std_logic;
  signal empty_x6: std_logic;
  signal empty_x7: std_logic;
  signal expression1_dout_net: std_logic;
  signal extd_out_x2: std_logic;
  signal extd_out_x3: std_logic;
  signal extd_out_x4: std_logic;
  signal extd_out_x5: std_logic;
  signal full_x4: std_logic;
  signal full_x5: std_logic;
  signal full_x6: std_logic;
  signal full_x7: std_logic;
  signal logical2_y_net_x3: std_logic;
  signal logical2_y_net_x4: std_logic;
  signal logical2_y_net_x5: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical3_y_net_x2: std_logic;
  signal logical3_y_net_x3: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net: std_logic_vector(24 downto 0);
  signal q_divider_m_axis_dout_tvalid_net_x0: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal re_and_x1: std_logic;
  signal re_x1: std_logic;
  signal register10_q_net_x0: std_logic_vector(25 downto 0);
  signal register11_q_net: std_logic_vector(24 downto 0);
  signal register12_q_net: std_logic_vector(24 downto 0);
  signal register13_q_net: std_logic_vector(24 downto 0);
  signal register14_q_net: std_logic_vector(25 downto 0);
  signal register1_q_net: std_logic_vector(24 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register1_q_net_x2: std_logic;
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register2_q_net: std_logic_vector(24 downto 0);
  signal register3_q_net: std_logic_vector(24 downto 0);
  signal register4_q_net: std_logic_vector(24 downto 0);
  signal register5_q_net: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(24 downto 0);
  signal register_q_net: std_logic_vector(24 downto 0);
  signal register_q_net_x0: std_logic_vector(24 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal register_q_net_x3: std_logic_vector(24 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret8_output_port_net: std_logic_vector(25 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net: std_logic_vector(25 downto 0);
  signal valid_ds_down_x1: std_logic;
  signal we_x5: std_logic;
  signal we_x6: std_logic;
  signal we_x7: std_logic;
  signal we_x8: std_logic;
  signal x_divider_m_axis_dout_tdata_fractional_net: std_logic_vector(24 downto 0);
  signal x_divider_m_axis_dout_tvalid_net_x0: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;

begin
  down_sample2_q_net_x20 <= a;
  down_sample1_q_net_x20 <= b;
  down_sample2_q_net_x21 <= c;
  ce_1_sg_x53 <= ce_1;
  ce_2_sg_x35 <= ce_2;
  ce_2224_sg_x31 <= ce_2224;
  ce_logic_2224_sg_x0 <= ce_logic_2224;
  clk_1_sg_x53 <= clk_1;
  clk_2_sg_x35 <= clk_2;
  clk_2224_sg_x31 <= clk_2224;
  down_sample1_q_net_x21 <= d;
  del_sig_div_fofb_thres_i_net_x0 <= ds_thres;
  dividend_data_x3 <= from_fifo;
  empty_x4 <= from_fifo_x0;
  dividend_data_x4 <= from_fifo_x1;
  empty_x5 <= from_fifo_x2;
  dividend_data_x5 <= from_fifo_x3;
  empty_x6 <= from_fifo_x4;
  dividend_data_x6 <= from_fifo_x5;
  empty_x7 <= from_fifo_x6;
  full_x4 <= to_fifo;
  full_x5 <= to_fifo_x0;
  full_x6 <= to_fifo_x1;
  full_x7 <= to_fifo_x2;
  fifo_fofb_q <= we_x5;
  fifo_fofb_q_x0 <= logical2_y_net_x3;
  fifo_fofb_sum <= we_x6;
  fifo_fofb_sum_x0 <= logical2_y_net_x4;
  fifo_fofb_x <= we_x7;
  fifo_fofb_x_x0 <= logical2_y_net_x5;
  fifo_fofb_y <= we_x8;
  fifo_fofb_y_x0 <= re_and_x1;
  q <= assert8_dout_net_x1;
  q_valid <= assert9_dout_net_x1;
  register10_x0 <= register10_q_net_x0;
  register7_x0 <= divisor_data_x1;
  register9_x0 <= din_x0;
  sum_d_s_fpga <= divisor_data_x2;
  sum_valid <= assert12_dout_net_x1;
  sum_x0 <= assert11_dout_net_x1;
  x <= assert5_dout_net_x1;
  x_valid <= assert10_dout_net_x1;
  y <= assert4_dout_net_x1;
  y_valid <= valid_ds_down_x1;

  a_plus_b: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x20,
      b => down_sample1_q_net_x20,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => a_plus_b_s_net
    );

  a_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x20,
      b => down_sample2_q_net_x21,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => a_plus_c_s_net
    );

  a_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x20,
      b => down_sample1_q_net_x21,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => a_plus_d_s_net
    );

  assert1: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => q_divider_s_axis_dividend_tready_net,
      dout(0) => assert1_dout_net_x1
    );

  assert10: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample6_q_net,
      dout(0) => assert10_dout_net_x1
    );

  assert11: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample7_q_net,
      dout => assert11_dout_net_x1
    );

  assert12: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample8_q_net,
      dout(0) => assert12_dout_net_x1
    );

  assert2: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => dividend_ready_x0,
      dout(0) => re_x1
    );

  assert3: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => dividend_ready,
      dout(0) => assert3_dout_net_x1
    );

  assert4: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net,
      dout => assert4_dout_net_x1
    );

  assert5: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample5_q_net,
      dout => assert5_dout_net_x1
    );

  assert6: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => expression1_dout_net,
      dout(0) => assert6_dout_net_x1
    );

  assert7: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample2_q_net,
      dout(0) => valid_ds_down_x1
    );

  assert8: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample3_q_net,
      dout => assert8_dout_net_x1
    );

  assert9: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample4_q_net,
      dout(0) => assert9_dout_net_x1
    );

  assert_x0: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => relational_op_net,
      dout(0) => assert_dout_net_x3
    );

  b_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample1_q_net_x20,
      b => down_sample2_q_net_x21,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => b_plus_c_s_net
    );

  b_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample1_q_net_x20,
      b => down_sample1_q_net_x21,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => b_plus_d_s_net
    );

  c_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x21,
      b => down_sample1_q_net_x21,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
    );

  ce1: entity work.xlceprobe
    generic map (
      d_width => 1,
      q_width => 1
    )
    port map (
      ce => ce_logic_2224_sg_x0,
      clk => clk_2224_sg_x31,
      d(0) => assert_dout_net_x3,
      q(0) => ce1_q_net_x3
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 22,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 21,
      dout_width => 25,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  datareg_en1_3225c09afc: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      din => reinterpret3_output_port_net_x0,
      en => q_divider_m_axis_dout_tvalid_net_x0,
      dout => register_q_net_x1,
      valid => register1_q_net_x2
    );

  datareg_en2_5b5f4b61b7: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      din => reinterpret1_output_port_net_x0,
      en => x_divider_m_axis_dout_tvalid_net_x0,
      dout => register_q_net_x2,
      valid => register1_q_net_x3
    );

  datareg_en3_6643090018: entity work.datareg_en3_entity_6643090018
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      din => convert_dout_net_x0,
      en => delay1_q_net_x0,
      dout => register_q_net_x3,
      valid => register1_q_net_x4
    );

  datareg_en_79473f9ed1: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      din => divider_full_x0,
      en => divider_dout_valid_x0,
      dout => register_q_net_x0,
      valid => register1_q_net_x1
    );

  delay: entity work.xldelay
    generic map (
      latency => 56,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      d => reinterpret8_output_port_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 56,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      d(0) => extd_out_x3,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  delta_q: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register5_q_net,
      b => register6_q_net,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => delta_q_s_net
    );

  delta_x: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register1_q_net,
      b => register3_q_net,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => delta_x_s_net
    );

  delta_y: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register2_q_net,
      b => register4_q_net,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => delta_y_s_net
    );

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 26,
      ds_ratio => 1112,
      latency => 1,
      phase => 1111,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 26
    )
    port map (
      d => register14_q_net,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x35,
      src_clk => clk_2_sg_x35,
      src_clr => '0',
      q => down_sample_q_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register_q_net,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q => down_sample1_q_net
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x0,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q(0) => down_sample2_q_net
    );

  down_sample3: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register11_q_net,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q => down_sample3_q_net
    );

  down_sample4: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x1,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q(0) => down_sample4_q_net
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register12_q_net,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q => down_sample5_q_net
    );

  down_sample6: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x2,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q(0) => down_sample6_q_net
    );

  down_sample7: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 25,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 25
    )
    port map (
      d => register13_q_net,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q => down_sample7_q_net
    );

  down_sample8: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 2224,
      latency => 1,
      phase => 2223,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x3,
      dest_ce => ce_2224_sg_x31,
      dest_clk => clk_2224_sg_x31,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x53,
      src_clk => clk_1_sg_x53,
      src_clr => '0',
      q(0) => down_sample8_q_net
    );

  expression1: entity work.expr_375d7bbece
    port map (
      a(0) => x_divider_s_axis_divisor_tready_net,
      b(0) => divisor_ready,
      c(0) => q_divider_s_axis_divisor_tready_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression1_dout_net
    );

  fifo_fofb_q_6e49a095d8: entity work.fifo_fofb_q_entity_6e49a095d8
    port map (
      ce_1 => ce_1_sg_x53,
      ce_2224 => ce_2224_sg_x31,
      clk_1 => clk_1_sg_x53,
      clk_2224 => clk_2224_sg_x31,
      from_fifo => empty_x4,
      re => assert1_dout_net_x1,
      to_fifo => full_x4,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x3,
      logical_x0 => we_x5,
      valid_out => extd_out_x2
    );

  fifo_fofb_sum_86c4c41f6b: entity work.fifo_fofb_q_entity_6e49a095d8
    port map (
      ce_1 => ce_1_sg_x53,
      ce_2224 => ce_2224_sg_x31,
      clk_1 => clk_1_sg_x53,
      clk_2224 => clk_2224_sg_x31,
      from_fifo => empty_x5,
      re => assert6_dout_net_x1,
      to_fifo => full_x5,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x4,
      logical_x0 => we_x6,
      valid_out => extd_out_x3
    );

  fifo_fofb_x_de2b346cf2: entity work.fifo_fofb_q_entity_6e49a095d8
    port map (
      ce_1 => ce_1_sg_x53,
      ce_2224 => ce_2224_sg_x31,
      clk_1 => clk_1_sg_x53,
      clk_2224 => clk_2224_sg_x31,
      from_fifo => empty_x6,
      re => assert3_dout_net_x1,
      to_fifo => full_x6,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x5,
      logical_x0 => we_x7,
      valid_out => extd_out_x4
    );

  fifo_fofb_y_3a7dcc9004: entity work.fifo_fofb_q_entity_6e49a095d8
    port map (
      ce_1 => ce_1_sg_x53,
      ce_2224 => ce_2224_sg_x31,
      clk_1 => clk_1_sg_x53,
      clk_2224 => clk_2224_sg_x31,
      from_fifo => empty_x7,
      re => re_x1,
      to_fifo => full_x7,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => re_and_x1,
      logical_x0 => we_x8,
      valid_out => extd_out_x5
    );

  pulse_stretcher1_f6401a1a3d: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x2,
      extd_out => logical3_y_net_x1
    );

  pulse_stretcher2_38948aaba0: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x3,
      extd_out => logical3_y_net_x2
    );

  pulse_stretcher3_816d954034: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x4,
      extd_out => logical3_y_net_x3
    );

  pulse_stretcher_9893378b63: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x53,
      clk_1 => clk_1_sg_x53,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x1,
      extd_out => logical3_y_net_x0
    );

  q_divider: entity work.xldivider_generator_ee95dc360423b121d9ecd626691cc2ae
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      s_axis_dividend_tdata_dividend => reinterpret7_output_port_net,
      s_axis_dividend_tvalid => extd_out_x2,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net_x0,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => b_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register10: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => delta_q_s_net,
      en => "1",
      rst => "0",
      q => register10_q_net_x0
    );

  register11: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      d => register_q_net_x1,
      en => "1",
      rst => "0",
      q => register11_q_net
    );

  register12: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      d => register_q_net_x2,
      en => "1",
      rst => "0",
      q => register12_q_net
    );

  register13: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      d => register_q_net_x3,
      en => "1",
      rst => "0",
      q => register13_q_net
    );

  register14: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x35,
      clk => clk_2_sg_x35,
      d => del_sig_div_fofb_thres_i_net_x0,
      en => "1",
      rst => "0",
      q => register14_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => a_plus_b_s_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => a_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => c_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register4_q_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => a_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register5_q_net
    );

  register6: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => b_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register6_q_net
    );

  register7: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => delta_x_s_net,
      en => "1",
      rst => "0",
      q => divisor_data_x1
    );

  register8: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => sum_s_net,
      en => "1",
      rst => "0",
      q => divisor_data_x2
    );

  register9: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      d => delta_y_s_net,
      en => "1",
      rst => "0",
      q => din_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      d => register_q_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => x_divider_m_axis_dout_tdata_fractional_net,
      output_port => reinterpret1_output_port_net_x0
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => divider_dout_frac,
      output_port => divider_full_x0
    );

  reinterpret3: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => q_divider_m_axis_dout_tdata_fractional_net,
      output_port => reinterpret3_output_port_net_x0
    );

  reinterpret4: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x5,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x4,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x6,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x3,
      output_port => reinterpret7_output_port_net
    );

  reinterpret8: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret5_output_port_net,
      output_port => reinterpret8_output_port_net
    );

  relational: entity work.relational_416cfcae1e
    port map (
      a => divisor_data_x2,
      b => down_sample_q_net,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      op(0) => relational_op_net
    );

  sum: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register3_q_net,
      b => register1_q_net,
      ce => ce_2224_sg_x31,
      clk => clk_2224_sg_x31,
      clr => '0',
      en => "1",
      s => sum_s_net
    );

  x_divider: entity work.xldivider_generator_ee95dc360423b121d9ecd626691cc2ae
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      s_axis_dividend_tdata_dividend => reinterpret4_output_port_net,
      s_axis_dividend_tvalid => extd_out_x4,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net_x0,
      s_axis_dividend_tready => dividend_ready,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_ee95dc360423b121d9ecd626691cc2ae
    port map (
      ce => ce_1_sg_x53,
      clk => clk_1_sg_x53,
      s_axis_dividend_tdata_dividend => reinterpret6_output_port_net,
      s_axis_dividend_tvalid => extd_out_x5,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => divider_dout_frac,
      m_axis_dout_tvalid => divider_dout_valid_x0,
      s_axis_dividend_tready => dividend_ready_x0,
      s_axis_divisor_tready => divisor_ready
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit/downsample"

entity downsample_entity_482880cb12 is
  port (
    ce_2: in std_logic; 
    ce_22240000: in std_logic; 
    ce_5000: in std_logic; 
    clk_2: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5000: in std_logic; 
    din: in std_logic_vector(25 downto 0); 
    dout: out std_logic_vector(25 downto 0)
  );
end downsample_entity_482880cb12;

architecture structural of downsample_entity_482880cb12 is
  signal ce_22240000_sg_x11: std_logic;
  signal ce_2_sg_x36: std_logic;
  signal ce_5000_sg_x0: std_logic;
  signal clk_22240000_sg_x11: std_logic;
  signal clk_2_sg_x36: std_logic;
  signal clk_5000_sg_x0: std_logic;
  signal down_sample5_q_net: std_logic_vector(25 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(25 downto 0);
  signal register14_q_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x36 <= ce_2;
  ce_22240000_sg_x11 <= ce_22240000;
  ce_5000_sg_x0 <= ce_5000;
  clk_2_sg_x36 <= clk_2;
  clk_22240000_sg_x11 <= clk_22240000;
  clk_5000_sg_x0 <= clk_5000;
  register14_q_net_x0 <= din;
  dout <= down_sample_q_net_x0;

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 26,
      ds_ratio => 4448,
      latency => 1,
      phase => 4447,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 26
    )
    port map (
      d => down_sample5_q_net,
      dest_ce => ce_22240000_sg_x11,
      dest_clk => clk_22240000_sg_x11,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5000_sg_x0,
      src_clk => clk_5000_sg_x0,
      src_clr => '0',
      q => down_sample_q_net_x0
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 26,
      ds_ratio => 2500,
      latency => 1,
      phase => 2499,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 26
    )
    port map (
      d => register14_q_net_x0,
      dest_ce => ce_5000_sg_x0,
      dest_clk => clk_5000_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x36,
      src_clk => clk_2_sg_x36,
      src_clr => '0',
      q => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit/downsample1"

entity downsample1_entity_4c88924603 is
  port (
    ce_1: in std_logic; 
    ce_22240000: in std_logic; 
    ce_5000: in std_logic; 
    clk_1: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(24 downto 0)
  );
end downsample1_entity_4c88924603;

architecture structural of downsample1_entity_4c88924603 is
  signal ce_1_sg_x58: std_logic;
  signal ce_22240000_sg_x12: std_logic;
  signal ce_5000_sg_x1: std_logic;
  signal clk_1_sg_x58: std_logic;
  signal clk_22240000_sg_x12: std_logic;
  signal clk_5000_sg_x1: std_logic;
  signal down_sample5_q_net: std_logic_vector(24 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(24 downto 0);
  signal register11_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x58 <= ce_1;
  ce_22240000_sg_x12 <= ce_22240000;
  ce_5000_sg_x1 <= ce_5000;
  clk_1_sg_x58 <= clk_1;
  clk_22240000_sg_x12 <= clk_22240000;
  clk_5000_sg_x1 <= clk_5000;
  register11_q_net_x0 <= din;
  dout <= down_sample_q_net_x0;

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 4448,
      latency => 1,
      phase => 4447,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => down_sample5_q_net,
      dest_ce => ce_22240000_sg_x12,
      dest_clk => clk_22240000_sg_x12,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5000_sg_x1,
      src_clk => clk_5000_sg_x1,
      src_clr => '0',
      q => down_sample_q_net_x0
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 5000,
      latency => 1,
      phase => 4999,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register11_q_net_x0,
      dest_ce => ce_5000_sg_x1,
      dest_clk => clk_5000_sg_x1,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x58,
      src_clk => clk_1_sg_x58,
      src_clr => '0',
      q => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit/downsample2"

entity downsample2_entity_891f07b1a7 is
  port (
    ce_1: in std_logic; 
    ce_22240000: in std_logic; 
    ce_5000: in std_logic; 
    clk_1: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5000: in std_logic; 
    din: in std_logic; 
    dout: out std_logic
  );
end downsample2_entity_891f07b1a7;

architecture structural of downsample2_entity_891f07b1a7 is
  signal ce_1_sg_x59: std_logic;
  signal ce_22240000_sg_x13: std_logic;
  signal ce_5000_sg_x2: std_logic;
  signal clk_1_sg_x59: std_logic;
  signal clk_22240000_sg_x13: std_logic;
  signal clk_5000_sg_x2: std_logic;
  signal down_sample5_q_net: std_logic;
  signal down_sample_q_net_x0: std_logic;
  signal logical3_y_net_x0: std_logic;

begin
  ce_1_sg_x59 <= ce_1;
  ce_22240000_sg_x13 <= ce_22240000;
  ce_5000_sg_x2 <= ce_5000;
  clk_1_sg_x59 <= clk_1;
  clk_22240000_sg_x13 <= clk_22240000;
  clk_5000_sg_x2 <= clk_5000;
  logical3_y_net_x0 <= din;
  dout <= down_sample_q_net_x0;

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 4448,
      latency => 1,
      phase => 4447,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => down_sample5_q_net,
      dest_ce => ce_22240000_sg_x13,
      dest_clk => clk_22240000_sg_x13,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5000_sg_x2,
      src_clk => clk_5000_sg_x2,
      src_clr => '0',
      q(0) => down_sample_q_net_x0
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 5000,
      latency => 1,
      phase => 4999,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x0,
      dest_ce => ce_5000_sg_x2,
      dest_clk => clk_5000_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x59,
      src_clk => clk_1_sg_x59,
      src_clr => '0',
      q(0) => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit/downsample7"

entity downsample7_entity_b85055cb62 is
  port (
    ce_1: in std_logic; 
    ce_22240000: in std_logic; 
    ce_5000: in std_logic; 
    clk_1: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(24 downto 0)
  );
end downsample7_entity_b85055cb62;

architecture structural of downsample7_entity_b85055cb62 is
  signal ce_1_sg_x64: std_logic;
  signal ce_22240000_sg_x18: std_logic;
  signal ce_5000_sg_x7: std_logic;
  signal clk_1_sg_x64: std_logic;
  signal clk_22240000_sg_x18: std_logic;
  signal clk_5000_sg_x7: std_logic;
  signal down_sample5_q_net: std_logic_vector(24 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(24 downto 0);
  signal register13_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x64 <= ce_1;
  ce_22240000_sg_x18 <= ce_22240000;
  ce_5000_sg_x7 <= ce_5000;
  clk_1_sg_x64 <= clk_1;
  clk_22240000_sg_x18 <= clk_22240000;
  clk_5000_sg_x7 <= clk_5000;
  register13_q_net_x0 <= din;
  dout <= down_sample_q_net_x0;

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 25,
      ds_ratio => 4448,
      latency => 1,
      phase => 4447,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 25
    )
    port map (
      d => down_sample5_q_net,
      dest_ce => ce_22240000_sg_x18,
      dest_clk => clk_22240000_sg_x18,
      dest_clr => '0',
      en => "1",
      src_ce => ce_5000_sg_x7,
      src_clk => clk_5000_sg_x7,
      src_clr => '0',
      q => down_sample_q_net_x0
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 25,
      ds_ratio => 5000,
      latency => 1,
      phase => 4999,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 25
    )
    port map (
      d => register13_q_net_x0,
      dest_ce => ce_5000_sg_x7,
      dest_clk => clk_5000_sg_x7,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x64,
      src_clk => clk_1_sg_x64,
      src_clr => '0',
      q => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit/fifo_tbt_q"

entity fifo_tbt_q_entity_59c3594b92 is
  port (
    ce_1: in std_logic; 
    ce_22240000: in std_logic; 
    clk_1: in std_logic; 
    clk_22240000: in std_logic; 
    from_fifo: in std_logic; 
    re: in std_logic; 
    to_fifo: in std_logic; 
    we_x0: in std_logic; 
    logical2_x0: out std_logic; 
    logical_x0: out std_logic; 
    valid_out: out std_logic
  );
end fifo_tbt_q_entity_59c3594b92;

architecture structural of fifo_tbt_q_entity_59c3594b92 is
  signal assert1_dout_net_x1: std_logic;
  signal assert_dout_net_x0: std_logic;
  signal ce_1_sg_x67: std_logic;
  signal ce_22240000_sg_x20: std_logic;
  signal clk_1_sg_x67: std_logic;
  signal clk_22240000_sg_x20: std_logic;
  signal dividend_valid: std_logic;
  signal empty_x0: std_logic;
  signal extd_out_x2: std_logic;
  signal full_x0: std_logic;
  signal inverter2_op_net: std_logic;
  signal logical2_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;
  signal we_x1: std_logic;

begin
  ce_1_sg_x67 <= ce_1;
  ce_22240000_sg_x20 <= ce_22240000;
  clk_1_sg_x67 <= clk_1;
  clk_22240000_sg_x20 <= clk_22240000;
  empty_x0 <= from_fifo;
  assert1_dout_net_x1 <= re;
  full_x0 <= to_fifo;
  assert_dout_net_x0 <= we_x0;
  logical2_x0 <= logical2_y_net_x0;
  logical_x0 <= we_x1;
  valid_out <= extd_out_x2;

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_22240000_sg_x20,
      clk => clk_22240000_sg_x20,
      clr => '0',
      ip(0) => full_x0,
      op(0) => inverter2_op_net
    );

  inverter4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      clr => '0',
      ip(0) => empty_x0,
      op(0) => dividend_valid
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => assert_dout_net_x0,
      d1(0) => inverter2_op_net,
      y(0) => we_x1
    );

  logical2: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => assert1_dout_net_x1,
      d1(0) => dividend_valid,
      y(0) => logical2_y_net_x0
    );

  pulse_stretcher_56aaa4157c: entity work.pulse_stretcher_entity_6e743f7335
    port map (
      ce_1 => ce_1_sg_x67,
      clk_1 => clk_1_sg_x67,
      clr => assert1_dout_net_x1,
      pulse_in => register_q_net_x0,
      extd_out_x0 => extd_out_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x67,
      clk => clk_1_sg_x67,
      d(0) => logical2_y_net_x0,
      en => "1",
      rst => "0",
      q(0) => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit"

entity delta_sigma_monit_entity_a8f8b81626 is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    c: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_22240000: in std_logic; 
    ce_5000: in std_logic; 
    ce_logic_22240000: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    clk_22240000: in std_logic; 
    clk_5000: in std_logic; 
    d: in std_logic_vector(23 downto 0); 
    ds_thres: in std_logic_vector(25 downto 0); 
    from_fifo: in std_logic_vector(25 downto 0); 
    from_fifo_x0: in std_logic; 
    from_fifo_x1: in std_logic_vector(25 downto 0); 
    from_fifo_x2: in std_logic; 
    from_fifo_x3: in std_logic_vector(25 downto 0); 
    from_fifo_x4: in std_logic; 
    from_fifo_x5: in std_logic_vector(25 downto 0); 
    from_fifo_x6: in std_logic; 
    to_fifo: in std_logic; 
    to_fifo_x0: in std_logic; 
    to_fifo_x1: in std_logic; 
    to_fifo_x2: in std_logic; 
    fifo_tbt_q: out std_logic; 
    fifo_tbt_q_x0: out std_logic; 
    fifo_tbt_sum: out std_logic; 
    fifo_tbt_sum_x0: out std_logic; 
    fifo_tbt_x: out std_logic; 
    fifo_tbt_x_x0: out std_logic; 
    fifo_tbt_y: out std_logic; 
    fifo_tbt_y_x0: out std_logic; 
    q: out std_logic_vector(24 downto 0); 
    q_valid: out std_logic; 
    register10_x0: out std_logic_vector(25 downto 0); 
    register7_x0: out std_logic_vector(25 downto 0); 
    register9_x0: out std_logic_vector(25 downto 0); 
    sum_d_s_fpga: out std_logic_vector(25 downto 0); 
    sum_valid: out std_logic; 
    sum_x0: out std_logic_vector(24 downto 0); 
    x: out std_logic_vector(24 downto 0); 
    x_valid: out std_logic; 
    y: out std_logic_vector(24 downto 0); 
    y_valid: out std_logic
  );
end delta_sigma_monit_entity_a8f8b81626;

architecture structural of delta_sigma_monit_entity_a8f8b81626 is
  signal a_plus_b_s_net: std_logic_vector(24 downto 0);
  signal a_plus_c_s_net: std_logic_vector(24 downto 0);
  signal a_plus_d_s_net: std_logic_vector(24 downto 0);
  signal assert10_dout_net_x1: std_logic;
  signal assert11_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x1: std_logic;
  signal assert1_dout_net_x1: std_logic;
  signal assert3_dout_net_x1: std_logic;
  signal assert4_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic;
  signal assert7_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert9_dout_net_x1: std_logic;
  signal assert_dout_net_x3: std_logic;
  signal b_plus_c_s_net: std_logic_vector(24 downto 0);
  signal b_plus_d_s_net: std_logic_vector(24 downto 0);
  signal c_plus_d_s_net: std_logic_vector(24 downto 0);
  signal ce1_q_net_x3: std_logic;
  signal ce_1_sg_x78: std_logic;
  signal ce_22240000_sg_x24: std_logic;
  signal ce_2_sg_x37: std_logic;
  signal ce_5000_sg_x9: std_logic;
  signal ce_logic_22240000_sg_x0: std_logic;
  signal clk_1_sg_x78: std_logic;
  signal clk_22240000_sg_x24: std_logic;
  signal clk_2_sg_x37: std_logic;
  signal clk_5000_sg_x9: std_logic;
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal del_sig_div_monit_thres_i_net_x0: std_logic_vector(25 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal delay_q_net: std_logic_vector(25 downto 0);
  signal delta_q_s_net: std_logic_vector(25 downto 0);
  signal delta_x_s_net: std_logic_vector(25 downto 0);
  signal delta_y_s_net: std_logic_vector(25 downto 0);
  signal din_x0: std_logic_vector(25 downto 0);
  signal dividend_data_x3: std_logic_vector(25 downto 0);
  signal dividend_data_x4: std_logic_vector(25 downto 0);
  signal dividend_data_x5: std_logic_vector(25 downto 0);
  signal dividend_data_x6: std_logic_vector(25 downto 0);
  signal dividend_ready: std_logic;
  signal dividend_ready_x0: std_logic;
  signal divider_dout_frac: std_logic_vector(24 downto 0);
  signal divider_dout_valid_x0: std_logic;
  signal divider_full_x0: std_logic_vector(24 downto 0);
  signal divisor_data_x0: std_logic_vector(25 downto 0);
  signal divisor_ready: std_logic;
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(25 downto 0);
  signal down_sample_q_net_x1: std_logic_vector(24 downto 0);
  signal down_sample_q_net_x2: std_logic;
  signal down_sample_q_net_x3: std_logic_vector(24 downto 0);
  signal down_sample_q_net_x4: std_logic;
  signal down_sample_q_net_x5: std_logic_vector(24 downto 0);
  signal down_sample_q_net_x6: std_logic;
  signal down_sample_q_net_x7: std_logic_vector(24 downto 0);
  signal down_sample_q_net_x8: std_logic;
  signal empty_x4: std_logic;
  signal empty_x5: std_logic;
  signal empty_x6: std_logic;
  signal empty_x7: std_logic;
  signal expression1_dout_net: std_logic;
  signal extd_out_x2: std_logic;
  signal extd_out_x3: std_logic;
  signal extd_out_x4: std_logic;
  signal extd_out_x5: std_logic;
  signal full_x4: std_logic;
  signal full_x5: std_logic;
  signal full_x6: std_logic;
  signal full_x7: std_logic;
  signal logical2_y_net_x3: std_logic;
  signal logical2_y_net_x4: std_logic;
  signal logical2_y_net_x5: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical3_y_net_x2: std_logic;
  signal logical3_y_net_x3: std_logic;
  signal logical3_y_net_x4: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net: std_logic_vector(24 downto 0);
  signal q_divider_m_axis_dout_tvalid_net_x0: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal re_and_x1: std_logic;
  signal re_x1: std_logic;
  signal register10_q_net_x0: std_logic_vector(25 downto 0);
  signal register11_q_net_x0: std_logic_vector(24 downto 0);
  signal register12_q_net_x0: std_logic_vector(24 downto 0);
  signal register13_q_net_x0: std_logic_vector(24 downto 0);
  signal register14_q_net_x0: std_logic_vector(25 downto 0);
  signal register1_q_net: std_logic_vector(24 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register1_q_net_x2: std_logic;
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register2_q_net: std_logic_vector(24 downto 0);
  signal register3_q_net: std_logic_vector(24 downto 0);
  signal register4_q_net: std_logic_vector(24 downto 0);
  signal register5_q_net: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(24 downto 0);
  signal register7_q_net_x0: std_logic_vector(25 downto 0);
  signal register_q_net_x0: std_logic_vector(24 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal register_q_net_x3: std_logic_vector(24 downto 0);
  signal register_q_net_x4: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret8_output_port_net: std_logic_vector(25 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net: std_logic_vector(25 downto 0);
  signal valid_ds_down_x1: std_logic;
  signal we_x5: std_logic;
  signal we_x6: std_logic;
  signal we_x7: std_logic;
  signal we_x8: std_logic;
  signal x_divider_m_axis_dout_tdata_fractional_net: std_logic_vector(24 downto 0);
  signal x_divider_m_axis_dout_tvalid_net_x0: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;

begin
  down_sample2_q_net_x5 <= a;
  down_sample1_q_net_x5 <= b;
  down_sample3_q_net_x5 <= c;
  ce_1_sg_x78 <= ce_1;
  ce_2_sg_x37 <= ce_2;
  ce_22240000_sg_x24 <= ce_22240000;
  ce_5000_sg_x9 <= ce_5000;
  ce_logic_22240000_sg_x0 <= ce_logic_22240000;
  clk_1_sg_x78 <= clk_1;
  clk_2_sg_x37 <= clk_2;
  clk_22240000_sg_x24 <= clk_22240000;
  clk_5000_sg_x9 <= clk_5000;
  down_sample4_q_net_x5 <= d;
  del_sig_div_monit_thres_i_net_x0 <= ds_thres;
  dividend_data_x3 <= from_fifo;
  empty_x4 <= from_fifo_x0;
  dividend_data_x4 <= from_fifo_x1;
  empty_x5 <= from_fifo_x2;
  dividend_data_x5 <= from_fifo_x3;
  empty_x6 <= from_fifo_x4;
  dividend_data_x6 <= from_fifo_x5;
  empty_x7 <= from_fifo_x6;
  full_x4 <= to_fifo;
  full_x5 <= to_fifo_x0;
  full_x6 <= to_fifo_x1;
  full_x7 <= to_fifo_x2;
  fifo_tbt_q <= we_x5;
  fifo_tbt_q_x0 <= logical2_y_net_x3;
  fifo_tbt_sum <= we_x6;
  fifo_tbt_sum_x0 <= logical2_y_net_x4;
  fifo_tbt_x <= we_x7;
  fifo_tbt_x_x0 <= logical2_y_net_x5;
  fifo_tbt_y <= we_x8;
  fifo_tbt_y_x0 <= re_and_x1;
  q <= assert4_dout_net_x1;
  q_valid <= assert9_dout_net_x1;
  register10_x0 <= register10_q_net_x0;
  register7_x0 <= register7_q_net_x0;
  register9_x0 <= din_x0;
  sum_d_s_fpga <= divisor_data_x0;
  sum_valid <= assert12_dout_net_x1;
  sum_x0 <= assert11_dout_net_x1;
  x <= assert5_dout_net_x1;
  x_valid <= assert10_dout_net_x1;
  y <= assert7_dout_net_x1;
  y_valid <= valid_ds_down_x1;

  a_plus_b: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x5,
      b => down_sample1_q_net_x5,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => a_plus_b_s_net
    );

  a_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x5,
      b => down_sample3_q_net_x5,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => a_plus_c_s_net
    );

  a_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x5,
      b => down_sample4_q_net_x5,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => a_plus_d_s_net
    );

  assert1: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => q_divider_s_axis_dividend_tready_net,
      dout(0) => assert1_dout_net_x1
    );

  assert10: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample_q_net_x6,
      dout(0) => assert10_dout_net_x1
    );

  assert11: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample_q_net_x7,
      dout => assert11_dout_net_x1
    );

  assert12: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample_q_net_x8,
      dout(0) => assert12_dout_net_x1
    );

  assert2: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => dividend_ready_x0,
      dout(0) => re_x1
    );

  assert3: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => dividend_ready,
      dout(0) => assert3_dout_net_x1
    );

  assert4: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample_q_net_x1,
      dout => assert4_dout_net_x1
    );

  assert5: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample_q_net_x5,
      dout => assert5_dout_net_x1
    );

  assert6: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => expression1_dout_net,
      dout(0) => assert6_dout_net_x1
    );

  assert7: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample_q_net_x3,
      dout => assert7_dout_net_x1
    );

  assert8: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample_q_net_x4,
      dout(0) => valid_ds_down_x1
    );

  assert9: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample_q_net_x2,
      dout(0) => assert9_dout_net_x1
    );

  assert_x0: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => relational_op_net,
      dout(0) => assert_dout_net_x3
    );

  b_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample1_q_net_x5,
      b => down_sample3_q_net_x5,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => b_plus_c_s_net
    );

  b_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample1_q_net_x5,
      b => down_sample4_q_net_x5,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => b_plus_d_s_net
    );

  c_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample3_q_net_x5,
      b => down_sample4_q_net_x5,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
    );

  ce1: entity work.xlceprobe
    generic map (
      d_width => 1,
      q_width => 1
    )
    port map (
      ce => ce_logic_22240000_sg_x0,
      clk => clk_22240000_sg_x24,
      d(0) => assert_dout_net_x3,
      q(0) => ce1_q_net_x3
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 22,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 21,
      dout_width => 25,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  datareg_en1_0658df0e73: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      din => reinterpret3_output_port_net_x0,
      en => q_divider_m_axis_dout_tvalid_net_x0,
      dout => register_q_net_x1,
      valid => register1_q_net_x2
    );

  datareg_en2_b216d22f41: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      din => reinterpret2_output_port_net_x0,
      en => x_divider_m_axis_dout_tvalid_net_x0,
      dout => register_q_net_x2,
      valid => register1_q_net_x3
    );

  datareg_en3_352b935ccb: entity work.datareg_en3_entity_6643090018
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      din => convert_dout_net_x0,
      en => delay1_q_net_x0,
      dout => register_q_net_x3,
      valid => register1_q_net_x4
    );

  datareg_en_8be792d5b9: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      din => divider_full_x0,
      en => divider_dout_valid_x0,
      dout => register_q_net_x0,
      valid => register1_q_net_x1
    );

  delay: entity work.xldelay
    generic map (
      latency => 56,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      d => reinterpret8_output_port_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 56,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      d(0) => extd_out_x3,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  delta_q: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register5_q_net,
      b => register6_q_net,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => delta_q_s_net
    );

  delta_x: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register1_q_net,
      b => register3_q_net,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => delta_x_s_net
    );

  delta_y: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register2_q_net,
      b => register4_q_net,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => delta_y_s_net
    );

  downsample1_4c88924603: entity work.downsample1_entity_4c88924603
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => register11_q_net_x0,
      dout => down_sample_q_net_x1
    );

  downsample2_891f07b1a7: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => logical3_y_net_x2,
      dout => down_sample_q_net_x2
    );

  downsample3_dba589aaee: entity work.downsample1_entity_4c88924603
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => register_q_net_x4,
      dout => down_sample_q_net_x3
    );

  downsample4_c9912c17cb: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => logical3_y_net_x1,
      dout => down_sample_q_net_x4
    );

  downsample5_5d411d5dea: entity work.downsample1_entity_4c88924603
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => register12_q_net_x0,
      dout => down_sample_q_net_x5
    );

  downsample6_d7e68015e5: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => logical3_y_net_x3,
      dout => down_sample_q_net_x6
    );

  downsample7_b85055cb62: entity work.downsample7_entity_b85055cb62
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => register13_q_net_x0,
      dout => down_sample_q_net_x7
    );

  downsample8_69d7284f0d: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => logical3_y_net_x4,
      dout => down_sample_q_net_x8
    );

  downsample_482880cb12: entity work.downsample_entity_482880cb12
    port map (
      ce_2 => ce_2_sg_x37,
      ce_22240000 => ce_22240000_sg_x24,
      ce_5000 => ce_5000_sg_x9,
      clk_2 => clk_2_sg_x37,
      clk_22240000 => clk_22240000_sg_x24,
      clk_5000 => clk_5000_sg_x9,
      din => register14_q_net_x0,
      dout => down_sample_q_net_x0
    );

  expression1: entity work.expr_375d7bbece
    port map (
      a(0) => x_divider_s_axis_divisor_tready_net,
      b(0) => divisor_ready,
      c(0) => q_divider_s_axis_divisor_tready_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression1_dout_net
    );

  fifo_tbt_q_59c3594b92: entity work.fifo_tbt_q_entity_59c3594b92
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      from_fifo => empty_x4,
      re => assert1_dout_net_x1,
      to_fifo => full_x4,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x3,
      logical_x0 => we_x5,
      valid_out => extd_out_x2
    );

  fifo_tbt_sum_a2dd4e9964: entity work.fifo_tbt_q_entity_59c3594b92
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      from_fifo => empty_x5,
      re => assert6_dout_net_x1,
      to_fifo => full_x5,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x4,
      logical_x0 => we_x6,
      valid_out => extd_out_x3
    );

  fifo_tbt_x_5c4c66961e: entity work.fifo_tbt_q_entity_59c3594b92
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      from_fifo => empty_x6,
      re => assert3_dout_net_x1,
      to_fifo => full_x6,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x5,
      logical_x0 => we_x7,
      valid_out => extd_out_x4
    );

  fifo_tbt_y_c02f3232c3: entity work.fifo_tbt_q_entity_59c3594b92
    port map (
      ce_1 => ce_1_sg_x78,
      ce_22240000 => ce_22240000_sg_x24,
      clk_1 => clk_1_sg_x78,
      clk_22240000 => clk_22240000_sg_x24,
      from_fifo => empty_x7,
      re => re_x1,
      to_fifo => full_x7,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => re_and_x1,
      logical_x0 => we_x8,
      valid_out => extd_out_x5
    );

  pulse_stretcher1_427f70e3c7: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x2,
      extd_out => logical3_y_net_x2
    );

  pulse_stretcher2_9a61283281: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x3,
      extd_out => logical3_y_net_x3
    );

  pulse_stretcher3_864c3e16a6: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x4,
      extd_out => logical3_y_net_x4
    );

  pulse_stretcher_6bf297451d: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x78,
      clk_1 => clk_1_sg_x78,
      clr => ce1_q_net_x3,
      pulse_in => register1_q_net_x1,
      extd_out => logical3_y_net_x1
    );

  q_divider: entity work.xldivider_generator_ee95dc360423b121d9ecd626691cc2ae
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      s_axis_dividend_tdata_dividend => reinterpret7_output_port_net,
      s_axis_dividend_tvalid => extd_out_x2,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net_x0,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => b_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register10: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => delta_q_s_net,
      en => "1",
      rst => "0",
      q => register10_q_net_x0
    );

  register11: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      d => register_q_net_x1,
      en => "1",
      rst => "0",
      q => register11_q_net_x0
    );

  register12: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      d => register_q_net_x2,
      en => "1",
      rst => "0",
      q => register12_q_net_x0
    );

  register13: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      d => register_q_net_x3,
      en => "1",
      rst => "0",
      q => register13_q_net_x0
    );

  register14: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x37,
      clk => clk_2_sg_x37,
      d => del_sig_div_monit_thres_i_net_x0,
      en => "1",
      rst => "0",
      q => register14_q_net_x0
    );

  register2: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => a_plus_b_s_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => a_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => c_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register4_q_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => a_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register5_q_net
    );

  register6: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => b_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register6_q_net
    );

  register7: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => delta_x_s_net,
      en => "1",
      rst => "0",
      q => register7_q_net_x0
    );

  register8: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => sum_s_net,
      en => "1",
      rst => "0",
      q => divisor_data_x0
    );

  register9: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      d => delta_y_s_net,
      en => "1",
      rst => "0",
      q => din_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      d => register_q_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x4
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => divider_dout_frac,
      output_port => divider_full_x0
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => x_divider_m_axis_dout_tdata_fractional_net,
      output_port => reinterpret2_output_port_net_x0
    );

  reinterpret3: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => q_divider_m_axis_dout_tdata_fractional_net,
      output_port => reinterpret3_output_port_net_x0
    );

  reinterpret4: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x5,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x4,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x6,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x3,
      output_port => reinterpret7_output_port_net
    );

  reinterpret8: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret5_output_port_net,
      output_port => reinterpret8_output_port_net
    );

  relational: entity work.relational_416cfcae1e
    port map (
      a => divisor_data_x0,
      b => down_sample_q_net_x0,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      op(0) => relational_op_net
    );

  sum: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register3_q_net,
      b => register1_q_net,
      ce => ce_22240000_sg_x24,
      clk => clk_22240000_sg_x24,
      clr => '0',
      en => "1",
      s => sum_s_net
    );

  x_divider: entity work.xldivider_generator_ee95dc360423b121d9ecd626691cc2ae
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      s_axis_dividend_tdata_dividend => reinterpret4_output_port_net,
      s_axis_dividend_tvalid => extd_out_x4,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net_x0,
      s_axis_dividend_tready => dividend_ready,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_ee95dc360423b121d9ecd626691cc2ae
    port map (
      ce => ce_1_sg_x78,
      clk => clk_1_sg_x78,
      s_axis_dividend_tdata_dividend => reinterpret6_output_port_net,
      s_axis_dividend_tvalid => extd_out_x5,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => divider_dout_frac,
      m_axis_dout_tvalid => divider_dout_valid_x0,
      s_axis_dividend_tready => dividend_ready_x0,
      s_axis_divisor_tready => divisor_ready
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_tbt/fifo_tbt_q"

entity fifo_tbt_q_entity_b4861d81a3 is
  port (
    ce_1: in std_logic; 
    ce_70: in std_logic; 
    clk_1: in std_logic; 
    clk_70: in std_logic; 
    from_fifo: in std_logic; 
    re: in std_logic; 
    to_fifo: in std_logic; 
    we_x0: in std_logic; 
    logical2_x0: out std_logic; 
    logical_x0: out std_logic; 
    valid_out: out std_logic
  );
end fifo_tbt_q_entity_b4861d81a3;

architecture structural of fifo_tbt_q_entity_b4861d81a3 is
  signal assert1_dout_net_x1: std_logic;
  signal assert_dout_net_x0: std_logic;
  signal ce_1_sg_x84: std_logic;
  signal ce_70_sg_x26: std_logic;
  signal clk_1_sg_x84: std_logic;
  signal clk_70_sg_x26: std_logic;
  signal dividend_valid: std_logic;
  signal empty_x0: std_logic;
  signal extd_out_x2: std_logic;
  signal full_x0: std_logic;
  signal inverter2_op_net: std_logic;
  signal logical2_y_net_x0: std_logic;
  signal register_q_net_x0: std_logic;
  signal we_x1: std_logic;

begin
  ce_1_sg_x84 <= ce_1;
  ce_70_sg_x26 <= ce_70;
  clk_1_sg_x84 <= clk_1;
  clk_70_sg_x26 <= clk_70;
  empty_x0 <= from_fifo;
  assert1_dout_net_x1 <= re;
  full_x0 <= to_fifo;
  assert_dout_net_x0 <= we_x0;
  logical2_x0 <= logical2_y_net_x0;
  logical_x0 <= we_x1;
  valid_out <= extd_out_x2;

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_70_sg_x26,
      clk => clk_70_sg_x26,
      clr => '0',
      ip(0) => full_x0,
      op(0) => inverter2_op_net
    );

  inverter4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x84,
      clk => clk_1_sg_x84,
      clr => '0',
      ip(0) => empty_x0,
      op(0) => dividend_valid
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => assert_dout_net_x0,
      d1(0) => inverter2_op_net,
      y(0) => we_x1
    );

  logical2: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => assert1_dout_net_x1,
      d1(0) => dividend_valid,
      y(0) => logical2_y_net_x0
    );

  pulse_stretcher_5f310e30e0: entity work.pulse_stretcher_entity_6e743f7335
    port map (
      ce_1 => ce_1_sg_x84,
      clk_1 => clk_1_sg_x84,
      clr => assert1_dout_net_x1,
      pulse_in => register_q_net_x0,
      extd_out_x0 => extd_out_x2
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x84,
      clk => clk_1_sg_x84,
      d(0) => logical2_y_net_x0,
      en => "1",
      rst => "0",
      q(0) => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_tbt"

entity delta_sigma_tbt_entity_bbfa8a8a69 is
  port (
    a: in std_logic_vector(23 downto 0); 
    b: in std_logic_vector(23 downto 0); 
    c: in std_logic_vector(23 downto 0); 
    ce_1: in std_logic; 
    ce_2: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_70: in std_logic; 
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    clk_70: in std_logic; 
    d: in std_logic_vector(23 downto 0); 
    ds_thres: in std_logic_vector(25 downto 0); 
    from_fifo: in std_logic_vector(25 downto 0); 
    from_fifo_x0: in std_logic; 
    from_fifo_x1: in std_logic_vector(25 downto 0); 
    from_fifo_x2: in std_logic; 
    from_fifo_x3: in std_logic_vector(25 downto 0); 
    from_fifo_x4: in std_logic; 
    from_fifo_x5: in std_logic_vector(25 downto 0); 
    from_fifo_x6: in std_logic; 
    to_fifo: in std_logic; 
    to_fifo_x0: in std_logic; 
    to_fifo_x1: in std_logic; 
    to_fifo_x2: in std_logic; 
    delta_q_d_s_fpga: out std_logic_vector(25 downto 0); 
    delta_x_d_s_fpga: out std_logic_vector(25 downto 0); 
    delta_y_d_s_fpga: out std_logic_vector(25 downto 0); 
    fifo_tbt_q: out std_logic; 
    fifo_tbt_q_x0: out std_logic; 
    fifo_tbt_sum: out std_logic; 
    fifo_tbt_sum_x0: out std_logic; 
    fifo_tbt_x: out std_logic; 
    fifo_tbt_x_x0: out std_logic; 
    fifo_tbt_y: out std_logic; 
    fifo_tbt_y_x0: out std_logic; 
    q: out std_logic_vector(24 downto 0); 
    q_valid: out std_logic; 
    sum_d_s_fpga: out std_logic_vector(25 downto 0); 
    sum_valid: out std_logic; 
    sum_x0: out std_logic_vector(24 downto 0); 
    x: out std_logic_vector(24 downto 0); 
    x_valid: out std_logic; 
    y: out std_logic_vector(24 downto 0); 
    y_valid: out std_logic
  );
end delta_sigma_tbt_entity_bbfa8a8a69;

architecture structural of delta_sigma_tbt_entity_bbfa8a8a69 is
  signal a_plus_b_s_net: std_logic_vector(24 downto 0);
  signal a_plus_c_s_net: std_logic_vector(24 downto 0);
  signal a_plus_d_s_net: std_logic_vector(24 downto 0);
  signal assert10_dout_net_x1: std_logic;
  signal assert11_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x1: std_logic;
  signal assert1_dout_net_x1: std_logic;
  signal assert3_dout_net_x1: std_logic;
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic;
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert9_dout_net_x1: std_logic;
  signal assert_dout_net_x3: std_logic;
  signal b_plus_c_s_net: std_logic_vector(24 downto 0);
  signal b_plus_d_s_net: std_logic_vector(24 downto 0);
  signal c_plus_d_s_net: std_logic_vector(24 downto 0);
  signal ce_1_sg_x95: std_logic;
  signal ce_2_sg_x38: std_logic;
  signal ce_70_sg_x30: std_logic;
  signal ce_70_x3: std_logic;
  signal ce_logic_70_sg_x0: std_logic;
  signal clk_1_sg_x95: std_logic;
  signal clk_2_sg_x38: std_logic;
  signal clk_70_sg_x30: std_logic;
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal del_sig_div_tbt_thres_i_net_x0: std_logic_vector(25 downto 0);
  signal delay1_q_net_x0: std_logic;
  signal delay_q_net: std_logic_vector(25 downto 0);
  signal delta_q_s_net: std_logic_vector(25 downto 0);
  signal delta_x_s_net: std_logic_vector(25 downto 0);
  signal delta_y_s_net: std_logic_vector(25 downto 0);
  signal din_x0: std_logic_vector(25 downto 0);
  signal dividend_data_x3: std_logic_vector(25 downto 0);
  signal dividend_data_x4: std_logic_vector(25 downto 0);
  signal dividend_data_x5: std_logic_vector(25 downto 0);
  signal dividend_data_x6: std_logic_vector(25 downto 0);
  signal dividend_ready: std_logic;
  signal dividend_ready_x0: std_logic;
  signal divider_dout_fracc: std_logic_vector(24 downto 0);
  signal divider_dout_valid_x0: std_logic;
  signal divisor_data_x0: std_logic_vector(25 downto 0);
  signal divisor_ready: std_logic;
  signal dout_down_x1: std_logic_vector(24 downto 0);
  signal dout_stretch: std_logic_vector(24 downto 0);
  signal down_sample1_q_net: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x26: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x27: std_logic_vector(23 downto 0);
  signal down_sample2_q_net: std_logic;
  signal down_sample2_q_net_x26: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x27: std_logic_vector(23 downto 0);
  signal down_sample3_q_net: std_logic_vector(24 downto 0);
  signal down_sample4_q_net: std_logic;
  signal down_sample5_q_net: std_logic_vector(24 downto 0);
  signal down_sample6_q_net: std_logic;
  signal down_sample7_q_net: std_logic_vector(24 downto 0);
  signal down_sample8_q_net: std_logic;
  signal down_sample_q_net: std_logic_vector(25 downto 0);
  signal empty_x4: std_logic;
  signal empty_x5: std_logic;
  signal empty_x6: std_logic;
  signal empty_x7: std_logic;
  signal expression1_dout_net: std_logic;
  signal extd_out_x2: std_logic;
  signal extd_out_x3: std_logic;
  signal extd_out_x4: std_logic;
  signal extd_out_x5: std_logic;
  signal full_x4: std_logic;
  signal full_x5: std_logic;
  signal full_x6: std_logic;
  signal full_x7: std_logic;
  signal logical2_y_net_x3: std_logic;
  signal logical2_y_net_x4: std_logic;
  signal logical2_y_net_x5: std_logic;
  signal logical3_y_net_x0: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical3_y_net_x2: std_logic;
  signal logical3_y_net_x3: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net: std_logic_vector(24 downto 0);
  signal q_divider_m_axis_dout_tvalid_net_x0: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal re_and_x1: std_logic;
  signal re_x1: std_logic;
  signal register10_q_net_x0: std_logic_vector(25 downto 0);
  signal register11_q_net: std_logic_vector(24 downto 0);
  signal register12_q_net: std_logic_vector(24 downto 0);
  signal register13_q_net: std_logic_vector(24 downto 0);
  signal register14_q_net: std_logic_vector(25 downto 0);
  signal register1_q_net: std_logic_vector(24 downto 0);
  signal register1_q_net_x1: std_logic;
  signal register1_q_net_x2: std_logic;
  signal register1_q_net_x3: std_logic;
  signal register1_q_net_x4: std_logic;
  signal register2_q_net: std_logic_vector(24 downto 0);
  signal register3_q_net: std_logic_vector(24 downto 0);
  signal register4_q_net: std_logic_vector(24 downto 0);
  signal register5_q_net: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(24 downto 0);
  signal register7_q_net_x0: std_logic_vector(25 downto 0);
  signal register_q_net_x0: std_logic_vector(24 downto 0);
  signal register_q_net_x1: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(24 downto 0);
  signal register_q_net_x3: std_logic_vector(24 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret6_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret7_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret8_output_port_net: std_logic_vector(25 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net: std_logic_vector(25 downto 0);
  signal valid_ds_down_x1: std_logic;
  signal we_x5: std_logic;
  signal we_x6: std_logic;
  signal we_x7: std_logic;
  signal we_x8: std_logic;
  signal x_divider_m_axis_dout_tdata_fractional_net: std_logic_vector(24 downto 0);
  signal x_divider_m_axis_dout_tvalid_net_x0: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;

begin
  down_sample2_q_net_x26 <= a;
  down_sample1_q_net_x26 <= b;
  down_sample2_q_net_x27 <= c;
  ce_1_sg_x95 <= ce_1;
  ce_2_sg_x38 <= ce_2;
  ce_70_sg_x30 <= ce_70;
  ce_logic_70_sg_x0 <= ce_logic_70;
  clk_1_sg_x95 <= clk_1;
  clk_2_sg_x38 <= clk_2;
  clk_70_sg_x30 <= clk_70;
  down_sample1_q_net_x27 <= d;
  del_sig_div_tbt_thres_i_net_x0 <= ds_thres;
  dividend_data_x3 <= from_fifo;
  empty_x4 <= from_fifo_x0;
  dividend_data_x4 <= from_fifo_x1;
  empty_x5 <= from_fifo_x2;
  dividend_data_x5 <= from_fifo_x3;
  empty_x6 <= from_fifo_x4;
  dividend_data_x6 <= from_fifo_x5;
  empty_x7 <= from_fifo_x6;
  full_x4 <= to_fifo;
  full_x5 <= to_fifo_x0;
  full_x6 <= to_fifo_x1;
  full_x7 <= to_fifo_x2;
  delta_q_d_s_fpga <= register10_q_net_x0;
  delta_x_d_s_fpga <= register7_q_net_x0;
  delta_y_d_s_fpga <= din_x0;
  fifo_tbt_q <= we_x5;
  fifo_tbt_q_x0 <= logical2_y_net_x3;
  fifo_tbt_sum <= we_x6;
  fifo_tbt_sum_x0 <= logical2_y_net_x4;
  fifo_tbt_x <= we_x7;
  fifo_tbt_x_x0 <= logical2_y_net_x5;
  fifo_tbt_y <= we_x8;
  fifo_tbt_y_x0 <= re_and_x1;
  q <= assert8_dout_net_x1;
  q_valid <= assert9_dout_net_x1;
  sum_d_s_fpga <= divisor_data_x0;
  sum_valid <= assert12_dout_net_x1;
  sum_x0 <= assert11_dout_net_x1;
  x <= assert5_dout_net_x1;
  x_valid <= assert10_dout_net_x1;
  y <= dout_down_x1;
  y_valid <= valid_ds_down_x1;

  a_plus_b: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x26,
      b => down_sample1_q_net_x26,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => a_plus_b_s_net
    );

  a_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x26,
      b => down_sample2_q_net_x27,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => a_plus_c_s_net
    );

  a_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x26,
      b => down_sample1_q_net_x27,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => a_plus_d_s_net
    );

  assert1: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => q_divider_s_axis_dividend_tready_net,
      dout(0) => assert1_dout_net_x1
    );

  assert10: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample6_q_net,
      dout(0) => assert10_dout_net_x1
    );

  assert11: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample7_q_net,
      dout => assert11_dout_net_x1
    );

  assert12: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample8_q_net,
      dout(0) => assert12_dout_net_x1
    );

  assert2: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => dividend_ready_x0,
      dout(0) => re_x1
    );

  assert3: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => dividend_ready,
      dout(0) => assert3_dout_net_x1
    );

  assert4: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net,
      dout => dout_down_x1
    );

  assert5: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample5_q_net,
      dout => assert5_dout_net_x1
    );

  assert6: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => expression1_dout_net,
      dout(0) => assert6_dout_net_x1
    );

  assert7: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample2_q_net,
      dout(0) => valid_ds_down_x1
    );

  assert8: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample3_q_net,
      dout => assert8_dout_net_x1
    );

  assert9: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => down_sample4_q_net,
      dout(0) => assert9_dout_net_x1
    );

  assert_x0: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => relational_op_net,
      dout(0) => assert_dout_net_x3
    );

  b_plus_c: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample1_q_net_x26,
      b => down_sample2_q_net_x27,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => b_plus_c_s_net
    );

  b_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample1_q_net_x26,
      b => down_sample1_q_net_x27,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => b_plus_d_s_net
    );

  c_plus_d: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 24,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 24,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 25,
      core_name0 => "addsb_11_0_26986301a9f671cd",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 25,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 25
    )
    port map (
      a => down_sample2_q_net_x27,
      b => down_sample1_q_net_x27,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
    );

  ce1: entity work.xlceprobe
    generic map (
      d_width => 1,
      q_width => 1
    )
    port map (
      ce => ce_logic_70_sg_x0,
      clk => clk_70_sg_x30,
      d(0) => assert_dout_net_x3,
      q(0) => ce_70_x3
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 22,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 21,
      dout_width => 25,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlRound
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  datareg_en1_e5d0399944: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      din => reinterpret2_output_port_net_x0,
      en => q_divider_m_axis_dout_tvalid_net_x0,
      dout => register_q_net_x1,
      valid => register1_q_net_x2
    );

  datareg_en2_02a2053e69: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      din => reinterpret3_output_port_net_x0,
      en => x_divider_m_axis_dout_tvalid_net_x0,
      dout => register_q_net_x2,
      valid => register1_q_net_x3
    );

  datareg_en3_78179f99cc: entity work.datareg_en3_entity_6643090018
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      din => convert_dout_net_x0,
      en => delay1_q_net_x0,
      dout => register_q_net_x3,
      valid => register1_q_net_x4
    );

  datareg_en_ed948c360a: entity work.datareg_en_entity_79473f9ed1
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      din => reinterpret1_output_port_net_x0,
      en => divider_dout_valid_x0,
      dout => register_q_net_x0,
      valid => register1_q_net_x1
    );

  delay: entity work.xldelay
    generic map (
      latency => 56,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      d => reinterpret8_output_port_net,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 56,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      d(0) => extd_out_x3,
      en => '1',
      rst => '1',
      q(0) => delay1_q_net_x0
    );

  delta_q: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register5_q_net,
      b => register6_q_net,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => delta_q_s_net
    );

  delta_x: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register1_q_net,
      b => register3_q_net,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => delta_x_s_net
    );

  delta_y: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_8b0747970e52f130",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register2_q_net,
      b => register4_q_net,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => delta_y_s_net
    );

  down_sample: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 22,
      d_width => 26,
      ds_ratio => 35,
      latency => 1,
      phase => 34,
      q_arith => xlSigned,
      q_bin_pt => 22,
      q_width => 26
    )
    port map (
      d => register14_q_net,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x38,
      src_clk => clk_2_sg_x38,
      src_clr => '0',
      q => down_sample_q_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => dout_stretch,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q => down_sample1_q_net
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x0,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q(0) => down_sample2_q_net
    );

  down_sample3: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register11_q_net,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q => down_sample3_q_net
    );

  down_sample4: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x1,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q(0) => down_sample4_q_net
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register12_q_net,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q => down_sample5_q_net
    );

  down_sample6: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x2,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q(0) => down_sample6_q_net
    );

  down_sample7: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 25,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 25
    )
    port map (
      d => register13_q_net,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q => down_sample7_q_net
    );

  down_sample8: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 1,
      ds_ratio => 70,
      latency => 1,
      phase => 69,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 1
    )
    port map (
      d(0) => logical3_y_net_x3,
      dest_ce => ce_70_sg_x30,
      dest_clk => clk_70_sg_x30,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x95,
      src_clk => clk_1_sg_x95,
      src_clr => '0',
      q(0) => down_sample8_q_net
    );

  expression1: entity work.expr_375d7bbece
    port map (
      a(0) => x_divider_s_axis_divisor_tready_net,
      b(0) => divisor_ready,
      c(0) => q_divider_s_axis_divisor_tready_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression1_dout_net
    );

  fifo_tbt_q_b4861d81a3: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x95,
      ce_70 => ce_70_sg_x30,
      clk_1 => clk_1_sg_x95,
      clk_70 => clk_70_sg_x30,
      from_fifo => empty_x4,
      re => assert1_dout_net_x1,
      to_fifo => full_x4,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x3,
      logical_x0 => we_x5,
      valid_out => extd_out_x2
    );

  fifo_tbt_sum_707d0cbec6: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x95,
      ce_70 => ce_70_sg_x30,
      clk_1 => clk_1_sg_x95,
      clk_70 => clk_70_sg_x30,
      from_fifo => empty_x5,
      re => assert6_dout_net_x1,
      to_fifo => full_x5,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x4,
      logical_x0 => we_x6,
      valid_out => extd_out_x3
    );

  fifo_tbt_x_99d20d0ab9: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x95,
      ce_70 => ce_70_sg_x30,
      clk_1 => clk_1_sg_x95,
      clk_70 => clk_70_sg_x30,
      from_fifo => empty_x6,
      re => assert3_dout_net_x1,
      to_fifo => full_x6,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => logical2_y_net_x5,
      logical_x0 => we_x7,
      valid_out => extd_out_x4
    );

  fifo_tbt_y_9ee91ec9a1: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x95,
      ce_70 => ce_70_sg_x30,
      clk_1 => clk_1_sg_x95,
      clk_70 => clk_70_sg_x30,
      from_fifo => empty_x7,
      re => re_x1,
      to_fifo => full_x7,
      we_x0 => assert_dout_net_x3,
      logical2_x0 => re_and_x1,
      logical_x0 => we_x8,
      valid_out => extd_out_x5
    );

  pulse_stretcher1_eef5ee33be: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      clr => ce_70_x3,
      pulse_in => register1_q_net_x2,
      extd_out => logical3_y_net_x1
    );

  pulse_stretcher2_6f5c3f41cf: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      clr => ce_70_x3,
      pulse_in => register1_q_net_x3,
      extd_out => logical3_y_net_x2
    );

  pulse_stretcher3_e720dfd76f: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      clr => ce_70_x3,
      pulse_in => register1_q_net_x4,
      extd_out => logical3_y_net_x3
    );

  pulse_stretcher_f661707a58: entity work.pulse_stretcher_entity_9893378b63
    port map (
      ce_1 => ce_1_sg_x95,
      clk_1 => clk_1_sg_x95,
      clr => ce_70_x3,
      pulse_in => register1_q_net_x1,
      extd_out => logical3_y_net_x0
    );

  q_divider: entity work.xldivider_generator_f42228f055beed40ccf45b1ffc83de1a
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      s_axis_dividend_tdata_dividend => reinterpret7_output_port_net,
      s_axis_dividend_tvalid => extd_out_x2,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net_x0,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => b_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register10: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => delta_q_s_net,
      en => "1",
      rst => "0",
      q => register10_q_net_x0
    );

  register11: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      d => register_q_net_x1,
      en => "1",
      rst => "0",
      q => register11_q_net
    );

  register12: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      d => register_q_net_x2,
      en => "1",
      rst => "0",
      q => register12_q_net
    );

  register13: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      d => register_q_net_x3,
      en => "1",
      rst => "0",
      q => register13_q_net
    );

  register14: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_2_sg_x38,
      clk => clk_2_sg_x38,
      d => del_sig_div_tbt_thres_i_net_x0,
      en => "1",
      rst => "0",
      q => register14_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => a_plus_b_s_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => a_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => c_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register4_q_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => a_plus_c_s_net,
      en => "1",
      rst => "0",
      q => register5_q_net
    );

  register6: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => b_plus_d_s_net,
      en => "1",
      rst => "0",
      q => register6_q_net
    );

  register7: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => delta_x_s_net,
      en => "1",
      rst => "0",
      q => register7_q_net_x0
    );

  register8: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => sum_s_net,
      en => "1",
      rst => "0",
      q => divisor_data_x0
    );

  register9: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      d => delta_y_s_net,
      en => "1",
      rst => "0",
      q => din_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      d => register_q_net_x0,
      en => "1",
      rst => "0",
      q => dout_stretch
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => divider_dout_fracc,
      output_port => reinterpret1_output_port_net_x0
    );

  reinterpret2: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => q_divider_m_axis_dout_tdata_fractional_net,
      output_port => reinterpret2_output_port_net_x0
    );

  reinterpret3: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => x_divider_m_axis_dout_tdata_fractional_net,
      output_port => reinterpret3_output_port_net_x0
    );

  reinterpret4: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x5,
      output_port => reinterpret4_output_port_net
    );

  reinterpret5: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x4,
      output_port => reinterpret5_output_port_net
    );

  reinterpret6: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x6,
      output_port => reinterpret6_output_port_net
    );

  reinterpret7: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => dividend_data_x3,
      output_port => reinterpret7_output_port_net
    );

  reinterpret8: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => reinterpret5_output_port_net,
      output_port => reinterpret8_output_port_net
    );

  relational: entity work.relational_416cfcae1e
    port map (
      a => divisor_data_x0,
      b => down_sample_q_net,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      op(0) => relational_op_net
    );

  sum: entity work.xladdsub
    generic map (
      a_arith => xlSigned,
      a_bin_pt => 22,
      a_width => 25,
      b_arith => xlSigned,
      b_bin_pt => 22,
      b_width => 25,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 26,
      core_name0 => "addsb_11_0_239e4f614ba09ab1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 26,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlSigned,
      s_bin_pt => 22,
      s_width => 26
    )
    port map (
      a => register3_q_net,
      b => register1_q_net,
      ce => ce_70_sg_x30,
      clk => clk_70_sg_x30,
      clr => '0',
      en => "1",
      s => sum_s_net
    );

  x_divider: entity work.xldivider_generator_f42228f055beed40ccf45b1ffc83de1a
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      s_axis_dividend_tdata_dividend => reinterpret4_output_port_net,
      s_axis_dividend_tvalid => extd_out_x4,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net_x0,
      s_axis_dividend_tready => dividend_ready,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_f42228f055beed40ccf45b1ffc83de1a
    port map (
      ce => ce_1_sg_x95,
      clk => clk_1_sg_x95,
      s_axis_dividend_tdata_dividend => reinterpret6_output_port_net,
      s_axis_dividend_tvalid => extd_out_x5,
      s_axis_divisor_tdata_divisor => reinterpret5_output_port_net,
      s_axis_divisor_tvalid => extd_out_x3,
      m_axis_dout_tdata_fractional => divider_dout_fracc,
      m_axis_dout_tvalid => divider_dout_valid_x0,
      s_axis_dividend_tready => dividend_ready_x0,
      s_axis_divisor_tready => divisor_ready
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/monit_pos_1/Cast1/format1"

entity format1_entity_a98b06306e is
  port (
    ce_55600000: in std_logic; 
    clk_55600000: in std_logic; 
    din: in std_logic_vector(25 downto 0); 
    dout: out std_logic_vector(24 downto 0)
  );
end format1_entity_a98b06306e;

architecture structural of format1_entity_a98b06306e is
  signal ce_55600000_sg_x0: std_logic;
  signal clk_55600000_sg_x0: std_logic;
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal monit_pos_1_c_m_axis_data_tdata_net_x0: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(25 downto 0);

begin
  ce_55600000_sg_x0 <= ce_55600000;
  clk_55600000_sg_x0 <= clk_55600000;
  monit_pos_1_c_m_axis_data_tdata_net_x0 <= din;
  dout <= convert_dout_net_x0;

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 24,
      din_width => 26,
      dout_arith => 2,
      dout_bin_pt => 24,
      dout_width => 25,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_55600000_sg_x0,
      clk => clk_55600000_sg_x0,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  reinterpret: entity work.reinterpret_040ef1b598
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => monit_pos_1_c_m_axis_data_tdata_net_x0,
      output_port => reinterpret_output_port_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/monit_pos_1/Cast1"

entity cast1_entity_3d447d0833 is
  port (
    ce_55600000: in std_logic; 
    clk_55600000: in std_logic; 
    data_in: in std_logic_vector(25 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(24 downto 0); 
    vld_out: out std_logic
  );
end cast1_entity_3d447d0833;

architecture structural of cast1_entity_3d447d0833 is
  signal ce_55600000_sg_x1: std_logic;
  signal clk_55600000_sg_x1: std_logic;
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal monit_pos_1_c_m_axis_data_tdata_net_x1: std_logic_vector(25 downto 0);
  signal monit_pos_1_c_m_axis_data_tvalid_net_x0: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_55600000_sg_x1 <= ce_55600000;
  clk_55600000_sg_x1 <= clk_55600000;
  monit_pos_1_c_m_axis_data_tdata_net_x1 <= data_in;
  monit_pos_1_c_m_axis_data_tvalid_net_x0 <= en;
  out_x0 <= register_q_net_x0;
  vld_out <= register1_q_net_x0;

  format1_a98b06306e: entity work.format1_entity_a98b06306e
    port map (
      ce_55600000 => ce_55600000_sg_x1,
      clk_55600000 => clk_55600000_sg_x1,
      din => monit_pos_1_c_m_axis_data_tdata_net_x1,
      dout => convert_dout_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_55600000_sg_x1,
      clk => clk_55600000_sg_x1,
      d(0) => monit_pos_1_c_m_axis_data_tvalid_net_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_55600000_sg_x1,
      clk => clk_55600000_sg_x1,
      d => convert_dout_net_x0,
      en(0) => monit_pos_1_c_m_axis_data_tvalid_net_x0,
      rst => "0",
      q => register_q_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/monit_pos_1/TDDM_monit_pos_1_out/TDDM_monit_pos_1_out_int"

entity tddm_monit_pos_1_out_int_entity_3405798202 is
  port (
    ce_222400000: in std_logic; 
    ce_55600000: in std_logic; 
    ch_in: in std_logic_vector(1 downto 0); 
    clk_222400000: in std_logic; 
    clk_55600000: in std_logic; 
    din: in std_logic_vector(25 downto 0); 
    dout_ch0: out std_logic_vector(25 downto 0); 
    dout_ch1: out std_logic_vector(25 downto 0); 
    dout_ch2: out std_logic_vector(25 downto 0); 
    dout_ch3: out std_logic_vector(25 downto 0)
  );
end tddm_monit_pos_1_out_int_entity_3405798202;

architecture structural of tddm_monit_pos_1_out_int_entity_3405798202 is
  signal ce_222400000_sg_x4: std_logic;
  signal ce_55600000_sg_x2: std_logic;
  signal clk_222400000_sg_x4: std_logic;
  signal clk_55600000_sg_x2: std_logic;
  signal concat_y_net_x0: std_logic_vector(25 downto 0);
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic_vector(1 downto 0);
  signal constant4_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x0: std_logic_vector(25 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(25 downto 0);
  signal down_sample3_q_net_x0: std_logic_vector(25 downto 0);
  signal down_sample4_q_net_x0: std_logic_vector(25 downto 0);
  signal register1_q_net: std_logic_vector(25 downto 0);
  signal register2_q_net: std_logic_vector(25 downto 0);
  signal register3_q_net: std_logic_vector(25 downto 0);
  signal register_q_net_x0: std_logic_vector(25 downto 0);
  signal register_q_net_x1: std_logic_vector(1 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_222400000_sg_x4 <= ce_222400000;
  ce_55600000_sg_x2 <= ce_55600000;
  register_q_net_x1 <= ch_in;
  clk_222400000_sg_x4 <= clk_222400000;
  clk_55600000_sg_x2 <= clk_55600000;
  concat_y_net_x0 <= din;
  dout_ch0 <= down_sample2_q_net_x0;
  dout_ch1 <= down_sample1_q_net_x0;
  dout_ch2 <= down_sample3_q_net_x0;
  dout_ch3 <= down_sample4_q_net_x0;

  constant1: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant3: entity work.constant_a7e2bb9e12
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant_x0: entity work.constant_3a9a3daeb9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => register1_q_net,
      dest_ce => ce_222400000_sg_x4,
      dest_clk => clk_222400000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_55600000_sg_x2,
      src_clk => clk_55600000_sg_x2,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample2: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => register_q_net_x0,
      dest_ce => ce_222400000_sg_x4,
      dest_clk => clk_222400000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_55600000_sg_x2,
      src_clk => clk_55600000_sg_x2,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  down_sample3: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => register2_q_net,
      dest_ce => ce_222400000_sg_x4,
      dest_clk => clk_222400000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_55600000_sg_x2,
      src_clk => clk_55600000_sg_x2,
      src_clr => '0',
      q => down_sample3_q_net_x0
    );

  down_sample4: entity work.xldsamp
    generic map (
      d_arith => xlUnsigned,
      d_bin_pt => 0,
      d_width => 26,
      ds_ratio => 4,
      latency => 1,
      phase => 3,
      q_arith => xlUnsigned,
      q_bin_pt => 0,
      q_width => 26
    )
    port map (
      d => register3_q_net,
      dest_ce => ce_222400000_sg_x4,
      dest_clk => clk_222400000_sg_x4,
      dest_clr => '0',
      en => "1",
      src_ce => ce_55600000_sg_x2,
      src_clk => clk_55600000_sg_x2,
      src_clr => '0',
      q => down_sample4_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      d => concat_y_net_x0,
      en(0) => relational1_op_net,
      rst => "0",
      q => register1_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      d => concat_y_net_x0,
      en(0) => relational2_op_net,
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      d => concat_y_net_x0,
      en(0) => relational3_op_net,
      rst => "0",
      q => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 26,
      init_value => b"00000000000000000000000000"
    )
    port map (
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      d => concat_y_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net_x0
    );

  relational: entity work.relational_367321bc0c
    port map (
      a => register_q_net_x1,
      b => constant_op_net,
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_367321bc0c
    port map (
      a => register_q_net_x1,
      b => constant1_op_net,
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_367321bc0c
    port map (
      a => register_q_net_x1,
      b => constant3_op_net,
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_367321bc0c
    port map (
      a => register_q_net_x1,
      b => constant4_op_net,
      ce => ce_55600000_sg_x2,
      clk => clk_55600000_sg_x2,
      clr => '0',
      op(0) => relational3_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/monit_pos_1/TDDM_monit_pos_1_out"

entity tddm_monit_pos_1_out_entity_1d58a51dbf is
  port (
    ce_222400000: in std_logic; 
    ce_55600000: in std_logic; 
    clk_222400000: in std_logic; 
    clk_55600000: in std_logic; 
    monit_pos_1_ch_in: in std_logic_vector(1 downto 0); 
    monit_pos_1_din: in std_logic_vector(25 downto 0); 
    monit_pos_1_q_out: out std_logic_vector(25 downto 0); 
    monit_pos_1_sum_out: out std_logic_vector(25 downto 0); 
    monit_pos_1_x_out: out std_logic_vector(25 downto 0); 
    monit_pos_1_y_out: out std_logic_vector(25 downto 0)
  );
end tddm_monit_pos_1_out_entity_1d58a51dbf;

architecture structural of tddm_monit_pos_1_out_entity_1d58a51dbf is
  signal ce_222400000_sg_x5: std_logic;
  signal ce_55600000_sg_x3: std_logic;
  signal clk_222400000_sg_x5: std_logic;
  signal clk_55600000_sg_x3: std_logic;
  signal concat_y_net_x1: std_logic_vector(25 downto 0);
  signal down_sample1_q_net_x1: std_logic_vector(25 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(25 downto 0);
  signal down_sample3_q_net_x1: std_logic_vector(25 downto 0);
  signal down_sample4_q_net_x1: std_logic_vector(25 downto 0);
  signal register_q_net_x2: std_logic_vector(1 downto 0);

begin
  ce_222400000_sg_x5 <= ce_222400000;
  ce_55600000_sg_x3 <= ce_55600000;
  clk_222400000_sg_x5 <= clk_222400000;
  clk_55600000_sg_x3 <= clk_55600000;
  register_q_net_x2 <= monit_pos_1_ch_in;
  concat_y_net_x1 <= monit_pos_1_din;
  monit_pos_1_q_out <= down_sample3_q_net_x1;
  monit_pos_1_sum_out <= down_sample4_q_net_x1;
  monit_pos_1_x_out <= down_sample2_q_net_x1;
  monit_pos_1_y_out <= down_sample1_q_net_x1;

  tddm_monit_pos_1_out_int_3405798202: entity work.tddm_monit_pos_1_out_int_entity_3405798202
    port map (
      ce_222400000 => ce_222400000_sg_x5,
      ce_55600000 => ce_55600000_sg_x3,
      ch_in => register_q_net_x2,
      clk_222400000 => clk_222400000_sg_x5,
      clk_55600000 => clk_55600000_sg_x3,
      din => concat_y_net_x1,
      dout_ch0 => down_sample2_q_net_x1,
      dout_ch1 => down_sample1_q_net_x1,
      dout_ch2 => down_sample3_q_net_x1,
      dout_ch3 => down_sample4_q_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/monit_pos_1"

entity monit_pos_1_entity_522c8cf08d is
  port (
    ce_1: in std_logic; 
    ce_222400000: in std_logic; 
    ce_5560000: in std_logic; 
    ce_55600000: in std_logic; 
    ce_logic_5560000: in std_logic; 
    ch_in: in std_logic_vector(1 downto 0); 
    clk_1: in std_logic; 
    clk_222400000: in std_logic; 
    clk_5560000: in std_logic; 
    clk_55600000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    monit_1_pos_q: out std_logic_vector(24 downto 0); 
    monit_1_pos_x: out std_logic_vector(24 downto 0); 
    monit_1_pos_y: out std_logic_vector(24 downto 0); 
    monit_1_sum: out std_logic_vector(24 downto 0); 
    monit_1_vld_q: out std_logic; 
    monit_1_vld_sum: out std_logic; 
    monit_1_vld_x: out std_logic; 
    monit_1_vld_y: out std_logic; 
    monit_pos_1_c_x0: out std_logic
  );
end monit_pos_1_entity_522c8cf08d;

architecture structural of monit_pos_1_entity_522c8cf08d is
  signal ce_1_sg_x96: std_logic;
  signal ce_222400000_sg_x6: std_logic;
  signal ce_55600000_sg_x4: std_logic;
  signal ce_5560000_sg_x11: std_logic;
  signal ce_logic_5560000_sg_x1: std_logic;
  signal clk_1_sg_x96: std_logic;
  signal clk_222400000_sg_x6: std_logic;
  signal clk_55600000_sg_x4: std_logic;
  signal clk_5560000_sg_x11: std_logic;
  signal concat_y_net_x1: std_logic_vector(25 downto 0);
  signal delay_q_net_x3: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x1: std_logic_vector(25 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(25 downto 0);
  signal down_sample3_q_net_x1: std_logic_vector(25 downto 0);
  signal down_sample4_q_net_x1: std_logic_vector(25 downto 0);
  signal extractor1_dout_net: std_logic_vector(24 downto 0);
  signal extractor1_vld_out_net: std_logic;
  signal extractor2_dout_net: std_logic_vector(24 downto 0);
  signal extractor2_vld_out_net: std_logic;
  signal extractor3_dout_net: std_logic_vector(24 downto 0);
  signal extractor3_vld_out_net: std_logic;
  signal extractor4_dout_net: std_logic_vector(24 downto 0);
  signal extractor4_vld_out_net: std_logic;
  signal monit_pos_1_c_event_s_data_chanid_incorrect_net_x0: std_logic;
  signal monit_pos_1_c_m_axis_data_tdata_net_x1: std_logic_vector(25 downto 0);
  signal monit_pos_1_c_m_axis_data_tuser_chanid_net: std_logic_vector(1 downto 0);
  signal monit_pos_1_c_m_axis_data_tvalid_net_x0: std_logic;
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(24 downto 0);
  signal register_q_net_x2: std_logic_vector(1 downto 0);
  signal reinterpret1_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret4_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret5_output_port_net: std_logic_vector(24 downto 0);
  signal reinterpret5_output_port_net_x1: std_logic_vector(24 downto 0);
  signal ufix_to_bool1_dout_net_x1: std_logic;
  signal ufix_to_bool2_dout_net_x1: std_logic;
  signal ufix_to_bool3_dout_net_x1: std_logic;
  signal ufix_to_bool_dout_net_x1: std_logic;

begin
  ce_1_sg_x96 <= ce_1;
  ce_222400000_sg_x6 <= ce_222400000;
  ce_5560000_sg_x11 <= ce_5560000;
  ce_55600000_sg_x4 <= ce_55600000;
  ce_logic_5560000_sg_x1 <= ce_logic_5560000;
  delay_q_net_x3 <= ch_in;
  clk_1_sg_x96 <= clk_1;
  clk_222400000_sg_x6 <= clk_222400000;
  clk_5560000_sg_x11 <= clk_5560000;
  clk_55600000_sg_x4 <= clk_55600000;
  reinterpret5_output_port_net_x1 <= din;
  monit_1_pos_q <= reinterpret2_output_port_net_x1;
  monit_1_pos_x <= reinterpret3_output_port_net_x1;
  monit_1_pos_y <= reinterpret1_output_port_net_x1;
  monit_1_sum <= reinterpret4_output_port_net_x1;
  monit_1_vld_q <= ufix_to_bool2_dout_net_x1;
  monit_1_vld_sum <= ufix_to_bool3_dout_net_x1;
  monit_1_vld_x <= ufix_to_bool_dout_net_x1;
  monit_1_vld_y <= ufix_to_bool1_dout_net_x1;
  monit_pos_1_c_x0 <= monit_pos_1_c_event_s_data_chanid_incorrect_net_x0;

  cast1_3d447d0833: entity work.cast1_entity_3d447d0833
    port map (
      ce_55600000 => ce_55600000_sg_x4,
      clk_55600000 => clk_55600000_sg_x4,
      data_in => monit_pos_1_c_m_axis_data_tdata_net_x1,
      en => monit_pos_1_c_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x0,
      vld_out => register1_q_net_x0
    );

  concat: entity work.concat_43e7f055fa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => register1_q_net_x0,
      in1 => reinterpret5_output_port_net,
      y => concat_y_net_x1
    );

  extractor1: entity work.bitbasher_a756ba0096
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => down_sample3_q_net_x1,
      dout => extractor1_dout_net,
      vld_out(0) => extractor1_vld_out_net
    );

  extractor2: entity work.bitbasher_a756ba0096
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => down_sample1_q_net_x1,
      dout => extractor2_dout_net,
      vld_out(0) => extractor2_vld_out_net
    );

  extractor3: entity work.bitbasher_a756ba0096
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => down_sample4_q_net_x1,
      dout => extractor3_dout_net,
      vld_out(0) => extractor3_vld_out_net
    );

  extractor4: entity work.bitbasher_a756ba0096
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      din => down_sample2_q_net_x1,
      dout => extractor4_dout_net,
      vld_out(0) => extractor4_vld_out_net
    );

  monit_pos_1_c: entity work.xlfir_compiler_45bf4b3837d8237712f93dc8ae18a85b
    port map (
      ce => ce_1_sg_x96,
      ce_5560000 => ce_5560000_sg_x11,
      ce_55600000 => ce_55600000_sg_x4,
      ce_logic_5560000 => ce_logic_5560000_sg_x1,
      clk => clk_1_sg_x96,
      clk_5560000 => clk_5560000_sg_x11,
      clk_55600000 => clk_55600000_sg_x4,
      clk_logic_5560000 => clk_5560000_sg_x11,
      s_axis_data_tdata => reinterpret5_output_port_net_x1,
      s_axis_data_tuser_chanid => delay_q_net_x3,
      src_ce => ce_5560000_sg_x11,
      src_clk => clk_5560000_sg_x11,
      event_s_data_chanid_incorrect => monit_pos_1_c_event_s_data_chanid_incorrect_net_x0,
      m_axis_data_tdata => monit_pos_1_c_m_axis_data_tdata_net_x1,
      m_axis_data_tuser_chanid => monit_pos_1_c_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => monit_pos_1_c_m_axis_data_tvalid_net_x0
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 2,
      init_value => b"00"
    )
    port map (
      ce => ce_55600000_sg_x4,
      clk => clk_55600000_sg_x4,
      d => monit_pos_1_c_m_axis_data_tuser_chanid_net,
      en => "1",
      rst => "0",
      q => register_q_net_x2
    );

  reinterpret1: entity work.reinterpret_60ea556961
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => extractor2_dout_net,
      output_port => reinterpret1_output_port_net_x1
    );

  reinterpret2: entity work.reinterpret_60ea556961
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => extractor1_dout_net,
      output_port => reinterpret2_output_port_net_x1
    );

  reinterpret3: entity work.reinterpret_60ea556961
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => extractor4_dout_net,
      output_port => reinterpret3_output_port_net_x1
    );

  reinterpret4: entity work.reinterpret_60ea556961
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => extractor3_dout_net,
      output_port => reinterpret4_output_port_net_x1
    );

  reinterpret5: entity work.reinterpret_c3c0e847be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => register_q_net_x0,
      output_port => reinterpret5_output_port_net
    );

  tddm_monit_pos_1_out_1d58a51dbf: entity work.tddm_monit_pos_1_out_entity_1d58a51dbf
    port map (
      ce_222400000 => ce_222400000_sg_x6,
      ce_55600000 => ce_55600000_sg_x4,
      clk_222400000 => clk_222400000_sg_x6,
      clk_55600000 => clk_55600000_sg_x4,
      monit_pos_1_ch_in => register_q_net_x2,
      monit_pos_1_din => concat_y_net_x1,
      monit_pos_1_q_out => down_sample3_q_net_x1,
      monit_pos_1_sum_out => down_sample4_q_net_x1,
      monit_pos_1_x_out => down_sample2_q_net_x1,
      monit_pos_1_y_out => down_sample1_q_net_x1
    );

  ufix_to_bool: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_222400000_sg_x6,
      clk => clk_222400000_sg_x6,
      clr => '0',
      din(0) => extractor4_vld_out_net,
      en => "1",
      dout(0) => ufix_to_bool_dout_net_x1
    );

  ufix_to_bool1: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_222400000_sg_x6,
      clk => clk_222400000_sg_x6,
      clr => '0',
      din(0) => extractor2_vld_out_net,
      en => "1",
      dout(0) => ufix_to_bool1_dout_net_x1
    );

  ufix_to_bool2: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_222400000_sg_x6,
      clk => clk_222400000_sg_x6,
      clr => '0',
      din(0) => extractor1_vld_out_net,
      en => "1",
      dout(0) => ufix_to_bool2_dout_net_x1
    );

  ufix_to_bool3: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlRound
    )
    port map (
      ce => ce_222400000_sg_x6,
      clk => clk_222400000_sg_x6,
      clr => '0',
      din(0) => extractor3_vld_out_net,
      en => "1",
      dout(0) => ufix_to_bool3_dout_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066"

entity ddc_bpm_476_066 is
  port (
    adc_ch0_i: in std_logic_vector(15 downto 0); 
    adc_ch1_i: in std_logic_vector(15 downto 0); 
    adc_ch2_i: in std_logic_vector(15 downto 0); 
    adc_ch3_i: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    ce_1112: in std_logic; 
    ce_1390000: in std_logic; 
    ce_2: in std_logic; 
    ce_2224: in std_logic; 
    ce_22240000: in std_logic; 
    ce_222400000: in std_logic; 
    ce_2500: in std_logic; 
    ce_2780000: in std_logic; 
    ce_35: in std_logic; 
    ce_5000: in std_logic; 
    ce_556: in std_logic; 
    ce_5560000: in std_logic; 
    ce_55600000: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ce_logic_1390000: in std_logic; 
    ce_logic_2: in std_logic; 
    ce_logic_2224: in std_logic; 
    ce_logic_22240000: in std_logic; 
    ce_logic_2780000: in std_logic; 
    ce_logic_556: in std_logic; 
    ce_logic_5560000: in std_logic; 
    ce_logic_70: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_1390000: in std_logic; 
    clk_2: in std_logic; 
    clk_2224: in std_logic; 
    clk_22240000: in std_logic; 
    clk_222400000: in std_logic; 
    clk_2500: in std_logic; 
    clk_2780000: in std_logic; 
    clk_35: in std_logic; 
    clk_5000: in std_logic; 
    clk_556: in std_logic; 
    clk_5560000: in std_logic; 
    clk_55600000: in std_logic; 
    clk_70: in std_logic; 
    data_out: in std_logic_vector(25 downto 0); 
    data_out_x0: in std_logic_vector(25 downto 0); 
    data_out_x1: in std_logic_vector(25 downto 0); 
    data_out_x10: in std_logic_vector(25 downto 0); 
    data_out_x2: in std_logic_vector(25 downto 0); 
    data_out_x3: in std_logic_vector(25 downto 0); 
    data_out_x4: in std_logic_vector(25 downto 0); 
    data_out_x5: in std_logic_vector(25 downto 0); 
    data_out_x6: in std_logic_vector(25 downto 0); 
    data_out_x7: in std_logic_vector(25 downto 0); 
    data_out_x8: in std_logic_vector(25 downto 0); 
    data_out_x9: in std_logic_vector(25 downto 0); 
    dds_config_valid_ch0_i: in std_logic; 
    dds_config_valid_ch1_i: in std_logic; 
    dds_config_valid_ch2_i: in std_logic; 
    dds_config_valid_ch3_i: in std_logic; 
    dds_pinc_ch0_i: in std_logic_vector(29 downto 0); 
    dds_pinc_ch1_i: in std_logic_vector(29 downto 0); 
    dds_pinc_ch2_i: in std_logic_vector(29 downto 0); 
    dds_pinc_ch3_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch0_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch1_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch2_i: in std_logic_vector(29 downto 0); 
    dds_poff_ch3_i: in std_logic_vector(29 downto 0); 
    del_sig_div_fofb_thres_i: in std_logic_vector(25 downto 0); 
    del_sig_div_monit_thres_i: in std_logic_vector(25 downto 0); 
    del_sig_div_tbt_thres_i: in std_logic_vector(25 downto 0); 
    empty: in std_logic; 
    empty_x0: in std_logic; 
    empty_x1: in std_logic; 
    empty_x10: in std_logic; 
    empty_x2: in std_logic; 
    empty_x3: in std_logic; 
    empty_x4: in std_logic; 
    empty_x5: in std_logic; 
    empty_x6: in std_logic; 
    empty_x7: in std_logic; 
    empty_x8: in std_logic; 
    empty_x9: in std_logic; 
    full: in std_logic; 
    full_x0: in std_logic; 
    full_x1: in std_logic; 
    full_x10: in std_logic; 
    full_x2: in std_logic; 
    full_x3: in std_logic; 
    full_x4: in std_logic; 
    full_x5: in std_logic; 
    full_x6: in std_logic; 
    full_x7: in std_logic; 
    full_x8: in std_logic; 
    full_x9: in std_logic; 
    ksum_i: in std_logic_vector(24 downto 0); 
    kx_i: in std_logic_vector(24 downto 0); 
    ky_i: in std_logic_vector(24 downto 0); 
    adc_ch0_dbg_data_o: out std_logic_vector(15 downto 0); 
    adc_ch1_dbg_data_o: out std_logic_vector(15 downto 0); 
    adc_ch2_dbg_data_o: out std_logic_vector(15 downto 0); 
    adc_ch3_dbg_data_o: out std_logic_vector(15 downto 0); 
    bpf_ch0_o: out std_logic_vector(23 downto 0); 
    bpf_ch1_o: out std_logic_vector(23 downto 0); 
    bpf_ch2_o: out std_logic_vector(23 downto 0); 
    bpf_ch3_o: out std_logic_vector(23 downto 0); 
    cic_fofb_q_01_missing_o: out std_logic; 
    cic_fofb_q_23_missing_o: out std_logic; 
    data_in: out std_logic_vector(25 downto 0); 
    data_in_x0: out std_logic_vector(25 downto 0); 
    data_in_x1: out std_logic_vector(25 downto 0); 
    data_in_x10: out std_logic_vector(25 downto 0); 
    data_in_x2: out std_logic_vector(25 downto 0); 
    data_in_x3: out std_logic_vector(25 downto 0); 
    data_in_x4: out std_logic_vector(25 downto 0); 
    data_in_x5: out std_logic_vector(25 downto 0); 
    data_in_x6: out std_logic_vector(25 downto 0); 
    data_in_x7: out std_logic_vector(25 downto 0); 
    data_in_x8: out std_logic_vector(25 downto 0); 
    data_in_x9: out std_logic_vector(25 downto 0); 
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
    fofb_pha_ch0_o: out std_logic_vector(23 downto 0); 
    fofb_pha_ch1_o: out std_logic_vector(23 downto 0); 
    fofb_pha_ch2_o: out std_logic_vector(23 downto 0); 
    fofb_pha_ch3_o: out std_logic_vector(23 downto 0); 
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
    monit_cfir_incorrect_o: out std_logic; 
    monit_cic_unexpected_o: out std_logic; 
    monit_pfir_incorrect_o: out std_logic; 
    monit_pos_1_incorrect_o: out std_logic; 
    q_fofb_o: out std_logic_vector(25 downto 0); 
    q_fofb_valid_o: out std_logic; 
    q_monit_1_o: out std_logic_vector(25 downto 0); 
    q_monit_1_valid_o: out std_logic; 
    q_monit_o: out std_logic_vector(25 downto 0); 
    q_monit_valid_o: out std_logic; 
    q_tbt_o: out std_logic_vector(25 downto 0); 
    q_tbt_valid_o: out std_logic; 
    re: out std_logic; 
    re_x0: out std_logic; 
    re_x1: out std_logic; 
    re_x10: out std_logic; 
    re_x2: out std_logic; 
    re_x3: out std_logic; 
    re_x4: out std_logic; 
    re_x5: out std_logic; 
    re_x6: out std_logic; 
    re_x7: out std_logic; 
    re_x8: out std_logic; 
    re_x9: out std_logic; 
    sum_fofb_o: out std_logic_vector(25 downto 0); 
    sum_fofb_valid_o: out std_logic; 
    sum_monit_1_o: out std_logic_vector(25 downto 0); 
    sum_monit_1_valid_o: out std_logic; 
    sum_monit_o: out std_logic_vector(25 downto 0); 
    sum_monit_valid_o: out std_logic; 
    sum_tbt_o: out std_logic_vector(25 downto 0); 
    sum_tbt_valid_o: out std_logic; 
    tbt_amp_ch0_o: out std_logic_vector(23 downto 0); 
    tbt_amp_ch1_o: out std_logic_vector(23 downto 0); 
    tbt_amp_ch2_o: out std_logic_vector(23 downto 0); 
    tbt_amp_ch3_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch01_incorrect_o: out std_logic; 
    tbt_decim_ch0_i_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch0_q_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch1_i_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch1_q_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch23_incorrect_o: out std_logic; 
    tbt_decim_ch2_i_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch2_q_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch3_i_o: out std_logic_vector(23 downto 0); 
    tbt_decim_ch3_q_o: out std_logic_vector(23 downto 0); 
    tbt_pha_ch0_o: out std_logic_vector(23 downto 0); 
    tbt_pha_ch1_o: out std_logic_vector(23 downto 0); 
    tbt_pha_ch2_o: out std_logic_vector(23 downto 0); 
    tbt_pha_ch3_o: out std_logic_vector(23 downto 0); 
    we: out std_logic; 
    we_x0: out std_logic; 
    we_x1: out std_logic; 
    we_x10: out std_logic; 
    we_x2: out std_logic; 
    we_x3: out std_logic; 
    we_x4: out std_logic; 
    we_x5: out std_logic; 
    we_x6: out std_logic; 
    we_x7: out std_logic; 
    we_x8: out std_logic; 
    we_x9: out std_logic; 
    x_fofb_o: out std_logic_vector(25 downto 0); 
    x_fofb_valid_o: out std_logic; 
    x_monit_1_o: out std_logic_vector(25 downto 0); 
    x_monit_1_valid_o: out std_logic; 
    x_monit_o: out std_logic_vector(25 downto 0); 
    x_monit_valid_o: out std_logic; 
    x_tbt_o: out std_logic_vector(25 downto 0); 
    x_tbt_valid_o: out std_logic; 
    y_fofb_o: out std_logic_vector(25 downto 0); 
    y_fofb_valid_o: out std_logic; 
    y_monit_1_o: out std_logic_vector(25 downto 0); 
    y_monit_1_valid_o: out std_logic; 
    y_monit_o: out std_logic_vector(25 downto 0); 
    y_monit_valid_o: out std_logic; 
    y_tbt_o: out std_logic_vector(25 downto 0); 
    y_tbt_valid_o: out std_logic
  );
end ddc_bpm_476_066;

architecture structural of ddc_bpm_476_066 is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "ddc_bpm_476_066,sysgen_core,{clock_period=4.44116092,clocking=Clock_Enables,compilation=HDL_Netlist,sample_periods=1.00000000000 2.00000000000 35.00000000000 70.00000000000 556.00000000000 1112.00000000000 2224.00000000000 2500.00000000000 5000.00000000000 1390000.00000000000 2780000.00000000000 5560000.00000000000 22240000.00000000000 55600000.00000000000 222400000.00000000000,testbench=0,total_blocks=3654,xilinx_adder_subtracter_block=30,xilinx_arithmetic_relational_operator_block=66,xilinx_assert_block=39,xilinx_bit_slice_extractor_block=24,xilinx_bitbasher_block=5,xilinx_bitwise_expression_evaluator_block=3,xilinx_bus_concatenator_block=5,xilinx_bus_multiplexer_block=8,xilinx_cic_compiler_3_0_block=5,xilinx_clock_enable_probe_block=11,xilinx_complex_multiplier_5_0__block=2,xilinx_constant_block_block=79,xilinx_cordic_5_0_block=4,xilinx_counter_block=8,xilinx_dds_compiler_5_0_block=4,xilinx_delay_block=61,xilinx_divider_generator_4_0_block=9,xilinx_down_sampler_block=102,xilinx_fir_compiler_6_3_block=6,xilinx_gateway_in_block=22,xilinx_gateway_out_block=270,xilinx_inverter_block=48,xilinx_logical_block_block=96,xilinx_multiplier_block=16,xilinx_register_block=279,xilinx_sample_time_block_block=125,xilinx_shared_memory_based_from_fifo_block=12,xilinx_shared_memory_based_to_fifo_block=12,xilinx_system_generator_block=1,xilinx_type_converter_block=23,xilinx_type_reinterpreter_block=86,xilinx_up_sampler_block=20,xilinx_wavescope_block=7,}";

  signal adc_ch0_dbg_data_o_net: std_logic_vector(15 downto 0);
  signal adc_ch0_i_net: std_logic_vector(15 downto 0);
  signal adc_ch1_dbg_data_o_net: std_logic_vector(15 downto 0);
  signal adc_ch1_i_net: std_logic_vector(15 downto 0);
  signal adc_ch2_dbg_data_o_net: std_logic_vector(15 downto 0);
  signal adc_ch2_i_net: std_logic_vector(15 downto 0);
  signal adc_ch3_dbg_data_o_net: std_logic_vector(15 downto 0);
  signal adc_ch3_i_net: std_logic_vector(15 downto 0);
  signal assert10_dout_net_x1: std_logic;
  signal assert10_dout_net_x2: std_logic;
  signal assert10_dout_net_x3: std_logic;
  signal assert11_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert11_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert11_dout_net_x3: std_logic_vector(24 downto 0);
  signal assert12_dout_net_x1: std_logic;
  signal assert12_dout_net_x2: std_logic;
  signal assert12_dout_net_x3: std_logic;
  signal assert4_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert4_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x3: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert9_dout_net_x1: std_logic;
  signal assert9_dout_net_x2: std_logic;
  signal assert9_dout_net_x3: std_logic;
  signal bpf_ch0_o_net: std_logic_vector(23 downto 0);
  signal bpf_ch1_o_net: std_logic_vector(23 downto 0);
  signal bpf_ch2_o_net: std_logic_vector(23 downto 0);
  signal bpf_ch3_o_net: std_logic_vector(23 downto 0);
  signal ce_1112_sg_x28: std_logic;
  signal ce_1390000_sg_x3: std_logic;
  signal ce_1_sg_x97: std_logic;
  signal ce_222400000_sg_x7: std_logic;
  signal ce_22240000_sg_x25: std_logic;
  signal ce_2224_sg_x32: std_logic;
  signal ce_2500_sg_x3: std_logic;
  signal ce_2780000_sg_x4: std_logic;
  signal ce_2_sg_x39: std_logic;
  signal ce_35_sg_x26: std_logic;
  signal ce_5000_sg_x10: std_logic;
  signal ce_55600000_sg_x5: std_logic;
  signal ce_5560000_sg_x12: std_logic;
  signal ce_556_sg_x3: std_logic;
  signal ce_70_sg_x31: std_logic;
  signal ce_logic_1390000_sg_x2: std_logic;
  signal ce_logic_1_sg_x20: std_logic;
  signal ce_logic_22240000_sg_x1: std_logic;
  signal ce_logic_2224_sg_x1: std_logic;
  signal ce_logic_2780000_sg_x2: std_logic;
  signal ce_logic_2_sg_x1: std_logic;
  signal ce_logic_5560000_sg_x2: std_logic;
  signal ce_logic_556_sg_x3: std_logic;
  signal ce_logic_70_sg_x1: std_logic;
  signal ch_out_x2: std_logic_vector(1 downto 0);
  signal cic_fofb_q_01_missing_o_net: std_logic;
  signal cic_fofb_q_23_missing_o_net: std_logic;
  signal clk_1112_sg_x28: std_logic;
  signal clk_1390000_sg_x3: std_logic;
  signal clk_1_sg_x97: std_logic;
  signal clk_222400000_sg_x7: std_logic;
  signal clk_22240000_sg_x25: std_logic;
  signal clk_2224_sg_x32: std_logic;
  signal clk_2500_sg_x3: std_logic;
  signal clk_2780000_sg_x4: std_logic;
  signal clk_2_sg_x39: std_logic;
  signal clk_35_sg_x26: std_logic;
  signal clk_5000_sg_x10: std_logic;
  signal clk_55600000_sg_x5: std_logic;
  signal clk_5560000_sg_x12: std_logic;
  signal clk_556_sg_x3: std_logic;
  signal clk_70_sg_x31: std_logic;
  signal concat1_y_net_x0: std_logic_vector(25 downto 0);
  signal concat2_y_net_x0: std_logic_vector(25 downto 0);
  signal concat3_y_net_x0: std_logic_vector(25 downto 0);
  signal concat_y_net_x0: std_logic_vector(25 downto 0);
  signal constant10_op_net_x0: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal constant15_op_net_x1: std_logic;
  signal constant3_op_net_x1: std_logic;
  signal data_in_net: std_logic_vector(25 downto 0);
  signal data_in_x0_net: std_logic_vector(25 downto 0);
  signal data_in_x10_net: std_logic_vector(25 downto 0);
  signal data_in_x1_net: std_logic_vector(25 downto 0);
  signal data_in_x2_net: std_logic_vector(25 downto 0);
  signal data_in_x3_net: std_logic_vector(25 downto 0);
  signal data_in_x4_net: std_logic_vector(25 downto 0);
  signal data_in_x5_net: std_logic_vector(25 downto 0);
  signal data_in_x6_net: std_logic_vector(25 downto 0);
  signal data_in_x7_net: std_logic_vector(25 downto 0);
  signal data_in_x8_net: std_logic_vector(25 downto 0);
  signal data_in_x9_net: std_logic_vector(25 downto 0);
  signal data_out_net: std_logic_vector(25 downto 0);
  signal data_out_x0_net: std_logic_vector(25 downto 0);
  signal data_out_x10_net: std_logic_vector(25 downto 0);
  signal data_out_x1_net: std_logic_vector(25 downto 0);
  signal data_out_x2_net: std_logic_vector(25 downto 0);
  signal data_out_x3_net: std_logic_vector(25 downto 0);
  signal data_out_x4_net: std_logic_vector(25 downto 0);
  signal data_out_x5_net: std_logic_vector(25 downto 0);
  signal data_out_x6_net: std_logic_vector(25 downto 0);
  signal data_out_x7_net: std_logic_vector(25 downto 0);
  signal data_out_x8_net: std_logic_vector(25 downto 0);
  signal data_out_x9_net: std_logic_vector(25 downto 0);
  signal dds_config_valid_ch0_i_net: std_logic;
  signal dds_config_valid_ch1_i_net: std_logic;
  signal dds_config_valid_ch2_i_net: std_logic;
  signal dds_config_valid_ch3_i_net: std_logic;
  signal dds_pinc_ch0_i_net: std_logic_vector(29 downto 0);
  signal dds_pinc_ch1_i_net: std_logic_vector(29 downto 0);
  signal dds_pinc_ch2_i_net: std_logic_vector(29 downto 0);
  signal dds_pinc_ch3_i_net: std_logic_vector(29 downto 0);
  signal dds_poff_ch0_i_net: std_logic_vector(29 downto 0);
  signal dds_poff_ch1_i_net: std_logic_vector(29 downto 0);
  signal dds_poff_ch2_i_net: std_logic_vector(29 downto 0);
  signal dds_poff_ch3_i_net: std_logic_vector(29 downto 0);
  signal del_sig_div_fofb_thres_i_net: std_logic_vector(25 downto 0);
  signal del_sig_div_monit_thres_i_net: std_logic_vector(25 downto 0);
  signal del_sig_div_tbt_thres_i_net: std_logic_vector(25 downto 0);
  signal delay_q_net_x3: std_logic_vector(1 downto 0);
  signal delay_q_net_x4: std_logic_vector(25 downto 0);
  signal dout_down_x1: std_logic_vector(24 downto 0);
  signal dout_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x34: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x35: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x34: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x35: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x5: std_logic_vector(23 downto 0);
  signal empty_net: std_logic;
  signal empty_x0_net: std_logic;
  signal empty_x10_net: std_logic;
  signal empty_x1_net: std_logic;
  signal empty_x2_net: std_logic;
  signal empty_x3_net: std_logic;
  signal empty_x4_net: std_logic;
  signal empty_x5_net: std_logic;
  signal empty_x6_net: std_logic;
  signal empty_x7_net: std_logic;
  signal empty_x8_net: std_logic;
  signal empty_x9_net: std_logic;
  signal fofb_amp_ch0_o_net: std_logic_vector(23 downto 0);
  signal fofb_amp_ch1_o_net: std_logic_vector(23 downto 0);
  signal fofb_amp_ch2_o_net: std_logic_vector(23 downto 0);
  signal fofb_amp_ch3_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch0_i_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch0_q_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch1_i_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch1_q_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch2_i_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch2_q_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch3_i_o_net: std_logic_vector(23 downto 0);
  signal fofb_decim_ch3_q_o_net: std_logic_vector(23 downto 0);
  signal fofb_pha_ch0_o_net: std_logic_vector(23 downto 0);
  signal fofb_pha_ch1_o_net: std_logic_vector(23 downto 0);
  signal fofb_pha_ch2_o_net: std_logic_vector(23 downto 0);
  signal fofb_pha_ch3_o_net: std_logic_vector(23 downto 0);
  signal full_net: std_logic;
  signal full_x0_net: std_logic;
  signal full_x10_net: std_logic;
  signal full_x1_net: std_logic;
  signal full_x2_net: std_logic;
  signal full_x3_net: std_logic;
  signal full_x4_net: std_logic;
  signal full_x5_net: std_logic;
  signal full_x6_net: std_logic;
  signal full_x7_net: std_logic;
  signal full_x8_net: std_logic;
  signal full_x9_net: std_logic;
  signal ksum_i_net: std_logic_vector(24 downto 0);
  signal kx_i_net: std_logic_vector(24 downto 0);
  signal ky_i_net: std_logic_vector(24 downto 0);
  signal mix_ch0_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch0_q_o_net: std_logic_vector(23 downto 0);
  signal mix_ch1_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch1_q_o_net: std_logic_vector(23 downto 0);
  signal mix_ch2_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch2_q_o_net: std_logic_vector(23 downto 0);
  signal mix_ch3_i_o_net: std_logic_vector(23 downto 0);
  signal mix_ch3_q_o_net: std_logic_vector(23 downto 0);
  signal monit_amp_ch0_o_net: std_logic_vector(23 downto 0);
  signal monit_amp_ch1_o_net: std_logic_vector(23 downto 0);
  signal monit_amp_ch2_o_net: std_logic_vector(23 downto 0);
  signal monit_amp_ch3_o_net: std_logic_vector(23 downto 0);
  signal monit_cfir_incorrect_o_net: std_logic;
  signal monit_cic_unexpected_o_net: std_logic;
  signal monit_pfir_incorrect_o_net: std_logic;
  signal monit_pos_1_incorrect_o_net: std_logic;
  signal q_fofb_o_net: std_logic_vector(25 downto 0);
  signal q_fofb_valid_o_net: std_logic;
  signal q_monit_1_o_net: std_logic_vector(25 downto 0);
  signal q_monit_1_valid_o_net: std_logic;
  signal q_monit_o_net: std_logic_vector(25 downto 0);
  signal q_monit_valid_o_net: std_logic;
  signal q_tbt_o_net: std_logic_vector(25 downto 0);
  signal q_tbt_valid_o_net: std_logic;
  signal re_net: std_logic;
  signal re_x0_net: std_logic;
  signal re_x10_net: std_logic;
  signal re_x1_net: std_logic;
  signal re_x2_net: std_logic;
  signal re_x3_net: std_logic;
  signal re_x4_net: std_logic;
  signal re_x5_net: std_logic;
  signal re_x6_net: std_logic;
  signal re_x7_net: std_logic;
  signal re_x8_net: std_logic;
  signal re_x9_net: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register1_q_net_x9: std_logic;
  signal register3_q_net_x15: std_logic;
  signal register3_q_net_x16: std_logic;
  signal register4_q_net_x14: std_logic_vector(23 downto 0);
  signal register4_q_net_x15: std_logic_vector(23 downto 0);
  signal register5_q_net_x15: std_logic_vector(23 downto 0);
  signal register5_q_net_x16: std_logic_vector(23 downto 0);
  signal register_q_net_x12: std_logic_vector(23 downto 0);
  signal register_q_net_x13: std_logic_vector(23 downto 0);
  signal register_q_net_x14: std_logic_vector(23 downto 0);
  signal register_q_net_x15: std_logic_vector(23 downto 0);
  signal register_q_net_x35: std_logic_vector(23 downto 0);
  signal register_q_net_x36: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(24 downto 0);
  signal reinterpret1_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(24 downto 0);
  signal reinterpret2_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret4_output_port_net: std_logic_vector(24 downto 0);
  signal reinterpret4_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret5_output_port_net_x1: std_logic_vector(24 downto 0);
  signal sum_fofb_o_net: std_logic_vector(25 downto 0);
  signal sum_fofb_valid_o_net: std_logic;
  signal sum_monit_1_o_net: std_logic_vector(25 downto 0);
  signal sum_monit_1_valid_o_net: std_logic;
  signal sum_monit_o_net: std_logic_vector(25 downto 0);
  signal sum_monit_valid_o_net: std_logic;
  signal sum_tbt_o_net: std_logic_vector(25 downto 0);
  signal sum_tbt_valid_o_net: std_logic;
  signal tbt_amp_ch0_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch1_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch2_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch3_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch01_incorrect_o_net: std_logic;
  signal tbt_decim_ch0_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch0_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch1_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch1_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch23_incorrect_o_net: std_logic;
  signal tbt_decim_ch2_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch2_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch3_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch3_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_pha_ch0_o_net: std_logic_vector(23 downto 0);
  signal tbt_pha_ch1_o_net: std_logic_vector(23 downto 0);
  signal tbt_pha_ch2_o_net: std_logic_vector(23 downto 0);
  signal tbt_pha_ch3_o_net: std_logic_vector(23 downto 0);
  signal ufix_to_bool1_dout_net_x1: std_logic;
  signal ufix_to_bool2_dout_net_x1: std_logic;
  signal ufix_to_bool3_dout_net_x1: std_logic;
  signal ufix_to_bool_dout_net_x1: std_logic;
  signal valid_ds_down_x1: std_logic;
  signal valid_ds_down_x2: std_logic;
  signal valid_ds_down_x3: std_logic;
  signal we_net: std_logic;
  signal we_x0_net: std_logic;
  signal we_x10_net: std_logic;
  signal we_x1_net: std_logic;
  signal we_x2_net: std_logic;
  signal we_x3_net: std_logic;
  signal we_x4_net: std_logic;
  signal we_x5_net: std_logic;
  signal we_x6_net: std_logic;
  signal we_x7_net: std_logic;
  signal we_x8_net: std_logic;
  signal we_x9_net: std_logic;
  signal x_fofb_o_net: std_logic_vector(25 downto 0);
  signal x_fofb_valid_o_net: std_logic;
  signal x_monit_1_o_net: std_logic_vector(25 downto 0);
  signal x_monit_1_valid_o_net: std_logic;
  signal x_monit_o_net: std_logic_vector(25 downto 0);
  signal x_monit_valid_o_net: std_logic;
  signal x_tbt_o_net: std_logic_vector(25 downto 0);
  signal x_tbt_valid_o_net: std_logic;
  signal y_fofb_o_net: std_logic_vector(25 downto 0);
  signal y_fofb_valid_o_net: std_logic;
  signal y_monit_1_o_net: std_logic_vector(25 downto 0);
  signal y_monit_1_valid_o_net: std_logic;
  signal y_monit_o_net: std_logic_vector(25 downto 0);
  signal y_monit_valid_o_net: std_logic;
  signal y_tbt_o_net: std_logic_vector(25 downto 0);
  signal y_tbt_valid_o_net: std_logic;

begin
  adc_ch0_i_net <= adc_ch0_i;
  adc_ch1_i_net <= adc_ch1_i;
  adc_ch2_i_net <= adc_ch2_i;
  adc_ch3_i_net <= adc_ch3_i;
  ce_1_sg_x97 <= ce_1;
  ce_1112_sg_x28 <= ce_1112;
  ce_1390000_sg_x3 <= ce_1390000;
  ce_2_sg_x39 <= ce_2;
  ce_2224_sg_x32 <= ce_2224;
  ce_22240000_sg_x25 <= ce_22240000;
  ce_222400000_sg_x7 <= ce_222400000;
  ce_2500_sg_x3 <= ce_2500;
  ce_2780000_sg_x4 <= ce_2780000;
  ce_35_sg_x26 <= ce_35;
  ce_5000_sg_x10 <= ce_5000;
  ce_556_sg_x3 <= ce_556;
  ce_5560000_sg_x12 <= ce_5560000;
  ce_55600000_sg_x5 <= ce_55600000;
  ce_70_sg_x31 <= ce_70;
  ce_logic_1_sg_x20 <= ce_logic_1;
  ce_logic_1390000_sg_x2 <= ce_logic_1390000;
  ce_logic_2_sg_x1 <= ce_logic_2;
  ce_logic_2224_sg_x1 <= ce_logic_2224;
  ce_logic_22240000_sg_x1 <= ce_logic_22240000;
  ce_logic_2780000_sg_x2 <= ce_logic_2780000;
  ce_logic_556_sg_x3 <= ce_logic_556;
  ce_logic_5560000_sg_x2 <= ce_logic_5560000;
  ce_logic_70_sg_x1 <= ce_logic_70;
  clk_1_sg_x97 <= clk_1;
  clk_1112_sg_x28 <= clk_1112;
  clk_1390000_sg_x3 <= clk_1390000;
  clk_2_sg_x39 <= clk_2;
  clk_2224_sg_x32 <= clk_2224;
  clk_22240000_sg_x25 <= clk_22240000;
  clk_222400000_sg_x7 <= clk_222400000;
  clk_2500_sg_x3 <= clk_2500;
  clk_2780000_sg_x4 <= clk_2780000;
  clk_35_sg_x26 <= clk_35;
  clk_5000_sg_x10 <= clk_5000;
  clk_556_sg_x3 <= clk_556;
  clk_5560000_sg_x12 <= clk_5560000;
  clk_55600000_sg_x5 <= clk_55600000;
  clk_70_sg_x31 <= clk_70;
  data_out_net <= data_out;
  data_out_x0_net <= data_out_x0;
  data_out_x1_net <= data_out_x1;
  data_out_x10_net <= data_out_x10;
  data_out_x2_net <= data_out_x2;
  data_out_x3_net <= data_out_x3;
  data_out_x4_net <= data_out_x4;
  data_out_x5_net <= data_out_x5;
  data_out_x6_net <= data_out_x6;
  data_out_x7_net <= data_out_x7;
  data_out_x8_net <= data_out_x8;
  data_out_x9_net <= data_out_x9;
  dds_config_valid_ch0_i_net <= dds_config_valid_ch0_i;
  dds_config_valid_ch1_i_net <= dds_config_valid_ch1_i;
  dds_config_valid_ch2_i_net <= dds_config_valid_ch2_i;
  dds_config_valid_ch3_i_net <= dds_config_valid_ch3_i;
  dds_pinc_ch0_i_net <= dds_pinc_ch0_i;
  dds_pinc_ch1_i_net <= dds_pinc_ch1_i;
  dds_pinc_ch2_i_net <= dds_pinc_ch2_i;
  dds_pinc_ch3_i_net <= dds_pinc_ch3_i;
  dds_poff_ch0_i_net <= dds_poff_ch0_i;
  dds_poff_ch1_i_net <= dds_poff_ch1_i;
  dds_poff_ch2_i_net <= dds_poff_ch2_i;
  dds_poff_ch3_i_net <= dds_poff_ch3_i;
  del_sig_div_fofb_thres_i_net <= del_sig_div_fofb_thres_i;
  del_sig_div_monit_thres_i_net <= del_sig_div_monit_thres_i;
  del_sig_div_tbt_thres_i_net <= del_sig_div_tbt_thres_i;
  empty_net <= empty;
  empty_x0_net <= empty_x0;
  empty_x1_net <= empty_x1;
  empty_x10_net <= empty_x10;
  empty_x2_net <= empty_x2;
  empty_x3_net <= empty_x3;
  empty_x4_net <= empty_x4;
  empty_x5_net <= empty_x5;
  empty_x6_net <= empty_x6;
  empty_x7_net <= empty_x7;
  empty_x8_net <= empty_x8;
  empty_x9_net <= empty_x9;
  full_net <= full;
  full_x0_net <= full_x0;
  full_x1_net <= full_x1;
  full_x10_net <= full_x10;
  full_x2_net <= full_x2;
  full_x3_net <= full_x3;
  full_x4_net <= full_x4;
  full_x5_net <= full_x5;
  full_x6_net <= full_x6;
  full_x7_net <= full_x7;
  full_x8_net <= full_x8;
  full_x9_net <= full_x9;
  ksum_i_net <= ksum_i;
  kx_i_net <= kx_i;
  ky_i_net <= ky_i;
  adc_ch0_dbg_data_o <= adc_ch0_dbg_data_o_net;
  adc_ch1_dbg_data_o <= adc_ch1_dbg_data_o_net;
  adc_ch2_dbg_data_o <= adc_ch2_dbg_data_o_net;
  adc_ch3_dbg_data_o <= adc_ch3_dbg_data_o_net;
  bpf_ch0_o <= bpf_ch0_o_net;
  bpf_ch1_o <= bpf_ch1_o_net;
  bpf_ch2_o <= bpf_ch2_o_net;
  bpf_ch3_o <= bpf_ch3_o_net;
  cic_fofb_q_01_missing_o <= cic_fofb_q_01_missing_o_net;
  cic_fofb_q_23_missing_o <= cic_fofb_q_23_missing_o_net;
  data_in <= data_in_net;
  data_in_x0 <= data_in_x0_net;
  data_in_x1 <= data_in_x1_net;
  data_in_x10 <= data_in_x10_net;
  data_in_x2 <= data_in_x2_net;
  data_in_x3 <= data_in_x3_net;
  data_in_x4 <= data_in_x4_net;
  data_in_x5 <= data_in_x5_net;
  data_in_x6 <= data_in_x6_net;
  data_in_x7 <= data_in_x7_net;
  data_in_x8 <= data_in_x8_net;
  data_in_x9 <= data_in_x9_net;
  fofb_amp_ch0_o <= fofb_amp_ch0_o_net;
  fofb_amp_ch1_o <= fofb_amp_ch1_o_net;
  fofb_amp_ch2_o <= fofb_amp_ch2_o_net;
  fofb_amp_ch3_o <= fofb_amp_ch3_o_net;
  fofb_decim_ch0_i_o <= fofb_decim_ch0_i_o_net;
  fofb_decim_ch0_q_o <= fofb_decim_ch0_q_o_net;
  fofb_decim_ch1_i_o <= fofb_decim_ch1_i_o_net;
  fofb_decim_ch1_q_o <= fofb_decim_ch1_q_o_net;
  fofb_decim_ch2_i_o <= fofb_decim_ch2_i_o_net;
  fofb_decim_ch2_q_o <= fofb_decim_ch2_q_o_net;
  fofb_decim_ch3_i_o <= fofb_decim_ch3_i_o_net;
  fofb_decim_ch3_q_o <= fofb_decim_ch3_q_o_net;
  fofb_pha_ch0_o <= fofb_pha_ch0_o_net;
  fofb_pha_ch1_o <= fofb_pha_ch1_o_net;
  fofb_pha_ch2_o <= fofb_pha_ch2_o_net;
  fofb_pha_ch3_o <= fofb_pha_ch3_o_net;
  mix_ch0_i_o <= mix_ch0_i_o_net;
  mix_ch0_q_o <= mix_ch0_q_o_net;
  mix_ch1_i_o <= mix_ch1_i_o_net;
  mix_ch1_q_o <= mix_ch1_q_o_net;
  mix_ch2_i_o <= mix_ch2_i_o_net;
  mix_ch2_q_o <= mix_ch2_q_o_net;
  mix_ch3_i_o <= mix_ch3_i_o_net;
  mix_ch3_q_o <= mix_ch3_q_o_net;
  monit_amp_ch0_o <= monit_amp_ch0_o_net;
  monit_amp_ch1_o <= monit_amp_ch1_o_net;
  monit_amp_ch2_o <= monit_amp_ch2_o_net;
  monit_amp_ch3_o <= monit_amp_ch3_o_net;
  monit_cfir_incorrect_o <= monit_cfir_incorrect_o_net;
  monit_cic_unexpected_o <= monit_cic_unexpected_o_net;
  monit_pfir_incorrect_o <= monit_pfir_incorrect_o_net;
  monit_pos_1_incorrect_o <= monit_pos_1_incorrect_o_net;
  q_fofb_o <= q_fofb_o_net;
  q_fofb_valid_o <= q_fofb_valid_o_net;
  q_monit_1_o <= q_monit_1_o_net;
  q_monit_1_valid_o <= q_monit_1_valid_o_net;
  q_monit_o <= q_monit_o_net;
  q_monit_valid_o <= q_monit_valid_o_net;
  q_tbt_o <= q_tbt_o_net;
  q_tbt_valid_o <= q_tbt_valid_o_net;
  re <= re_net;
  re_x0 <= re_x0_net;
  re_x1 <= re_x1_net;
  re_x10 <= re_x10_net;
  re_x2 <= re_x2_net;
  re_x3 <= re_x3_net;
  re_x4 <= re_x4_net;
  re_x5 <= re_x5_net;
  re_x6 <= re_x6_net;
  re_x7 <= re_x7_net;
  re_x8 <= re_x8_net;
  re_x9 <= re_x9_net;
  sum_fofb_o <= sum_fofb_o_net;
  sum_fofb_valid_o <= sum_fofb_valid_o_net;
  sum_monit_1_o <= sum_monit_1_o_net;
  sum_monit_1_valid_o <= sum_monit_1_valid_o_net;
  sum_monit_o <= sum_monit_o_net;
  sum_monit_valid_o <= sum_monit_valid_o_net;
  sum_tbt_o <= sum_tbt_o_net;
  sum_tbt_valid_o <= sum_tbt_valid_o_net;
  tbt_amp_ch0_o <= tbt_amp_ch0_o_net;
  tbt_amp_ch1_o <= tbt_amp_ch1_o_net;
  tbt_amp_ch2_o <= tbt_amp_ch2_o_net;
  tbt_amp_ch3_o <= tbt_amp_ch3_o_net;
  tbt_decim_ch01_incorrect_o <= tbt_decim_ch01_incorrect_o_net;
  tbt_decim_ch0_i_o <= tbt_decim_ch0_i_o_net;
  tbt_decim_ch0_q_o <= tbt_decim_ch0_q_o_net;
  tbt_decim_ch1_i_o <= tbt_decim_ch1_i_o_net;
  tbt_decim_ch1_q_o <= tbt_decim_ch1_q_o_net;
  tbt_decim_ch23_incorrect_o <= tbt_decim_ch23_incorrect_o_net;
  tbt_decim_ch2_i_o <= tbt_decim_ch2_i_o_net;
  tbt_decim_ch2_q_o <= tbt_decim_ch2_q_o_net;
  tbt_decim_ch3_i_o <= tbt_decim_ch3_i_o_net;
  tbt_decim_ch3_q_o <= tbt_decim_ch3_q_o_net;
  tbt_pha_ch0_o <= tbt_pha_ch0_o_net;
  tbt_pha_ch1_o <= tbt_pha_ch1_o_net;
  tbt_pha_ch2_o <= tbt_pha_ch2_o_net;
  tbt_pha_ch3_o <= tbt_pha_ch3_o_net;
  we <= we_net;
  we_x0 <= we_x0_net;
  we_x1 <= we_x1_net;
  we_x10 <= we_x10_net;
  we_x2 <= we_x2_net;
  we_x3 <= we_x3_net;
  we_x4 <= we_x4_net;
  we_x5 <= we_x5_net;
  we_x6 <= we_x6_net;
  we_x7 <= we_x7_net;
  we_x8 <= we_x8_net;
  we_x9 <= we_x9_net;
  x_fofb_o <= x_fofb_o_net;
  x_fofb_valid_o <= x_fofb_valid_o_net;
  x_monit_1_o <= x_monit_1_o_net;
  x_monit_1_valid_o <= x_monit_1_valid_o_net;
  x_monit_o <= x_monit_o_net;
  x_monit_valid_o <= x_monit_valid_o_net;
  x_tbt_o <= x_tbt_o_net;
  x_tbt_valid_o <= x_tbt_valid_o_net;
  y_fofb_o <= y_fofb_o_net;
  y_fofb_valid_o <= y_fofb_valid_o_net;
  y_monit_1_o <= y_monit_1_o_net;
  y_monit_1_valid_o <= y_monit_1_valid_o_net;
  y_monit_o <= y_monit_o_net;
  y_monit_valid_o <= y_monit_valid_o_net;
  y_tbt_o <= y_tbt_o_net;
  y_tbt_valid_o <= y_tbt_valid_o_net;

  bpf_d31c4af409: entity work.bpf_entity_d31c4af409
    port map (
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ce_logic_2 => ce_logic_2_sg_x1,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      din_ch0 => adc_ch0_dbg_data_o_net,
      din_ch1 => adc_ch1_dbg_data_o_net,
      din_ch2 => adc_ch2_dbg_data_o_net,
      din_ch3 => adc_ch3_dbg_data_o_net,
      dout_ch0 => bpf_ch0_o_net,
      dout_ch1 => bpf_ch1_o_net,
      dout_ch2 => bpf_ch2_o_net,
      dout_ch3 => bpf_ch3_o_net
    );

  concat: entity work.concat_43e7f055fa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => assert10_dout_net_x2,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net_x0
    );

  concat1: entity work.concat_43e7f055fa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => valid_ds_down_x2,
      in1 => reinterpret2_output_port_net,
      y => concat1_y_net_x0
    );

  concat2: entity work.concat_43e7f055fa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => assert9_dout_net_x2,
      in1 => reinterpret3_output_port_net,
      y => concat2_y_net_x0
    );

  concat3: entity work.concat_43e7f055fa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => assert12_dout_net_x2,
      in1 => reinterpret4_output_port_net,
      y => concat3_y_net_x0
    );

  constant10: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant10_op_net_x0
    );

  constant11: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant11_op_net_x0
    );

  constant15: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant15_op_net_x1
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net_x1
    );

  convert_filt_fda412c1bf: entity work.convert_filt_entity_fda412c1bf
    port map (
      din => delay_q_net_x4,
      dout => reinterpret5_output_port_net_x1
    );

  dds_sub_a4b6b880f6: entity work.dds_sub_entity_a4b6b880f6
    port map (
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ce_logic_1 => ce_logic_1_sg_x20,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      dds_config_valid_ch0_i => dds_config_valid_ch0_i_net,
      dds_config_valid_ch1_i => dds_config_valid_ch1_i_net,
      dds_config_valid_ch2_i => dds_config_valid_ch2_i_net,
      dds_config_valid_ch3_i => dds_config_valid_ch3_i_net,
      dds_pinc_ch0_i => dds_pinc_ch0_i_net,
      dds_pinc_ch1_i => dds_pinc_ch1_i_net,
      dds_pinc_ch2_i => dds_pinc_ch2_i_net,
      dds_pinc_ch3_i => dds_pinc_ch3_i_net,
      dds_poff_ch0_i => dds_poff_ch0_i_net,
      dds_poff_ch1_i => dds_poff_ch1_i_net,
      dds_poff_ch2_i => dds_poff_ch2_i_net,
      dds_poff_ch3_i => dds_poff_ch3_i_net,
      dds_01_cosine => register_q_net_x12,
      dds_01_sine => register_q_net_x13,
      dds_23_cosine => register_q_net_x14,
      dds_23_sine => register_q_net_x15
    );

  delta_sigma_fofb_ee61e649ea: entity work.delta_sigma_fofb_entity_ee61e649ea
    port map (
      a => down_sample2_q_net_x20,
      b => down_sample1_q_net_x20,
      c => down_sample2_q_net_x21,
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ce_2224 => ce_2224_sg_x32,
      ce_logic_2224 => ce_logic_2224_sg_x1,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      clk_2224 => clk_2224_sg_x32,
      d => down_sample1_q_net_x21,
      ds_thres => del_sig_div_fofb_thres_i_net,
      from_fifo => data_out_net,
      from_fifo_x0 => empty_net,
      from_fifo_x1 => data_out_x0_net,
      from_fifo_x2 => empty_x0_net,
      from_fifo_x3 => data_out_x1_net,
      from_fifo_x4 => empty_x1_net,
      from_fifo_x5 => data_out_x2_net,
      from_fifo_x6 => empty_x2_net,
      to_fifo => full_net,
      to_fifo_x0 => full_x0_net,
      to_fifo_x1 => full_x1_net,
      to_fifo_x2 => full_x2_net,
      fifo_fofb_q => we_net,
      fifo_fofb_q_x0 => re_net,
      fifo_fofb_sum => we_x0_net,
      fifo_fofb_sum_x0 => re_x0_net,
      fifo_fofb_x => we_x1_net,
      fifo_fofb_x_x0 => re_x1_net,
      fifo_fofb_y => we_x2_net,
      fifo_fofb_y_x0 => re_x2_net,
      q => assert8_dout_net_x1,
      q_valid => assert9_dout_net_x1,
      register10_x0 => data_in_net,
      register7_x0 => data_in_x1_net,
      register9_x0 => data_in_x2_net,
      sum_d_s_fpga => data_in_x0_net,
      sum_valid => assert12_dout_net_x1,
      sum_x0 => assert11_dout_net_x1,
      x => assert5_dout_net_x1,
      x_valid => assert10_dout_net_x1,
      y => assert4_dout_net_x1,
      y_valid => valid_ds_down_x1
    );

  delta_sigma_monit_a8f8b81626: entity work.delta_sigma_monit_entity_a8f8b81626
    port map (
      a => down_sample2_q_net_x5,
      b => down_sample1_q_net_x5,
      c => down_sample3_q_net_x5,
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ce_22240000 => ce_22240000_sg_x25,
      ce_5000 => ce_5000_sg_x10,
      ce_logic_22240000 => ce_logic_22240000_sg_x1,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      clk_22240000 => clk_22240000_sg_x25,
      clk_5000 => clk_5000_sg_x10,
      d => down_sample4_q_net_x5,
      ds_thres => del_sig_div_monit_thres_i_net,
      from_fifo => data_out_x3_net,
      from_fifo_x0 => empty_x3_net,
      from_fifo_x1 => data_out_x4_net,
      from_fifo_x2 => empty_x4_net,
      from_fifo_x3 => data_out_x5_net,
      from_fifo_x4 => empty_x5_net,
      from_fifo_x5 => data_out_x6_net,
      from_fifo_x6 => empty_x6_net,
      to_fifo => full_x3_net,
      to_fifo_x0 => full_x4_net,
      to_fifo_x1 => full_x5_net,
      to_fifo_x2 => full_x6_net,
      fifo_tbt_q => we_x3_net,
      fifo_tbt_q_x0 => re_x3_net,
      fifo_tbt_sum => we_x4_net,
      fifo_tbt_sum_x0 => re_x4_net,
      fifo_tbt_x => we_x5_net,
      fifo_tbt_x_x0 => re_x5_net,
      fifo_tbt_y => we_x6_net,
      fifo_tbt_y_x0 => re_x6_net,
      q => assert4_dout_net_x2,
      q_valid => assert9_dout_net_x2,
      register10_x0 => data_in_x3_net,
      register7_x0 => data_in_x5_net,
      register9_x0 => data_in_x6_net,
      sum_d_s_fpga => data_in_x4_net,
      sum_valid => assert12_dout_net_x2,
      sum_x0 => assert11_dout_net_x2,
      x => assert5_dout_net_x2,
      x_valid => assert10_dout_net_x2,
      y => assert7_dout_net_x1,
      y_valid => valid_ds_down_x2
    );

  delta_sigma_tbt_bbfa8a8a69: entity work.delta_sigma_tbt_entity_bbfa8a8a69
    port map (
      a => down_sample2_q_net_x34,
      b => down_sample1_q_net_x34,
      c => down_sample2_q_net_x35,
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ce_70 => ce_70_sg_x31,
      ce_logic_70 => ce_logic_70_sg_x1,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      clk_70 => clk_70_sg_x31,
      d => down_sample1_q_net_x35,
      ds_thres => del_sig_div_tbt_thres_i_net,
      from_fifo => data_out_x7_net,
      from_fifo_x0 => empty_x7_net,
      from_fifo_x1 => data_out_x8_net,
      from_fifo_x2 => empty_x8_net,
      from_fifo_x3 => data_out_x9_net,
      from_fifo_x4 => empty_x9_net,
      from_fifo_x5 => data_out_x10_net,
      from_fifo_x6 => empty_x10_net,
      to_fifo => full_x7_net,
      to_fifo_x0 => full_x8_net,
      to_fifo_x1 => full_x9_net,
      to_fifo_x2 => full_x10_net,
      delta_q_d_s_fpga => data_in_x7_net,
      delta_x_d_s_fpga => data_in_x9_net,
      delta_y_d_s_fpga => data_in_x10_net,
      fifo_tbt_q => we_x7_net,
      fifo_tbt_q_x0 => re_x7_net,
      fifo_tbt_sum => we_x8_net,
      fifo_tbt_sum_x0 => re_x8_net,
      fifo_tbt_x => we_x9_net,
      fifo_tbt_x_x0 => re_x9_net,
      fifo_tbt_y => we_x10_net,
      fifo_tbt_y_x0 => re_x10_net,
      q => assert8_dout_net_x2,
      q_valid => assert9_dout_net_x3,
      sum_d_s_fpga => data_in_x8_net,
      sum_valid => assert12_dout_net_x3,
      sum_x0 => assert11_dout_net_x3,
      x => assert5_dout_net_x3,
      x_valid => assert10_dout_net_x3,
      y => dout_down_x1,
      y_valid => valid_ds_down_x3
    );

  fofb_amp_8b25d4b0b6: entity work.fofb_amp_entity_8b25d4b0b6
    port map (
      ce_1 => ce_1_sg_x97,
      ce_1112 => ce_1112_sg_x28,
      ce_2224 => ce_2224_sg_x32,
      ce_logic_1 => ce_logic_1_sg_x20,
      ch_in0 => register3_q_net_x15,
      ch_in1 => register3_q_net_x16,
      clk_1 => clk_1_sg_x97,
      clk_1112 => clk_1112_sg_x28,
      clk_2224 => clk_2224_sg_x32,
      i_in0 => register4_q_net_x14,
      i_in1 => register4_q_net_x15,
      q_in0 => register5_q_net_x15,
      q_in1 => register5_q_net_x16,
      amp_out0 => down_sample2_q_net_x20,
      amp_out1 => down_sample1_q_net_x20,
      amp_out2 => down_sample2_q_net_x21,
      amp_out3 => down_sample1_q_net_x21,
      fofb_amp0 => fofb_amp_ch1_o_net,
      fofb_amp0_x0 => fofb_amp_ch0_o_net,
      fofb_amp0_x1 => fofb_pha_ch1_o_net,
      fofb_amp0_x2 => fofb_pha_ch0_o_net,
      fofb_amp0_x3 => fofb_decim_ch1_i_o_net,
      fofb_amp0_x4 => fofb_decim_ch0_i_o_net,
      fofb_amp0_x5 => fofb_decim_ch1_q_o_net,
      fofb_amp0_x6 => fofb_decim_ch0_q_o_net,
      fofb_amp0_x7 => cic_fofb_q_01_missing_o_net,
      fofb_amp1 => fofb_amp_ch3_o_net,
      fofb_amp1_x0 => fofb_amp_ch2_o_net,
      fofb_amp1_x1 => fofb_pha_ch3_o_net,
      fofb_amp1_x2 => fofb_pha_ch2_o_net,
      fofb_amp1_x3 => fofb_decim_ch3_i_o_net,
      fofb_amp1_x4 => fofb_decim_ch2_i_o_net,
      fofb_amp1_x5 => fofb_decim_ch3_q_o_net,
      fofb_amp1_x6 => fofb_decim_ch2_q_o_net,
      fofb_amp1_x7 => cic_fofb_q_23_missing_o_net
    );

  k_fofb_mult3_697accc8e2: entity work.k_fofb_mult3_entity_697accc8e2
    port map (
      ce_2 => ce_2_sg_x39,
      ce_2224 => ce_2224_sg_x32,
      clk_2 => clk_2_sg_x39,
      clk_2224 => clk_2224_sg_x32,
      in1 => assert5_dout_net_x1,
      in2 => kx_i_net,
      vld_in => assert10_dout_net_x1,
      out1 => x_fofb_o_net,
      vld_out => x_fofb_valid_o_net
    );

  k_fofb_mult4_102b49a84e: entity work.k_fofb_mult3_entity_697accc8e2
    port map (
      ce_2 => ce_2_sg_x39,
      ce_2224 => ce_2224_sg_x32,
      clk_2 => clk_2_sg_x39,
      clk_2224 => clk_2224_sg_x32,
      in1 => assert4_dout_net_x1,
      in2 => ky_i_net,
      vld_in => valid_ds_down_x1,
      out1 => y_fofb_o_net,
      vld_out => y_fofb_valid_o_net
    );

  k_fofb_mult5_ed47def699: entity work.k_fofb_mult3_entity_697accc8e2
    port map (
      ce_2 => ce_2_sg_x39,
      ce_2224 => ce_2224_sg_x32,
      clk_2 => clk_2_sg_x39,
      clk_2224 => clk_2224_sg_x32,
      in1 => assert8_dout_net_x1,
      in2 => kx_i_net,
      vld_in => assert9_dout_net_x1,
      out1 => q_fofb_o_net,
      vld_out => q_fofb_valid_o_net
    );

  k_monit_1_mult2_30ad492eba: entity work.k_monit_1_mult_entity_016885a3ac
    port map (
      ce_2 => ce_2_sg_x39,
      ce_222400000 => ce_222400000_sg_x7,
      clk_2 => clk_2_sg_x39,
      clk_222400000 => clk_222400000_sg_x7,
      in1 => reinterpret1_output_port_net_x1,
      in2 => ky_i_net,
      vld_in => ufix_to_bool1_dout_net_x1,
      out1 => y_monit_1_o_net,
      vld_out => y_monit_1_valid_o_net
    );

  k_monit_1_mult6_71da64dfef: entity work.k_monit_1_mult_entity_016885a3ac
    port map (
      ce_2 => ce_2_sg_x39,
      ce_222400000 => ce_222400000_sg_x7,
      clk_2 => clk_2_sg_x39,
      clk_222400000 => clk_222400000_sg_x7,
      in1 => reinterpret2_output_port_net_x1,
      in2 => kx_i_net,
      vld_in => ufix_to_bool2_dout_net_x1,
      out1 => q_monit_1_o_net,
      vld_out => q_monit_1_valid_o_net
    );

  k_monit_1_mult_016885a3ac: entity work.k_monit_1_mult_entity_016885a3ac
    port map (
      ce_2 => ce_2_sg_x39,
      ce_222400000 => ce_222400000_sg_x7,
      clk_2 => clk_2_sg_x39,
      clk_222400000 => clk_222400000_sg_x7,
      in1 => reinterpret3_output_port_net_x1,
      in2 => kx_i_net,
      vld_in => ufix_to_bool_dout_net_x1,
      out1 => x_monit_1_o_net,
      vld_out => x_monit_1_valid_o_net
    );

  k_monit_mult3_8a778fb5f4: entity work.k_monit_mult3_entity_8a778fb5f4
    port map (
      ce_2 => ce_2_sg_x39,
      ce_22240000 => ce_22240000_sg_x25,
      clk_2 => clk_2_sg_x39,
      clk_22240000 => clk_22240000_sg_x25,
      in1 => assert5_dout_net_x2,
      in2 => kx_i_net,
      vld_in => assert10_dout_net_x2,
      out1 => x_monit_o_net,
      vld_out => x_monit_valid_o_net
    );

  k_monit_mult4_1b07b5102a: entity work.k_monit_mult3_entity_8a778fb5f4
    port map (
      ce_2 => ce_2_sg_x39,
      ce_22240000 => ce_22240000_sg_x25,
      clk_2 => clk_2_sg_x39,
      clk_22240000 => clk_22240000_sg_x25,
      in1 => assert7_dout_net_x1,
      in2 => ky_i_net,
      vld_in => valid_ds_down_x2,
      out1 => y_monit_o_net,
      vld_out => y_monit_valid_o_net
    );

  k_monit_mult5_a064f6aaae: entity work.k_monit_mult3_entity_8a778fb5f4
    port map (
      ce_2 => ce_2_sg_x39,
      ce_22240000 => ce_22240000_sg_x25,
      clk_2 => clk_2_sg_x39,
      clk_22240000 => clk_22240000_sg_x25,
      in1 => assert4_dout_net_x2,
      in2 => kx_i_net,
      vld_in => assert9_dout_net_x2,
      out1 => q_monit_o_net,
      vld_out => q_monit_valid_o_net
    );

  k_tbt_mult1_cebfa469e3: entity work.k_tbt_mult_entity_b8fafff255
    port map (
      ce_2 => ce_2_sg_x39,
      ce_70 => ce_70_sg_x31,
      clk_2 => clk_2_sg_x39,
      clk_70 => clk_70_sg_x31,
      in1 => dout_down_x1,
      in2 => ky_i_net,
      vld_in => valid_ds_down_x3,
      out1 => y_tbt_o_net,
      vld_out => y_tbt_valid_o_net
    );

  k_tbt_mult2_2b721a52a5: entity work.k_tbt_mult_entity_b8fafff255
    port map (
      ce_2 => ce_2_sg_x39,
      ce_70 => ce_70_sg_x31,
      clk_2 => clk_2_sg_x39,
      clk_70 => clk_70_sg_x31,
      in1 => assert8_dout_net_x2,
      in2 => kx_i_net,
      vld_in => assert9_dout_net_x3,
      out1 => q_tbt_o_net,
      vld_out => q_tbt_valid_o_net
    );

  k_tbt_mult_b8fafff255: entity work.k_tbt_mult_entity_b8fafff255
    port map (
      ce_2 => ce_2_sg_x39,
      ce_70 => ce_70_sg_x31,
      clk_2 => clk_2_sg_x39,
      clk_70 => clk_70_sg_x31,
      in1 => assert5_dout_net_x3,
      in2 => kx_i_net,
      vld_in => assert10_dout_net_x3,
      out1 => x_tbt_o_net,
      vld_out => x_tbt_valid_o_net
    );

  ksum_fofb_mult4_ac3ed97096: entity work.ksum_fofb_mult4_entity_ac3ed97096
    port map (
      ce_2 => ce_2_sg_x39,
      ce_2224 => ce_2224_sg_x32,
      clk_2 => clk_2_sg_x39,
      clk_2224 => clk_2224_sg_x32,
      in1 => assert11_dout_net_x1,
      in2 => ksum_i_net,
      vld_in => assert12_dout_net_x1,
      out1 => sum_fofb_o_net,
      vld_out => sum_fofb_valid_o_net
    );

  ksum_monit_1_mult1_c66dc07078: entity work.ksum_monit_1_mult1_entity_c66dc07078
    port map (
      ce_2 => ce_2_sg_x39,
      ce_222400000 => ce_222400000_sg_x7,
      clk_2 => clk_2_sg_x39,
      clk_222400000 => clk_222400000_sg_x7,
      in1 => reinterpret4_output_port_net_x1,
      in2 => ksum_i_net,
      vld_in => ufix_to_bool3_dout_net_x1,
      out1 => sum_monit_1_o_net,
      vld_out => sum_monit_1_valid_o_net
    );

  ksum_monit_mult2_31877b6d2b: entity work.ksum_monit_mult2_entity_31877b6d2b
    port map (
      ce_2 => ce_2_sg_x39,
      ce_22240000 => ce_22240000_sg_x25,
      clk_2 => clk_2_sg_x39,
      clk_22240000 => clk_22240000_sg_x25,
      in1 => assert11_dout_net_x2,
      in2 => ksum_i_net,
      vld_in => assert12_dout_net_x2,
      out1 => sum_monit_o_net,
      vld_out => sum_monit_valid_o_net
    );

  ksum_tbt_mult3_e0be30d675: entity work.ksum_tbt_mult3_entity_e0be30d675
    port map (
      ce_2 => ce_2_sg_x39,
      ce_70 => ce_70_sg_x31,
      clk_2 => clk_2_sg_x39,
      clk_70 => clk_70_sg_x31,
      in1 => assert11_dout_net_x3,
      in2 => ksum_i_net,
      vld_in => assert12_dout_net_x3,
      out1 => sum_tbt_o_net,
      vld_out => sum_tbt_valid_o_net
    );

  mixer_a1cd828545: entity work.mixer_entity_a1cd828545
    port map (
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ch_in0 => register1_q_net_x8,
      ch_in1 => register1_q_net_x9,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      dds_cosine_0 => register_q_net_x12,
      dds_cosine_1 => register_q_net_x14,
      dds_msine_0 => register_q_net_x13,
      dds_msine_1 => register_q_net_x15,
      dds_valid_0 => constant15_op_net_x1,
      dds_valid_1 => constant3_op_net_x1,
      din0 => register_q_net_x35,
      din1 => register_q_net_x36,
      ch_out0 => register3_q_net_x15,
      ch_out1 => register3_q_net_x16,
      i_out0 => register4_q_net_x14,
      i_out1 => register4_q_net_x15,
      q_out0 => register5_q_net_x15,
      q_out1 => register5_q_net_x16,
      tddm_mixer => mix_ch1_i_o_net,
      tddm_mixer_x0 => mix_ch0_i_o_net,
      tddm_mixer_x1 => mix_ch1_q_o_net,
      tddm_mixer_x2 => mix_ch0_q_o_net,
      tddm_mixer_x3 => mix_ch3_i_o_net,
      tddm_mixer_x4 => mix_ch2_i_o_net,
      tddm_mixer_x5 => mix_ch3_q_o_net,
      tddm_mixer_x6 => mix_ch2_q_o_net
    );

  monit_amp_44da74e268: entity work.monit_amp_entity_44da74e268
    port map (
      ce_1 => ce_1_sg_x97,
      ce_1390000 => ce_1390000_sg_x3,
      ce_22240000 => ce_22240000_sg_x25,
      ce_2780000 => ce_2780000_sg_x4,
      ce_556 => ce_556_sg_x3,
      ce_5560000 => ce_5560000_sg_x12,
      ce_logic_1390000 => ce_logic_1390000_sg_x2,
      ce_logic_2780000 => ce_logic_2780000_sg_x2,
      ce_logic_556 => ce_logic_556_sg_x3,
      ch_in => ch_out_x2,
      clk_1 => clk_1_sg_x97,
      clk_1390000 => clk_1390000_sg_x3,
      clk_22240000 => clk_22240000_sg_x25,
      clk_2780000 => clk_2780000_sg_x4,
      clk_556 => clk_556_sg_x3,
      clk_5560000 => clk_5560000_sg_x12,
      din => dout_x2,
      amp_out0 => down_sample2_q_net_x5,
      amp_out1 => down_sample1_q_net_x5,
      amp_out2 => down_sample3_q_net_x5,
      amp_out3 => down_sample4_q_net_x5,
      monit_amp_c => monit_amp_ch1_o_net,
      monit_amp_c_x0 => monit_amp_ch0_o_net,
      monit_amp_c_x1 => monit_amp_ch2_o_net,
      monit_amp_c_x2 => monit_amp_ch3_o_net,
      monit_amp_c_x3 => monit_cfir_incorrect_o_net,
      monit_amp_c_x4 => monit_cic_unexpected_o_net,
      monit_amp_c_x5 => monit_pfir_incorrect_o_net
    );

  monit_pos_1_522c8cf08d: entity work.monit_pos_1_entity_522c8cf08d
    port map (
      ce_1 => ce_1_sg_x97,
      ce_222400000 => ce_222400000_sg_x7,
      ce_5560000 => ce_5560000_sg_x12,
      ce_55600000 => ce_55600000_sg_x5,
      ce_logic_5560000 => ce_logic_5560000_sg_x2,
      ch_in => delay_q_net_x3,
      clk_1 => clk_1_sg_x97,
      clk_222400000 => clk_222400000_sg_x7,
      clk_5560000 => clk_5560000_sg_x12,
      clk_55600000 => clk_55600000_sg_x5,
      din => reinterpret5_output_port_net_x1,
      monit_1_pos_q => reinterpret2_output_port_net_x1,
      monit_1_pos_x => reinterpret3_output_port_net_x1,
      monit_1_pos_y => reinterpret1_output_port_net_x1,
      monit_1_sum => reinterpret4_output_port_net_x1,
      monit_1_vld_q => ufix_to_bool2_dout_net_x1,
      monit_1_vld_sum => ufix_to_bool3_dout_net_x1,
      monit_1_vld_x => ufix_to_bool_dout_net_x1,
      monit_1_vld_y => ufix_to_bool1_dout_net_x1,
      monit_pos_1_c_x0 => monit_pos_1_incorrect_o_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 16,
      init_value => b"0000000000000000"
    )
    port map (
      ce => ce_2_sg_x39,
      clk => clk_2_sg_x39,
      d => adc_ch1_i_net,
      en => "1",
      rst => "0",
      q => adc_ch1_dbg_data_o_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 16,
      init_value => b"0000000000000000"
    )
    port map (
      ce => ce_2_sg_x39,
      clk => clk_2_sg_x39,
      d => adc_ch2_i_net,
      en => "1",
      rst => "0",
      q => adc_ch2_dbg_data_o_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 16,
      init_value => b"0000000000000000"
    )
    port map (
      ce => ce_2_sg_x39,
      clk => clk_2_sg_x39,
      d => adc_ch3_i_net,
      en => "1",
      rst => "0",
      q => adc_ch3_dbg_data_o_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 16,
      init_value => b"0000000000000000"
    )
    port map (
      ce => ce_2_sg_x39,
      clk => clk_2_sg_x39,
      d => adc_ch0_i_net,
      en => "1",
      rst => "0",
      q => adc_ch0_dbg_data_o_net
    );

  reinterpret1: entity work.reinterpret_c3c0e847be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => assert5_dout_net_x2,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_c3c0e847be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => assert7_dout_net_x1,
      output_port => reinterpret2_output_port_net
    );

  reinterpret3: entity work.reinterpret_c3c0e847be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => assert4_dout_net_x2,
      output_port => reinterpret3_output_port_net
    );

  reinterpret4: entity work.reinterpret_c3c0e847be
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => assert11_dout_net_x2,
      output_port => reinterpret4_output_port_net
    );

  tbt_amp_cbd277bb0c: entity work.tbt_amp_entity_cbd277bb0c
    port map (
      ce_1 => ce_1_sg_x97,
      ce_35 => ce_35_sg_x26,
      ce_70 => ce_70_sg_x31,
      ce_logic_1 => ce_logic_1_sg_x20,
      ch_in0 => register3_q_net_x15,
      ch_in1 => register3_q_net_x16,
      clk_1 => clk_1_sg_x97,
      clk_35 => clk_35_sg_x26,
      clk_70 => clk_70_sg_x31,
      i_in0 => register4_q_net_x14,
      i_in1 => register4_q_net_x15,
      q_in0 => register5_q_net_x15,
      q_in1 => register5_q_net_x16,
      amp_out0 => down_sample2_q_net_x34,
      amp_out1 => down_sample1_q_net_x34,
      amp_out2 => down_sample2_q_net_x35,
      amp_out3 => down_sample1_q_net_x35,
      tbt_amp0 => tbt_amp_ch1_o_net,
      tbt_amp0_x0 => tbt_amp_ch0_o_net,
      tbt_amp0_x1 => tbt_pha_ch1_o_net,
      tbt_amp0_x2 => tbt_pha_ch0_o_net,
      tbt_amp0_x3 => tbt_decim_ch01_incorrect_o_net,
      tbt_amp0_x4 => tbt_decim_ch1_i_o_net,
      tbt_amp0_x5 => tbt_decim_ch0_i_o_net,
      tbt_amp0_x6 => tbt_decim_ch1_q_o_net,
      tbt_amp0_x7 => tbt_decim_ch0_q_o_net,
      tbt_amp1 => tbt_amp_ch3_o_net,
      tbt_amp1_x0 => tbt_amp_ch2_o_net,
      tbt_amp1_x1 => tbt_pha_ch3_o_net,
      tbt_amp1_x2 => tbt_pha_ch2_o_net,
      tbt_amp1_x3 => tbt_decim_ch23_incorrect_o_net,
      tbt_amp1_x4 => tbt_decim_ch3_i_o_net,
      tbt_amp1_x5 => tbt_decim_ch2_i_o_net,
      tbt_amp1_x6 => tbt_decim_ch3_q_o_net,
      tbt_amp1_x7 => tbt_decim_ch2_q_o_net
    );

  tdm_mix_54ce67e6e8: entity work.tdm_mix_entity_54ce67e6e8
    port map (
      ce_1 => ce_1_sg_x97,
      ce_2 => ce_2_sg_x39,
      ce_logic_1 => ce_logic_1_sg_x20,
      clk_1 => clk_1_sg_x97,
      clk_2 => clk_2_sg_x39,
      din_ch0 => bpf_ch0_o_net,
      din_ch1 => bpf_ch1_o_net,
      din_ch2 => bpf_ch2_o_net,
      din_ch3 => bpf_ch3_o_net,
      ch_out0 => register1_q_net_x8,
      ch_out1 => register1_q_net_x9,
      dout0 => register_q_net_x35,
      dout1 => register_q_net_x36
    );

  tdm_monit_1_746ecf54b0: entity work.tdm_monit_1_entity_746ecf54b0
    port map (
      ce_1 => ce_1_sg_x97,
      ce_22240000 => ce_22240000_sg_x25,
      ce_2500 => ce_2500_sg_x3,
      ce_5560000 => ce_5560000_sg_x12,
      ce_logic_5560000 => ce_logic_5560000_sg_x2,
      clk_1 => clk_1_sg_x97,
      clk_22240000 => clk_22240000_sg_x25,
      clk_2500 => clk_2500_sg_x3,
      clk_5560000 => clk_5560000_sg_x12,
      din_ch0 => concat_y_net_x0,
      din_ch1 => concat1_y_net_x0,
      din_ch2 => concat2_y_net_x0,
      din_ch3 => concat3_y_net_x0,
      rst => constant11_op_net_x0,
      ch_out => delay_q_net_x3,
      dout => delay_q_net_x4
    );

  tdm_monit_6e38292ecb: entity work.tdm_monit_entity_6e38292ecb
    port map (
      ce_1 => ce_1_sg_x97,
      ce_2224 => ce_2224_sg_x32,
      ce_556 => ce_556_sg_x3,
      ce_logic_556 => ce_logic_556_sg_x3,
      clk_1 => clk_1_sg_x97,
      clk_2224 => clk_2224_sg_x32,
      clk_556 => clk_556_sg_x3,
      din_ch0 => down_sample2_q_net_x20,
      din_ch1 => down_sample1_q_net_x20,
      din_ch2 => down_sample2_q_net_x21,
      din_ch3 => down_sample1_q_net_x21,
      rst => constant10_op_net_x0,
      ch_out => ch_out_x2,
      dout => dout_x2
    );

end structural;
