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
  signal adc_ch0_i_net_x0: std_logic_vector(15 downto 0);
  signal adc_ch1_i_net_x0: std_logic_vector(15 downto 0);
  signal adc_ch2_i_net_x0: std_logic_vector(15 downto 0);
  signal adc_ch3_i_net_x0: std_logic_vector(15 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path0_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path1_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path2_net: std_logic_vector(23 downto 0);
  signal bpf_fpga_m_axis_data_tdata_path3_net: std_logic_vector(23 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal ce_2_sg_x0: std_logic;
  signal ce_logic_2_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal clk_2_sg_x0: std_logic;
  signal reinterpret2_output_port_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret4_output_port_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x0 <= ce_1;
  ce_2_sg_x0 <= ce_2;
  ce_logic_2_sg_x0 <= ce_logic_2;
  clk_1_sg_x0 <= clk_1;
  clk_2_sg_x0 <= clk_2;
  adc_ch0_i_net_x0 <= din_ch0;
  adc_ch1_i_net_x0 <= din_ch1;
  adc_ch2_i_net_x0 <= din_ch2;
  adc_ch3_i_net_x0 <= din_ch3;
  dout_ch0 <= reinterpret4_output_port_net_x0;
  dout_ch1 <= reinterpret_output_port_net_x0;
  dout_ch2 <= reinterpret2_output_port_net_x0;
  dout_ch3 <= reinterpret3_output_port_net_x0;

  bpf_fpga: entity work.xlfir_compiler_5c49e68d4a338363199fcba5a3e22356
    port map (
      ce => ce_1_sg_x0,
      ce_2 => ce_2_sg_x0,
      ce_logic_2 => ce_logic_2_sg_x0,
      clk => clk_1_sg_x0,
      clk_2 => clk_2_sg_x0,
      clk_logic_2 => clk_2_sg_x0,
      s_axis_data_tdata_path0 => adc_ch3_i_net_x0,
      s_axis_data_tdata_path1 => adc_ch2_i_net_x0,
      s_axis_data_tdata_path2 => adc_ch1_i_net_x0,
      s_axis_data_tdata_path3 => adc_ch0_i_net_x0,
      src_ce => ce_2_sg_x0,
      src_clk => clk_2_sg_x0,
      m_axis_data_tdata_path0 => bpf_fpga_m_axis_data_tdata_path0_net,
      m_axis_data_tdata_path1 => bpf_fpga_m_axis_data_tdata_path1_net,
      m_axis_data_tdata_path2 => bpf_fpga_m_axis_data_tdata_path2_net,
      m_axis_data_tdata_path3 => bpf_fpga_m_axis_data_tdata_path3_net
    );

  reinterpret: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path2_net,
      output_port => reinterpret_output_port_net_x0
    );

  reinterpret2: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path1_net,
      output_port => reinterpret2_output_port_net_x0
    );

  reinterpret3: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path0_net,
      output_port => reinterpret3_output_port_net_x0
    );

  reinterpret4: entity work.reinterpret_b62f4240f0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => bpf_fpga_m_axis_data_tdata_path3_net,
      output_port => reinterpret4_output_port_net_x0
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

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_CORDIC/TDDM_tbt_cordic0"

entity tddm_tbt_cordic0_entity_38de3613fe is
  port (
    ce_1112: in std_logic; 
    ce_2224: in std_logic; 
    clk_1112: in std_logic; 
    clk_2224: in std_logic; 
    fofb_cordic_ch_in: in std_logic; 
    fofb_cordic_din: in std_logic_vector(23 downto 0); 
    fofb_cordic_data0_out: out std_logic_vector(23 downto 0); 
    fofb_cordic_data1_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic0_entity_38de3613fe;

architecture structural of tddm_tbt_cordic0_entity_38de3613fe is
  signal ce_1112_sg_x4: std_logic;
  signal ce_2224_sg_x4: std_logic;
  signal clk_1112_sg_x4: std_logic;
  signal clk_2224_sg_x4: std_logic;
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal register1_q_net_x5: std_logic;
  signal register5_q_net_x4: std_logic_vector(23 downto 0);

begin
  ce_1112_sg_x4 <= ce_1112;
  ce_2224_sg_x4 <= ce_2224;
  clk_1112_sg_x4 <= clk_1112;
  clk_2224_sg_x4 <= clk_2224;
  register1_q_net_x5 <= fofb_cordic_ch_in;
  register5_q_net_x4 <= fofb_cordic_din;
  fofb_cordic_data0_out <= down_sample2_q_net_x1;
  fofb_cordic_data1_out <= down_sample1_q_net_x1;

  tddm_fofb_cordic0_int_516d0c2a22: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x4,
      ce_2224 => ce_2224_sg_x4,
      ch_in => register1_q_net_x5,
      clk_1112 => clk_1112_sg_x4,
      clk_2224 => clk_2224_sg_x4,
      din => register5_q_net_x4,
      dout_ch0 => down_sample2_q_net_x1,
      dout_ch1 => down_sample1_q_net_x1
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
    tddm_tbt_cordic0_x0: out std_logic_vector(23 downto 0)
  );
end fofb_cordic_entity_fad57e49ce;

architecture structural of fofb_cordic_entity_fad57e49ce is
  signal ce_1112_sg_x5: std_logic;
  signal ce_2224_sg_x5: std_logic;
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x0: std_logic;
  signal clk_1112_sg_x5: std_logic;
  signal clk_2224_sg_x5: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal expression_dout_net_x0: std_logic;
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x6: std_logic;
  signal register5_q_net_x5: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1112_sg_x5 <= ce_1112;
  ce_2224_sg_x5 <= ce_2224;
  cic_fofb_i_m_axis_data_tuser_chan_out_net_x0 <= ch_in;
  clk_1112_sg_x5 <= clk_1112;
  clk_2224_sg_x5 <= clk_2224;
  reinterpret1_output_port_net_x0 <= i_in;
  reinterpret_output_port_net_x0 <= q_in;
  expression_dout_net_x0 <= valid_in;
  amp_out <= register5_q_net_x5;
  ch_out <= register1_q_net_x6;
  tddm_tbt_cordic0 <= down_sample1_q_net_x2;
  tddm_tbt_cordic0_x0 <= down_sample2_q_net_x2;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_1112_sg_x5,
      clk => clk_1112_sg_x5,
      s_axis_cartesian_tdata_imag => reinterpret_output_port_net_x0,
      s_axis_cartesian_tdata_real => reinterpret1_output_port_net_x0,
      s_axis_cartesian_tuser_user(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net_x0,
      s_axis_cartesian_tvalid => expression_dout_net_x0,
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
      ce => ce_1112_sg_x5,
      clk => clk_1112_sg_x5,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x6
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x5,
      clk => clk_1112_sg_x5,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x5
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
      ce_1112 => ce_1112_sg_x5,
      ce_2224 => ce_2224_sg_x5,
      clk_1112 => clk_1112_sg_x5,
      clk_2224 => clk_2224_sg_x5,
      fofb_cordic_ch_in => register1_q_net_x6,
      fofb_cordic_din => register5_q_net_x5,
      fofb_cordic_data0_out => down_sample2_q_net_x2,
      fofb_cordic_data1_out => down_sample1_q_net_x2
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
  signal ce_1112_sg_x8: std_logic;
  signal ce_2224_sg_x8: std_logic;
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x3: std_logic;
  signal clk_1112_sg_x8: std_logic;
  signal clk_2224_sg_x8: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);

begin
  ce_1112_sg_x8 <= ce_1112;
  ce_2224_sg_x8 <= ce_2224;
  clk_1112_sg_x8 <= clk_1112;
  clk_2224_sg_x8 <= clk_2224;
  cic_fofb_i_m_axis_data_tuser_chan_out_net_x3 <= fofb_ch_in;
  reinterpret_output_port_net_x3 <= fofb_i_in;
  reinterpret_output_port_net_x2 <= fofb_q_in;
  cic_fofb_ch0_i_out <= down_sample2_q_net_x2;
  cic_fofb_ch0_q_out <= down_sample2_q_net_x3;
  cic_fofb_ch1_i_out <= down_sample1_q_net_x2;
  cic_fofb_ch1_q_out <= down_sample1_q_net_x3;

  tddm_fofb_cic0_i_06b84397ec: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x8,
      ce_2224 => ce_2224_sg_x8,
      ch_in => cic_fofb_i_m_axis_data_tuser_chan_out_net_x3,
      clk_1112 => clk_1112_sg_x8,
      clk_2224 => clk_2224_sg_x8,
      din => reinterpret_output_port_net_x3,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_fofb_cic0_q_a6a1d7c301: entity work.tddm_fofb_amp0_entity_fd74c6ad6e
    port map (
      ce_1112 => ce_1112_sg_x8,
      ce_2224 => ce_2224_sg_x8,
      ch_in => cic_fofb_i_m_axis_data_tuser_chan_out_net_x3,
      clk_1112 => clk_1112_sg_x8,
      clk_2224 => clk_2224_sg_x8,
      din => reinterpret_output_port_net_x2,
      dout_ch0 => down_sample2_q_net_x3,
      dout_ch1 => down_sample1_q_net_x3
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/FOFB_amp/fofb_amp0/FOFB_amp/Trunc2"

entity trunc2_entity_3462e9e0db is
  port (
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end trunc2_entity_3462e9e0db;

architecture structural of trunc2_entity_3462e9e0db is
  signal reinterpret_output_port_net_x1: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal slice_y_net: std_logic_vector(23 downto 0);

begin
  reinterpret_output_port_net_x1 <= din;
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
      x => reinterpret_output_port_net_x1,
      y => slice_y_net
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
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end cic_fofb_entity_2ed6a6e00c;

architecture structural of cic_fofb_entity_2ed6a6e00c is
  signal ce_1112_sg_x9: std_logic;
  signal ce_1_sg_x1: std_logic;
  signal ce_logic_1_sg_x0: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x4: std_logic;
  signal cic_fofb_i_m_axis_data_tvalid_net: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_q_m_axis_data_tvalid_net: std_logic;
  signal clk_1112_sg_x9: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal delay1_q_net: std_logic_vector(23 downto 0);
  signal delay4_q_net_x0: std_logic;
  signal delay6_q_net_x0: std_logic_vector(23 downto 0);
  signal delay7_q_net_x0: std_logic_vector(23 downto 0);
  signal delay_q_net: std_logic_vector(23 downto 0);
  signal expression_dout_net_x1: std_logic;
  signal relational1_op_net: std_logic;

begin
  ce_1_sg_x1 <= ce_1;
  ce_1112_sg_x9 <= ce_1112;
  ce_logic_1_sg_x0 <= ce_logic_1;
  delay4_q_net_x0 <= ch_in;
  clk_1_sg_x1 <= clk_1;
  clk_1112_sg_x9 <= clk_1112;
  delay7_q_net_x0 <= i_in;
  delay6_q_net_x0 <= q_in;
  ch_out <= cic_fofb_i_m_axis_data_tuser_chan_out_net_x4;
  i_out <= cic_fofb_i_m_axis_data_tdata_data_net_x0;
  q_out <= cic_fofb_q_m_axis_data_tdata_data_net_x0;
  valid_out <= expression_dout_net_x1;

  cic_fofb_i: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x1,
      ce_1112 => ce_1112_sg_x9,
      ce_logic_1 => ce_logic_1_sg_x0,
      clk => clk_1_sg_x1,
      clk_1112 => clk_1112_sg_x9,
      clk_logic_1 => clk_1_sg_x1,
      s_axis_data_tdata_data => delay1_q_net,
      s_axis_data_tlast => relational1_op_net,
      m_axis_data_tdata_data => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      m_axis_data_tuser_chan_out(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net_x4,
      m_axis_data_tvalid => cic_fofb_i_m_axis_data_tvalid_net
    );

  cic_fofb_q: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x1,
      ce_1112 => ce_1112_sg_x9,
      ce_logic_1 => ce_logic_1_sg_x0,
      clk => clk_1_sg_x1,
      clk_1112 => clk_1112_sg_x9,
      clk_logic_1 => clk_1_sg_x1,
      s_axis_data_tdata_data => delay_q_net,
      s_axis_data_tlast => relational1_op_net,
      m_axis_data_tdata_data => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_fofb_q_m_axis_data_tvalid_net
    );

  constant_x0: entity work.constant_cda50df78a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => delay6_q_net_x0,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      d => delay7_q_net_x0,
      en => '1',
      rst => '1',
      q => delay1_q_net
    );

  expression: entity work.expr_3c2515cf08
    port map (
      a(0) => cic_fofb_q_m_axis_data_tvalid_net,
      b(0) => cic_fofb_i_m_axis_data_tvalid_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression_dout_net_x1
    );

  relational1: entity work.relational_d29d27b7b3
    port map (
      a(0) => delay4_q_net_x0,
      b => constant_op_net,
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      op(0) => relational1_op_net
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
  signal ce_1112_sg_x10: std_logic;
  signal ce_1_sg_x2: std_logic;
  signal ce_2224_sg_x9: std_logic;
  signal ce_logic_1_sg_x1: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x5: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal clk_1112_sg_x10: std_logic;
  signal clk_1_sg_x2: std_logic;
  signal clk_2224_sg_x9: std_logic;
  signal delay4_q_net_x1: std_logic;
  signal delay6_q_net_x1: std_logic_vector(23 downto 0);
  signal delay7_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal expression_dout_net_x2: std_logic;
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x2 <= ce_1;
  ce_1112_sg_x10 <= ce_1112;
  ce_2224_sg_x9 <= ce_2224;
  ce_logic_1_sg_x1 <= ce_logic_1;
  delay4_q_net_x1 <= ch_in;
  clk_1_sg_x2 <= clk_1;
  clk_1112_sg_x10 <= clk_1112;
  clk_2224_sg_x9 <= clk_2224;
  delay7_q_net_x1 <= i_in;
  delay6_q_net_x1 <= q_in;
  ch_out <= cic_fofb_i_m_axis_data_tuser_chan_out_net_x5;
  i_out <= reinterpret1_output_port_net_x2;
  q_out <= reinterpret_output_port_net_x5;
  tddm_fofb_cic0 <= down_sample1_q_net_x4;
  tddm_fofb_cic0_x0 <= down_sample2_q_net_x4;
  tddm_fofb_cic0_x1 <= down_sample1_q_net_x5;
  tddm_fofb_cic0_x2 <= down_sample2_q_net_x5;
  valid_out <= expression_dout_net_x2;

  cic_fofb_2ed6a6e00c: entity work.cic_fofb_entity_2ed6a6e00c
    port map (
      ce_1 => ce_1_sg_x2,
      ce_1112 => ce_1112_sg_x10,
      ce_logic_1 => ce_logic_1_sg_x1,
      ch_in => delay4_q_net_x1,
      clk_1 => clk_1_sg_x2,
      clk_1112 => clk_1112_sg_x10,
      i_in => delay7_q_net_x1,
      q_in => delay6_q_net_x1,
      ch_out => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      i_out => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      q_out => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      valid_out => expression_dout_net_x2
    );

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret_output_port_net_x5
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret1_output_port_net_x2
    );

  tddm_fofb_cic0_6b909292ff: entity work.tddm_fofb_cic0_entity_6b909292ff
    port map (
      ce_1112 => ce_1112_sg_x10,
      ce_2224 => ce_2224_sg_x9,
      clk_1112 => clk_1112_sg_x10,
      clk_2224 => clk_2224_sg_x9,
      fofb_ch_in => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      fofb_i_in => reinterpret_output_port_net_x4,
      fofb_q_in => reinterpret_output_port_net_x3,
      cic_fofb_ch0_i_out => down_sample2_q_net_x4,
      cic_fofb_ch0_q_out => down_sample2_q_net_x5,
      cic_fofb_ch1_i_out => down_sample1_q_net_x4,
      cic_fofb_ch1_q_out => down_sample1_q_net_x5
    );

  trunc2_3462e9e0db: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret_output_port_net_x5,
      dout => reinterpret_output_port_net_x3
    );

  trunc3_f53345228a: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret1_output_port_net_x2,
      dout => reinterpret_output_port_net_x4
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
    fofb_cordic: out std_logic_vector(23 downto 0); 
    fofb_cordic_x0: out std_logic_vector(23 downto 0)
  );
end fofb_amp0_entity_95b23bfc2c;

architecture structural of fofb_amp0_entity_95b23bfc2c is
  signal ce_1112_sg_x11: std_logic;
  signal ce_1_sg_x3: std_logic;
  signal ce_2224_sg_x10: std_logic;
  signal ce_logic_1_sg_x2: std_logic;
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x5: std_logic;
  signal clk_1112_sg_x11: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal clk_2224_sg_x10: std_logic;
  signal delay4_q_net_x2: std_logic;
  signal delay6_q_net_x2: std_logic_vector(23 downto 0);
  signal delay7_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal expression_dout_net_x2: std_logic;
  signal register1_q_net_x7: std_logic;
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x3 <= ce_1;
  ce_1112_sg_x11 <= ce_1112;
  ce_2224_sg_x10 <= ce_2224;
  ce_logic_1_sg_x2 <= ce_logic_1;
  delay4_q_net_x2 <= ch_in;
  clk_1_sg_x3 <= clk_1;
  clk_1112_sg_x11 <= clk_1112;
  clk_2224_sg_x10 <= clk_2224;
  delay7_q_net_x2 <= i_in;
  delay6_q_net_x2 <= q_in;
  amp_out <= register5_q_net_x6;
  ch_out <= register1_q_net_x7;
  fofb_amp <= down_sample1_q_net_x7;
  fofb_amp_x0 <= down_sample2_q_net_x7;
  fofb_amp_x1 <= down_sample1_q_net_x8;
  fofb_amp_x2 <= down_sample2_q_net_x8;
  fofb_cordic <= down_sample1_q_net_x6;
  fofb_cordic_x0 <= down_sample2_q_net_x6;

  fofb_amp_078cdb1842: entity work.fofb_amp_entity_078cdb1842
    port map (
      ce_1 => ce_1_sg_x3,
      ce_1112 => ce_1112_sg_x11,
      ce_2224 => ce_2224_sg_x10,
      ce_logic_1 => ce_logic_1_sg_x2,
      ch_in => delay4_q_net_x2,
      clk_1 => clk_1_sg_x3,
      clk_1112 => clk_1112_sg_x11,
      clk_2224 => clk_2224_sg_x10,
      i_in => delay7_q_net_x2,
      q_in => delay6_q_net_x2,
      ch_out => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      i_out => reinterpret1_output_port_net_x2,
      q_out => reinterpret_output_port_net_x5,
      tddm_fofb_cic0 => down_sample1_q_net_x7,
      tddm_fofb_cic0_x0 => down_sample2_q_net_x7,
      tddm_fofb_cic0_x1 => down_sample1_q_net_x8,
      tddm_fofb_cic0_x2 => down_sample2_q_net_x8,
      valid_out => expression_dout_net_x2
    );

  fofb_cordic_fad57e49ce: entity work.fofb_cordic_entity_fad57e49ce
    port map (
      ce_1112 => ce_1112_sg_x11,
      ce_2224 => ce_2224_sg_x10,
      ch_in => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      clk_1112 => clk_1112_sg_x11,
      clk_2224 => clk_2224_sg_x10,
      i_in => reinterpret1_output_port_net_x2,
      q_in => reinterpret_output_port_net_x5,
      valid_in => expression_dout_net_x2,
      amp_out => register5_q_net_x6,
      ch_out => register1_q_net_x7,
      tddm_tbt_cordic0 => down_sample1_q_net_x6,
      tddm_tbt_cordic0_x0 => down_sample2_q_net_x6
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
    tddm_fofb_cordic1_x0: out std_logic_vector(23 downto 0)
  );
end fofb_cordic_entity_e4c0810ec7;

architecture structural of fofb_cordic_entity_e4c0810ec7 is
  signal ce_1112_sg_x14: std_logic;
  signal ce_2224_sg_x13: std_logic;
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x0: std_logic;
  signal clk_1112_sg_x14: std_logic;
  signal clk_2224_sg_x13: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal expression_dout_net_x0: std_logic;
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x7: std_logic;
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1112_sg_x14 <= ce_1112;
  ce_2224_sg_x13 <= ce_2224;
  cic_fofb_i_m_axis_data_tuser_chan_out_net_x0 <= ch_in;
  clk_1112_sg_x14 <= clk_1112;
  clk_2224_sg_x13 <= clk_2224;
  reinterpret1_output_port_net_x0 <= i_in;
  reinterpret_output_port_net_x0 <= q_in;
  expression_dout_net_x0 <= valid_in;
  amp_out <= register5_q_net_x6;
  ch_out <= register1_q_net_x7;
  tddm_fofb_cordic1 <= down_sample1_q_net_x2;
  tddm_fofb_cordic1_x0 <= down_sample2_q_net_x2;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_1112_sg_x14,
      clk => clk_1112_sg_x14,
      s_axis_cartesian_tdata_imag => reinterpret_output_port_net_x0,
      s_axis_cartesian_tdata_real => reinterpret1_output_port_net_x0,
      s_axis_cartesian_tuser_user(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net_x0,
      s_axis_cartesian_tvalid => expression_dout_net_x0,
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
      ce => ce_1112_sg_x14,
      clk => clk_1112_sg_x14,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x7
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1112_sg_x14,
      clk => clk_1112_sg_x14,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x6
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
      ce_1112 => ce_1112_sg_x14,
      ce_2224 => ce_2224_sg_x13,
      clk_1112 => clk_1112_sg_x14,
      clk_2224 => clk_2224_sg_x13,
      fofb_cordic_ch_in => register1_q_net_x7,
      fofb_cordic_din => register5_q_net_x6,
      fofb_cordic_data0_out => down_sample2_q_net_x2,
      fofb_cordic_data1_out => down_sample1_q_net_x2
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
    i_out: out std_logic_vector(24 downto 0); 
    q_out: out std_logic_vector(24 downto 0); 
    valid_out: out std_logic
  );
end cic_fofb_entity_579902476d;

architecture structural of cic_fofb_entity_579902476d is
  signal ce_1112_sg_x18: std_logic;
  signal ce_1_sg_x4: std_logic;
  signal ce_logic_1_sg_x3: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x4: std_logic;
  signal cic_fofb_i_m_axis_data_tvalid_net: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_q_m_axis_data_tvalid_net: std_logic;
  signal clk_1112_sg_x18: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal constant_op_net: std_logic;
  signal delay1_q_net: std_logic_vector(23 downto 0);
  signal delay4_q_net_x0: std_logic;
  signal delay6_q_net_x0: std_logic_vector(23 downto 0);
  signal delay7_q_net_x0: std_logic_vector(23 downto 0);
  signal delay_q_net: std_logic_vector(23 downto 0);
  signal expression_dout_net_x1: std_logic;
  signal relational1_op_net: std_logic;

