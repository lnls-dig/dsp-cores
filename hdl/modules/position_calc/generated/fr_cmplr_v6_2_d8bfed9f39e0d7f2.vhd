--------------------------------------------------------------------------------
--     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.            --
--                                                                            --
--     This file contains confidential and proprietary information            --
--     of Xilinx, Inc. and is protected under U.S. and                        --
--     international copyright and other intellectual property                --
--     laws.                                                                  --
--                                                                            --
--     DISCLAIMER                                                             --
--     This disclaimer is not a license and does not grant any                --
--     rights to the materials distributed herewith. Except as                --
--     otherwise provided in a valid license issued to you by                 --
--     Xilinx, and to the maximum extent permitted by applicable              --
--     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                --
--     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES            --
--     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING              --
--     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                 --
--     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and               --
--     (2) Xilinx shall not be liable (whether in contract or tort,           --
--     including negligence, or under any other theory of                     --
--     liability) for any loss or damage of any kind or nature                --
--     related to, arising under or in connection with these                  --
--     materials, including for any direct, or any indirect,                  --
--     special, incidental, or consequential loss or damage                   --
--     (including loss of data, profits, goodwill, or any type of             --
--     loss or damage suffered as a result of any action brought              --
--     by a third party) even if such damage or loss was                      --
--     reasonably foreseeable or Xilinx had been advised of the               --
--     possibility of the same.                                               --
--                                                                            --
--     CRITICAL APPLICATIONS                                                  --
--     Xilinx products are not designed or intended to be fail-               --
--     safe, or for use in any application requiring fail-safe                --
--     performance, such as life-support or safety devices or                 --
--     systems, Class III medical devices, nuclear facilities,                --
--     applications related to the deployment of airbags, or any              --
--     other applications that could lead to death, personal                  --
--     injury, or severe property or environmental damage                     --
--     (individually and collectively, "Critical                              --
--     Applications"). Customer assumes the sole risk and                     --
--     liability of any use of Xilinx products in Critical                    --
--     Applications, subject only to applicable laws and                      --
--     regulations governing limitations on product liability.                --
--                                                                            --
--     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS               --
--     PART OF THIS FILE AT ALL TIMES.                                        --
--------------------------------------------------------------------------------

--  Generated from component ID: xilinx.com:ip:fir_compiler:6.2


-- You must compile the wrapper file fr_cmplr_v6_2_d8bfed9f39e0d7f2.vhd when simulating
-- the core, fr_cmplr_v6_2_d8bfed9f39e0d7f2. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY fr_cmplr_v6_2_d8bfed9f39e0d7f2 IS
	port (
	aclk: in std_logic;
	aclken: in std_logic;
	s_axis_data_tvalid: in std_logic;
	s_axis_data_tready: out std_logic;
	s_axis_data_tdata: in std_logic_vector(95 downto 0);
	m_axis_data_tvalid: out std_logic;
	m_axis_data_tdata: out std_logic_vector(127 downto 0));
END fr_cmplr_v6_2_d8bfed9f39e0d7f2;

ARCHITECTURE fr_cmplr_v6_2_d8bfed9f39e0d7f2_a OF fr_cmplr_v6_2_d8bfed9f39e0d7f2 IS
-- synthesis translate_off
component wrapped_fr_cmplr_v6_2_d8bfed9f39e0d7f2
	port (
	aclk: in std_logic;
	aclken: in std_logic;
	s_axis_data_tvalid: in std_logic;
	s_axis_data_tready: out std_logic;
	s_axis_data_tdata: in std_logic_vector(95 downto 0);
	m_axis_data_tvalid: out std_logic;
	m_axis_data_tdata: out std_logic_vector(127 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_fr_cmplr_v6_2_d8bfed9f39e0d7f2 use entity XilinxCoreLib.fir_compiler_v6_2(behavioral)
		generic map(
			c_round_mode => 4,
			c_coef_memtype => 2,
			c_has_config_channel => 0,
			c_m_data_has_tready => 0,
			c_col_pipe_len => 4,
			c_coef_reload => 0,
			c_input_rate => 1,
			c_col_config => "22",
			c_coef_mem_packing => 0,
			c_filter_type => 1,
			c_accum_op_path_widths => "41,41,41,41",
			c_component_name => "fr_cmplr_v6_2_d8bfed9f39e0d7f2",
			c_coef_file => "fr_cmplr_v6_2_d8bfed9f39e0d7f2.mif",
			c_reload_tdata_width => 1,
			c_mem_arrangement => 1,
			c_filts_packed => 0,
			c_opbuff_memtype => 0,
			c_num_channels => 1,
			c_data_width => 24,
			c_symmetry => 1,
			c_data_path_src => "0,1,2,3",
			c_data_path_sign => "0,0,0,0",
			c_config_sync_mode => 0,
			c_latency => 28,
			c_output_rate => 2,
			c_xdevicefamily => "virtex6",
			c_interp_rate => 1,
			c_datapath_memtype => 2,
			c_s_data_tdata_width => 96,
			c_coef_file_lines => 42,
			c_s_data_has_tuser => 0,
			c_s_data_tuser_width => 1,
			c_data_memtype => 0,
			c_output_path_widths => "25,25,25,25",
			c_data_path_widths => "24,24,24,24",
			c_coef_path_sign => "0,0,0,0",
			c_has_aresetn => 0,
			c_decim_rate => 2,
			c_data_has_tlast => 0,
			c_s_data_has_fifo => 0,
			c_oversampling_rate => 1,
			c_channel_pattern => "fixed",
			c_config_packet_size => 0,
			c_coef_path_widths => "16,16,16,16",
			c_optimization => 0,
			c_m_data_has_tuser => 0,
			c_num_reload_slots => 1,
			c_coef_path_src => "0,0,0,0",
			c_m_data_tdata_width => 128,
			c_has_aclken => 1,
			c_zero_packing_factor => 1,
			c_config_tdata_width => 1,
			c_m_data_tuser_width => 1,
			c_accum_path_widths => "41,41,41,41",
			c_num_taps => 81,
			c_ipbuff_memtype => 0,
			c_num_madds => 21,
			c_coef_width => 16,
			c_opt_madds => "none",
			c_num_filts => 1,
			c_data_mem_packing => 0,
			c_ext_mult_cnfg => "none",
			c_output_width => 25,
			c_col_mode => 0);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_fr_cmplr_v6_2_d8bfed9f39e0d7f2
		port map (
			aclk => aclk,
			aclken => aclken,
			s_axis_data_tvalid => s_axis_data_tvalid,
			s_axis_data_tready => s_axis_data_tready,
			s_axis_data_tdata => s_axis_data_tdata,
			m_axis_data_tvalid => m_axis_data_tvalid,
			m_axis_data_tdata => m_axis_data_tdata);
-- synthesis translate_on

END fr_cmplr_v6_2_d8bfed9f39e0d7f2_a;

