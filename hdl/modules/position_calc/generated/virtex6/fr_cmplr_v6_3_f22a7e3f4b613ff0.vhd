--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2014 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file fr_cmplr_v6_3_f22a7e3f4b613ff0.vhd when simulating
-- the core, fr_cmplr_v6_3_f22a7e3f4b613ff0. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY fr_cmplr_v6_3_f22a7e3f4b613ff0 IS
  PORT (
    aclk : IN STD_LOGIC;
    aclken : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tuser : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tuser : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    event_s_data_chanid_incorrect : OUT STD_LOGIC
  );
END fr_cmplr_v6_3_f22a7e3f4b613ff0;

ARCHITECTURE fr_cmplr_v6_3_f22a7e3f4b613ff0_a OF fr_cmplr_v6_3_f22a7e3f4b613ff0 IS
-- synthesis translate_off
COMPONENT wrapped_fr_cmplr_v6_3_f22a7e3f4b613ff0
  PORT (
    aclk : IN STD_LOGIC;
    aclken : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tuser : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tuser : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    event_s_data_chanid_incorrect : OUT STD_LOGIC
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_fr_cmplr_v6_3_f22a7e3f4b613ff0 USE ENTITY XilinxCoreLib.fir_compiler_v6_3(behavioral)
    GENERIC MAP (
      c_accum_op_path_widths => "44",
      c_accum_path_widths => "44",
      c_channel_pattern => "fixed",
      c_coef_file => "fr_cmplr_v6_3_f22a7e3f4b613ff0.mif",
      c_coef_file_lines => 240,
      c_coef_mem_packing => 0,
      c_coef_memtype => 1,
      c_coef_path_sign => "0",
      c_coef_path_src => "0",
      c_coef_path_widths => "16",
      c_coef_reload => 0,
      c_coef_width => 16,
      c_col_config => "1",
      c_col_mode => 1,
      c_col_pipe_len => 4,
      c_component_name => "fr_cmplr_v6_3_f22a7e3f4b613ff0",
      c_config_packet_size => 0,
      c_config_sync_mode => 0,
      c_config_tdata_width => 1,
      c_data_has_tlast => 0,
      c_data_mem_packing => 0,
      c_data_memtype => 1,
      c_data_path_sign => "0",
      c_data_path_src => "0",
      c_data_path_widths => "25",
      c_data_width => 25,
      c_datapath_memtype => 2,
      c_decim_rate => 10,
      c_ext_mult_cnfg => "none",
      c_filter_type => 1,
      c_filts_packed => 0,
      c_has_aclken => 1,
      c_has_aresetn => 0,
      c_has_config_channel => 0,
      c_input_rate => 5600000,
      c_interp_rate => 1,
      c_ipbuff_memtype => 0,
      c_latency => 31,
      c_m_data_has_tready => 0,
      c_m_data_has_tuser => 1,
      c_m_data_tdata_width => 32,
      c_m_data_tuser_width => 2,
      c_mem_arrangement => 0,
      c_num_channels => 4,
      c_num_filts => 1,
      c_num_madds => 1,
      c_num_reload_slots => 1,
      c_num_taps => 240,
      c_opbuff_memtype => 0,
      c_opt_madds => "none",
      c_optimization => 0,
      c_output_path_widths => "26",
      c_output_rate => 56000000,
      c_output_width => 26,
      c_oversampling_rate => 24,
      c_reload_tdata_width => 1,
      c_round_mode => 4,
      c_s_data_has_fifo => 0,
      c_s_data_has_tuser => 1,
      c_s_data_tdata_width => 32,
      c_s_data_tuser_width => 2,
      c_symmetry => 0,
      c_xdevicefamily => "virtex6",
      c_zero_packing_factor => 1
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_fr_cmplr_v6_3_f22a7e3f4b613ff0
  PORT MAP (
    aclk => aclk,
    aclken => aclken,
    s_axis_data_tvalid => s_axis_data_tvalid,
    s_axis_data_tready => s_axis_data_tready,
    s_axis_data_tuser => s_axis_data_tuser,
    s_axis_data_tdata => s_axis_data_tdata,
    m_axis_data_tvalid => m_axis_data_tvalid,
    m_axis_data_tuser => m_axis_data_tuser,
    m_axis_data_tdata => m_axis_data_tdata,
    event_s_data_chanid_incorrect => event_s_data_chanid_incorrect
  );
-- synthesis translate_on

END fr_cmplr_v6_3_f22a7e3f4b613ff0_a;