begin
  ce_1_sg_x4 <= ce_1;
  ce_1112_sg_x18 <= ce_1112;
  ce_logic_1_sg_x3 <= ce_logic_1;
  delay4_q_net_x0 <= ch_in;
  clk_1_sg_x4 <= clk_1;
  clk_1112_sg_x18 <= clk_1112;
  delay7_q_net_x0 <= i_in;
  delay6_q_net_x0 <= q_in;
  ch_out <= cic_fofb_i_m_axis_data_tuser_chan_out_net_x4;
  i_out <= cic_fofb_i_m_axis_data_tdata_data_net_x0;
  q_out <= cic_fofb_q_m_axis_data_tdata_data_net_x0;
  valid_out <= expression_dout_net_x1;

  cic_fofb_i: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x4,
      ce_1112 => ce_1112_sg_x18,
      ce_logic_1 => ce_logic_1_sg_x3,
      clk => clk_1_sg_x4,
      clk_1112 => clk_1112_sg_x18,
      clk_logic_1 => clk_1_sg_x4,
      s_axis_data_tdata_data => delay1_q_net,
      s_axis_data_tlast => relational1_op_net,
      m_axis_data_tdata_data => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      m_axis_data_tuser_chan_out(0) => cic_fofb_i_m_axis_data_tuser_chan_out_net_x4,
      m_axis_data_tvalid => cic_fofb_i_m_axis_data_tvalid_net
    );

  cic_fofb_q: entity work.xlcic_compiler_7373a9a257c6e448caebe0d43b2c869b
    port map (
      ce => ce_1_sg_x4,
      ce_1112 => ce_1112_sg_x18,
      ce_logic_1 => ce_logic_1_sg_x3,
      clk => clk_1_sg_x4,
      clk_1112 => clk_1112_sg_x18,
      clk_logic_1 => clk_1_sg_x4,
      s_axis_data_tdata_data => delay_q_net,
      s_axis_data_tlast => relational1_op_net,
      m_axis_data_tdata_data => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      m_axis_data_tvalid => cic_fofb_q_m_axis_data_tvalid_net
    );

  constant_x0: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d => delay6_q_net_x0,
      en => '1',
      rst => '1',
      q => delay_q_net
    );

  delay1: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      d => delay7_q_net_x0,
      en => '1',
      rst => '1',
      q => delay1_q_net
    );

  expression: entity work.expr_3c2515cf08
    port map (
      a(0) => cic_fofb_q_m_axis_data_tvalid_net,
      b(0) => cic_fofb_i_m_axis_data_tvalid_net,
      ce => '0',
      clk => '0',
      clr => '0',
      dout(0) => expression_dout_net_x1
    );

  relational1: entity work.relational_a892e1bf40
    port map (
      a(0) => delay4_q_net_x0,
      b(0) => constant_op_net,
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      op(0) => relational1_op_net
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
  signal ce_1112_sg_x19: std_logic;
  signal ce_1_sg_x5: std_logic;
  signal ce_2224_sg_x17: std_logic;
  signal ce_logic_1_sg_x4: std_logic;
  signal cic_fofb_i_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x5: std_logic;
  signal cic_fofb_q_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal clk_1112_sg_x19: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal clk_2224_sg_x17: std_logic;
  signal delay4_q_net_x1: std_logic;
  signal delay6_q_net_x1: std_logic_vector(23 downto 0);
  signal delay7_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal expression_dout_net_x2: std_logic;
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x5 <= ce_1;
  ce_1112_sg_x19 <= ce_1112;
  ce_2224_sg_x17 <= ce_2224;
  ce_logic_1_sg_x4 <= ce_logic_1;
  delay4_q_net_x1 <= ch_in;
  clk_1_sg_x5 <= clk_1;
  clk_1112_sg_x19 <= clk_1112;
  clk_2224_sg_x17 <= clk_2224;
  delay7_q_net_x1 <= i_in;
  delay6_q_net_x1 <= q_in;
  ch_out <= cic_fofb_i_m_axis_data_tuser_chan_out_net_x5;
  i_out <= reinterpret1_output_port_net_x2;
  q_out <= reinterpret_output_port_net_x5;
  tddm_fofb_cic1 <= down_sample1_q_net_x4;
  tddm_fofb_cic1_x0 <= down_sample2_q_net_x4;
  tddm_fofb_cic1_x1 <= down_sample1_q_net_x5;
  tddm_fofb_cic1_x2 <= down_sample2_q_net_x5;
  valid_out <= expression_dout_net_x2;

  cic_fofb_579902476d: entity work.cic_fofb_entity_579902476d
    port map (
      ce_1 => ce_1_sg_x5,
      ce_1112 => ce_1112_sg_x19,
      ce_logic_1 => ce_logic_1_sg_x4,
      ch_in => delay4_q_net_x1,
      clk_1 => clk_1_sg_x5,
      clk_1112 => clk_1112_sg_x19,
      i_in => delay7_q_net_x1,
      q_in => delay6_q_net_x1,
      ch_out => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      i_out => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      q_out => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      valid_out => expression_dout_net_x2
    );

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_q_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret_output_port_net_x5
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => cic_fofb_i_m_axis_data_tdata_data_net_x0,
      output_port => reinterpret1_output_port_net_x2
    );

  tddm_fofb_cic1_4a640315a5: entity work.tddm_fofb_cic0_entity_6b909292ff
    port map (
      ce_1112 => ce_1112_sg_x19,
      ce_2224 => ce_2224_sg_x17,
      clk_1112 => clk_1112_sg_x19,
      clk_2224 => clk_2224_sg_x17,
      fofb_ch_in => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      fofb_i_in => reinterpret_output_port_net_x4,
      fofb_q_in => reinterpret_output_port_net_x3,
      cic_fofb_ch0_i_out => down_sample2_q_net_x4,
      cic_fofb_ch0_q_out => down_sample2_q_net_x5,
      cic_fofb_ch1_i_out => down_sample1_q_net_x4,
      cic_fofb_ch1_q_out => down_sample1_q_net_x5
    );

  trunc2_a8d5edbf1e: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret_output_port_net_x5,
      dout => reinterpret_output_port_net_x3
    );

  trunc3_c3350094b5: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret1_output_port_net_x2,
      dout => reinterpret_output_port_net_x4
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
    fofb_cordic: out std_logic_vector(23 downto 0); 
    fofb_cordic_x0: out std_logic_vector(23 downto 0)
  );
end fofb_amp1_entity_a049562dde;

architecture structural of fofb_amp1_entity_a049562dde is
  signal ce_1112_sg_x20: std_logic;
  signal ce_1_sg_x6: std_logic;
  signal ce_2224_sg_x18: std_logic;
  signal ce_logic_1_sg_x5: std_logic;
  signal cic_fofb_i_m_axis_data_tuser_chan_out_net_x5: std_logic;
  signal clk_1112_sg_x20: std_logic;
  signal clk_1_sg_x6: std_logic;
  signal clk_2224_sg_x18: std_logic;
  signal delay4_q_net_x2: std_logic;
  signal delay6_q_net_x2: std_logic_vector(23 downto 0);
  signal delay7_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal expression_dout_net_x2: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register5_q_net_x7: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x6 <= ce_1;
  ce_1112_sg_x20 <= ce_1112;
  ce_2224_sg_x18 <= ce_2224;
  ce_logic_1_sg_x5 <= ce_logic_1;
  delay4_q_net_x2 <= ch_in;
  clk_1_sg_x6 <= clk_1;
  clk_1112_sg_x20 <= clk_1112;
  clk_2224_sg_x18 <= clk_2224;
  delay7_q_net_x2 <= i_in;
  delay6_q_net_x2 <= q_in;
  amp_out <= register5_q_net_x7;
  ch_out <= register1_q_net_x8;
  fofb_amp <= down_sample1_q_net_x7;
  fofb_amp_x0 <= down_sample2_q_net_x7;
  fofb_amp_x1 <= down_sample1_q_net_x8;
  fofb_amp_x2 <= down_sample2_q_net_x8;
  fofb_cordic <= down_sample1_q_net_x6;
  fofb_cordic_x0 <= down_sample2_q_net_x6;

  fofb_amp_f70fcc8ed9: entity work.fofb_amp_entity_f70fcc8ed9
    port map (
      ce_1 => ce_1_sg_x6,
      ce_1112 => ce_1112_sg_x20,
      ce_2224 => ce_2224_sg_x18,
      ce_logic_1 => ce_logic_1_sg_x5,
      ch_in => delay4_q_net_x2,
      clk_1 => clk_1_sg_x6,
      clk_1112 => clk_1112_sg_x20,
      clk_2224 => clk_2224_sg_x18,
      i_in => delay7_q_net_x2,
      q_in => delay6_q_net_x2,
      ch_out => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      i_out => reinterpret1_output_port_net_x2,
      q_out => reinterpret_output_port_net_x5,
      tddm_fofb_cic1 => down_sample1_q_net_x7,
      tddm_fofb_cic1_x0 => down_sample2_q_net_x7,
      tddm_fofb_cic1_x1 => down_sample1_q_net_x8,
      tddm_fofb_cic1_x2 => down_sample2_q_net_x8,
      valid_out => expression_dout_net_x2
    );

  fofb_cordic_e4c0810ec7: entity work.fofb_cordic_entity_e4c0810ec7
    port map (
      ce_1112 => ce_1112_sg_x20,
      ce_2224 => ce_2224_sg_x18,
      ch_in => cic_fofb_i_m_axis_data_tuser_chan_out_net_x5,
      clk_1112 => clk_1112_sg_x20,
      clk_2224 => clk_2224_sg_x18,
      i_in => reinterpret1_output_port_net_x2,
      q_in => reinterpret_output_port_net_x5,
      valid_in => expression_dout_net_x2,
      amp_out => register5_q_net_x7,
      ch_out => register1_q_net_x8,
      tddm_fofb_cordic1 => down_sample1_q_net_x6,
      tddm_fofb_cordic1_x0 => down_sample2_q_net_x6
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
    fofb_amp1: out std_logic_vector(23 downto 0); 
    fofb_amp1_x0: out std_logic_vector(23 downto 0); 
    fofb_amp1_x1: out std_logic_vector(23 downto 0); 
    fofb_amp1_x2: out std_logic_vector(23 downto 0); 
    fofb_amp1_x3: out std_logic_vector(23 downto 0); 
    fofb_amp1_x4: out std_logic_vector(23 downto 0)
  );
end fofb_amp_entity_8b25d4b0b6;

