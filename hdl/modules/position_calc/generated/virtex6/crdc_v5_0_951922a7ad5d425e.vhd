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
-- You must compile the wrapper file crdc_v5_0_951922a7ad5d425e.vhd when simulating
-- the core, crdc_v5_0_951922a7ad5d425e. When compiling the wrapper file, be sure to
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
ENTITY crdc_v5_0_951922a7ad5d425e IS
  PORT (
    aclk : IN STD_LOGIC;
    aclken : IN STD_LOGIC;
    s_axis_cartesian_tvalid : IN STD_LOGIC;
    s_axis_cartesian_tready : OUT STD_LOGIC;
    s_axis_cartesian_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_cartesian_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END crdc_v5_0_951922a7ad5d425e;

ARCHITECTURE crdc_v5_0_951922a7ad5d425e_a OF crdc_v5_0_951922a7ad5d425e IS
-- synthesis translate_off
COMPONENT wrapped_crdc_v5_0_951922a7ad5d425e
  PORT (
    aclk : IN STD_LOGIC;
    aclken : IN STD_LOGIC;
    s_axis_cartesian_tvalid : IN STD_LOGIC;
    s_axis_cartesian_tready : OUT STD_LOGIC;
    s_axis_cartesian_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_cartesian_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_crdc_v5_0_951922a7ad5d425e USE ENTITY XilinxCoreLib.cordic_v5_0(behavioral)
    GENERIC MAP (
      c_architecture => 1,
      c_coarse_rotate => 1,
      c_cordic_function => 1,
      c_data_format => 0,
      c_has_aclk => 1,
      c_has_aclken => 1,
      c_has_aresetn => 0,
      c_has_s_axis_cartesian => 1,
      c_has_s_axis_cartesian_tlast => 0,
      c_has_s_axis_cartesian_tuser => 1,
      c_has_s_axis_phase => 0,
      c_has_s_axis_phase_tlast => 0,
      c_has_s_axis_phase_tuser => 0,
      c_input_width => 25,
      c_iterations => 0,
      c_m_axis_dout_tdata_width => 48,
      c_m_axis_dout_tuser_width => 1,
      c_output_width => 24,
      c_phase_format => 0,
      c_pipeline_mode => -1,
      c_precision => 0,
      c_round_mode => 3,
      c_s_axis_cartesian_tdata_width => 64,
      c_s_axis_cartesian_tuser_width => 1,
      c_s_axis_phase_tdata_width => 32,
      c_s_axis_phase_tuser_width => 1,
      c_scale_comp => 3,
      c_throttle_scheme => 3,
      c_tlast_resolution => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_crdc_v5_0_951922a7ad5d425e
  PORT MAP (
    aclk => aclk,
    aclken => aclken,
    s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
    s_axis_cartesian_tready => s_axis_cartesian_tready,
    s_axis_cartesian_tuser => s_axis_cartesian_tuser,
    s_axis_cartesian_tdata => s_axis_cartesian_tdata,
    m_axis_dout_tvalid => m_axis_dout_tvalid,
    m_axis_dout_tuser => m_axis_dout_tuser,
    m_axis_dout_tdata => m_axis_dout_tdata
  );
-- synthesis translate_on

END crdc_v5_0_951922a7ad5d425e_a;
