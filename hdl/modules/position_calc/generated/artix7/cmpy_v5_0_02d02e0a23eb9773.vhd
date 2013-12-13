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
--    (c) Copyright 1995-2013 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file cmpy_v5_0_02d02e0a23eb9773.vhd when simulating
-- the core, cmpy_v5_0_02d02e0a23eb9773. When compiling the wrapper file, be sure to
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
ENTITY cmpy_v5_0_02d02e0a23eb9773 IS
  PORT (
    aclk : IN STD_LOGIC;
    aclken : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END cmpy_v5_0_02d02e0a23eb9773;

ARCHITECTURE cmpy_v5_0_02d02e0a23eb9773_a OF cmpy_v5_0_02d02e0a23eb9773 IS
-- synthesis translate_off
COMPONENT wrapped_cmpy_v5_0_02d02e0a23eb9773
  PORT (
    aclk : IN STD_LOGIC;
    aclken : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_cmpy_v5_0_02d02e0a23eb9773 USE ENTITY XilinxCoreLib.cmpy_v5_0(behavioral)
    GENERIC MAP (
      c_a_width => 24,
      c_b_width => 24,
      c_has_aclken => 1,
      c_has_aresetn => 0,
      c_has_s_axis_a_tlast => 0,
      c_has_s_axis_a_tuser => 0,
      c_has_s_axis_b_tlast => 0,
      c_has_s_axis_b_tuser => 1,
      c_has_s_axis_ctrl_tlast => 0,
      c_has_s_axis_ctrl_tuser => 0,
      c_latency => 6,
      c_m_axis_dout_tdata_width => 48,
      c_m_axis_dout_tuser_width => 1,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_out_width => 24,
      c_s_axis_a_tdata_width => 48,
      c_s_axis_a_tuser_width => 1,
      c_s_axis_b_tdata_width => 48,
      c_s_axis_b_tuser_width => 1,
      c_s_axis_ctrl_tdata_width => 8,
      c_s_axis_ctrl_tuser_width => 1,
      c_throttle_scheme => 3,
      c_tlast_resolution => 0,
      c_verbosity => 0,
      c_xdevice => "xc7a200t",
      c_xdevicefamily => "artix7",
      has_negate => 0,
      round => 0,
      single_output => 0,
      use_dsp_cascades => 1
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cmpy_v5_0_02d02e0a23eb9773
  PORT MAP (
    aclk => aclk,
    aclken => aclken,
    s_axis_a_tvalid => s_axis_a_tvalid,
    s_axis_a_tdata => s_axis_a_tdata,
    s_axis_b_tvalid => s_axis_b_tvalid,
    s_axis_b_tuser => s_axis_b_tuser,
    s_axis_b_tdata => s_axis_b_tdata,
    m_axis_dout_tvalid => m_axis_dout_tvalid,
    m_axis_dout_tuser => m_axis_dout_tuser,
    m_axis_dout_tdata => m_axis_dout_tdata
  );
-- synthesis translate_on

END cmpy_v5_0_02d02e0a23eb9773_a;