architecture structural of fofb_amp_entity_8b25d4b0b6 is
  signal ce_1112_sg_x21: std_logic;
  signal ce_1_sg_x7: std_logic;
  signal ce_2224_sg_x19: std_logic;
  signal ce_logic_1_sg_x6: std_logic;
  signal clk_1112_sg_x21: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal clk_2224_sg_x19: std_logic;
  signal delay4_q_net_x4: std_logic;
  signal delay4_q_net_x5: std_logic;
  signal delay6_q_net_x4: std_logic_vector(23 downto 0);
  signal delay6_q_net_x5: std_logic_vector(23 downto 0);
  signal delay7_q_net_x4: std_logic_vector(23 downto 0);
  signal delay7_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x12: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x13: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x14: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x12: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x13: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x14: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x19: std_logic_vector(23 downto 0);
  signal register1_q_net_x7: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal register5_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x7 <= ce_1;
  ce_1112_sg_x21 <= ce_1112;
  ce_2224_sg_x19 <= ce_2224;
  ce_logic_1_sg_x6 <= ce_logic_1;
  delay4_q_net_x4 <= ch_in0;
  delay4_q_net_x5 <= ch_in1;
  clk_1_sg_x7 <= clk_1;
  clk_1112_sg_x21 <= clk_1112;
  clk_2224_sg_x19 <= clk_2224;
  delay7_q_net_x4 <= i_in0;
  delay7_q_net_x5 <= i_in1;
  delay6_q_net_x4 <= q_in0;
  delay6_q_net_x5 <= q_in1;
  amp_out0 <= down_sample2_q_net_x12;
  amp_out1 <= down_sample1_q_net_x12;
  amp_out2 <= down_sample2_q_net_x13;
  amp_out3 <= down_sample1_q_net_x13;
  fofb_amp0 <= down_sample1_q_net_x14;
  fofb_amp0_x0 <= down_sample2_q_net_x14;
  fofb_amp0_x1 <= down_sample1_q_net_x15;
  fofb_amp0_x2 <= down_sample2_q_net_x15;
  fofb_amp0_x3 <= down_sample1_q_net_x16;
  fofb_amp0_x4 <= down_sample2_q_net_x16;
  fofb_amp1 <= down_sample1_q_net_x17;
  fofb_amp1_x0 <= down_sample2_q_net_x17;
  fofb_amp1_x1 <= down_sample1_q_net_x18;
  fofb_amp1_x2 <= down_sample2_q_net_x18;
  fofb_amp1_x3 <= down_sample1_q_net_x19;
  fofb_amp1_x4 <= down_sample2_q_net_x19;

  fofb_amp0_95b23bfc2c: entity work.fofb_amp0_entity_95b23bfc2c
    port map (
      ce_1 => ce_1_sg_x7,
      ce_1112 => ce_1112_sg_x21,
      ce_2224 => ce_2224_sg_x19,
      ce_logic_1 => ce_logic_1_sg_x6,
      ch_in => delay4_q_net_x4,
      clk_1 => clk_1_sg_x7,
      clk_1112 => clk_1112_sg_x21,
      clk_2224 => clk_2224_sg_x19,
      i_in => delay7_q_net_x4,
      q_in => delay6_q_net_x4,
      amp_out => register5_q_net_x6,
      ch_out => register1_q_net_x7,
      fofb_amp => down_sample1_q_net_x15,
      fofb_amp_x0 => down_sample2_q_net_x15,
      fofb_amp_x1 => down_sample1_q_net_x16,
      fofb_amp_x2 => down_sample2_q_net_x16,
      fofb_cordic => down_sample1_q_net_x14,
      fofb_cordic_x0 => down_sample2_q_net_x14
    );

  fofb_amp1_a049562dde: entity work.fofb_amp1_entity_a049562dde
    port map (
      ce_1 => ce_1_sg_x7,
      ce_1112 => ce_1112_sg_x21,
      ce_2224 => ce_2224_sg_x19,
      ce_logic_1 => ce_logic_1_sg_x6,
      ch_in => delay4_q_net_x5,
      clk_1 => clk_1_sg_x7,
      clk_1112 => clk_1112_sg_x21,
      clk_2224 => clk_2224_sg_x19,
      i_in => delay7_q_net_x5,
      q_in => delay6_q_net_x5,
      amp_out => register5_q_net_x7,
      ch_out => register1_q_net_x8,
      fofb_amp => down_sample1_q_net_x18,
      fofb_amp_x0 => down_sample2_q_net_x18,
      fofb_amp_x1 => down_sample1_q_net_x19,
      fofb_amp_x2 => down_sample2_q_net_x19,
      fofb_cordic => down_sample1_q_net_x17,
      fofb_cordic_x0 => down_sample2_q_net_x17
    );

  tddm_fofb_amp_4ch_2cc521a83f: entity work.tddm_fofb_amp_4ch_entity_2cc521a83f
    port map (
      amp_in0 => register5_q_net_x6,
      amp_in1 => register5_q_net_x7,
      ce_1112 => ce_1112_sg_x21,
      ce_2224 => ce_2224_sg_x19,
      ch_in0 => register1_q_net_x7,
      ch_in1 => register1_q_net_x8,
      clk_1112 => clk_1112_sg_x21,
      clk_2224 => clk_2224_sg_x19,
      amp_out0 => down_sample2_q_net_x12,
      amp_out1 => down_sample1_q_net_x12,
      amp_out2 => down_sample2_q_net_x13,
      amp_out3 => down_sample1_q_net_x13
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_fofb_mult/Cast_truncate1"

entity cast_truncate1_entity_34ede9bd50 is
  port (
    in1: in std_logic_vector(49 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end cast_truncate1_entity_34ede9bd50;

architecture structural of cast_truncate1_entity_34ede9bd50 is
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

-- Generated from Simulink block "ddc_bpm_476_066/Ksum_fofb_mult"

entity ksum_fofb_mult_entity_6af626cc30 is
  port (
    ce_2: in std_logic; 
    clk_2: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end ksum_fofb_mult_entity_6af626cc30;

architecture structural of ksum_fofb_mult_entity_6af626cc30 is
  signal assert6_dout_net_x0: std_logic_vector(24 downto 0);
  signal ce_2_sg_x1: std_logic;
  signal clk_2_sg_x1: std_logic;
  signal ksum_net_x0: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x1 <= ce_2;
  clk_2_sg_x1 <= clk_2;
  assert6_dout_net_x0 <= in1;
  ksum_net_x0 <= in2;
  out1 <= reinterpret_output_port_net_x1;

  cast_truncate1_34ede9bd50: entity work.cast_truncate1_entity_34ede9bd50
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x1
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
      a => assert6_dout_net_x0,
      b => ksum_net_x0,
      ce => ce_2_sg_x1,
      clk => clk_2_sg_x1,
      clr => '0',
      core_ce => ce_2_sg_x1,
      core_clk => clk_2_sg_x1,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Kx_fofb_mult/Cast_truncate1"

entity cast_truncate1_entity_dac1af24a2 is
  port (
    in1: in std_logic_vector(49 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end cast_truncate1_entity_dac1af24a2;

architecture structural of cast_truncate1_entity_dac1af24a2 is
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

-- Generated from Simulink block "ddc_bpm_476_066/Kx_fofb_mult"

entity kx_fofb_mult_entity_da06e4eb4a is
  port (
    ce_2: in std_logic; 
    clk_2: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end kx_fofb_mult_entity_da06e4eb4a;

architecture structural of kx_fofb_mult_entity_da06e4eb4a is
  signal assert5_dout_net_x0: std_logic_vector(24 downto 0);
  signal ce_2_sg_x4: std_logic;
  signal clk_2_sg_x4: std_logic;
  signal kx_net_x0: std_logic_vector(24 downto 0);
  signal kx_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x4 <= ce_2;
  clk_2_sg_x4 <= clk_2;
  assert5_dout_net_x0 <= in1;
  kx_net_x0 <= in2;
  out1 <= reinterpret_output_port_net_x1;

  cast_truncate1_dac1af24a2: entity work.cast_truncate1_entity_dac1af24a2
    port map (
      in1 => kx_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x1
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
      b => kx_net_x0,
      ce => ce_2_sg_x4,
      clk => clk_2_sg_x4,
      clr => '0',
      core_ce => ce_2_sg_x4,
      core_clk => clk_2_sg_x4,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => kx_tbt_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/Ky_tbt_mult"

entity ky_tbt_mult_entity_ab5fc2072b is
  port (
    ce_2: in std_logic; 
    clk_2: in std_logic; 
    in1: in std_logic_vector(24 downto 0); 
    in2: in std_logic_vector(24 downto 0); 
    out1: out std_logic_vector(25 downto 0)
  );
end ky_tbt_mult_entity_ab5fc2072b;

architecture structural of ky_tbt_mult_entity_ab5fc2072b is
  signal assert7_dout_net_x0: std_logic_vector(24 downto 0);
  signal ce_2_sg_x11: std_logic;
  signal clk_2_sg_x11: std_logic;
  signal ky_net_x1: std_logic_vector(24 downto 0);
  signal ky_tbt_p_net_x0: std_logic_vector(49 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x11 <= ce_2;
  clk_2_sg_x11 <= clk_2;
  assert7_dout_net_x0 <= in1;
  ky_net_x1 <= in2;
  out1 <= reinterpret_output_port_net_x1;

  cast_truncate1_35f47d196b: entity work.cast_truncate1_entity_dac1af24a2
    port map (
      in1 => ky_tbt_p_net_x0,
      out1 => reinterpret_output_port_net_x1
    );

  ky_tbt: entity work.xlmult
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
      a => assert7_dout_net_x0,
      b => ky_net_x1,
      ce => ce_2_sg_x11,
      clk => clk_2_sg_x11,
      clr => '0',
      core_ce => ce_2_sg_x11,
      core_clk => clk_2_sg_x11,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => ky_tbt_p_net_x0
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
  signal ce_2_sg_x13: std_logic;
  signal clk_2_sg_x13: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal constant12_op_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);

begin
  ce_2_sg_x13 <= ce_2;
  clk_2_sg_x13 <= clk_2;
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
      ce => ce_2_sg_x13,
      clk => clk_2_sg_x13,
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
      ce => ce_2_sg_x13,
      clk => clk_2_sg_x13,
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
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal constant11_op_net_x1: std_logic;
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x8 <= ce_1;
  clk_1_sg_x8 <= clk_1;
  register_q_net_x1 <= din;
  constant11_op_net_x1 <= en;
  dout <= register_q_net_x2;

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
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
  signal ce_1_sg_x9: std_logic;
  signal ce_2_sg_x14: std_logic;
  signal clk_1_sg_x9: std_logic;
  signal clk_2_sg_x14: std_logic;
  signal complexmult_m_axis_dout_tdata_imag_net: std_logic_vector(23 downto 0);
  signal complexmult_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal complexmult_m_axis_dout_tuser_net: std_logic;
  signal complexmult_m_axis_dout_tvalid_net: std_logic;
  signal constant11_op_net_x2: std_logic;
  signal constant12_op_net_x1: std_logic_vector(23 downto 0);
  signal convert1_dout_net: std_logic_vector(23 downto 0);
  signal convert2_dout_net: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tdata_cosine_net_x0: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tdata_sine_net_x0: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tvalid_net_x0: std_logic;
  signal delay4_q_net_x5: std_logic;
  signal delay6_q_net_x5: std_logic_vector(23 downto 0);
  signal delay7_q_net_x5: std_logic_vector(23 downto 0);
  signal register1_q_net_x0: std_logic;
  signal register1_q_net_x1: std_logic;
  signal register_q_net: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);
  signal register_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x9 <= ce_1;
  ce_2_sg_x14 <= ce_2;
  register1_q_net_x1 <= ch_in;
  clk_1_sg_x9 <= clk_1;
  clk_2_sg_x14 <= clk_2;
  dds_compiler_5_0_m_axis_data_tdata_cosine_net_x0 <= dds_cosine;
  dds_compiler_5_0_m_axis_data_tdata_sine_net_x0 <= dds_msine;
  dds_compiler_5_0_m_axis_data_tvalid_net_x0 <= dds_valid;
  register_q_net_x3 <= din_i;
  constant12_op_net_x1 <= din_q;
  constant11_op_net_x2 <= en;
  ch_out <= delay4_q_net_x5;
  i_out <= delay7_q_net_x5;
  q_out <= delay6_q_net_x5;

  complexmult: entity work.xlcomplex_multiplier_9420c9297365b1438cc1e8469b8205e1
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      s_axis_a_tdata_imag => a_i,
      s_axis_a_tdata_real => a_r,
      s_axis_a_tvalid => dds_compiler_5_0_m_axis_data_tvalid_net_x0,
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
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
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
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert2_dout_net
    );

  datareg_en1_8d533fde9e: entity work.datareg_en1_entity_8d533fde9e
    port map (
      ce_1 => ce_1_sg_x9,
      clk_1 => clk_1_sg_x9,
      din => register_q_net_x3,
      en => constant11_op_net_x2,
      dout => register_q_net_x2
    );

  datareg_en_5c82ef2965: entity work.datareg_en_entity_5c82ef2965
    port map (
      ce_2 => ce_2_sg_x14,
      clk_2 => clk_2_sg_x14,
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

  delay2: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_2_sg_x14,
      clk => clk_2_sg_x14,
      d => dds_compiler_5_0_m_axis_data_tdata_sine_net_x0,
      en => dds_compiler_5_0_m_axis_data_tvalid_net_x0,
      rst => '1',
      q => a_i
    );

  delay3: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_2_sg_x14,
      clk => clk_2_sg_x14,
      d => dds_compiler_5_0_m_axis_data_tdata_cosine_net_x0,
      en => dds_compiler_5_0_m_axis_data_tvalid_net_x0,
      rst => '1',
      q => a_r
    );

  delay4: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 1
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d(0) => complexmult_m_axis_dout_tuser_net,
      en => complexmult_m_axis_dout_tvalid_net,
      rst => '1',
      q(0) => delay4_q_net_x5
    );

  delay6: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d => convert2_dout_net,
      en => complexmult_m_axis_dout_tvalid_net,
      rst => '1',
      q => delay6_q_net_x5
    );

  delay7: entity work.xldelay
    generic map (
      latency => 1,
      reg_retiming => 0,
      reset => 0,
      width => 24
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
      d => convert1_dout_net,
      en => complexmult_m_axis_dout_tvalid_net,
      rst => '1',
      q => delay7_q_net_x5
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x9,
      clk => clk_1_sg_x9,
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
  signal ce_1_sg_x12: std_logic;
  signal ce_2_sg_x17: std_logic;
  signal clk_1_sg_x12: std_logic;
  signal clk_2_sg_x17: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic;
  signal delay4_q_net_x6: std_logic;
  signal delay7_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_1_sg_x12 <= ce_1;
  ce_2_sg_x17 <= ce_2;
  delay4_q_net_x6 <= ch_in;
  clk_1_sg_x12 <= clk_1;
  clk_2_sg_x17 <= clk_2;
  delay7_q_net_x6 <= din;
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
      dest_ce => ce_2_sg_x17,
      dest_clk => clk_2_sg_x17,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x12,
      src_clk => clk_1_sg_x12,
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
      dest_ce => ce_2_sg_x17,
      dest_clk => clk_2_sg_x17,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x12,
      src_clk => clk_1_sg_x12,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x12,
      clk => clk_1_sg_x12,
      d => delay7_q_net_x6,
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
      ce => ce_1_sg_x12,
      clk => clk_1_sg_x12,
      d => delay7_q_net_x6,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => delay4_q_net_x6,
      b(0) => constant_op_net,
      ce => ce_1_sg_x12,
      clk => clk_1_sg_x12,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_d29d27b7b3
    port map (
      a(0) => delay4_q_net_x6,
      b => constant1_op_net,
      ce => ce_1_sg_x12,
      clk => clk_1_sg_x12,
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
  signal ce_1_sg_x16: std_logic;
  signal ce_2_sg_x21: std_logic;
  signal clk_1_sg_x16: std_logic;
  signal clk_2_sg_x21: std_logic;
  signal delay4_q_net_x10: std_logic;
  signal delay4_q_net_x9: std_logic;
  signal delay6_q_net_x8: std_logic_vector(23 downto 0);
  signal delay6_q_net_x9: std_logic_vector(23 downto 0);
  signal delay7_q_net_x8: std_logic_vector(23 downto 0);
  signal delay7_q_net_x9: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x16 <= ce_1;
  ce_2_sg_x21 <= ce_2;
  clk_1_sg_x16 <= clk_1;
  clk_2_sg_x21 <= clk_2;
  delay4_q_net_x9 <= mix0_ch_in;
  delay7_q_net_x8 <= mix0_i_in;
  delay6_q_net_x8 <= mix0_q_in;
  delay4_q_net_x10 <= mix1_ch_in;
  delay7_q_net_x9 <= mix1_i_in;
  delay6_q_net_x9 <= mix1_q_in;
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
      ce_1 => ce_1_sg_x16,
      ce_2 => ce_2_sg_x21,
      ch_in => delay4_q_net_x9,
      clk_1 => clk_1_sg_x16,
      clk_2 => clk_2_sg_x21,
      din => delay7_q_net_x8,
      dout_ch0 => down_sample2_q_net_x4,
      dout_ch1 => down_sample1_q_net_x4
    );

  tddm_mixer0_q_2c5e18f496: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x16,
      ce_2 => ce_2_sg_x21,
      ch_in => delay4_q_net_x9,
      clk_1 => clk_1_sg_x16,
      clk_2 => clk_2_sg_x21,
      din => delay6_q_net_x8,
      dout_ch0 => down_sample2_q_net_x5,
      dout_ch1 => down_sample1_q_net_x5
    );

  tddm_mixer1_i_1afc4ccdba: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x16,
      ce_2 => ce_2_sg_x21,
      ch_in => delay4_q_net_x10,
      clk_1 => clk_1_sg_x16,
      clk_2 => clk_2_sg_x21,
      din => delay7_q_net_x9,
      dout_ch0 => down_sample2_q_net_x6,
      dout_ch1 => down_sample1_q_net_x6
    );

  tddm_mixer1_q_ee4acbed30: entity work.tddm_mixer0_i_entity_f95b8f24ad
    port map (
      ce_1 => ce_1_sg_x16,
      ce_2 => ce_2_sg_x21,
      ch_in => delay4_q_net_x10,
      clk_1 => clk_1_sg_x16,
      clk_2 => clk_2_sg_x21,
      din => delay6_q_net_x9,
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
    dds_cosine: in std_logic_vector(23 downto 0); 
    dds_msine: in std_logic_vector(23 downto 0); 
    dds_valid: in std_logic; 
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
  signal ce_1_sg_x17: std_logic;
  signal ce_2_sg_x22: std_logic;
  signal clk_1_sg_x17: std_logic;
  signal clk_2_sg_x22: std_logic;
  signal constant11_op_net_x2: std_logic;
  signal constant12_op_net_x1: std_logic_vector(23 downto 0);
  signal constant1_op_net_x2: std_logic;
  signal constant2_op_net_x1: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tdata_sine_net_x2: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tvalid_net_x2: std_logic;
  signal delay4_q_net_x11: std_logic;
  signal delay4_q_net_x12: std_logic;
  signal delay6_q_net_x10: std_logic_vector(23 downto 0);
  signal delay6_q_net_x11: std_logic_vector(23 downto 0);
  signal delay7_q_net_x10: std_logic_vector(23 downto 0);
  signal delay7_q_net_x11: std_logic_vector(23 downto 0);
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
  signal register_q_net_x5: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x17 <= ce_1;
  ce_2_sg_x22 <= ce_2;
  register1_q_net_x3 <= ch_in0;
  register1_q_net_x4 <= ch_in1;
  clk_1_sg_x17 <= clk_1;
  clk_2_sg_x22 <= clk_2;
  dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2 <= dds_cosine;
  dds_compiler_5_0_m_axis_data_tdata_sine_net_x2 <= dds_msine;
  dds_compiler_5_0_m_axis_data_tvalid_net_x2 <= dds_valid;
  register_q_net_x5 <= din0;
  register_q_net_x6 <= din1;
  ch_out0 <= delay4_q_net_x11;
  ch_out1 <= delay4_q_net_x12;
  i_out0 <= delay7_q_net_x10;
  i_out1 <= delay7_q_net_x11;
  q_out0 <= delay6_q_net_x10;
  q_out1 <= delay6_q_net_x11;
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
      ce_1 => ce_1_sg_x17,
      ce_2 => ce_2_sg_x22,
      ch_in => register1_q_net_x3,
      clk_1 => clk_1_sg_x17,
      clk_2 => clk_2_sg_x22,
      dds_cosine => dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2,
      dds_msine => dds_compiler_5_0_m_axis_data_tdata_sine_net_x2,
      dds_valid => dds_compiler_5_0_m_axis_data_tvalid_net_x2,
      din_i => register_q_net_x5,
      din_q => constant12_op_net_x1,
      en => constant11_op_net_x2,
      ch_out => delay4_q_net_x11,
      i_out => delay7_q_net_x10,
      q_out => delay6_q_net_x10
    );

  cmixer_1_61bfc18f90: entity work.cmixer_0_entity_f630e8d7ec
    port map (
      ce_1 => ce_1_sg_x17,
      ce_2 => ce_2_sg_x22,
      ch_in => register1_q_net_x4,
      clk_1 => clk_1_sg_x17,
      clk_2 => clk_2_sg_x22,
      dds_cosine => dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2,
      dds_msine => dds_compiler_5_0_m_axis_data_tdata_sine_net_x2,
      dds_valid => dds_compiler_5_0_m_axis_data_tvalid_net_x2,
      din_i => register_q_net_x6,
      din_q => constant2_op_net_x1,
      en => constant1_op_net_x2,
      ch_out => delay4_q_net_x12,
      i_out => delay7_q_net_x11,
      q_out => delay6_q_net_x11
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
      ce_1 => ce_1_sg_x17,
      ce_2 => ce_2_sg_x22,
      clk_1 => clk_1_sg_x17,
      clk_2 => clk_2_sg_x22,
      mix0_ch_in => delay4_q_net_x11,
      mix0_i_in => delay7_q_net_x10,
      mix0_q_in => delay6_q_net_x10,
      mix1_ch_in => delay4_q_net_x12,
      mix1_i_in => delay7_q_net_x11,
      mix1_q_in => delay6_q_net_x11,
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

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast1/format1"

entity format1_entity_38ea21fd86 is
  port (
    ce_5560000: in std_logic; 
    clk_5560000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end format1_entity_38ea21fd86;

architecture structural of format1_entity_38ea21fd86 is
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

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast1"

entity cast1_entity_17ee9c0582 is
  port (
    ce_5560000: in std_logic; 
    clk_5560000: in std_logic; 
    data_in: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end cast1_entity_17ee9c0582;

architecture structural of cast1_entity_17ee9c0582 is
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

  format1_38ea21fd86: entity work.format1_entity_38ea21fd86
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

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast2/format1"

entity format1_entity_4e0a69646b is
  port (
    ce_2780000: in std_logic; 
    clk_2780000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(23 downto 0)
  );
end format1_entity_4e0a69646b;

architecture structural of format1_entity_4e0a69646b is
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

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Cast2"

entity cast2_entity_4b7421c7c9 is
  port (
    ce_2780000: in std_logic; 
    clk_2780000: in std_logic; 
    data_in: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    out_x0: out std_logic_vector(23 downto 0)
  );
end cast2_entity_4b7421c7c9;

architecture structural of cast2_entity_4b7421c7c9 is
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

  format1_4e0a69646b: entity work.format1_entity_4e0a69646b
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

-- Generated from Simulink block "ddc_bpm_476_066/Monit_amp/Monit_amp_c/Reg"

entity reg_entity_68a33d3d79 is
  port (
    ce_1390000: in std_logic; 
    clk_1390000: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    en: in std_logic; 
    dout: out std_logic_vector(23 downto 0)
  );
end reg_entity_68a33d3d79;

architecture structural of reg_entity_68a33d3d79 is
  signal ce_1390000_sg_x0: std_logic;
  signal clk_1390000_sg_x0: std_logic;
  signal convert_dout_net: std_logic_vector(23 downto 0);
  signal monit_cic_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal monit_cic_m_axis_data_tvalid_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(24 downto 0);

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
      din_bin_pt => 23,
      din_width => 25,
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

  reinterpret2: entity work.reinterpret_31a4235b32
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
  signal ce_22240000_sg_x0: std_logic;
  signal ce_5560000_sg_x2: std_logic;
  signal clk_22240000_sg_x0: std_logic;
  signal clk_5560000_sg_x2: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant3_op_net: std_logic_vector(1 downto 0);
  signal constant4_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register2_q_net_x0: std_logic_vector(23 downto 0);
  signal register2_q_net_x1: std_logic_vector(1 downto 0);
  signal register3_q_net: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational_op_net: std_logic;

begin
  ce_22240000_sg_x0 <= ce_22240000;
  ce_5560000_sg_x2 <= ce_5560000;
  register2_q_net_x1 <= ch_in;
  clk_22240000_sg_x0 <= clk_22240000;
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
      dest_ce => ce_22240000_sg_x0,
      dest_clk => clk_22240000_sg_x0,
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
      dest_ce => ce_22240000_sg_x0,
      dest_clk => clk_22240000_sg_x0,
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
      d => register2_q_net_x0,
      dest_ce => ce_22240000_sg_x0,
      dest_clk => clk_22240000_sg_x0,
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
      dest_ce => ce_22240000_sg_x0,
      dest_clk => clk_22240000_sg_x0,
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
      q => register2_q_net_x0
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
      a => register2_q_net_x1,
      b => constant_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_367321bc0c
    port map (
      a => register2_q_net_x1,
      b => constant1_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_367321bc0c
    port map (
      a => register2_q_net_x1,
      b => constant3_op_net,
      ce => ce_5560000_sg_x2,
      clk => clk_5560000_sg_x2,
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_367321bc0c
    port map (
      a => register2_q_net_x1,
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
  signal ce_22240000_sg_x1: std_logic;
  signal ce_5560000_sg_x3: std_logic;
  signal clk_22240000_sg_x1: std_logic;
  signal clk_5560000_sg_x3: std_logic;
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x1: std_logic_vector(23 downto 0);
  signal register2_q_net_x2: std_logic_vector(1 downto 0);
  signal register_q_net_x2: std_logic_vector(23 downto 0);

begin
  ce_22240000_sg_x1 <= ce_22240000;
  ce_5560000_sg_x3 <= ce_5560000;
  clk_22240000_sg_x1 <= clk_22240000;
  clk_5560000_sg_x3 <= clk_5560000;
  register2_q_net_x2 <= monit_ch_in;
  register_q_net_x2 <= monit_din;
  monit_ch0_out <= down_sample2_q_net_x1;
  monit_ch1_out <= down_sample1_q_net_x1;
  monit_ch2_out <= down_sample3_q_net_x1;
  monit_ch3_out <= down_sample4_q_net_x1;

  tddm_monit_amp_c_int_554a834349: entity work.tddm_monit_amp_c_int_entity_554a834349
    port map (
      ce_22240000 => ce_22240000_sg_x1,
      ce_5560000 => ce_5560000_sg_x3,
      ch_in => register2_q_net_x2,
      clk_22240000 => clk_22240000_sg_x1,
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
    ch_out: out std_logic_vector(1 downto 0); 
    tddm_monit_amp_c: out std_logic_vector(23 downto 0); 
    tddm_monit_amp_c_x0: out std_logic_vector(23 downto 0); 
    tddm_monit_amp_c_x1: out std_logic_vector(23 downto 0); 
    tddm_monit_amp_c_x2: out std_logic_vector(23 downto 0)
  );
end monit_amp_c_entity_c83793ea71;

architecture structural of monit_amp_c_entity_c83793ea71 is
  signal ce_1390000_sg_x1: std_logic;
  signal ce_1_sg_x18: std_logic;
  signal ce_22240000_sg_x2: std_logic;
  signal ce_2780000_sg_x2: std_logic;
  signal ce_5560000_sg_x4: std_logic;
  signal ce_556_sg_x0: std_logic;
  signal ce_logic_1390000_sg_x0: std_logic;
  signal ce_logic_2780000_sg_x0: std_logic;
  signal ce_logic_556_sg_x0: std_logic;
  signal clk_1390000_sg_x1: std_logic;
  signal clk_1_sg_x18: std_logic;
  signal clk_22240000_sg_x2: std_logic;
  signal clk_2780000_sg_x2: std_logic;
  signal clk_5560000_sg_x4: std_logic;
  signal clk_556_sg_x0: std_logic;
  signal constant_op_net: std_logic_vector(1 downto 0);
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x2: std_logic_vector(23 downto 0);
  signal monit_cfir_m_axis_data_tdata_net_x1: std_logic_vector(24 downto 0);
  signal monit_cfir_m_axis_data_tuser_chanid_net: std_logic_vector(1 downto 0);
  signal monit_cfir_m_axis_data_tvalid_net_x0: std_logic;
  signal monit_cic_m_axis_data_tdata_data_net_x0: std_logic_vector(24 downto 0);
  signal monit_cic_m_axis_data_tuser_chan_out_net: std_logic_vector(1 downto 0);
  signal monit_cic_m_axis_data_tvalid_net_x0: std_logic;
  signal monit_pfir_m_axis_data_tdata_net_x1: std_logic_vector(24 downto 0);
  signal monit_pfir_m_axis_data_tuser_chanid_net: std_logic_vector(1 downto 0);
  signal monit_pfir_m_axis_data_tvalid_net_x0: std_logic;
  signal register1_q_net: std_logic_vector(1 downto 0);
  signal register1_q_net_x1: std_logic_vector(1 downto 0);
  signal register2_q_net_x3: std_logic_vector(1 downto 0);
  signal register_q_net: std_logic_vector(1 downto 0);
  signal register_q_net_x0: std_logic_vector(23 downto 0);
  signal register_q_net_x1: std_logic_vector(23 downto 0);
  signal register_q_net_x4: std_logic_vector(23 downto 0);
  signal register_q_net_x5: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;

begin
  ce_1_sg_x18 <= ce_1;
  ce_1390000_sg_x1 <= ce_1390000;
  ce_22240000_sg_x2 <= ce_22240000;
  ce_2780000_sg_x2 <= ce_2780000;
  ce_556_sg_x0 <= ce_556;
  ce_5560000_sg_x4 <= ce_5560000;
  ce_logic_1390000_sg_x0 <= ce_logic_1390000;
  ce_logic_2780000_sg_x0 <= ce_logic_2780000;
  ce_logic_556_sg_x0 <= ce_logic_556;
  register1_q_net_x1 <= ch_in;
  clk_1_sg_x18 <= clk_1;
  clk_1390000_sg_x1 <= clk_1390000;
  clk_22240000_sg_x2 <= clk_22240000;
  clk_2780000_sg_x2 <= clk_2780000;
  clk_556_sg_x0 <= clk_556;
  clk_5560000_sg_x4 <= clk_5560000;
  register_q_net_x4 <= din;
  amp_out <= register_q_net_x5;
  ch_out <= register2_q_net_x3;
  tddm_monit_amp_c <= down_sample1_q_net_x2;
  tddm_monit_amp_c_x0 <= down_sample2_q_net_x2;
  tddm_monit_amp_c_x1 <= down_sample3_q_net_x2;
  tddm_monit_amp_c_x2 <= down_sample4_q_net_x2;

  cast1_17ee9c0582: entity work.cast1_entity_17ee9c0582
    port map (
      ce_5560000 => ce_5560000_sg_x4,
      clk_5560000 => clk_5560000_sg_x4,
      data_in => monit_pfir_m_axis_data_tdata_net_x1,
      en => monit_pfir_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x5
    );

  cast2_4b7421c7c9: entity work.cast2_entity_4b7421c7c9
    port map (
      ce_2780000 => ce_2780000_sg_x2,
      clk_2780000 => clk_2780000_sg_x2,
      data_in => monit_cfir_m_axis_data_tdata_net_x1,
      en => monit_cfir_m_axis_data_tvalid_net_x0,
      out_x0 => register_q_net_x0
    );

  constant_x0: entity work.constant_e8ddc079e9
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  monit_cfir: entity work.xlfir_compiler_a40330992b6d642594644f4f518ca750
    port map (
      ce => ce_1_sg_x18,
      ce_1390000 => ce_1390000_sg_x1,
      ce_2780000 => ce_2780000_sg_x2,
      ce_logic_1390000 => ce_logic_1390000_sg_x0,
      clk => clk_1_sg_x18,
      clk_1390000 => clk_1390000_sg_x1,
      clk_2780000 => clk_2780000_sg_x2,
      clk_logic_1390000 => clk_1390000_sg_x1,
      s_axis_data_tdata => register_q_net_x1,
      s_axis_data_tuser_chanid => register_q_net,
      src_ce => ce_1390000_sg_x1,
      src_clk => clk_1390000_sg_x1,
      m_axis_data_tdata => monit_cfir_m_axis_data_tdata_net_x1,
      m_axis_data_tuser_chanid => monit_cfir_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => monit_cfir_m_axis_data_tvalid_net_x0
    );

  monit_cic: entity work.xlcic_compiler_71739fa1c4bea66086b8ea70a80d908e
    port map (
      ce => ce_1_sg_x18,
      ce_1390000 => ce_1390000_sg_x1,
      ce_556 => ce_556_sg_x0,
      ce_logic_556 => ce_logic_556_sg_x0,
      clk => clk_1_sg_x18,
      clk_1390000 => clk_1390000_sg_x1,
      clk_556 => clk_556_sg_x0,
      clk_logic_556 => clk_556_sg_x0,
      s_axis_data_tdata_data => register_q_net_x4,
      s_axis_data_tlast => relational1_op_net,
      m_axis_data_tdata_data => monit_cic_m_axis_data_tdata_data_net_x0,
      m_axis_data_tuser_chan_out => monit_cic_m_axis_data_tuser_chan_out_net,
      m_axis_data_tvalid => monit_cic_m_axis_data_tvalid_net_x0
    );

  monit_pfir: entity work.xlfir_compiler_af8460ed5b328ff479173f1beee0bef8
    port map (
      ce => ce_1_sg_x18,
      ce_2780000 => ce_2780000_sg_x2,
      ce_5560000 => ce_5560000_sg_x4,
      ce_logic_2780000 => ce_logic_2780000_sg_x0,
      clk => clk_1_sg_x18,
      clk_2780000 => clk_2780000_sg_x2,
      clk_5560000 => clk_5560000_sg_x4,
      clk_logic_2780000 => clk_2780000_sg_x2,
      s_axis_data_tdata => register_q_net_x0,
      s_axis_data_tuser_chanid => register1_q_net,
      src_ce => ce_2780000_sg_x2,
      src_clk => clk_2780000_sg_x2,
      m_axis_data_tdata => monit_pfir_m_axis_data_tdata_net_x1,
      m_axis_data_tuser_chanid => monit_pfir_m_axis_data_tuser_chanid_net,
      m_axis_data_tvalid => monit_pfir_m_axis_data_tvalid_net_x0
    );

  reg_68a33d3d79: entity work.reg_entity_68a33d3d79
    port map (
      ce_1390000 => ce_1390000_sg_x1,
      clk_1390000 => clk_1390000_sg_x1,
      din => monit_cic_m_axis_data_tdata_data_net_x0,
      en => monit_cic_m_axis_data_tvalid_net_x0,
      dout => register_q_net_x1
    );

  register1: entity work.xlregister
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
      q => register1_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 2,
      init_value => b"00"
    )
    port map (
      ce => ce_5560000_sg_x4,
      clk => clk_5560000_sg_x4,
      d => monit_pfir_m_axis_data_tuser_chanid_net,
      en => "1",
      rst => "0",
      q => register2_q_net_x3
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 2,
      init_value => b"00"
    )
    port map (
      ce => ce_1390000_sg_x1,
      clk => clk_1390000_sg_x1,
      d => monit_cic_m_axis_data_tuser_chan_out_net,
      en => "1",
      rst => "0",
      q => register_q_net
    );

  relational1: entity work.relational_367321bc0c
    port map (
      a => register1_q_net_x1,
      b => constant_op_net,
      ce => ce_556_sg_x0,
      clk => clk_556_sg_x0,
      clr => '0',
      op(0) => relational1_op_net
    );

  tddm_monit_amp_c_5b2613eff7: entity work.tddm_monit_amp_c_entity_5b2613eff7
    port map (
      ce_22240000 => ce_22240000_sg_x2,
      ce_5560000 => ce_5560000_sg_x4,
      clk_22240000 => clk_22240000_sg_x2,
      clk_5560000 => clk_5560000_sg_x4,
      monit_ch_in => register2_q_net_x3,
      monit_din => register_q_net_x5,
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
  signal ce_22240000_sg_x4: std_logic;
  signal ce_5560000_sg_x6: std_logic;
  signal clk_22240000_sg_x4: std_logic;
  signal clk_5560000_sg_x6: std_logic;
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x1: std_logic_vector(23 downto 0);
  signal register2_q_net_x5: std_logic_vector(1 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_22240000_sg_x4 <= ce_22240000;
  ce_5560000_sg_x6 <= ce_5560000;
  clk_22240000_sg_x4 <= clk_22240000;
  clk_5560000_sg_x6 <= clk_5560000;
  register2_q_net_x5 <= monit_amp_ch_in;
  register_q_net_x7 <= monit_amp_din;
  monit_amp_data0_out <= down_sample2_q_net_x1;
  monit_amp_data1_out <= down_sample1_q_net_x1;
  monit_amp_data2_out <= down_sample3_q_net_x1;
  monit_amp_data3_out <= down_sample4_q_net_x1;

  tddm_monit_amp_out_int_b60196c7a6: entity work.tddm_monit_amp_c_int_entity_554a834349
    port map (
      ce_22240000 => ce_22240000_sg_x4,
      ce_5560000 => ce_5560000_sg_x6,
      ch_in => register2_q_net_x5,
      clk_22240000 => clk_22240000_sg_x4,
      clk_5560000 => clk_5560000_sg_x6,
      din => register_q_net_x7,
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
    monit_amp_c_x2: out std_logic_vector(23 downto 0)
  );
end monit_amp_entity_44da74e268;

architecture structural of monit_amp_entity_44da74e268 is
  signal ce_1390000_sg_x2: std_logic;
  signal ce_1_sg_x19: std_logic;
  signal ce_22240000_sg_x5: std_logic;
  signal ce_2780000_sg_x3: std_logic;
  signal ce_5560000_sg_x7: std_logic;
  signal ce_556_sg_x1: std_logic;
  signal ce_logic_1390000_sg_x1: std_logic;
  signal ce_logic_2780000_sg_x1: std_logic;
  signal ce_logic_556_sg_x1: std_logic;
  signal clk_1390000_sg_x2: std_logic;
  signal clk_1_sg_x19: std_logic;
  signal clk_22240000_sg_x5: std_logic;
  signal clk_2780000_sg_x3: std_logic;
  signal clk_5560000_sg_x7: std_logic;
  signal clk_556_sg_x1: std_logic;
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x4: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic_vector(1 downto 0);
  signal register2_q_net_x5: std_logic_vector(1 downto 0);
  signal register_q_net_x7: std_logic_vector(23 downto 0);
  signal register_q_net_x8: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x19 <= ce_1;
  ce_1390000_sg_x2 <= ce_1390000;
  ce_22240000_sg_x5 <= ce_22240000;
  ce_2780000_sg_x3 <= ce_2780000;
  ce_556_sg_x1 <= ce_556;
  ce_5560000_sg_x7 <= ce_5560000;
  ce_logic_1390000_sg_x1 <= ce_logic_1390000;
  ce_logic_2780000_sg_x1 <= ce_logic_2780000;
  ce_logic_556_sg_x1 <= ce_logic_556;
  register1_q_net_x2 <= ch_in;
  clk_1_sg_x19 <= clk_1;
  clk_1390000_sg_x2 <= clk_1390000;
  clk_22240000_sg_x5 <= clk_22240000;
  clk_2780000_sg_x3 <= clk_2780000;
  clk_556_sg_x1 <= clk_556;
  clk_5560000_sg_x7 <= clk_5560000;
  register_q_net_x8 <= din;
  amp_out0 <= down_sample2_q_net_x4;
  amp_out1 <= down_sample1_q_net_x4;
  amp_out2 <= down_sample3_q_net_x4;
  amp_out3 <= down_sample4_q_net_x4;
  monit_amp_c <= down_sample1_q_net_x3;
  monit_amp_c_x0 <= down_sample2_q_net_x3;
  monit_amp_c_x1 <= down_sample3_q_net_x3;
  monit_amp_c_x2 <= down_sample4_q_net_x3;

  monit_amp_c_c83793ea71: entity work.monit_amp_c_entity_c83793ea71
    port map (
      ce_1 => ce_1_sg_x19,
      ce_1390000 => ce_1390000_sg_x2,
      ce_22240000 => ce_22240000_sg_x5,
      ce_2780000 => ce_2780000_sg_x3,
      ce_556 => ce_556_sg_x1,
      ce_5560000 => ce_5560000_sg_x7,
      ce_logic_1390000 => ce_logic_1390000_sg_x1,
      ce_logic_2780000 => ce_logic_2780000_sg_x1,
      ce_logic_556 => ce_logic_556_sg_x1,
      ch_in => register1_q_net_x2,
      clk_1 => clk_1_sg_x19,
      clk_1390000 => clk_1390000_sg_x2,
      clk_22240000 => clk_22240000_sg_x5,
      clk_2780000 => clk_2780000_sg_x3,
      clk_556 => clk_556_sg_x1,
      clk_5560000 => clk_5560000_sg_x7,
      din => register_q_net_x8,
      amp_out => register_q_net_x7,
      ch_out => register2_q_net_x5,
      tddm_monit_amp_c => down_sample1_q_net_x3,
      tddm_monit_amp_c_x0 => down_sample2_q_net_x3,
      tddm_monit_amp_c_x1 => down_sample3_q_net_x3,
      tddm_monit_amp_c_x2 => down_sample4_q_net_x3
    );

  tddm_monit_amp_out_521eb373cc: entity work.tddm_monit_amp_out_entity_521eb373cc
    port map (
      ce_22240000 => ce_22240000_sg_x5,
      ce_5560000 => ce_5560000_sg_x7,
      clk_22240000 => clk_22240000_sg_x5,
      clk_5560000 => clk_5560000_sg_x7,
      monit_amp_ch_in => register2_q_net_x5,
      monit_amp_din => register_q_net_x7,
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
  signal ce_70_sg_x0: std_logic;
  signal clk_35_sg_x0: std_logic;
  signal clk_70_sg_x0: std_logic;
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
  ce_70_sg_x0 <= ce_70;
  register1_q_net_x1 <= ch_in;
  clk_35_sg_x0 <= clk_35;
  clk_70_sg_x0 <= clk_70;
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
      dest_ce => ce_70_sg_x0,
      dest_clk => clk_70_sg_x0,
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
      dest_ce => ce_70_sg_x0,
      dest_clk => clk_70_sg_x0,
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

-- Generated from Simulink block "ddc_bpm_476_066/TBT_amp/TBT_amp0/TBT_CORDIC/TDDM_tbt_cordic"

entity tddm_tbt_cordic_entity_18d3979a26 is
  port (
    ce_35: in std_logic; 
    ce_70: in std_logic; 
    clk_35: in std_logic; 
    clk_70: in std_logic; 
    tbt_cordic_ch_in: in std_logic; 
    tbt_cordic_din: in std_logic_vector(23 downto 0); 
    tbt_cordic_data0_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_data1_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic_entity_18d3979a26;

architecture structural of tddm_tbt_cordic_entity_18d3979a26 is
  signal ce_35_sg_x1: std_logic;
  signal ce_70_sg_x1: std_logic;
  signal clk_35_sg_x1: std_logic;
  signal clk_70_sg_x1: std_logic;
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register5_q_net_x1: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x1 <= ce_35;
  ce_70_sg_x1 <= ce_70;
  clk_35_sg_x1 <= clk_35;
  clk_70_sg_x1 <= clk_70;
  register1_q_net_x2 <= tbt_cordic_ch_in;
  register5_q_net_x1 <= tbt_cordic_din;
  tbt_cordic_data0_out <= down_sample2_q_net_x1;
  tbt_cordic_data1_out <= down_sample1_q_net_x1;

  tddm_tbt_cordic_5b94be40c5: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x1,
      ce_70 => ce_70_sg_x1,
      ch_in => register1_q_net_x2,
      clk_35 => clk_35_sg_x1,
      clk_70 => clk_70_sg_x1,
      din => register5_q_net_x1,
      dout_ch0 => down_sample2_q_net_x1,
      dout_ch1 => down_sample1_q_net_x1
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
    tddm_tbt_cordic_x0: out std_logic_vector(23 downto 0)
  );
end tbt_cordic_entity_232cb2e43e;

architecture structural of tbt_cordic_entity_232cb2e43e is
  signal ce_35_sg_x2: std_logic;
  signal ce_70_sg_x2: std_logic;
  signal clk_35_sg_x2: std_logic;
  signal clk_70_sg_x2: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x3: std_logic;
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x0: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x0: std_logic;

begin
  ce_35_sg_x2 <= ce_35;
  ce_70_sg_x2 <= ce_70;
  tbt_poly_m_axis_data_tuser_chanid_net_x0 <= ch_in;
  clk_35_sg_x2 <= clk_35;
  clk_70_sg_x2 <= clk_70;
  reinterpret1_output_port_net_x0 <= i_in;
  reinterpret_output_port_net_x0 <= q_in;
  tbt_poly_m_axis_data_tvalid_net_x0 <= valid_in;
  amp_out <= register5_q_net_x2;
  ch_out <= register1_q_net_x3;
  tddm_tbt_cordic <= down_sample1_q_net_x2;
  tddm_tbt_cordic_x0 <= down_sample2_q_net_x2;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_35_sg_x2,
      clk => clk_35_sg_x2,
      s_axis_cartesian_tdata_imag => reinterpret_output_port_net_x0,
      s_axis_cartesian_tdata_real => reinterpret1_output_port_net_x0,
      s_axis_cartesian_tuser_user(0) => tbt_poly_m_axis_data_tuser_chanid_net_x0,
      s_axis_cartesian_tvalid => tbt_poly_m_axis_data_tvalid_net_x0,
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
      ce => ce_35_sg_x2,
      clk => clk_35_sg_x2,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x3
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x2,
      clk => clk_35_sg_x2,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x2
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
      ce_35 => ce_35_sg_x2,
      ce_70 => ce_70_sg_x2,
      clk_35 => clk_35_sg_x2,
      clk_70 => clk_70_sg_x2,
      tbt_cordic_ch_in => register1_q_net_x3,
      tbt_cordic_din => register5_q_net_x2,
      tbt_cordic_data0_out => down_sample2_q_net_x2,
      tbt_cordic_data1_out => down_sample1_q_net_x2
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
  signal ce_35_sg_x3: std_logic;
  signal ce_70_sg_x3: std_logic;
  signal clk_35_sg_x3: std_logic;
  signal clk_70_sg_x3: std_logic;
  signal constant1_op_net: std_logic_vector(1 downto 0);
  signal constant_op_net: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x0: std_logic_vector(23 downto 0);
  signal register1_q_net: std_logic_vector(23 downto 0);
  signal register_q_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(23 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal tbt_poly_m_axis_data_tuser_chanid_net_x1: std_logic;

begin
  ce_35_sg_x3 <= ce_35;
  ce_70_sg_x3 <= ce_70;
  tbt_poly_m_axis_data_tuser_chanid_net_x1 <= ch_in;
  clk_35_sg_x3 <= clk_35;
  clk_70_sg_x3 <= clk_70;
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
      dest_ce => ce_70_sg_x3,
      dest_clk => clk_70_sg_x3,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x3,
      src_clk => clk_35_sg_x3,
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
      dest_ce => ce_70_sg_x3,
      dest_clk => clk_70_sg_x3,
      dest_clr => '0',
      en => "1",
      src_ce => ce_35_sg_x3,
      src_clk => clk_35_sg_x3,
      src_clr => '0',
      q => down_sample2_q_net_x0
    );

  register1: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
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
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
      d => reinterpret_output_port_net_x0,
      en(0) => relational_op_net,
      rst => "0",
      q => register_q_net
    );

  relational: entity work.relational_a892e1bf40
    port map (
      a(0) => tbt_poly_m_axis_data_tuser_chanid_net_x1,
      b(0) => constant_op_net,
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity work.relational_d29d27b7b3
    port map (
      a(0) => tbt_poly_m_axis_data_tuser_chanid_net_x1,
      b => constant1_op_net,
      ce => ce_35_sg_x3,
      clk => clk_35_sg_x3,
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
  signal ce_35_sg_x5: std_logic;
  signal ce_70_sg_x5: std_logic;
  signal clk_35_sg_x5: std_logic;
  signal clk_70_sg_x5: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x3: std_logic;

begin
  ce_35_sg_x5 <= ce_35;
  ce_70_sg_x5 <= ce_70;
  clk_35_sg_x5 <= clk_35;
  clk_70_sg_x5 <= clk_70;
  tbt_poly_m_axis_data_tuser_chanid_net_x3 <= tbt_ch_in;
  reinterpret_output_port_net_x3 <= tbt_i_in;
  reinterpret_output_port_net_x2 <= tbt_q_in;
  poly35_ch0_i_out <= down_sample2_q_net_x2;
  poly35_ch0_q_out <= down_sample2_q_net_x3;
  poly35_ch1_i_out <= down_sample1_q_net_x2;
  poly35_ch1_q_out <= down_sample1_q_net_x3;

  tddm_tbt_poly_i_469601736c: entity work.tddm_tbt_poly_i_entity_469601736c
    port map (
      ce_35 => ce_35_sg_x5,
      ce_70 => ce_70_sg_x5,
      ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x3,
      clk_35 => clk_35_sg_x5,
      clk_70 => clk_70_sg_x5,
      din => reinterpret_output_port_net_x3,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_poly_q_8011b4e29e: entity work.tddm_tbt_poly_i_entity_469601736c
    port map (
      ce_35 => ce_35_sg_x5,
      ce_70 => ce_70_sg_x5,
      ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x3,
      clk_35 => clk_35_sg_x5,
      clk_70 => clk_70_sg_x5,
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
    tddm_tbt: out std_logic_vector(23 downto 0); 
    tddm_tbt_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_x2: out std_logic_vector(23 downto 0); 
    valid_out: out std_logic
  );
end tbt_poly_decim_entity_4477ec06c2;

architecture structural of tbt_poly_decim_entity_4477ec06c2 is
  signal ce_1_sg_x20: std_logic;
  signal ce_35_sg_x6: std_logic;
  signal ce_70_sg_x6: std_logic;
  signal ce_logic_1_sg_x7: std_logic;
  signal clk_1_sg_x20: std_logic;
  signal clk_35_sg_x6: std_logic;
  signal clk_70_sg_x6: std_logic;
  signal delay4_q_net_x12: std_logic;
  signal delay6_q_net_x11: std_logic_vector(23 downto 0);
  signal delay7_q_net_x11: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path0_net: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path1_net: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x4: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_1_sg_x20 <= ce_1;
  ce_35_sg_x6 <= ce_35;
  ce_70_sg_x6 <= ce_70;
  ce_logic_1_sg_x7 <= ce_logic_1;
  delay4_q_net_x12 <= ch_in;
  clk_1_sg_x20 <= clk_1;
  clk_35_sg_x6 <= clk_35;
  clk_70_sg_x6 <= clk_70;
  delay7_q_net_x11 <= i_in;
  delay6_q_net_x11 <= q_in;
  ch_out <= tbt_poly_m_axis_data_tuser_chanid_net_x4;
  i_out <= reinterpret1_output_port_net_x2;
  q_out <= reinterpret_output_port_net_x5;
  tddm_tbt <= down_sample1_q_net_x4;
  tddm_tbt_x0 <= down_sample2_q_net_x4;
  tddm_tbt_x1 <= down_sample1_q_net_x5;
  tddm_tbt_x2 <= down_sample2_q_net_x5;
  valid_out <= tbt_poly_m_axis_data_tvalid_net_x1;

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => tbt_poly_m_axis_data_tdata_path1_net,
      output_port => reinterpret_output_port_net_x5
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => tbt_poly_m_axis_data_tdata_path0_net,
      output_port => reinterpret1_output_port_net_x2
    );

  tbt_poly: entity work.xlfir_compiler_5af5e45cff55e9c8da090559fc87fdb6
    port map (
      ce => ce_1_sg_x20,
      ce_35 => ce_35_sg_x6,
      ce_logic_1 => ce_logic_1_sg_x7,
      clk => clk_1_sg_x20,
      clk_35 => clk_35_sg_x6,
      clk_logic_1 => clk_1_sg_x20,
      s_axis_data_tdata_path0 => delay7_q_net_x11,
      s_axis_data_tdata_path1 => delay6_q_net_x11,
      s_axis_data_tuser_chanid(0) => delay4_q_net_x12,
      src_ce => ce_1_sg_x20,
      src_clk => clk_1_sg_x20,
      m_axis_data_tdata_path0 => tbt_poly_m_axis_data_tdata_path0_net,
      m_axis_data_tdata_path1 => tbt_poly_m_axis_data_tdata_path1_net,
      m_axis_data_tuser_chanid(0) => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      m_axis_data_tvalid => tbt_poly_m_axis_data_tvalid_net_x1
    );

  tddm_tbt_9ac9f65b0b: entity work.tddm_tbt_entity_9ac9f65b0b
    port map (
      ce_35 => ce_35_sg_x6,
      ce_70 => ce_70_sg_x6,
      clk_35 => clk_35_sg_x6,
      clk_70 => clk_70_sg_x6,
      tbt_ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      tbt_i_in => reinterpret_output_port_net_x4,
      tbt_q_in => reinterpret_output_port_net_x3,
      poly35_ch0_i_out => down_sample2_q_net_x4,
      poly35_ch0_q_out => down_sample2_q_net_x5,
      poly35_ch1_i_out => down_sample1_q_net_x4,
      poly35_ch1_q_out => down_sample1_q_net_x5
    );

  trunc1_841a61ebcc: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret1_output_port_net_x2,
      dout => reinterpret_output_port_net_x4
    );

  trunc_e5eda8a5ac: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret_output_port_net_x5,
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
    tbt_poly_decim: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x0: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x1: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x2: out std_logic_vector(23 downto 0)
  );
end tbt_amp0_entity_88b1c45f0e;

architecture structural of tbt_amp0_entity_88b1c45f0e is
  signal ce_1_sg_x21: std_logic;
  signal ce_35_sg_x7: std_logic;
  signal ce_70_sg_x7: std_logic;
  signal ce_logic_1_sg_x8: std_logic;
  signal clk_1_sg_x21: std_logic;
  signal clk_35_sg_x7: std_logic;
  signal clk_70_sg_x7: std_logic;
  signal delay4_q_net_x13: std_logic;
  signal delay6_q_net_x12: std_logic_vector(23 downto 0);
  signal delay7_q_net_x12: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal register1_q_net_x4: std_logic;
  signal register5_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x4: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_1_sg_x21 <= ce_1;
  ce_35_sg_x7 <= ce_35;
  ce_70_sg_x7 <= ce_70;
  ce_logic_1_sg_x8 <= ce_logic_1;
  delay4_q_net_x13 <= ch_in;
  clk_1_sg_x21 <= clk_1;
  clk_35_sg_x7 <= clk_35;
  clk_70_sg_x7 <= clk_70;
  delay7_q_net_x12 <= i_in;
  delay6_q_net_x12 <= q_in;
  amp_out <= register5_q_net_x3;
  ch_out <= register1_q_net_x4;
  tbt_cordic <= down_sample1_q_net_x6;
  tbt_cordic_x0 <= down_sample2_q_net_x6;
  tbt_poly_decim <= down_sample1_q_net_x7;
  tbt_poly_decim_x0 <= down_sample2_q_net_x7;
  tbt_poly_decim_x1 <= down_sample1_q_net_x8;
  tbt_poly_decim_x2 <= down_sample2_q_net_x8;

  tbt_cordic_232cb2e43e: entity work.tbt_cordic_entity_232cb2e43e
    port map (
      ce_35 => ce_35_sg_x7,
      ce_70 => ce_70_sg_x7,
      ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      clk_35 => clk_35_sg_x7,
      clk_70 => clk_70_sg_x7,
      i_in => reinterpret1_output_port_net_x2,
      q_in => reinterpret_output_port_net_x5,
      valid_in => tbt_poly_m_axis_data_tvalid_net_x1,
      amp_out => register5_q_net_x3,
      ch_out => register1_q_net_x4,
      tddm_tbt_cordic => down_sample1_q_net_x6,
      tddm_tbt_cordic_x0 => down_sample2_q_net_x6
    );

  tbt_poly_decim_4477ec06c2: entity work.tbt_poly_decim_entity_4477ec06c2
    port map (
      ce_1 => ce_1_sg_x21,
      ce_35 => ce_35_sg_x7,
      ce_70 => ce_70_sg_x7,
      ce_logic_1 => ce_logic_1_sg_x8,
      ch_in => delay4_q_net_x13,
      clk_1 => clk_1_sg_x21,
      clk_35 => clk_35_sg_x7,
      clk_70 => clk_70_sg_x7,
      i_in => delay7_q_net_x12,
      q_in => delay6_q_net_x12,
      ch_out => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      i_out => reinterpret1_output_port_net_x2,
      q_out => reinterpret_output_port_net_x5,
      tddm_tbt => down_sample1_q_net_x7,
      tddm_tbt_x0 => down_sample2_q_net_x7,
      tddm_tbt_x1 => down_sample1_q_net_x8,
      tddm_tbt_x2 => down_sample2_q_net_x8,
      valid_out => tbt_poly_m_axis_data_tvalid_net_x1
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
    tbt_cordic_ch2_out: out std_logic_vector(23 downto 0); 
    tbt_cordic_ch3_out: out std_logic_vector(23 downto 0)
  );
end tddm_tbt_cordic_entity_9e99bd206d;

architecture structural of tddm_tbt_cordic_entity_9e99bd206d is
  signal ce_35_sg_x9: std_logic;
  signal ce_70_sg_x9: std_logic;
  signal clk_35_sg_x9: std_logic;
  signal clk_70_sg_x9: std_logic;
  signal down_sample1_q_net_x1: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x1: std_logic_vector(23 downto 0);
  signal register1_q_net_x2: std_logic;
  signal register5_q_net_x1: std_logic_vector(23 downto 0);

begin
  ce_35_sg_x9 <= ce_35;
  ce_70_sg_x9 <= ce_70;
  clk_35_sg_x9 <= clk_35;
  clk_70_sg_x9 <= clk_70;
  register1_q_net_x2 <= tbt_cordic_ch_in;
  register5_q_net_x1 <= tbt_cordic_din;
  tbt_cordic_ch2_out <= down_sample2_q_net_x1;
  tbt_cordic_ch3_out <= down_sample1_q_net_x1;

  tddm_tbt_cordic_f04a48283a: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x9,
      ce_70 => ce_70_sg_x9,
      ch_in => register1_q_net_x2,
      clk_35 => clk_35_sg_x9,
      clk_70 => clk_70_sg_x9,
      din => register5_q_net_x1,
      dout_ch0 => down_sample2_q_net_x1,
      dout_ch1 => down_sample1_q_net_x1
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
    tddm_tbt_cordic_x0: out std_logic_vector(23 downto 0)
  );
end tbt_cordic_entity_9dc3371de2;

architecture structural of tbt_cordic_entity_9dc3371de2 is
  signal ce_35_sg_x10: std_logic;
  signal ce_70_sg_x10: std_logic;
  signal clk_35_sg_x10: std_logic;
  signal clk_70_sg_x10: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tdata_real_net: std_logic_vector(23 downto 0);
  signal rect2pol_m_axis_dout_tuser_cartesian_tuser_net: std_logic;
  signal rect2pol_m_axis_dout_tvalid_net: std_logic;
  signal register1_q_net_x3: std_logic;
  signal register5_q_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x0: std_logic_vector(24 downto 0);
  signal reinterpret3_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x0: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x0: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x0: std_logic;

begin
  ce_35_sg_x10 <= ce_35;
  ce_70_sg_x10 <= ce_70;
  tbt_poly_m_axis_data_tuser_chanid_net_x0 <= ch_in;
  clk_35_sg_x10 <= clk_35;
  clk_70_sg_x10 <= clk_70;
  reinterpret1_output_port_net_x0 <= i_in;
  reinterpret_output_port_net_x0 <= q_in;
  tbt_poly_m_axis_data_tvalid_net_x0 <= valid_in;
  amp_out <= register5_q_net_x2;
  ch_out <= register1_q_net_x3;
  tddm_tbt_cordic <= down_sample1_q_net_x2;
  tddm_tbt_cordic_x0 <= down_sample2_q_net_x2;

  rect2pol: entity work.xlcordic_67422259e33cafe86cb2beaf1e4ed91a
    port map (
      ce => ce_35_sg_x10,
      clk => clk_35_sg_x10,
      s_axis_cartesian_tdata_imag => reinterpret_output_port_net_x0,
      s_axis_cartesian_tdata_real => reinterpret1_output_port_net_x0,
      s_axis_cartesian_tuser_user(0) => tbt_poly_m_axis_data_tuser_chanid_net_x0,
      s_axis_cartesian_tvalid => tbt_poly_m_axis_data_tvalid_net_x0,
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
      ce => ce_35_sg_x10,
      clk => clk_35_sg_x10,
      d(0) => rect2pol_m_axis_dout_tuser_cartesian_tuser_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q(0) => register1_q_net_x3
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_35_sg_x10,
      clk => clk_35_sg_x10,
      d => reinterpret3_output_port_net,
      en(0) => rect2pol_m_axis_dout_tvalid_net,
      rst => "0",
      q => register5_q_net_x2
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
      ce_35 => ce_35_sg_x10,
      ce_70 => ce_70_sg_x10,
      clk_35 => clk_35_sg_x10,
      clk_70 => clk_70_sg_x10,
      tbt_cordic_ch_in => register1_q_net_x3,
      tbt_cordic_din => register5_q_net_x2,
      tbt_cordic_ch2_out => down_sample2_q_net_x2,
      tbt_cordic_ch3_out => down_sample1_q_net_x2
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
  signal ce_35_sg_x13: std_logic;
  signal ce_70_sg_x13: std_logic;
  signal clk_35_sg_x13: std_logic;
  signal clk_70_sg_x13: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x3: std_logic;

begin
  ce_35_sg_x13 <= ce_35;
  ce_70_sg_x13 <= ce_70;
  clk_35_sg_x13 <= clk_35;
  clk_70_sg_x13 <= clk_70;
  tbt_poly_m_axis_data_tuser_chanid_net_x3 <= tbt_ch_in;
  reinterpret_output_port_net_x3 <= tbt_i_in;
  reinterpret_output_port_net_x2 <= tbt_q_in;
  poly35_ch2_i_out <= down_sample2_q_net_x2;
  poly35_ch2_q_out <= down_sample2_q_net_x3;
  poly35_ch3_i_out <= down_sample1_q_net_x2;
  poly35_ch3_q_out <= down_sample1_q_net_x3;

  tddm_tbt_poly_i_b74b709553: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x13,
      ce_70 => ce_70_sg_x13,
      ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x3,
      clk_35 => clk_35_sg_x13,
      clk_70 => clk_70_sg_x13,
      din => reinterpret_output_port_net_x3,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_poly_q_4f85d7362a: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x13,
      ce_70 => ce_70_sg_x13,
      ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x3,
      clk_35 => clk_35_sg_x13,
      clk_70 => clk_70_sg_x13,
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
    tddm_tbt: out std_logic_vector(23 downto 0); 
    tddm_tbt_x0: out std_logic_vector(23 downto 0); 
    tddm_tbt_x1: out std_logic_vector(23 downto 0); 
    tddm_tbt_x2: out std_logic_vector(23 downto 0); 
    valid_out: out std_logic
  );
end tbt_poly_decim_entity_bb6f6b5b6a;

architecture structural of tbt_poly_decim_entity_bb6f6b5b6a is
  signal ce_1_sg_x22: std_logic;
  signal ce_35_sg_x14: std_logic;
  signal ce_70_sg_x14: std_logic;
  signal ce_logic_1_sg_x9: std_logic;
  signal clk_1_sg_x22: std_logic;
  signal clk_35_sg_x14: std_logic;
  signal clk_70_sg_x14: std_logic;
  signal delay4_q_net_x13: std_logic;
  signal delay6_q_net_x12: std_logic_vector(23 downto 0);
  signal delay7_q_net_x12: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x4: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x4: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path0_net: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tdata_path1_net: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x4: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_1_sg_x22 <= ce_1;
  ce_35_sg_x14 <= ce_35;
  ce_70_sg_x14 <= ce_70;
  ce_logic_1_sg_x9 <= ce_logic_1;
  delay4_q_net_x13 <= ch_in;
  clk_1_sg_x22 <= clk_1;
  clk_35_sg_x14 <= clk_35;
  clk_70_sg_x14 <= clk_70;
  delay7_q_net_x12 <= i_in;
  delay6_q_net_x12 <= q_in;
  ch_out <= tbt_poly_m_axis_data_tuser_chanid_net_x4;
  i_out <= reinterpret1_output_port_net_x2;
  q_out <= reinterpret_output_port_net_x5;
  tddm_tbt <= down_sample1_q_net_x4;
  tddm_tbt_x0 <= down_sample2_q_net_x4;
  tddm_tbt_x1 <= down_sample1_q_net_x5;
  tddm_tbt_x2 <= down_sample2_q_net_x5;
  valid_out <= tbt_poly_m_axis_data_tvalid_net_x1;

  reinterpret: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => tbt_poly_m_axis_data_tdata_path1_net,
      output_port => reinterpret_output_port_net_x5
    );

  reinterpret1: entity work.reinterpret_31a4235b32
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => tbt_poly_m_axis_data_tdata_path0_net,
      output_port => reinterpret1_output_port_net_x2
    );

  tbt_poly: entity work.xlfir_compiler_05e0a4872537f61082344f48df4591f1
    port map (
      ce => ce_1_sg_x22,
      ce_35 => ce_35_sg_x14,
      ce_logic_1 => ce_logic_1_sg_x9,
      clk => clk_1_sg_x22,
      clk_35 => clk_35_sg_x14,
      clk_logic_1 => clk_1_sg_x22,
      s_axis_data_tdata_path0 => delay7_q_net_x12,
      s_axis_data_tdata_path1 => delay6_q_net_x12,
      s_axis_data_tuser_chanid(0) => delay4_q_net_x13,
      src_ce => ce_1_sg_x22,
      src_clk => clk_1_sg_x22,
      m_axis_data_tdata_path0 => tbt_poly_m_axis_data_tdata_path0_net,
      m_axis_data_tdata_path1 => tbt_poly_m_axis_data_tdata_path1_net,
      m_axis_data_tuser_chanid(0) => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      m_axis_data_tvalid => tbt_poly_m_axis_data_tvalid_net_x1
    );

  tddm_tbt_1f4b61e651: entity work.tddm_tbt_entity_1f4b61e651
    port map (
      ce_35 => ce_35_sg_x14,
      ce_70 => ce_70_sg_x14,
      clk_35 => clk_35_sg_x14,
      clk_70 => clk_70_sg_x14,
      tbt_ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      tbt_i_in => reinterpret_output_port_net_x4,
      tbt_q_in => reinterpret_output_port_net_x3,
      poly35_ch2_i_out => down_sample2_q_net_x4,
      poly35_ch2_q_out => down_sample2_q_net_x5,
      poly35_ch3_i_out => down_sample1_q_net_x4,
      poly35_ch3_q_out => down_sample1_q_net_x5
    );

  trunc1_c3e3bdeec5: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret1_output_port_net_x2,
      dout => reinterpret_output_port_net_x4
    );

  trunc_6a2a4db298: entity work.trunc2_entity_3462e9e0db
    port map (
      din => reinterpret_output_port_net_x5,
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
    tbt_poly_decim: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x0: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x1: out std_logic_vector(23 downto 0); 
    tbt_poly_decim_x2: out std_logic_vector(23 downto 0)
  );
end tbt_amp1_entity_6e98f85f9f;

architecture structural of tbt_amp1_entity_6e98f85f9f is
  signal ce_1_sg_x23: std_logic;
  signal ce_35_sg_x15: std_logic;
  signal ce_70_sg_x15: std_logic;
  signal ce_logic_1_sg_x10: std_logic;
  signal clk_1_sg_x23: std_logic;
  signal clk_35_sg_x15: std_logic;
  signal clk_70_sg_x15: std_logic;
  signal delay4_q_net_x14: std_logic;
  signal delay6_q_net_x13: std_logic_vector(23 downto 0);
  signal delay7_q_net_x13: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x8: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x6: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x7: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x8: std_logic_vector(23 downto 0);
  signal register1_q_net_x4: std_logic;
  signal register5_q_net_x3: std_logic_vector(23 downto 0);
  signal reinterpret1_output_port_net_x2: std_logic_vector(24 downto 0);
  signal reinterpret_output_port_net_x5: std_logic_vector(24 downto 0);
  signal tbt_poly_m_axis_data_tuser_chanid_net_x4: std_logic;
  signal tbt_poly_m_axis_data_tvalid_net_x1: std_logic;

begin
  ce_1_sg_x23 <= ce_1;
  ce_35_sg_x15 <= ce_35;
  ce_70_sg_x15 <= ce_70;
  ce_logic_1_sg_x10 <= ce_logic_1;
  delay4_q_net_x14 <= ch_in;
  clk_1_sg_x23 <= clk_1;
  clk_35_sg_x15 <= clk_35;
  clk_70_sg_x15 <= clk_70;
  delay7_q_net_x13 <= i_in;
  delay6_q_net_x13 <= q_in;
  amp_out <= register5_q_net_x3;
  ch_out <= register1_q_net_x4;
  tbt_cordic <= down_sample1_q_net_x6;
  tbt_cordic_x0 <= down_sample2_q_net_x6;
  tbt_poly_decim <= down_sample1_q_net_x7;
  tbt_poly_decim_x0 <= down_sample2_q_net_x7;
  tbt_poly_decim_x1 <= down_sample1_q_net_x8;
  tbt_poly_decim_x2 <= down_sample2_q_net_x8;

  tbt_cordic_9dc3371de2: entity work.tbt_cordic_entity_9dc3371de2
    port map (
      ce_35 => ce_35_sg_x15,
      ce_70 => ce_70_sg_x15,
      ch_in => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      clk_35 => clk_35_sg_x15,
      clk_70 => clk_70_sg_x15,
      i_in => reinterpret1_output_port_net_x2,
      q_in => reinterpret_output_port_net_x5,
      valid_in => tbt_poly_m_axis_data_tvalid_net_x1,
      amp_out => register5_q_net_x3,
      ch_out => register1_q_net_x4,
      tddm_tbt_cordic => down_sample1_q_net_x6,
      tddm_tbt_cordic_x0 => down_sample2_q_net_x6
    );

  tbt_poly_decim_bb6f6b5b6a: entity work.tbt_poly_decim_entity_bb6f6b5b6a
    port map (
      ce_1 => ce_1_sg_x23,
      ce_35 => ce_35_sg_x15,
      ce_70 => ce_70_sg_x15,
      ce_logic_1 => ce_logic_1_sg_x10,
      ch_in => delay4_q_net_x14,
      clk_1 => clk_1_sg_x23,
      clk_35 => clk_35_sg_x15,
      clk_70 => clk_70_sg_x15,
      i_in => delay7_q_net_x13,
      q_in => delay6_q_net_x13,
      ch_out => tbt_poly_m_axis_data_tuser_chanid_net_x4,
      i_out => reinterpret1_output_port_net_x2,
      q_out => reinterpret_output_port_net_x5,
      tddm_tbt => down_sample1_q_net_x7,
      tddm_tbt_x0 => down_sample2_q_net_x7,
      tddm_tbt_x1 => down_sample1_q_net_x8,
      tddm_tbt_x2 => down_sample2_q_net_x8,
      valid_out => tbt_poly_m_axis_data_tvalid_net_x1
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
  signal ce_35_sg_x18: std_logic;
  signal ce_70_sg_x18: std_logic;
  signal clk_35_sg_x18: std_logic;
  signal clk_70_sg_x18: std_logic;
  signal down_sample1_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x2: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x3: std_logic_vector(23 downto 0);
  signal register1_q_net_x7: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal register5_q_net_x7: std_logic_vector(23 downto 0);

begin
  register5_q_net_x6 <= amp_in0;
  register5_q_net_x7 <= amp_in1;
  ce_35_sg_x18 <= ce_35;
  ce_70_sg_x18 <= ce_70;
  register1_q_net_x7 <= ch_in0;
  register1_q_net_x8 <= ch_in1;
  clk_35_sg_x18 <= clk_35;
  clk_70_sg_x18 <= clk_70;
  amp_out0 <= down_sample2_q_net_x2;
  amp_out1 <= down_sample1_q_net_x2;
  amp_out2 <= down_sample2_q_net_x3;
  amp_out3 <= down_sample1_q_net_x3;

  tddm_tbt_amp0_8f2b25894a: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x18,
      ce_70 => ce_70_sg_x18,
      ch_in => register1_q_net_x7,
      clk_35 => clk_35_sg_x18,
      clk_70 => clk_70_sg_x18,
      din => register5_q_net_x6,
      dout_ch0 => down_sample2_q_net_x2,
      dout_ch1 => down_sample1_q_net_x2
    );

  tddm_tbt_amp1_0c4a2e4770: entity work.tddm_tbt_cordic_entity_5b94be40c5
    port map (
      ce_35 => ce_35_sg_x18,
      ce_70 => ce_70_sg_x18,
      ch_in => register1_q_net_x8,
      clk_35 => clk_35_sg_x18,
      clk_70 => clk_70_sg_x18,
      din => register5_q_net_x7,
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
    tbt_amp0_x3: out std_logic_vector(23 downto 0); 
    tbt_amp0_x4: out std_logic_vector(23 downto 0); 
    tbt_amp1: out std_logic_vector(23 downto 0); 
    tbt_amp1_x0: out std_logic_vector(23 downto 0); 
    tbt_amp1_x1: out std_logic_vector(23 downto 0); 
    tbt_amp1_x2: out std_logic_vector(23 downto 0); 
    tbt_amp1_x3: out std_logic_vector(23 downto 0); 
    tbt_amp1_x4: out std_logic_vector(23 downto 0)
  );
end tbt_amp_entity_cbd277bb0c;

architecture structural of tbt_amp_entity_cbd277bb0c is
  signal ce_1_sg_x24: std_logic;
  signal ce_35_sg_x19: std_logic;
  signal ce_70_sg_x19: std_logic;
  signal ce_logic_1_sg_x11: std_logic;
  signal clk_1_sg_x24: std_logic;
  signal clk_35_sg_x19: std_logic;
  signal clk_70_sg_x19: std_logic;
  signal delay4_q_net_x15: std_logic;
  signal delay4_q_net_x16: std_logic;
  signal delay6_q_net_x14: std_logic_vector(23 downto 0);
  signal delay6_q_net_x15: std_logic_vector(23 downto 0);
  signal delay7_q_net_x14: std_logic_vector(23 downto 0);
  signal delay7_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x12: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x13: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x14: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x19: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x12: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x13: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x14: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x18: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x19: std_logic_vector(23 downto 0);
  signal register1_q_net_x7: std_logic;
  signal register1_q_net_x8: std_logic;
  signal register5_q_net_x6: std_logic_vector(23 downto 0);
  signal register5_q_net_x7: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x24 <= ce_1;
  ce_35_sg_x19 <= ce_35;
  ce_70_sg_x19 <= ce_70;
  ce_logic_1_sg_x11 <= ce_logic_1;
  delay4_q_net_x15 <= ch_in0;
  delay4_q_net_x16 <= ch_in1;
  clk_1_sg_x24 <= clk_1;
  clk_35_sg_x19 <= clk_35;
  clk_70_sg_x19 <= clk_70;
  delay7_q_net_x14 <= i_in0;
  delay7_q_net_x15 <= i_in1;
  delay6_q_net_x14 <= q_in0;
  delay6_q_net_x15 <= q_in1;
  amp_out0 <= down_sample2_q_net_x18;
  amp_out1 <= down_sample1_q_net_x18;
  amp_out2 <= down_sample2_q_net_x19;
  amp_out3 <= down_sample1_q_net_x19;
  tbt_amp0 <= down_sample1_q_net_x12;
  tbt_amp0_x0 <= down_sample2_q_net_x12;
  tbt_amp0_x1 <= down_sample1_q_net_x13;
  tbt_amp0_x2 <= down_sample2_q_net_x13;
  tbt_amp0_x3 <= down_sample1_q_net_x14;
  tbt_amp0_x4 <= down_sample2_q_net_x14;
  tbt_amp1 <= down_sample1_q_net_x15;
  tbt_amp1_x0 <= down_sample2_q_net_x15;
  tbt_amp1_x1 <= down_sample1_q_net_x16;
  tbt_amp1_x2 <= down_sample2_q_net_x16;
  tbt_amp1_x3 <= down_sample1_q_net_x17;
  tbt_amp1_x4 <= down_sample2_q_net_x17;

  tbt_amp0_88b1c45f0e: entity work.tbt_amp0_entity_88b1c45f0e
    port map (
      ce_1 => ce_1_sg_x24,
      ce_35 => ce_35_sg_x19,
      ce_70 => ce_70_sg_x19,
      ce_logic_1 => ce_logic_1_sg_x11,
      ch_in => delay4_q_net_x15,
      clk_1 => clk_1_sg_x24,
      clk_35 => clk_35_sg_x19,
      clk_70 => clk_70_sg_x19,
      i_in => delay7_q_net_x14,
      q_in => delay6_q_net_x14,
      amp_out => register5_q_net_x6,
      ch_out => register1_q_net_x7,
      tbt_cordic => down_sample1_q_net_x12,
      tbt_cordic_x0 => down_sample2_q_net_x12,
      tbt_poly_decim => down_sample1_q_net_x13,
      tbt_poly_decim_x0 => down_sample2_q_net_x13,
      tbt_poly_decim_x1 => down_sample1_q_net_x14,
      tbt_poly_decim_x2 => down_sample2_q_net_x14
    );

  tbt_amp1_6e98f85f9f: entity work.tbt_amp1_entity_6e98f85f9f
    port map (
      ce_1 => ce_1_sg_x24,
      ce_35 => ce_35_sg_x19,
      ce_70 => ce_70_sg_x19,
      ce_logic_1 => ce_logic_1_sg_x11,
      ch_in => delay4_q_net_x16,
      clk_1 => clk_1_sg_x24,
      clk_35 => clk_35_sg_x19,
      clk_70 => clk_70_sg_x19,
      i_in => delay7_q_net_x15,
      q_in => delay6_q_net_x15,
      amp_out => register5_q_net_x7,
      ch_out => register1_q_net_x8,
      tbt_cordic => down_sample1_q_net_x15,
      tbt_cordic_x0 => down_sample2_q_net_x15,
      tbt_poly_decim => down_sample1_q_net_x16,
      tbt_poly_decim_x0 => down_sample2_q_net_x16,
      tbt_poly_decim_x1 => down_sample1_q_net_x17,
      tbt_poly_decim_x2 => down_sample2_q_net_x17
    );

  tddm_tbt_amp_4ch_9f3ac0073e: entity work.tddm_tbt_amp_4ch_entity_9f3ac0073e
    port map (
      amp_in0 => register5_q_net_x6,
      amp_in1 => register5_q_net_x7,
      ce_35 => ce_35_sg_x19,
      ce_70 => ce_70_sg_x19,
      ch_in0 => register1_q_net_x7,
      ch_in1 => register1_q_net_x8,
      clk_35 => clk_35_sg_x19,
      clk_70 => clk_70_sg_x19,
      amp_out0 => down_sample2_q_net_x18,
      amp_out1 => down_sample1_q_net_x18,
      amp_out2 => down_sample2_q_net_x19,
      amp_out3 => down_sample1_q_net_x19
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/TDM"

entity tdm_entity_517deaf50c is
  port (
    ce_2224: in std_logic; 
    ce_556: in std_logic; 
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
end tdm_entity_517deaf50c;

architecture structural of tdm_entity_517deaf50c is
  signal ce_2224_sg_x20: std_logic;
  signal ce_556_sg_x2: std_logic;
  signal clk_2224_sg_x20: std_logic;
  signal clk_556_sg_x2: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal down_sample1_q_net_x14: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x14: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x15: std_logic_vector(23 downto 0);
  signal mux_sel_op_net: std_logic_vector(1 downto 0);
  signal mux_y_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x3: std_logic_vector(1 downto 0);
  signal register2_q_net: std_logic_vector(23 downto 0);
  signal register3_q_net: std_logic_vector(23 downto 0);
  signal register4_q_net: std_logic_vector(23 downto 0);
  signal register5_q_net: std_logic_vector(23 downto 0);
  signal register_q_net_x9: std_logic_vector(23 downto 0);
  signal up_sample_ch0_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch1_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch2_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch3_q_net: std_logic_vector(23 downto 0);

begin
  ce_2224_sg_x20 <= ce_2224;
  ce_556_sg_x2 <= ce_556;
  clk_2224_sg_x20 <= clk_2224;
  clk_556_sg_x2 <= clk_556;
  down_sample2_q_net_x14 <= din_ch0;
  down_sample1_q_net_x14 <= din_ch1;
  down_sample2_q_net_x15 <= din_ch2;
  down_sample1_q_net_x15 <= din_ch3;
  constant10_op_net_x0 <= rst;
  ch_out <= register1_q_net_x3;
  dout <= register_q_net_x9;

  mux: entity work.mux_f062741975
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register2_q_net,
      d1 => register3_q_net,
      d2 => register5_q_net,
      d3 => register4_q_net,
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
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
      clr => '0',
      en => "1",
      rst(0) => constant10_op_net_x0,
      op => mux_sel_op_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 2,
      init_value => b"00"
    )
    port map (
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
      d => mux_sel_op_net,
      en => "1",
      rst => "0",
      q => register1_q_net_x3
    );

  register2: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
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
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
      d => up_sample_ch1_q_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register4: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
      d => up_sample_ch3_q_net,
      en => "1",
      rst => "0",
      q => register4_q_net
    );

  register5: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
      d => up_sample_ch2_q_net,
      en => "1",
      rst => "0",
      q => register5_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_556_sg_x2,
      clk => clk_556_sg_x2,
      d => mux_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x9
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
      d => down_sample2_q_net_x14,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x20,
      src_clk => clk_2224_sg_x20,
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
      d => down_sample1_q_net_x14,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x20,
      src_clk => clk_2224_sg_x20,
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
      d => down_sample2_q_net_x15,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x20,
      src_clk => clk_2224_sg_x20,
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
      d => down_sample1_q_net_x15,
      dest_ce => ce_556_sg_x2,
      dest_clk => clk_556_sg_x2,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2224_sg_x20,
      src_clk => clk_2224_sg_x20,
      src_clr => '0',
      q => up_sample_ch3_q_net
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
  signal ce_1_sg_x25: std_logic;
  signal ce_2_sg_x23: std_logic;
  signal clk_1_sg_x25: std_logic;
  signal clk_2_sg_x23: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal mux_sel_op_net: std_logic;
  signal mux_y_net: std_logic_vector(23 downto 0);
  signal register1_q_net_x4: std_logic;
  signal register2_q_net: std_logic_vector(23 downto 0);
  signal register3_q_net: std_logic_vector(23 downto 0);
  signal register_q_net_x6: std_logic_vector(23 downto 0);
  signal reinterpret4_output_port_net_x1: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x1: std_logic_vector(23 downto 0);
  signal up_sample_ch0_q_net: std_logic_vector(23 downto 0);
  signal up_sample_ch1_q_net: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x25 <= ce_1;
  ce_2_sg_x23 <= ce_2;
  clk_1_sg_x25 <= clk_1;
  clk_2_sg_x23 <= clk_2;
  reinterpret4_output_port_net_x1 <= din_ch0;
  reinterpret_output_port_net_x1 <= din_ch1;
  constant10_op_net_x0 <= rst;
  ch_out <= register1_q_net_x4;
  dout <= register_q_net_x6;

  mux: entity work.mux_a2121d82da
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register2_q_net,
      d1 => register3_q_net,
      sel(0) => mux_sel_op_net,
      y => mux_y_net
    );

  mux_sel: entity work.counter_9b03e3d644
    port map (
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      clr => '0',
      rst(0) => constant10_op_net_x0,
      op(0) => mux_sel_op_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      d(0) => mux_sel_op_net,
      en => "1",
      rst => "0",
      q(0) => register1_q_net_x4
    );

  register2: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
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
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      d => up_sample_ch1_q_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 24,
      init_value => b"000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x25,
      clk => clk_1_sg_x25,
      d => mux_y_net,
      en => "1",
      rst => "0",
      q => register_q_net_x6
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
      d => reinterpret4_output_port_net_x1,
      dest_ce => ce_1_sg_x25,
      dest_clk => clk_1_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x23,
      src_clk => clk_2_sg_x23,
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
      d => reinterpret_output_port_net_x1,
      dest_ce => ce_1_sg_x25,
      dest_clk => clk_1_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x23,
      src_clk => clk_2_sg_x23,
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
  signal ce_1_sg_x27: std_logic;
  signal ce_2_sg_x25: std_logic;
  signal clk_1_sg_x27: std_logic;
  signal clk_2_sg_x25: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal constant11_op_net_x0: std_logic;
  signal register1_q_net_x6: std_logic;
  signal register1_q_net_x7: std_logic;
  signal register_q_net_x8: std_logic_vector(23 downto 0);
  signal register_q_net_x9: std_logic_vector(23 downto 0);
  signal reinterpret2_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret3_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret4_output_port_net_x2: std_logic_vector(23 downto 0);
  signal reinterpret_output_port_net_x2: std_logic_vector(23 downto 0);

begin
  ce_1_sg_x27 <= ce_1;
  ce_2_sg_x25 <= ce_2;
  clk_1_sg_x27 <= clk_1;
  clk_2_sg_x25 <= clk_2;
  reinterpret4_output_port_net_x2 <= din_ch0;
  reinterpret_output_port_net_x2 <= din_ch1;
  reinterpret2_output_port_net_x2 <= din_ch2;
  reinterpret3_output_port_net_x2 <= din_ch3;
  ch_out0 <= register1_q_net_x6;
  ch_out1 <= register1_q_net_x7;
  dout0 <= register_q_net_x8;
  dout1 <= register_q_net_x9;

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
      ce_1 => ce_1_sg_x27,
      ce_2 => ce_2_sg_x25,
      clk_1 => clk_1_sg_x27,
      clk_2 => clk_2_sg_x25,
      din_ch0 => reinterpret4_output_port_net_x2,
      din_ch1 => reinterpret_output_port_net_x2,
      rst => constant10_op_net_x0,
      ch_out => register1_q_net_x6,
      dout => register_q_net_x8
    );

  tdm_mix_ch1_2_5f72ff242b: entity work.tdm_mix_ch0_1_entity_b9bb73dd5f
    port map (
      ce_1 => ce_1_sg_x27,
      ce_2 => ce_2_sg_x25,
      clk_1 => clk_1_sg_x27,
      clk_2 => clk_2_sg_x25,
      din_ch0 => reinterpret2_output_port_net_x2,
      din_ch1 => reinterpret3_output_port_net_x2,
      rst => constant11_op_net_x0,
      ch_out => register1_q_net_x7,
      dout => register_q_net_x9
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/fifo_ds_q"

entity fifo_ds_q_entity_6eec74202f is
  port (
    ce_1: in std_logic; 
    ce_2224: in std_logic; 
    clk_1: in std_logic; 
    clk_2224: in std_logic; 
    from_fifo: in std_logic; 
    to_fifo: in std_logic; 
    we_x0: in std_logic; 
    logical_x0: out std_logic; 
    valid_out: out std_logic
  );
end fifo_ds_q_entity_6eec74202f;

architecture structural of fifo_ds_q_entity_6eec74202f is
  signal assert_dout_net_x0: std_logic;
  signal ce_1_sg_x28: std_logic;
  signal ce_2224_sg_x21: std_logic;
  signal clk_1_sg_x28: std_logic;
  signal clk_2224_sg_x21: std_logic;
  signal dividend_valid_x0: std_logic;
  signal empty_x0: std_logic;
  signal full_x0: std_logic;
  signal inverter2_op_net: std_logic;
  signal we_x1: std_logic;

begin
  ce_1_sg_x28 <= ce_1;
  ce_2224_sg_x21 <= ce_2224;
  clk_1_sg_x28 <= clk_1;
  clk_2224_sg_x21 <= clk_2224;
  empty_x0 <= from_fifo;
  full_x0 <= to_fifo;
  assert_dout_net_x0 <= we_x0;
  logical_x0 <= we_x1;
  valid_out <= dividend_valid_x0;

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_2224_sg_x21,
      clk => clk_2224_sg_x21,
      clr => '0',
      ip(0) => full_x0,
      op(0) => inverter2_op_net
    );

  inverter4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x28,
      clk => clk_1_sg_x28,
      clr => '0',
      ip(0) => empty_x0,
      op(0) => dividend_valid_x0
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

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_fofb/unsigned2signed1"

entity unsigned2signed1_entity_4871dec4a6 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    s_data: in std_logic_vector(25 downto 0); 
    u_data: in std_logic_vector(23 downto 0); 
    data_out: out std_logic_vector(24 downto 0)
  );
end unsigned2signed1_entity_4871dec4a6;

architecture structural of unsigned2signed1_entity_4871dec4a6 is
  signal ce_1_sg_x32: std_logic;
  signal clk_1_sg_x32: std_logic;
  signal concat_y_net: std_logic_vector(49 downto 0);
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal divider_dout_frac_x0: std_logic_vector(23 downto 0);
  signal divider_dout_quoc_x0: std_logic_vector(25 downto 0);
  signal reinterpret1_output_port_net: std_logic_vector(23 downto 0);
  signal reinterpret2_output_port_net: std_logic_vector(25 downto 0);
  signal reinterpret_output_port_net: std_logic_vector(49 downto 0);

begin
  ce_1_sg_x32 <= ce_1;
  clk_1_sg_x32 <= clk_1;
  divider_dout_quoc_x0 <= s_data;
  divider_dout_frac_x0 <= u_data;
  data_out <= convert_dout_net_x0;

  concat: entity work.concat_0f2aa0366d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => reinterpret2_output_port_net,
      in1 => reinterpret1_output_port_net,
      y => concat_y_net
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 24,
      din_width => 50,
      dout_arith => 2,
      dout_bin_pt => 24,
      dout_width => 25,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x32,
      clk => clk_1_sg_x32,
      clr => '0',
      din => reinterpret_output_port_net,
      en => "1",
      dout => convert_dout_net_x0
    );

  reinterpret: entity work.reinterpret_1d284b35d5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => concat_y_net,
      output_port => reinterpret_output_port_net
    );

  reinterpret1: entity work.reinterpret_950635102d
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => divider_dout_frac_x0,
      output_port => reinterpret1_output_port_net
    );

  reinterpret2: entity work.reinterpret_f5c4fbeb84
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      input_port => divider_dout_quoc_x0,
      output_port => reinterpret2_output_port_net
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
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    clk_2224: in std_logic; 
    d: in std_logic_vector(23 downto 0); 
    delta_sigma_thres: in std_logic_vector(25 downto 0); 
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
    assert1_x0: out std_logic; 
    assert2_x0: out std_logic; 
    assert3_x0: out std_logic; 
    assert4_x0: out std_logic; 
    fifo_ds_q: out std_logic; 
    fifo_ds_sum: out std_logic; 
    fifo_ds_x: out std_logic; 
    fifo_ds_y: out std_logic; 
    q: out std_logic_vector(24 downto 0); 
    register10_x0: out std_logic_vector(25 downto 0); 
    register7_x0: out std_logic_vector(25 downto 0); 
    register9_x0: out std_logic_vector(25 downto 0); 
    sum_d_s_fpga: out std_logic_vector(25 downto 0); 
    sum_x0: out std_logic_vector(24 downto 0); 
    x: out std_logic_vector(24 downto 0); 
    y: out std_logic_vector(24 downto 0)
  );
end delta_sigma_fofb_entity_ee61e649ea;

architecture structural of delta_sigma_fofb_entity_ee61e649ea is
  signal a_plus_b_s_net: std_logic_vector(24 downto 0);
  signal a_plus_c_s_net: std_logic_vector(24 downto 0);
  signal a_plus_d_s_net: std_logic_vector(24 downto 0);
  signal assert2_dout_net_x0: std_logic;
  signal assert3_dout_net_x0: std_logic;
  signal assert4_dout_net_x0: std_logic;
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert_dout_net_x3: std_logic;
  signal b_plus_c_s_net: std_logic_vector(24 downto 0);
  signal b_plus_d_s_net: std_logic_vector(24 downto 0);
  signal c_plus_d_s_net: std_logic_vector(24 downto 0);
  signal ce_1_sg_x35: std_logic;
  signal ce_2224_sg_x25: std_logic;
  signal ce_2_sg_x26: std_logic;
  signal clk_1_sg_x35: std_logic;
  signal clk_2224_sg_x25: std_logic;
  signal clk_2_sg_x26: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal convert_dout_net_x1: std_logic_vector(24 downto 0);
  signal convert_dout_net_x2: std_logic_vector(24 downto 0);
  signal del_sig_div_fofb_thres_i_net_x0: std_logic_vector(25 downto 0);
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
  signal dividend_valid_x0: std_logic;
  signal dividend_valid_x1: std_logic;
  signal dividend_valid_x2: std_logic;
  signal dividend_valid_x3: std_logic;
  signal divider_dout_frac_x0: std_logic_vector(23 downto 0);
  signal divider_dout_quoc_x0: std_logic_vector(25 downto 0);
  signal divider_dout_valid: std_logic;
  signal divisor_data_x0: std_logic_vector(25 downto 0);
  signal divisor_ready: std_logic;
  signal down_sample1_q_net: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample2_q_net: std_logic_vector(24 downto 0);
  signal down_sample2_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample3_q_net: std_logic_vector(24 downto 0);
  signal down_sample4_q_net: std_logic_vector(24 downto 0);
  signal down_sample_q_net: std_logic_vector(25 downto 0);
  signal empty_x4: std_logic;
  signal empty_x5: std_logic;
  signal empty_x6: std_logic;
  signal empty_x7: std_logic;
  signal expression1_dout_net: std_logic;
  signal full_x4: std_logic;
  signal full_x5: std_logic;
  signal full_x6: std_logic;
  signal full_x7: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(23 downto 0);
  signal q_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(25 downto 0);
  signal q_divider_m_axis_dout_tvalid_net: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal re_x0: std_logic;
  signal register10_q_net_x0: std_logic_vector(25 downto 0);
  signal register11_q_net: std_logic_vector(24 downto 0);
  signal register12_q_net: std_logic_vector(24 downto 0);
  signal register13_q_net: std_logic_vector(24 downto 0);
  signal register19_q_net: std_logic_vector(24 downto 0);
  signal register1_q_net: std_logic_vector(24 downto 0);
  signal register2_q_net: std_logic_vector(24 downto 0);
  signal register3_q_net: std_logic_vector(24 downto 0);
  signal register4_q_net: std_logic_vector(24 downto 0);
  signal register5_q_net: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(24 downto 0);
  signal register7_q_net_x0: std_logic_vector(25 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net: std_logic_vector(25 downto 0);
  signal we_x5: std_logic;
  signal we_x6: std_logic;
  signal we_x7: std_logic;
  signal we_x8: std_logic;
  signal x_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(23 downto 0);
  signal x_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(25 downto 0);
  signal x_divider_m_axis_dout_tvalid_net: std_logic;
  signal x_divider_s_axis_dividend_tready_net: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;

begin
  down_sample2_q_net_x16 <= a;
  down_sample1_q_net_x16 <= b;
  down_sample2_q_net_x17 <= c;
  ce_1_sg_x35 <= ce_1;
  ce_2_sg_x26 <= ce_2;
  ce_2224_sg_x25 <= ce_2224;
  clk_1_sg_x35 <= clk_1;
  clk_2_sg_x26 <= clk_2;
  clk_2224_sg_x25 <= clk_2224;
  down_sample1_q_net_x17 <= d;
  del_sig_div_fofb_thres_i_net_x0 <= delta_sigma_thres;
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
  assert1_x0 <= re_x0;
  assert2_x0 <= assert2_dout_net_x0;
  assert3_x0 <= assert3_dout_net_x0;
  assert4_x0 <= assert4_dout_net_x0;
  fifo_ds_q <= we_x5;
  fifo_ds_sum <= we_x6;
  fifo_ds_x <= we_x7;
  fifo_ds_y <= we_x8;
  q <= assert8_dout_net_x1;
  register10_x0 <= register10_q_net_x0;
  register7_x0 <= register7_q_net_x0;
  register9_x0 <= din_x0;
  sum_d_s_fpga <= divisor_data_x0;
  sum_x0 <= assert6_dout_net_x1;
  x <= assert5_dout_net_x1;
  y <= assert7_dout_net_x1;

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
      a => down_sample2_q_net_x16,
      b => down_sample1_q_net_x16,
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      a => down_sample2_q_net_x16,
      b => down_sample2_q_net_x17,
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      a => down_sample2_q_net_x16,
      b => down_sample1_q_net_x17,
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      din(0) => dividend_ready,
      dout(0) => re_x0
    );

  assert2: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => expression1_dout_net,
      dout(0) => assert2_dout_net_x0
    );

  assert3: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => x_divider_s_axis_dividend_tready_net,
      dout(0) => assert3_dout_net_x0
    );

  assert4: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => q_divider_s_axis_dividend_tready_net,
      dout(0) => assert4_dout_net_x0
    );

  assert5: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample2_q_net,
      dout => assert5_dout_net_x1
    );

  assert6: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample3_q_net,
      dout => assert6_dout_net_x1
    );

  assert7: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net,
      dout => assert7_dout_net_x1
    );

  assert8: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample4_q_net,
      dout => assert8_dout_net_x1
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
      a => down_sample1_q_net_x16,
      b => down_sample2_q_net_x17,
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      a => down_sample1_q_net_x16,
      b => down_sample1_q_net_x17,
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      a => down_sample2_q_net_x17,
      b => down_sample1_q_net_x17,
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
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
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 25,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      d => dividend_data_x4,
      en => '1',
      rst => '1',
      q => delay_q_net
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      d => del_sig_div_fofb_thres_i_net_x0,
      dest_ce => ce_2224_sg_x25,
      dest_clk => clk_2224_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x26,
      src_clk => clk_2_sg_x26,
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
      d => register13_q_net,
      dest_ce => ce_2224_sg_x25,
      dest_clk => clk_2224_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x35,
      src_clk => clk_1_sg_x35,
      src_clr => '0',
      q => down_sample1_q_net
    );

  down_sample2: entity work.xldsamp
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
      dest_ce => ce_2224_sg_x25,
      dest_clk => clk_2224_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x35,
      src_clk => clk_1_sg_x35,
      src_clr => '0',
      q => down_sample2_q_net
    );

  down_sample3: entity work.xldsamp
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
      d => register19_q_net,
      dest_ce => ce_2224_sg_x25,
      dest_clk => clk_2224_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x35,
      src_clk => clk_1_sg_x35,
      src_clr => '0',
      q => down_sample3_q_net
    );

  down_sample4: entity work.xldsamp
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
      dest_ce => ce_2224_sg_x25,
      dest_clk => clk_2224_sg_x25,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x35,
      src_clk => clk_1_sg_x35,
      src_clr => '0',
      q => down_sample4_q_net
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

  fifo_ds_q_6eec74202f: entity work.fifo_ds_q_entity_6eec74202f
    port map (
      ce_1 => ce_1_sg_x35,
      ce_2224 => ce_2224_sg_x25,
      clk_1 => clk_1_sg_x35,
      clk_2224 => clk_2224_sg_x25,
      from_fifo => empty_x4,
      to_fifo => full_x4,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x5,
      valid_out => dividend_valid_x0
    );

  fifo_ds_sum_da7cfd6132: entity work.fifo_ds_q_entity_6eec74202f
    port map (
      ce_1 => ce_1_sg_x35,
      ce_2224 => ce_2224_sg_x25,
      clk_1 => clk_1_sg_x35,
      clk_2224 => clk_2224_sg_x25,
      from_fifo => empty_x5,
      to_fifo => full_x5,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x6,
      valid_out => dividend_valid_x1
    );

  fifo_ds_x_d06178076e: entity work.fifo_ds_q_entity_6eec74202f
    port map (
      ce_1 => ce_1_sg_x35,
      ce_2224 => ce_2224_sg_x25,
      clk_1 => clk_1_sg_x35,
      clk_2224 => clk_2224_sg_x25,
      from_fifo => empty_x6,
      to_fifo => full_x6,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x7,
      valid_out => dividend_valid_x2
    );

  fifo_ds_y_75738e511e: entity work.fifo_ds_q_entity_6eec74202f
    port map (
      ce_1 => ce_1_sg_x35,
      ce_2224 => ce_2224_sg_x25,
      clk_1 => clk_1_sg_x35,
      clk_2224 => clk_2224_sg_x25,
      from_fifo => empty_x7,
      to_fifo => full_x7,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x8,
      valid_out => dividend_valid_x3
    );

  q_divider: entity work.xldivider_generator_7b92d2b3a8529d55359a27d09fb2c5d6
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      s_axis_dividend_tdata_dividend => dividend_data_x3,
      s_axis_dividend_tvalid => dividend_valid_x0,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => q_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      d => convert_dout_net_x1,
      en(0) => x_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register11_q_net
    );

  register12: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      d => convert_dout_net_x2,
      en(0) => q_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register12_q_net
    );

  register13: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      d => convert_dout_net_x0,
      en(0) => divider_dout_valid,
      rst => "0",
      q => register13_q_net
    );

  register19: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      d => convert_dout_net,
      en => "1",
      rst => "0",
      q => register19_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
      d => delta_y_s_net,
      en => "1",
      rst => "0",
      q => din_x0
    );

  relational: entity work.relational_351cfeabec
    port map (
      a => divisor_data_x0,
      b => down_sample_q_net,
      ce => '0',
      clk => '0',
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
      ce => ce_2224_sg_x25,
      clk => clk_2224_sg_x25,
      clr => '0',
      en => "1",
      s => sum_s_net
    );

  unsigned2signed1_4871dec4a6: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x35,
      clk_1 => clk_1_sg_x35,
      s_data => divider_dout_quoc_x0,
      u_data => divider_dout_frac_x0,
      data_out => convert_dout_net_x0
    );

  unsigned2signed2_2f05b465d2: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x35,
      clk_1 => clk_1_sg_x35,
      s_data => x_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => x_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x1
    );

  unsigned2signed3_5318c8a639: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x35,
      clk_1 => clk_1_sg_x35,
      s_data => q_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => q_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x2
    );

  x_divider: entity work.xldivider_generator_7b92d2b3a8529d55359a27d09fb2c5d6
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      s_axis_dividend_tdata_dividend => dividend_data_x5,
      s_axis_dividend_tvalid => dividend_valid_x2,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => x_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => x_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_9bc6b5677974555f6235feeceb7f929f
    port map (
      ce => ce_1_sg_x35,
      clk => clk_1_sg_x35,
      s_axis_dividend_tdata_dividend => dividend_data_x6,
      s_axis_dividend_tvalid => dividend_valid_x3,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => divider_dout_frac_x0,
      m_axis_dout_tdata_quotient => divider_dout_quoc_x0,
      m_axis_dout_tvalid => divider_dout_valid,
      s_axis_dividend_tready => dividend_ready,
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
  signal ce_22240000_sg_x6: std_logic;
  signal ce_2_sg_x27: std_logic;
  signal ce_5000_sg_x0: std_logic;
  signal clk_22240000_sg_x6: std_logic;
  signal clk_2_sg_x27: std_logic;
  signal clk_5000_sg_x0: std_logic;
  signal del_sig_div_monit_thres_i_net_x0: std_logic_vector(25 downto 0);
  signal down_sample5_q_net: std_logic_vector(25 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(25 downto 0);

begin
  ce_2_sg_x27 <= ce_2;
  ce_22240000_sg_x6 <= ce_22240000;
  ce_5000_sg_x0 <= ce_5000;
  clk_2_sg_x27 <= clk_2;
  clk_22240000_sg_x6 <= clk_22240000;
  clk_5000_sg_x0 <= clk_5000;
  del_sig_div_monit_thres_i_net_x0 <= din;
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
      dest_ce => ce_22240000_sg_x6,
      dest_clk => clk_22240000_sg_x6,
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
      d => del_sig_div_monit_thres_i_net_x0,
      dest_ce => ce_5000_sg_x0,
      dest_clk => clk_5000_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x27,
      src_clk => clk_2_sg_x27,
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
    ce_11120000: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2500: in std_logic; 
    clk_1: in std_logic; 
    clk_11120000: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2500: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(24 downto 0)
  );
end downsample1_entity_4c88924603;

architecture structural of downsample1_entity_4c88924603 is
  signal ce_11120000_sg_x0: std_logic;
  signal ce_1_sg_x36: std_logic;
  signal ce_22240000_sg_x7: std_logic;
  signal ce_2500_sg_x0: std_logic;
  signal clk_11120000_sg_x0: std_logic;
  signal clk_1_sg_x36: std_logic;
  signal clk_22240000_sg_x7: std_logic;
  signal clk_2500_sg_x0: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(24 downto 0);
  signal down_sample5_q_net: std_logic_vector(24 downto 0);
  signal down_sample_q_net: std_logic_vector(24 downto 0);
  signal register19_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x36 <= ce_1;
  ce_11120000_sg_x0 <= ce_11120000;
  ce_22240000_sg_x7 <= ce_22240000;
  ce_2500_sg_x0 <= ce_2500;
  clk_1_sg_x36 <= clk_1;
  clk_11120000_sg_x0 <= clk_11120000;
  clk_22240000_sg_x7 <= clk_22240000;
  clk_2500_sg_x0 <= clk_2500;
  register19_q_net_x0 <= din;
  dout <= down_sample1_q_net_x0;

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
      dest_ce => ce_11120000_sg_x0,
      dest_clk => clk_11120000_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2500_sg_x0,
      src_clk => clk_2500_sg_x0,
      src_clr => '0',
      q => down_sample_q_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 25,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 25
    )
    port map (
      d => down_sample_q_net,
      dest_ce => ce_22240000_sg_x7,
      dest_clk => clk_22240000_sg_x7,
      dest_clr => '0',
      en => "1",
      src_ce => ce_11120000_sg_x0,
      src_clk => clk_11120000_sg_x0,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 21,
      d_width => 25,
      ds_ratio => 2500,
      latency => 1,
      phase => 2499,
      q_arith => xlSigned,
      q_bin_pt => 21,
      q_width => 25
    )
    port map (
      d => register19_q_net_x0,
      dest_ce => ce_2500_sg_x0,
      dest_clk => clk_2500_sg_x0,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x36,
      src_clk => clk_1_sg_x36,
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
    ce_11120000: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2500: in std_logic; 
    clk_1: in std_logic; 
    clk_11120000: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2500: in std_logic; 
    din: in std_logic_vector(24 downto 0); 
    dout: out std_logic_vector(24 downto 0)
  );
end downsample2_entity_891f07b1a7;

architecture structural of downsample2_entity_891f07b1a7 is
  signal ce_11120000_sg_x1: std_logic;
  signal ce_1_sg_x37: std_logic;
  signal ce_22240000_sg_x8: std_logic;
  signal ce_2500_sg_x1: std_logic;
  signal clk_11120000_sg_x1: std_logic;
  signal clk_1_sg_x37: std_logic;
  signal clk_22240000_sg_x8: std_logic;
  signal clk_2500_sg_x1: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(24 downto 0);
  signal down_sample5_q_net: std_logic_vector(24 downto 0);
  signal down_sample_q_net: std_logic_vector(24 downto 0);
  signal register11_q_net_x0: std_logic_vector(24 downto 0);

begin
  ce_1_sg_x37 <= ce_1;
  ce_11120000_sg_x1 <= ce_11120000;
  ce_22240000_sg_x8 <= ce_22240000;
  ce_2500_sg_x1 <= ce_2500;
  clk_1_sg_x37 <= clk_1;
  clk_11120000_sg_x1 <= clk_11120000;
  clk_22240000_sg_x8 <= clk_22240000;
  clk_2500_sg_x1 <= clk_2500;
  register11_q_net_x0 <= din;
  dout <= down_sample1_q_net_x0;

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
      dest_ce => ce_11120000_sg_x1,
      dest_clk => clk_11120000_sg_x1,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2500_sg_x1,
      src_clk => clk_2500_sg_x1,
      src_clr => '0',
      q => down_sample_q_net
    );

  down_sample1: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 2,
      latency => 1,
      phase => 1,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => down_sample_q_net,
      dest_ce => ce_22240000_sg_x8,
      dest_clk => clk_22240000_sg_x8,
      dest_clr => '0',
      en => "1",
      src_ce => ce_11120000_sg_x1,
      src_clk => clk_11120000_sg_x1,
      src_clr => '0',
      q => down_sample1_q_net_x0
    );

  down_sample5: entity work.xldsamp
    generic map (
      d_arith => xlSigned,
      d_bin_pt => 24,
      d_width => 25,
      ds_ratio => 2500,
      latency => 1,
      phase => 2499,
      q_arith => xlSigned,
      q_bin_pt => 24,
      q_width => 25
    )
    port map (
      d => register11_q_net_x0,
      dest_ce => ce_2500_sg_x1,
      dest_clk => clk_2500_sg_x1,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x37,
      src_clk => clk_1_sg_x37,
      src_clr => '0',
      q => down_sample5_q_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "ddc_bpm_476_066/delta-sigma_monit/fifo_ds_q"

entity fifo_ds_q_entity_6b3a8c7b24 is
  port (
    ce_1: in std_logic; 
    ce_22240000: in std_logic; 
    clk_1: in std_logic; 
    clk_22240000: in std_logic; 
    from_fifo: in std_logic; 
    to_fifo: in std_logic; 
    we_x0: in std_logic; 
    logical_x0: out std_logic; 
    valid_out: out std_logic
  );
end fifo_ds_q_entity_6b3a8c7b24;

architecture structural of fifo_ds_q_entity_6b3a8c7b24 is
  signal assert_dout_net_x0: std_logic;
  signal ce_1_sg_x40: std_logic;
  signal ce_22240000_sg_x11: std_logic;
  signal clk_1_sg_x40: std_logic;
  signal clk_22240000_sg_x11: std_logic;
  signal dividend_valid_x0: std_logic;
  signal empty_x0: std_logic;
  signal full_x0: std_logic;
  signal inverter2_op_net: std_logic;
  signal we_x1: std_logic;

begin
  ce_1_sg_x40 <= ce_1;
  ce_22240000_sg_x11 <= ce_22240000;
  clk_1_sg_x40 <= clk_1;
  clk_22240000_sg_x11 <= clk_22240000;
  empty_x0 <= from_fifo;
  full_x0 <= to_fifo;
  assert_dout_net_x0 <= we_x0;
  logical_x0 <= we_x1;
  valid_out <= dividend_valid_x0;

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_22240000_sg_x11,
      clk => clk_22240000_sg_x11,
      clr => '0',
      ip(0) => full_x0,
      op(0) => inverter2_op_net
    );

  inverter4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x40,
      clk => clk_1_sg_x40,
      clr => '0',
      ip(0) => empty_x0,
      op(0) => dividend_valid_x0
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
    ce_11120000: in std_logic; 
    ce_2: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2500: in std_logic; 
    ce_5000: in std_logic; 
    clk_1: in std_logic; 
    clk_11120000: in std_logic; 
    clk_2: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2500: in std_logic; 
    clk_5000: in std_logic; 
    d: in std_logic_vector(23 downto 0); 
    delta_sigma_thres: in std_logic_vector(25 downto 0); 
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
    assert1_x0: out std_logic; 
    assert2_x0: out std_logic; 
    assert3_x0: out std_logic; 
    assert4_x0: out std_logic; 
    fifo_ds_q: out std_logic; 
    fifo_ds_sum: out std_logic; 
    fifo_ds_x: out std_logic; 
    fifo_ds_y: out std_logic; 
    q: out std_logic_vector(24 downto 0); 
    register10_x0: out std_logic_vector(25 downto 0); 
    register7_x0: out std_logic_vector(25 downto 0); 
    register9_x0: out std_logic_vector(25 downto 0); 
    sum_d_s_fpga: out std_logic_vector(25 downto 0); 
    sum_x0: out std_logic_vector(24 downto 0); 
    x: out std_logic_vector(24 downto 0); 
    y: out std_logic_vector(24 downto 0)
  );
end delta_sigma_monit_entity_a8f8b81626;

architecture structural of delta_sigma_monit_entity_a8f8b81626 is
  signal a_plus_b_s_net: std_logic_vector(24 downto 0);
  signal a_plus_c_s_net: std_logic_vector(24 downto 0);
  signal a_plus_d_s_net: std_logic_vector(24 downto 0);
  signal assert2_dout_net_x0: std_logic;
  signal assert3_dout_net_x0: std_logic;
  signal assert4_dout_net_x0: std_logic;
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert_dout_net_x3: std_logic;
  signal b_plus_c_s_net: std_logic_vector(24 downto 0);
  signal b_plus_d_s_net: std_logic_vector(24 downto 0);
  signal c_plus_d_s_net: std_logic_vector(24 downto 0);
  signal ce_11120000_sg_x4: std_logic;
  signal ce_1_sg_x47: std_logic;
  signal ce_22240000_sg_x15: std_logic;
  signal ce_2500_sg_x4: std_logic;
  signal ce_2_sg_x28: std_logic;
  signal ce_5000_sg_x1: std_logic;
  signal clk_11120000_sg_x4: std_logic;
  signal clk_1_sg_x47: std_logic;
  signal clk_22240000_sg_x15: std_logic;
  signal clk_2500_sg_x4: std_logic;
  signal clk_2_sg_x28: std_logic;
  signal clk_5000_sg_x1: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal convert_dout_net_x1: std_logic_vector(24 downto 0);
  signal convert_dout_net_x2: std_logic_vector(24 downto 0);
  signal del_sig_div_monit_thres_i_net_x1: std_logic_vector(25 downto 0);
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
  signal dividend_valid_x0: std_logic;
  signal dividend_valid_x1: std_logic;
  signal dividend_valid_x2: std_logic;
  signal dividend_valid_x3: std_logic;
  signal divider_dout_frac_x0: std_logic_vector(23 downto 0);
  signal divider_dout_quoc_x0: std_logic_vector(25 downto 0);
  signal divider_dout_valid: std_logic;
  signal divisor_data_x0: std_logic_vector(25 downto 0);
  signal divisor_ready: std_logic;
  signal down_sample1_q_net_x0: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x1: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x2: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x3: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample3_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample4_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample_q_net_x0: std_logic_vector(25 downto 0);
  signal empty_x4: std_logic;
  signal empty_x5: std_logic;
  signal empty_x6: std_logic;
  signal empty_x7: std_logic;
  signal expression1_dout_net: std_logic;
  signal full_x4: std_logic;
  signal full_x5: std_logic;
  signal full_x6: std_logic;
  signal full_x7: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(23 downto 0);
  signal q_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(25 downto 0);
  signal q_divider_m_axis_dout_tvalid_net: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal re_x0: std_logic;
  signal register10_q_net_x0: std_logic_vector(25 downto 0);
  signal register11_q_net_x0: std_logic_vector(24 downto 0);
  signal register12_q_net_x0: std_logic_vector(24 downto 0);
  signal register13_q_net_x0: std_logic_vector(24 downto 0);
  signal register19_q_net_x0: std_logic_vector(24 downto 0);
  signal register1_q_net: std_logic_vector(24 downto 0);
  signal register2_q_net: std_logic_vector(24 downto 0);
  signal register3_q_net: std_logic_vector(24 downto 0);
  signal register4_q_net: std_logic_vector(24 downto 0);
  signal register5_q_net: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(24 downto 0);
  signal register7_q_net_x0: std_logic_vector(25 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net: std_logic_vector(25 downto 0);
  signal we_x5: std_logic;
  signal we_x6: std_logic;
  signal we_x7: std_logic;
  signal we_x8: std_logic;
  signal x_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(23 downto 0);
  signal x_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(25 downto 0);
  signal x_divider_m_axis_dout_tvalid_net: std_logic;
  signal x_divider_s_axis_dividend_tready_net: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;

begin
  down_sample2_q_net_x5 <= a;
  down_sample1_q_net_x5 <= b;
  down_sample3_q_net_x5 <= c;
  ce_1_sg_x47 <= ce_1;
  ce_11120000_sg_x4 <= ce_11120000;
  ce_2_sg_x28 <= ce_2;
  ce_22240000_sg_x15 <= ce_22240000;
  ce_2500_sg_x4 <= ce_2500;
  ce_5000_sg_x1 <= ce_5000;
  clk_1_sg_x47 <= clk_1;
  clk_11120000_sg_x4 <= clk_11120000;
  clk_2_sg_x28 <= clk_2;
  clk_22240000_sg_x15 <= clk_22240000;
  clk_2500_sg_x4 <= clk_2500;
  clk_5000_sg_x1 <= clk_5000;
  down_sample4_q_net_x5 <= d;
  del_sig_div_monit_thres_i_net_x1 <= delta_sigma_thres;
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
  assert1_x0 <= re_x0;
  assert2_x0 <= assert2_dout_net_x0;
  assert3_x0 <= assert3_dout_net_x0;
  assert4_x0 <= assert4_dout_net_x0;
  fifo_ds_q <= we_x5;
  fifo_ds_sum <= we_x6;
  fifo_ds_x <= we_x7;
  fifo_ds_y <= we_x8;
  q <= assert6_dout_net_x1;
  register10_x0 <= register10_q_net_x0;
  register7_x0 <= register7_q_net_x0;
  register9_x0 <= din_x0;
  sum_d_s_fpga <= divisor_data_x0;
  sum_x0 <= assert8_dout_net_x1;
  x <= assert7_dout_net_x1;
  y <= assert5_dout_net_x1;

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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      din(0) => dividend_ready,
      dout(0) => re_x0
    );

  assert2: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => expression1_dout_net,
      dout(0) => assert2_dout_net_x0
    );

  assert3: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => x_divider_s_axis_dividend_tready_net,
      dout(0) => assert3_dout_net_x0
    );

  assert4: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => q_divider_s_axis_dividend_tready_net,
      dout(0) => assert4_dout_net_x0
    );

  assert5: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net_x2,
      dout => assert5_dout_net_x1
    );

  assert6: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net_x3,
      dout => assert6_dout_net_x1
    );

  assert7: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net_x1,
      dout => assert7_dout_net_x1
    );

  assert8: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net_x0,
      dout => assert8_dout_net_x1
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
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
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 25,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d => dividend_data_x4,
      en => '1',
      rst => '1',
      q => delay_q_net
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
      clr => '0',
      en => "1",
      s => delta_y_s_net
    );

  downsample1_4c88924603: entity work.downsample1_entity_4c88924603
    port map (
      ce_1 => ce_1_sg_x47,
      ce_11120000 => ce_11120000_sg_x4,
      ce_22240000 => ce_22240000_sg_x15,
      ce_2500 => ce_2500_sg_x4,
      clk_1 => clk_1_sg_x47,
      clk_11120000 => clk_11120000_sg_x4,
      clk_22240000 => clk_22240000_sg_x15,
      clk_2500 => clk_2500_sg_x4,
      din => register19_q_net_x0,
      dout => down_sample1_q_net_x0
    );

  downsample2_891f07b1a7: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x47,
      ce_11120000 => ce_11120000_sg_x4,
      ce_22240000 => ce_22240000_sg_x15,
      ce_2500 => ce_2500_sg_x4,
      clk_1 => clk_1_sg_x47,
      clk_11120000 => clk_11120000_sg_x4,
      clk_22240000 => clk_22240000_sg_x15,
      clk_2500 => clk_2500_sg_x4,
      din => register11_q_net_x0,
      dout => down_sample1_q_net_x1
    );

  downsample3_dba589aaee: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x47,
      ce_11120000 => ce_11120000_sg_x4,
      ce_22240000 => ce_22240000_sg_x15,
      ce_2500 => ce_2500_sg_x4,
      clk_1 => clk_1_sg_x47,
      clk_11120000 => clk_11120000_sg_x4,
      clk_22240000 => clk_22240000_sg_x15,
      clk_2500 => clk_2500_sg_x4,
      din => register13_q_net_x0,
      dout => down_sample1_q_net_x2
    );

  downsample4_c9912c17cb: entity work.downsample2_entity_891f07b1a7
    port map (
      ce_1 => ce_1_sg_x47,
      ce_11120000 => ce_11120000_sg_x4,
      ce_22240000 => ce_22240000_sg_x15,
      ce_2500 => ce_2500_sg_x4,
      clk_1 => clk_1_sg_x47,
      clk_11120000 => clk_11120000_sg_x4,
      clk_22240000 => clk_22240000_sg_x15,
      clk_2500 => clk_2500_sg_x4,
      din => register12_q_net_x0,
      dout => down_sample1_q_net_x3
    );

  downsample_482880cb12: entity work.downsample_entity_482880cb12
    port map (
      ce_2 => ce_2_sg_x28,
      ce_22240000 => ce_22240000_sg_x15,
      ce_5000 => ce_5000_sg_x1,
      clk_2 => clk_2_sg_x28,
      clk_22240000 => clk_22240000_sg_x15,
      clk_5000 => clk_5000_sg_x1,
      din => del_sig_div_monit_thres_i_net_x1,
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

  fifo_ds_q_6b3a8c7b24: entity work.fifo_ds_q_entity_6b3a8c7b24
    port map (
      ce_1 => ce_1_sg_x47,
      ce_22240000 => ce_22240000_sg_x15,
      clk_1 => clk_1_sg_x47,
      clk_22240000 => clk_22240000_sg_x15,
      from_fifo => empty_x4,
      to_fifo => full_x4,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x5,
      valid_out => dividend_valid_x0
    );

  fifo_ds_sum_d6214fcddf: entity work.fifo_ds_q_entity_6b3a8c7b24
    port map (
      ce_1 => ce_1_sg_x47,
      ce_22240000 => ce_22240000_sg_x15,
      clk_1 => clk_1_sg_x47,
      clk_22240000 => clk_22240000_sg_x15,
      from_fifo => empty_x5,
      to_fifo => full_x5,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x6,
      valid_out => dividend_valid_x1
    );

  fifo_ds_x_3882b5e348: entity work.fifo_ds_q_entity_6b3a8c7b24
    port map (
      ce_1 => ce_1_sg_x47,
      ce_22240000 => ce_22240000_sg_x15,
      clk_1 => clk_1_sg_x47,
      clk_22240000 => clk_22240000_sg_x15,
      from_fifo => empty_x6,
      to_fifo => full_x6,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x7,
      valid_out => dividend_valid_x2
    );

  fifo_ds_y_d1a9a19eff: entity work.fifo_ds_q_entity_6b3a8c7b24
    port map (
      ce_1 => ce_1_sg_x47,
      ce_22240000 => ce_22240000_sg_x15,
      clk_1 => clk_1_sg_x47,
      clk_22240000 => clk_22240000_sg_x15,
      from_fifo => empty_x7,
      to_fifo => full_x7,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x8,
      valid_out => dividend_valid_x3
    );

  q_divider: entity work.xldivider_generator_7b92d2b3a8529d55359a27d09fb2c5d6
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      s_axis_dividend_tdata_dividend => dividend_data_x3,
      s_axis_dividend_tvalid => dividend_valid_x0,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => q_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d => convert_dout_net_x1,
      en(0) => x_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register11_q_net_x0
    );

  register12: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d => convert_dout_net_x2,
      en(0) => q_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register12_q_net_x0
    );

  register13: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d => convert_dout_net_x0,
      en(0) => divider_dout_valid,
      rst => "0",
      q => register13_q_net_x0
    );

  register19: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      d => convert_dout_net,
      en => "1",
      rst => "0",
      q => register19_q_net_x0
    );

  register2: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
      d => delta_y_s_net,
      en => "1",
      rst => "0",
      q => din_x0
    );

  relational: entity work.relational_351cfeabec
    port map (
      a => divisor_data_x0,
      b => down_sample_q_net_x0,
      ce => '0',
      clk => '0',
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
      ce => ce_22240000_sg_x15,
      clk => clk_22240000_sg_x15,
      clr => '0',
      en => "1",
      s => sum_s_net
    );

  unsigned2signed1_6fa9a83fc6: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      s_data => divider_dout_quoc_x0,
      u_data => divider_dout_frac_x0,
      data_out => convert_dout_net_x0
    );

  unsigned2signed2_43a7df0349: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      s_data => x_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => x_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x1
    );

  unsigned2signed3_ef7a66d0da: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x47,
      clk_1 => clk_1_sg_x47,
      s_data => q_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => q_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x2
    );

  x_divider: entity work.xldivider_generator_7b92d2b3a8529d55359a27d09fb2c5d6
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      s_axis_dividend_tdata_dividend => dividend_data_x5,
      s_axis_dividend_tvalid => dividend_valid_x2,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => x_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => x_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_9bc6b5677974555f6235feeceb7f929f
    port map (
      ce => ce_1_sg_x47,
      clk => clk_1_sg_x47,
      s_axis_dividend_tdata_dividend => dividend_data_x6,
      s_axis_dividend_tvalid => dividend_valid_x3,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => divider_dout_frac_x0,
      m_axis_dout_tdata_quotient => divider_dout_quoc_x0,
      m_axis_dout_tvalid => divider_dout_valid,
      s_axis_dividend_tready => dividend_ready,
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
    to_fifo: in std_logic; 
    we_x0: in std_logic; 
    logical_x0: out std_logic; 
    valid_out: out std_logic
  );
end fifo_tbt_q_entity_b4861d81a3;

architecture structural of fifo_tbt_q_entity_b4861d81a3 is
  signal assert_dout_net_x0: std_logic;
  signal ce_1_sg_x48: std_logic;
  signal ce_70_sg_x20: std_logic;
  signal clk_1_sg_x48: std_logic;
  signal clk_70_sg_x20: std_logic;
  signal dividend_valid_x0: std_logic;
  signal empty_x0: std_logic;
  signal full_x0: std_logic;
  signal inverter2_op_net: std_logic;
  signal we_x1: std_logic;

begin
  ce_1_sg_x48 <= ce_1;
  ce_70_sg_x20 <= ce_70;
  clk_1_sg_x48 <= clk_1;
  clk_70_sg_x20 <= clk_70;
  empty_x0 <= from_fifo;
  full_x0 <= to_fifo;
  assert_dout_net_x0 <= we_x0;
  logical_x0 <= we_x1;
  valid_out <= dividend_valid_x0;

  inverter2: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_70_sg_x20,
      clk => clk_70_sg_x20,
      clr => '0',
      ip(0) => full_x0,
      op(0) => inverter2_op_net
    );

  inverter4: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x48,
      clk => clk_1_sg_x48,
      clr => '0',
      ip(0) => empty_x0,
      op(0) => dividend_valid_x0
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
    clk_1: in std_logic; 
    clk_2: in std_logic; 
    clk_70: in std_logic; 
    d: in std_logic_vector(23 downto 0); 
    delta_sigma_thres: in std_logic_vector(25 downto 0); 
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
    assert1_x0: out std_logic; 
    assert2_x0: out std_logic; 
    assert3_x0: out std_logic; 
    assert4_x0: out std_logic; 
    delta_q_d_s_fpga: out std_logic_vector(25 downto 0); 
    delta_x_d_s_fpga: out std_logic_vector(25 downto 0); 
    delta_y_d_s_fpga: out std_logic_vector(25 downto 0); 
    fifo_tbt_q: out std_logic; 
    fifo_tbt_sum: out std_logic; 
    fifo_tbt_x: out std_logic; 
    fifo_tbt_y: out std_logic; 
    q: out std_logic_vector(24 downto 0); 
    sum_d_s_fpga: out std_logic_vector(25 downto 0); 
    sum_x0: out std_logic_vector(24 downto 0); 
    x: out std_logic_vector(24 downto 0); 
    y: out std_logic_vector(24 downto 0)
  );
end delta_sigma_tbt_entity_bbfa8a8a69;

architecture structural of delta_sigma_tbt_entity_bbfa8a8a69 is
  signal a_plus_b_s_net: std_logic_vector(24 downto 0);
  signal a_plus_c_s_net: std_logic_vector(24 downto 0);
  signal a_plus_d_s_net: std_logic_vector(24 downto 0);
  signal assert2_dout_net_x0: std_logic;
  signal assert3_dout_net_x0: std_logic;
  signal assert4_dout_net_x0: std_logic;
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert_dout_net_x3: std_logic;
  signal b_plus_c_s_net: std_logic_vector(24 downto 0);
  signal b_plus_d_s_net: std_logic_vector(24 downto 0);
  signal c_plus_d_s_net: std_logic_vector(24 downto 0);
  signal ce_1_sg_x55: std_logic;
  signal ce_2_sg_x29: std_logic;
  signal ce_70_sg_x24: std_logic;
  signal clk_1_sg_x55: std_logic;
  signal clk_2_sg_x29: std_logic;
  signal clk_70_sg_x24: std_logic;
  signal convert_dout_net: std_logic_vector(24 downto 0);
  signal convert_dout_net_x0: std_logic_vector(24 downto 0);
  signal convert_dout_net_x1: std_logic_vector(24 downto 0);
  signal convert_dout_net_x2: std_logic_vector(24 downto 0);
  signal del_sig_div_tbt_thres_i_net_x0: std_logic_vector(25 downto 0);
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
  signal dividend_valid_x0: std_logic;
  signal dividend_valid_x1: std_logic;
  signal dividend_valid_x2: std_logic;
  signal dividend_valid_x3: std_logic;
  signal divider_dout_frac_x0: std_logic_vector(23 downto 0);
  signal divider_dout_quoc_x0: std_logic_vector(25 downto 0);
  signal divider_dout_valid: std_logic;
  signal divisor_data_x0: std_logic_vector(25 downto 0);
  signal divisor_ready: std_logic;
  signal down_sample1_q_net: std_logic_vector(24 downto 0);
  signal down_sample1_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample2_q_net: std_logic_vector(24 downto 0);
  signal down_sample2_q_net_x20: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x21: std_logic_vector(23 downto 0);
  signal down_sample3_q_net: std_logic_vector(24 downto 0);
  signal down_sample4_q_net: std_logic_vector(24 downto 0);
  signal down_sample_q_net: std_logic_vector(25 downto 0);
  signal empty_x4: std_logic;
  signal empty_x5: std_logic;
  signal empty_x6: std_logic;
  signal empty_x7: std_logic;
  signal expression1_dout_net: std_logic;
  signal full_x4: std_logic;
  signal full_x5: std_logic;
  signal full_x6: std_logic;
  signal full_x7: std_logic;
  signal q_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(23 downto 0);
  signal q_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(25 downto 0);
  signal q_divider_m_axis_dout_tvalid_net: std_logic;
  signal q_divider_s_axis_dividend_tready_net: std_logic;
  signal q_divider_s_axis_divisor_tready_net: std_logic;
  signal re_x0: std_logic;
  signal register10_q_net_x0: std_logic_vector(25 downto 0);
  signal register11_q_net: std_logic_vector(24 downto 0);
  signal register12_q_net: std_logic_vector(24 downto 0);
  signal register13_q_net: std_logic_vector(24 downto 0);
  signal register19_q_net: std_logic_vector(24 downto 0);
  signal register1_q_net: std_logic_vector(24 downto 0);
  signal register2_q_net: std_logic_vector(24 downto 0);
  signal register3_q_net: std_logic_vector(24 downto 0);
  signal register4_q_net: std_logic_vector(24 downto 0);
  signal register5_q_net: std_logic_vector(24 downto 0);
  signal register6_q_net: std_logic_vector(24 downto 0);
  signal register7_q_net_x0: std_logic_vector(25 downto 0);
  signal relational_op_net: std_logic;
  signal sum_s_net: std_logic_vector(25 downto 0);
  signal we_x5: std_logic;
  signal we_x6: std_logic;
  signal we_x7: std_logic;
  signal we_x8: std_logic;
  signal x_divider_m_axis_dout_tdata_fractional_net_x0: std_logic_vector(23 downto 0);
  signal x_divider_m_axis_dout_tdata_quotient_net_x0: std_logic_vector(25 downto 0);
  signal x_divider_m_axis_dout_tvalid_net: std_logic;
  signal x_divider_s_axis_dividend_tready_net: std_logic;
  signal x_divider_s_axis_divisor_tready_net: std_logic;

begin
  down_sample2_q_net_x20 <= a;
  down_sample1_q_net_x20 <= b;
  down_sample2_q_net_x21 <= c;
  ce_1_sg_x55 <= ce_1;
  ce_2_sg_x29 <= ce_2;
  ce_70_sg_x24 <= ce_70;
  clk_1_sg_x55 <= clk_1;
  clk_2_sg_x29 <= clk_2;
  clk_70_sg_x24 <= clk_70;
  down_sample1_q_net_x21 <= d;
  del_sig_div_tbt_thres_i_net_x0 <= delta_sigma_thres;
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
  assert1_x0 <= re_x0;
  assert2_x0 <= assert2_dout_net_x0;
  assert3_x0 <= assert3_dout_net_x0;
  assert4_x0 <= assert4_dout_net_x0;
  delta_q_d_s_fpga <= register10_q_net_x0;
  delta_x_d_s_fpga <= register7_q_net_x0;
  delta_y_d_s_fpga <= din_x0;
  fifo_tbt_q <= we_x5;
  fifo_tbt_sum <= we_x6;
  fifo_tbt_x <= we_x7;
  fifo_tbt_y <= we_x8;
  q <= assert8_dout_net_x1;
  sum_d_s_fpga <= divisor_data_x0;
  sum_x0 <= assert6_dout_net_x1;
  x <= assert5_dout_net_x1;
  y <= assert7_dout_net_x1;

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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      din(0) => dividend_ready,
      dout(0) => re_x0
    );

  assert2: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => expression1_dout_net,
      dout(0) => assert2_dout_net_x0
    );

  assert3: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => x_divider_s_axis_dividend_tready_net,
      dout(0) => assert3_dout_net_x0
    );

  assert4: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => q_divider_s_axis_dividend_tready_net,
      dout(0) => assert4_dout_net_x0
    );

  assert5: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample2_q_net,
      dout => assert5_dout_net_x1
    );

  assert6: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample3_q_net,
      dout => assert6_dout_net_x1
    );

  assert7: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample1_q_net,
      dout => assert7_dout_net_x1
    );

  assert8: entity work.xlpassthrough
    generic map (
      din_width => 25,
      dout_width => 25
    )
    port map (
      din => down_sample4_q_net,
      dout => assert8_dout_net_x1
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
      clr => '0',
      en => "1",
      s => c_plus_d_s_net
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
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      clr => '0',
      din => delay_q_net,
      en => "1",
      dout => convert_dout_net
    );

  delay: entity work.xldelay
    generic map (
      latency => 25,
      reg_retiming => 0,
      reset => 0,
      width => 26
    )
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      d => dividend_data_x4,
      en => '1',
      rst => '1',
      q => delay_q_net
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      d => del_sig_div_tbt_thres_i_net_x0,
      dest_ce => ce_70_sg_x24,
      dest_clk => clk_70_sg_x24,
      dest_clr => '0',
      en => "1",
      src_ce => ce_2_sg_x29,
      src_clk => clk_2_sg_x29,
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
      d => register13_q_net,
      dest_ce => ce_70_sg_x24,
      dest_clk => clk_70_sg_x24,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x55,
      src_clk => clk_1_sg_x55,
      src_clr => '0',
      q => down_sample1_q_net
    );

  down_sample2: entity work.xldsamp
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
      dest_ce => ce_70_sg_x24,
      dest_clk => clk_70_sg_x24,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x55,
      src_clk => clk_1_sg_x55,
      src_clr => '0',
      q => down_sample2_q_net
    );

  down_sample3: entity work.xldsamp
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
      d => register19_q_net,
      dest_ce => ce_70_sg_x24,
      dest_clk => clk_70_sg_x24,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x55,
      src_clk => clk_1_sg_x55,
      src_clr => '0',
      q => down_sample3_q_net
    );

  down_sample4: entity work.xldsamp
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
      dest_ce => ce_70_sg_x24,
      dest_clk => clk_70_sg_x24,
      dest_clr => '0',
      en => "1",
      src_ce => ce_1_sg_x55,
      src_clk => clk_1_sg_x55,
      src_clr => '0',
      q => down_sample4_q_net
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
      ce_1 => ce_1_sg_x55,
      ce_70 => ce_70_sg_x24,
      clk_1 => clk_1_sg_x55,
      clk_70 => clk_70_sg_x24,
      from_fifo => empty_x4,
      to_fifo => full_x4,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x5,
      valid_out => dividend_valid_x0
    );

  fifo_tbt_sum_707d0cbec6: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x55,
      ce_70 => ce_70_sg_x24,
      clk_1 => clk_1_sg_x55,
      clk_70 => clk_70_sg_x24,
      from_fifo => empty_x5,
      to_fifo => full_x5,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x6,
      valid_out => dividend_valid_x1
    );

  fifo_tbt_x_99d20d0ab9: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x55,
      ce_70 => ce_70_sg_x24,
      clk_1 => clk_1_sg_x55,
      clk_70 => clk_70_sg_x24,
      from_fifo => empty_x6,
      to_fifo => full_x6,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x7,
      valid_out => dividend_valid_x2
    );

  fifo_tbt_y_9ee91ec9a1: entity work.fifo_tbt_q_entity_b4861d81a3
    port map (
      ce_1 => ce_1_sg_x55,
      ce_70 => ce_70_sg_x24,
      clk_1 => clk_1_sg_x55,
      clk_70 => clk_70_sg_x24,
      from_fifo => empty_x7,
      to_fifo => full_x7,
      we_x0 => assert_dout_net_x3,
      logical_x0 => we_x8,
      valid_out => dividend_valid_x3
    );

  q_divider: entity work.xldivider_generator_7b92d2b3a8529d55359a27d09fb2c5d6
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      s_axis_dividend_tdata_dividend => dividend_data_x3,
      s_axis_dividend_tvalid => dividend_valid_x0,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => q_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => q_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => q_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => q_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => q_divider_s_axis_divisor_tready_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      d => convert_dout_net_x1,
      en(0) => x_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register11_q_net
    );

  register12: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      d => convert_dout_net_x2,
      en(0) => q_divider_m_axis_dout_tvalid_net,
      rst => "0",
      q => register12_q_net
    );

  register13: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      d => convert_dout_net_x0,
      en(0) => divider_dout_valid,
      rst => "0",
      q => register13_q_net
    );

  register19: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      d => convert_dout_net,
      en => "1",
      rst => "0",
      q => register19_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 25,
      init_value => b"0000000000000000000000000"
    )
    port map (
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
      d => delta_y_s_net,
      en => "1",
      rst => "0",
      q => din_x0
    );

  relational: entity work.relational_351cfeabec
    port map (
      a => divisor_data_x0,
      b => down_sample_q_net,
      ce => '0',
      clk => '0',
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
      ce => ce_70_sg_x24,
      clk => clk_70_sg_x24,
      clr => '0',
      en => "1",
      s => sum_s_net
    );

  unsigned2signed1_0c64554e20: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x55,
      clk_1 => clk_1_sg_x55,
      s_data => divider_dout_quoc_x0,
      u_data => divider_dout_frac_x0,
      data_out => convert_dout_net_x0
    );

  unsigned2signed2_b5112b4796: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x55,
      clk_1 => clk_1_sg_x55,
      s_data => x_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => x_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x1
    );

  unsigned2signed3_3e8ecc04fc: entity work.unsigned2signed1_entity_4871dec4a6
    port map (
      ce_1 => ce_1_sg_x55,
      clk_1 => clk_1_sg_x55,
      s_data => q_divider_m_axis_dout_tdata_quotient_net_x0,
      u_data => q_divider_m_axis_dout_tdata_fractional_net_x0,
      data_out => convert_dout_net_x2
    );

  x_divider: entity work.xldivider_generator_7b92d2b3a8529d55359a27d09fb2c5d6
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      s_axis_dividend_tdata_dividend => dividend_data_x5,
      s_axis_dividend_tvalid => dividend_valid_x2,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => x_divider_m_axis_dout_tdata_fractional_net_x0,
      m_axis_dout_tdata_quotient => x_divider_m_axis_dout_tdata_quotient_net_x0,
      m_axis_dout_tvalid => x_divider_m_axis_dout_tvalid_net,
      s_axis_dividend_tready => x_divider_s_axis_dividend_tready_net,
      s_axis_divisor_tready => x_divider_s_axis_divisor_tready_net
    );

  y_divider: entity work.xldivider_generator_9bc6b5677974555f6235feeceb7f929f
    port map (
      ce => ce_1_sg_x55,
      clk => clk_1_sg_x55,
      s_axis_dividend_tdata_dividend => dividend_data_x6,
      s_axis_dividend_tvalid => dividend_valid_x3,
      s_axis_divisor_tdata_divisor => dividend_data_x4,
      s_axis_divisor_tvalid => dividend_valid_x1,
      m_axis_dout_tdata_fractional => divider_dout_frac_x0,
      m_axis_dout_tdata_quotient => divider_dout_quoc_x0,
      m_axis_dout_tvalid => divider_dout_valid,
      s_axis_dividend_tready => dividend_ready,
      s_axis_divisor_tready => divisor_ready
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
    ce_11120000: in std_logic; 
    ce_1390000: in std_logic; 
    ce_2: in std_logic; 
    ce_2224: in std_logic; 
    ce_22240000: in std_logic; 
    ce_2500: in std_logic; 
    ce_2780000: in std_logic; 
    ce_35: in std_logic; 
    ce_5000: in std_logic; 
    ce_556: in std_logic; 
    ce_5560000: in std_logic; 
    ce_70: in std_logic; 
    ce_logic_1: in std_logic; 
    ce_logic_1390000: in std_logic; 
    ce_logic_2: in std_logic; 
    ce_logic_2780000: in std_logic; 
    ce_logic_556: in std_logic; 
    clk_1: in std_logic; 
    clk_1112: in std_logic; 
    clk_11120000: in std_logic; 
    clk_1390000: in std_logic; 
    clk_2: in std_logic; 
    clk_2224: in std_logic; 
    clk_22240000: in std_logic; 
    clk_2500: in std_logic; 
    clk_2780000: in std_logic; 
    clk_35: in std_logic; 
    clk_5000: in std_logic; 
    clk_556: in std_logic; 
    clk_5560000: in std_logic; 
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
    re: out std_logic; 
    re_x0: out std_logic; 
    re_x1: out std_logic; 
    re_x10: out std_logic; 
    re_x11: out std_logic; 
    re_x12: out std_logic; 
    re_x13: out std_logic; 
    re_x2: out std_logic; 
    re_x6: out std_logic; 
    re_x7: out std_logic; 
    re_x8: out std_logic; 
    re_x9: out std_logic; 
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
    x_monit_o: out std_logic_vector(25 downto 0); 
    x_tbt_o: out std_logic_vector(25 downto 0); 
    y_fofb_o: out std_logic_vector(25 downto 0); 
    y_monit_o: out std_logic_vector(25 downto 0); 
    y_tbt_o: out std_logic_vector(25 downto 0)
  );
end ddc_bpm_476_066;

architecture structural of ddc_bpm_476_066 is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "ddc_bpm_476_066,sysgen_core,{clock_period=4.44116092,clocking=Clock_Enables,compilation=HDL_Netlist,sample_periods=1.00000000000 2.00000000000 35.00000000000 70.00000000000 556.00000000000 1112.00000000000 2224.00000000000 2500.00000000000 5000.00000000000 1390000.00000000000 2780000.00000000000 5560000.00000000000 11120000.00000000000 22240000.00000000000,testbench=0,total_blocks=2310,xilinx_adder_subtracter_block=30,xilinx_arithmetic_relational_operator_block=54,xilinx_assert_block=27,xilinx_bit_slice_extractor_block=20,xilinx_bitwise_expression_evaluator_block=5,xilinx_bus_concatenator_block=9,xilinx_bus_multiplexer_block=3,xilinx_cic_compiler_3_0_block=5,xilinx_complex_multiplier_5_0__block=2,xilinx_constant_block_block=59,xilinx_cordic_5_0_block=4,xilinx_counter_block=3,xilinx_dds_compiler_5_0_block=1,xilinx_delay_block=45,xilinx_divider_generator_4_0_block=9,xilinx_down_sampler_block=72,xilinx_fir_compiler_6_3_block=5,xilinx_gateway_in_block=10,xilinx_gateway_out_block=160,xilinx_inverter_block=24,xilinx_logical_block_block=12,xilinx_multiplier_block=12,xilinx_register_block=138,xilinx_sample_time_block_block=75,xilinx_shared_memory_based_from_fifo_block=12,xilinx_shared_memory_based_to_fifo_block=12,xilinx_system_generator_block=1,xilinx_type_converter_block=19,xilinx_type_reinterpreter_block=74,xilinx_up_sampler_block=8,xilinx_wavescope_block=1,}";

  signal adc_ch0_i_net_x1: std_logic_vector(15 downto 0);
  signal adc_ch1_i_net_x1: std_logic_vector(15 downto 0);
  signal adc_ch2_i_net_x1: std_logic_vector(15 downto 0);
  signal adc_ch3_i_net_x1: std_logic_vector(15 downto 0);
  signal assert5_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert5_dout_net_x3: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert6_dout_net_x3: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert7_dout_net_x3: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x1: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x2: std_logic_vector(24 downto 0);
  signal assert8_dout_net_x3: std_logic_vector(24 downto 0);
  signal bpf_ch0_o_net: std_logic_vector(23 downto 0);
  signal bpf_ch1_o_net: std_logic_vector(23 downto 0);
  signal bpf_ch2_o_net: std_logic_vector(23 downto 0);
  signal bpf_ch3_o_net: std_logic_vector(23 downto 0);
  signal ce_11120000_sg_x5: std_logic;
  signal ce_1112_sg_x22: std_logic;
  signal ce_1390000_sg_x3: std_logic;
  signal ce_1_sg_x56: std_logic;
  signal ce_22240000_sg_x16: std_logic;
  signal ce_2224_sg_x26: std_logic;
  signal ce_2500_sg_x5: std_logic;
  signal ce_2780000_sg_x4: std_logic;
  signal ce_2_sg_x30: std_logic;
  signal ce_35_sg_x20: std_logic;
  signal ce_5000_sg_x2: std_logic;
  signal ce_5560000_sg_x8: std_logic;
  signal ce_556_sg_x3: std_logic;
  signal ce_70_sg_x25: std_logic;
  signal ce_logic_1390000_sg_x2: std_logic;
  signal ce_logic_1_sg_x12: std_logic;
  signal ce_logic_2780000_sg_x2: std_logic;
  signal ce_logic_2_sg_x1: std_logic;
  signal ce_logic_556_sg_x2: std_logic;
  signal clk_11120000_sg_x5: std_logic;
  signal clk_1112_sg_x22: std_logic;
  signal clk_1390000_sg_x3: std_logic;
  signal clk_1_sg_x56: std_logic;
  signal clk_22240000_sg_x16: std_logic;
  signal clk_2224_sg_x26: std_logic;
  signal clk_2500_sg_x5: std_logic;
  signal clk_2780000_sg_x4: std_logic;
  signal clk_2_sg_x30: std_logic;
  signal clk_35_sg_x20: std_logic;
  signal clk_5000_sg_x2: std_logic;
  signal clk_5560000_sg_x8: std_logic;
  signal clk_556_sg_x3: std_logic;
  signal clk_70_sg_x25: std_logic;
  signal constant10_op_net_x0: std_logic;
  signal constant3_op_net: std_logic;
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
  signal dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tdata_sine_net_x2: std_logic_vector(23 downto 0);
  signal dds_compiler_5_0_m_axis_data_tvalid_net_x2: std_logic;
  signal del_sig_div_fofb_thres_i_net: std_logic_vector(25 downto 0);
  signal del_sig_div_monit_thres_i_net: std_logic_vector(25 downto 0);
  signal del_sig_div_tbt_thres_i_net: std_logic_vector(25 downto 0);
  signal delay4_q_net_x15: std_logic;
  signal delay4_q_net_x16: std_logic;
  signal delay6_q_net_x14: std_logic_vector(23 downto 0);
  signal delay6_q_net_x15: std_logic_vector(23 downto 0);
  signal delay7_q_net_x14: std_logic_vector(23 downto 0);
  signal delay7_q_net_x15: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x26: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x27: std_logic_vector(23 downto 0);
  signal down_sample1_q_net_x5: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x16: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x17: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x26: std_logic_vector(23 downto 0);
  signal down_sample2_q_net_x27: std_logic_vector(23 downto 0);
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
  signal ksum_net: std_logic_vector(24 downto 0);
  signal kx_net: std_logic_vector(24 downto 0);
  signal ky_net: std_logic_vector(24 downto 0);
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
  signal q_fofb_o_net: std_logic_vector(25 downto 0);
  signal q_monit_o_net: std_logic_vector(25 downto 0);
  signal q_tbt_o_net: std_logic_vector(25 downto 0);
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
  signal register1_q_net_x3: std_logic_vector(1 downto 0);
  signal register1_q_net_x6: std_logic;
  signal register1_q_net_x7: std_logic;
  signal register_q_net_x10: std_logic_vector(23 downto 0);
  signal register_q_net_x8: std_logic_vector(23 downto 0);
  signal register_q_net_x9: std_logic_vector(23 downto 0);
  signal sum_fofb_o_net: std_logic_vector(25 downto 0);
  signal sum_monit_o_net: std_logic_vector(25 downto 0);
  signal sum_tbt_o_net: std_logic_vector(25 downto 0);
  signal tbt_amp_ch0_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch1_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch2_o_net: std_logic_vector(23 downto 0);
  signal tbt_amp_ch3_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch0_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch0_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch1_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch1_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch2_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch2_q_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch3_i_o_net: std_logic_vector(23 downto 0);
  signal tbt_decim_ch3_q_o_net: std_logic_vector(23 downto 0);
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
  signal x_monit_o_net: std_logic_vector(25 downto 0);
  signal x_tbt_o_net: std_logic_vector(25 downto 0);
  signal y_fofb_o_net: std_logic_vector(25 downto 0);
  signal y_monit_o_net: std_logic_vector(25 downto 0);
  signal y_tbt_o_net: std_logic_vector(25 downto 0);

begin
  adc_ch0_i_net_x1 <= adc_ch0_i;
  adc_ch1_i_net_x1 <= adc_ch1_i;
  adc_ch2_i_net_x1 <= adc_ch2_i;
  adc_ch3_i_net_x1 <= adc_ch3_i;
  ce_1_sg_x56 <= ce_1;
  ce_1112_sg_x22 <= ce_1112;
  ce_11120000_sg_x5 <= ce_11120000;
  ce_1390000_sg_x3 <= ce_1390000;
  ce_2_sg_x30 <= ce_2;
  ce_2224_sg_x26 <= ce_2224;
  ce_22240000_sg_x16 <= ce_22240000;
  ce_2500_sg_x5 <= ce_2500;
  ce_2780000_sg_x4 <= ce_2780000;
  ce_35_sg_x20 <= ce_35;
  ce_5000_sg_x2 <= ce_5000;
  ce_556_sg_x3 <= ce_556;
  ce_5560000_sg_x8 <= ce_5560000;
  ce_70_sg_x25 <= ce_70;
  ce_logic_1_sg_x12 <= ce_logic_1;
  ce_logic_1390000_sg_x2 <= ce_logic_1390000;
  ce_logic_2_sg_x1 <= ce_logic_2;
  ce_logic_2780000_sg_x2 <= ce_logic_2780000;
  ce_logic_556_sg_x2 <= ce_logic_556;
  clk_1_sg_x56 <= clk_1;
  clk_1112_sg_x22 <= clk_1112;
  clk_11120000_sg_x5 <= clk_11120000;
  clk_1390000_sg_x3 <= clk_1390000;
  clk_2_sg_x30 <= clk_2;
  clk_2224_sg_x26 <= clk_2224;
  clk_22240000_sg_x16 <= clk_22240000;
  clk_2500_sg_x5 <= clk_2500;
  clk_2780000_sg_x4 <= clk_2780000;
  clk_35_sg_x20 <= clk_35;
  clk_5000_sg_x2 <= clk_5000;
  clk_556_sg_x3 <= clk_556;
  clk_5560000_sg_x8 <= clk_5560000;
  clk_70_sg_x25 <= clk_70;
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
  ksum_net <= ksum;
  kx_net <= kx;
  ky_net <= ky;
  adc_ch0_dbg_data_o <= adc_ch0_i_net_x1;
  adc_ch1_dbg_data_o <= adc_ch1_i_net_x1;
  adc_ch2_dbg_data_o <= adc_ch2_i_net_x1;
  adc_ch3_dbg_data_o <= adc_ch3_i_net_x1;
  bpf_ch0_o <= bpf_ch0_o_net;
  bpf_ch1_o <= bpf_ch1_o_net;
  bpf_ch2_o <= bpf_ch2_o_net;
  bpf_ch3_o <= bpf_ch3_o_net;
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
  q_fofb_o <= q_fofb_o_net;
  q_monit_o <= q_monit_o_net;
  q_tbt_o <= q_tbt_o_net;
  re <= re_net;
  re_x0 <= re_x0_net;
  re_x1 <= re_x1_net;
  re_x10 <= re_x10_net;
  re_x11 <= re_x8_net;
  re_x12 <= re_x9_net;
  re_x13 <= re_x7_net;
  re_x2 <= re_x2_net;
  re_x6 <= re_x6_net;
  re_x7 <= re_x4_net;
  re_x8 <= re_x5_net;
  re_x9 <= re_x3_net;
  sum_fofb_o <= sum_fofb_o_net;
  sum_monit_o <= sum_monit_o_net;
  sum_tbt_o <= sum_tbt_o_net;
  tbt_amp_ch0_o <= tbt_amp_ch0_o_net;
  tbt_amp_ch1_o <= tbt_amp_ch1_o_net;
  tbt_amp_ch2_o <= tbt_amp_ch2_o_net;
  tbt_amp_ch3_o <= tbt_amp_ch3_o_net;
  tbt_decim_ch0_i_o <= tbt_decim_ch0_i_o_net;
  tbt_decim_ch0_q_o <= tbt_decim_ch0_q_o_net;
  tbt_decim_ch1_i_o <= tbt_decim_ch1_i_o_net;
  tbt_decim_ch1_q_o <= tbt_decim_ch1_q_o_net;
  tbt_decim_ch2_i_o <= tbt_decim_ch2_i_o_net;
  tbt_decim_ch2_q_o <= tbt_decim_ch2_q_o_net;
  tbt_decim_ch3_i_o <= tbt_decim_ch3_i_o_net;
  tbt_decim_ch3_q_o <= tbt_decim_ch3_q_o_net;
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
  x_monit_o <= x_monit_o_net;
  x_tbt_o <= x_tbt_o_net;
  y_fofb_o <= y_fofb_o_net;
  y_monit_o <= y_monit_o_net;
  y_tbt_o <= y_tbt_o_net;

  bpf_d31c4af409: entity work.bpf_entity_d31c4af409
    port map (
      ce_1 => ce_1_sg_x56,
      ce_2 => ce_2_sg_x30,
      ce_logic_2 => ce_logic_2_sg_x1,
      clk_1 => clk_1_sg_x56,
      clk_2 => clk_2_sg_x30,
      din_ch0 => adc_ch0_i_net_x1,
      din_ch1 => adc_ch1_i_net_x1,
      din_ch2 => adc_ch2_i_net_x1,
      din_ch3 => adc_ch3_i_net_x1,
      dout_ch0 => bpf_ch0_o_net,
      dout_ch1 => bpf_ch1_o_net,
      dout_ch2 => bpf_ch2_o_net,
      dout_ch3 => bpf_ch3_o_net
    );

  constant10: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant10_op_net_x0
    );

  constant3: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant3_op_net
    );

  dds_compiler_5_0: entity work.xldds_compiler_ab6bf36aaf63155698be9359a11e3f1c
    port map (
      ce => ce_2_sg_x30,
      clk => clk_2_sg_x30,
      m_axis_data_tready => constant3_op_net,
      m_axis_data_tdata_cosine => dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2,
      m_axis_data_tdata_sine => dds_compiler_5_0_m_axis_data_tdata_sine_net_x2,
      m_axis_data_tvalid => dds_compiler_5_0_m_axis_data_tvalid_net_x2
    );

  delta_sigma_fofb_ee61e649ea: entity work.delta_sigma_fofb_entity_ee61e649ea
    port map (
      a => down_sample2_q_net_x16,
      b => down_sample1_q_net_x16,
      c => down_sample2_q_net_x17,
      ce_1 => ce_1_sg_x56,
      ce_2 => ce_2_sg_x30,
      ce_2224 => ce_2224_sg_x26,
      clk_1 => clk_1_sg_x56,
      clk_2 => clk_2_sg_x30,
      clk_2224 => clk_2224_sg_x26,
      d => down_sample1_q_net_x17,
      delta_sigma_thres => del_sig_div_fofb_thres_i_net,
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
      assert1_x0 => re_x2_net,
      assert2_x0 => re_x0_net,
      assert3_x0 => re_x1_net,
      assert4_x0 => re_net,
      fifo_ds_q => we_net,
      fifo_ds_sum => we_x0_net,
      fifo_ds_x => we_x1_net,
      fifo_ds_y => we_x2_net,
      q => assert8_dout_net_x1,
      register10_x0 => data_in_net,
      register7_x0 => data_in_x1_net,
      register9_x0 => data_in_x2_net,
      sum_d_s_fpga => data_in_x0_net,
      sum_x0 => assert6_dout_net_x1,
      x => assert5_dout_net_x1,
      y => assert7_dout_net_x1
    );

  delta_sigma_monit_a8f8b81626: entity work.delta_sigma_monit_entity_a8f8b81626
    port map (
      a => down_sample2_q_net_x5,
      b => down_sample1_q_net_x5,
      c => down_sample3_q_net_x5,
      ce_1 => ce_1_sg_x56,
      ce_11120000 => ce_11120000_sg_x5,
      ce_2 => ce_2_sg_x30,
      ce_22240000 => ce_22240000_sg_x16,
      ce_2500 => ce_2500_sg_x5,
      ce_5000 => ce_5000_sg_x2,
      clk_1 => clk_1_sg_x56,
      clk_11120000 => clk_11120000_sg_x5,
      clk_2 => clk_2_sg_x30,
      clk_22240000 => clk_22240000_sg_x16,
      clk_2500 => clk_2500_sg_x5,
      clk_5000 => clk_5000_sg_x2,
      d => down_sample4_q_net_x5,
      delta_sigma_thres => del_sig_div_monit_thres_i_net,
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
      assert1_x0 => re_x6_net,
      assert2_x0 => re_x4_net,
      assert3_x0 => re_x5_net,
      assert4_x0 => re_x3_net,
      fifo_ds_q => we_x3_net,
      fifo_ds_sum => we_x4_net,
      fifo_ds_x => we_x5_net,
      fifo_ds_y => we_x6_net,
      q => assert6_dout_net_x2,
      register10_x0 => data_in_x3_net,
      register7_x0 => data_in_x5_net,
      register9_x0 => data_in_x6_net,
      sum_d_s_fpga => data_in_x4_net,
      sum_x0 => assert8_dout_net_x2,
      x => assert7_dout_net_x2,
      y => assert5_dout_net_x2
    );

  delta_sigma_tbt_bbfa8a8a69: entity work.delta_sigma_tbt_entity_bbfa8a8a69
    port map (
      a => down_sample2_q_net_x26,
      b => down_sample1_q_net_x26,
      c => down_sample2_q_net_x27,
      ce_1 => ce_1_sg_x56,
      ce_2 => ce_2_sg_x30,
      ce_70 => ce_70_sg_x25,
      clk_1 => clk_1_sg_x56,
      clk_2 => clk_2_sg_x30,
      clk_70 => clk_70_sg_x25,
      d => down_sample1_q_net_x27,
      delta_sigma_thres => del_sig_div_tbt_thres_i_net,
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
      assert1_x0 => re_x10_net,
      assert2_x0 => re_x8_net,
      assert3_x0 => re_x9_net,
      assert4_x0 => re_x7_net,
      delta_q_d_s_fpga => data_in_x7_net,
      delta_x_d_s_fpga => data_in_x9_net,
      delta_y_d_s_fpga => data_in_x10_net,
      fifo_tbt_q => we_x7_net,
      fifo_tbt_sum => we_x8_net,
      fifo_tbt_x => we_x9_net,
      fifo_tbt_y => we_x10_net,
      q => assert8_dout_net_x3,
      sum_d_s_fpga => data_in_x8_net,
      sum_x0 => assert6_dout_net_x3,
      x => assert5_dout_net_x3,
      y => assert7_dout_net_x3
    );

  fofb_amp_8b25d4b0b6: entity work.fofb_amp_entity_8b25d4b0b6
    port map (
      ce_1 => ce_1_sg_x56,
      ce_1112 => ce_1112_sg_x22,
      ce_2224 => ce_2224_sg_x26,
      ce_logic_1 => ce_logic_1_sg_x12,
      ch_in0 => delay4_q_net_x15,
      ch_in1 => delay4_q_net_x16,
      clk_1 => clk_1_sg_x56,
      clk_1112 => clk_1112_sg_x22,
      clk_2224 => clk_2224_sg_x26,
      i_in0 => delay7_q_net_x14,
      i_in1 => delay7_q_net_x15,
      q_in0 => delay6_q_net_x14,
      q_in1 => delay6_q_net_x15,
      amp_out0 => down_sample2_q_net_x16,
      amp_out1 => down_sample1_q_net_x16,
      amp_out2 => down_sample2_q_net_x17,
      amp_out3 => down_sample1_q_net_x17,
      fofb_amp0 => fofb_amp_ch1_o_net,
      fofb_amp0_x0 => fofb_amp_ch0_o_net,
      fofb_amp0_x1 => fofb_decim_ch1_i_o_net,
      fofb_amp0_x2 => fofb_decim_ch0_i_o_net,
      fofb_amp0_x3 => fofb_decim_ch1_q_o_net,
      fofb_amp0_x4 => fofb_decim_ch0_q_o_net,
      fofb_amp1 => fofb_amp_ch3_o_net,
      fofb_amp1_x0 => fofb_amp_ch2_o_net,
      fofb_amp1_x1 => fofb_decim_ch3_i_o_net,
      fofb_amp1_x2 => fofb_decim_ch2_i_o_net,
      fofb_amp1_x3 => fofb_decim_ch3_q_o_net,
      fofb_amp1_x4 => fofb_decim_ch2_q_o_net
    );

  ksum_fofb_mult_6af626cc30: entity work.ksum_fofb_mult_entity_6af626cc30
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert6_dout_net_x1,
      in2 => ksum_net,
      out1 => sum_fofb_o_net
    );

  ksum_tbt_mult2_1f8fe73dba: entity work.ksum_fofb_mult_entity_6af626cc30
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert8_dout_net_x2,
      in2 => ksum_net,
      out1 => sum_monit_o_net
    );

  ksum_tbt_mult3_e0be30d675: entity work.ksum_fofb_mult_entity_6af626cc30
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert6_dout_net_x3,
      in2 => ksum_net,
      out1 => sum_tbt_o_net
    );

  kx_fofb_mult_da06e4eb4a: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert5_dout_net_x1,
      in2 => kx_net,
      out1 => x_fofb_o_net
    );

  kx_monit_mult_a36a48a235: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert7_dout_net_x2,
      in2 => kx_net,
      out1 => x_monit_o_net
    );

  kx_q_fofb_mult1_3c19a6b977: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert5_dout_net_x2,
      in2 => ky_net,
      out1 => y_monit_o_net
    );

  kx_q_fofb_mult_ace9a3983f: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert8_dout_net_x1,
      in2 => kx_net,
      out1 => q_fofb_o_net
    );

  kx_q_monit_mult_a6894bd18a: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert6_dout_net_x2,
      in2 => kx_net,
      out1 => q_monit_o_net
    );

  kx_q_tbt_mult_f1c06c2384: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert8_dout_net_x3,
      in2 => kx_net,
      out1 => q_tbt_o_net
    );

  kx_tbt_mult_44b47bc5e9: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert5_dout_net_x3,
      in2 => kx_net,
      out1 => x_tbt_o_net
    );

  ky_tbt_mult1_ac05dc5f10: entity work.kx_fofb_mult_entity_da06e4eb4a
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert7_dout_net_x1,
      in2 => ky_net,
      out1 => y_fofb_o_net
    );

  ky_tbt_mult_ab5fc2072b: entity work.ky_tbt_mult_entity_ab5fc2072b
    port map (
      ce_2 => ce_2_sg_x30,
      clk_2 => clk_2_sg_x30,
      in1 => assert7_dout_net_x3,
      in2 => ky_net,
      out1 => y_tbt_o_net
    );

  mixer_a1cd828545: entity work.mixer_entity_a1cd828545
    port map (
      ce_1 => ce_1_sg_x56,
      ce_2 => ce_2_sg_x30,
      ch_in0 => register1_q_net_x6,
      ch_in1 => register1_q_net_x7,
      clk_1 => clk_1_sg_x56,
      clk_2 => clk_2_sg_x30,
      dds_cosine => dds_compiler_5_0_m_axis_data_tdata_cosine_net_x2,
      dds_msine => dds_compiler_5_0_m_axis_data_tdata_sine_net_x2,
      dds_valid => dds_compiler_5_0_m_axis_data_tvalid_net_x2,
      din0 => register_q_net_x8,
      din1 => register_q_net_x10,
      ch_out0 => delay4_q_net_x15,
      ch_out1 => delay4_q_net_x16,
      i_out0 => delay7_q_net_x14,
      i_out1 => delay7_q_net_x15,
      q_out0 => delay6_q_net_x14,
      q_out1 => delay6_q_net_x15,
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
      ce_1 => ce_1_sg_x56,
      ce_1390000 => ce_1390000_sg_x3,
      ce_22240000 => ce_22240000_sg_x16,
      ce_2780000 => ce_2780000_sg_x4,
      ce_556 => ce_556_sg_x3,
      ce_5560000 => ce_5560000_sg_x8,
      ce_logic_1390000 => ce_logic_1390000_sg_x2,
      ce_logic_2780000 => ce_logic_2780000_sg_x2,
      ce_logic_556 => ce_logic_556_sg_x2,
      ch_in => register1_q_net_x3,
      clk_1 => clk_1_sg_x56,
      clk_1390000 => clk_1390000_sg_x3,
      clk_22240000 => clk_22240000_sg_x16,
      clk_2780000 => clk_2780000_sg_x4,
      clk_556 => clk_556_sg_x3,
      clk_5560000 => clk_5560000_sg_x8,
      din => register_q_net_x9,
      amp_out0 => down_sample2_q_net_x5,
      amp_out1 => down_sample1_q_net_x5,
      amp_out2 => down_sample3_q_net_x5,
      amp_out3 => down_sample4_q_net_x5,
      monit_amp_c => monit_amp_ch1_o_net,
      monit_amp_c_x0 => monit_amp_ch0_o_net,
      monit_amp_c_x1 => monit_amp_ch2_o_net,
      monit_amp_c_x2 => monit_amp_ch3_o_net
    );

  tbt_amp_cbd277bb0c: entity work.tbt_amp_entity_cbd277bb0c
    port map (
      ce_1 => ce_1_sg_x56,
      ce_35 => ce_35_sg_x20,
      ce_70 => ce_70_sg_x25,
      ce_logic_1 => ce_logic_1_sg_x12,
      ch_in0 => delay4_q_net_x15,
      ch_in1 => delay4_q_net_x16,
      clk_1 => clk_1_sg_x56,
      clk_35 => clk_35_sg_x20,
      clk_70 => clk_70_sg_x25,
      i_in0 => delay7_q_net_x14,
      i_in1 => delay7_q_net_x15,
      q_in0 => delay6_q_net_x14,
      q_in1 => delay6_q_net_x15,
      amp_out0 => down_sample2_q_net_x26,
      amp_out1 => down_sample1_q_net_x26,
      amp_out2 => down_sample2_q_net_x27,
      amp_out3 => down_sample1_q_net_x27,
      tbt_amp0 => tbt_amp_ch1_o_net,
      tbt_amp0_x0 => tbt_amp_ch0_o_net,
      tbt_amp0_x1 => tbt_decim_ch1_i_o_net,
      tbt_amp0_x2 => tbt_decim_ch0_i_o_net,
      tbt_amp0_x3 => tbt_decim_ch1_q_o_net,
      tbt_amp0_x4 => tbt_decim_ch0_q_o_net,
      tbt_amp1 => tbt_amp_ch3_o_net,
      tbt_amp1_x0 => tbt_amp_ch2_o_net,
      tbt_amp1_x1 => tbt_decim_ch3_i_o_net,
      tbt_amp1_x2 => tbt_decim_ch2_i_o_net,
      tbt_amp1_x3 => tbt_decim_ch3_q_o_net,
      tbt_amp1_x4 => tbt_decim_ch2_q_o_net
    );

  tdm_517deaf50c: entity work.tdm_entity_517deaf50c
    port map (
      ce_2224 => ce_2224_sg_x26,
      ce_556 => ce_556_sg_x3,
      clk_2224 => clk_2224_sg_x26,
      clk_556 => clk_556_sg_x3,
      din_ch0 => down_sample2_q_net_x16,
      din_ch1 => down_sample1_q_net_x16,
      din_ch2 => down_sample2_q_net_x17,
      din_ch3 => down_sample1_q_net_x17,
      rst => constant10_op_net_x0,
      ch_out => register1_q_net_x3,
      dout => register_q_net_x9
    );

  tdm_mix_54ce67e6e8: entity work.tdm_mix_entity_54ce67e6e8
    port map (
      ce_1 => ce_1_sg_x56,
      ce_2 => ce_2_sg_x30,
      clk_1 => clk_1_sg_x56,
      clk_2 => clk_2_sg_x30,
      din_ch0 => bpf_ch0_o_net,
      din_ch1 => bpf_ch1_o_net,
      din_ch2 => bpf_ch2_o_net,
      din_ch3 => bpf_ch3_o_net,
      ch_out0 => register1_q_net_x6,
      ch_out1 => register1_q_net_x7,
      dout0 => register_q_net_x8,
      dout1 => register_q_net_x10
    );

end structural;
