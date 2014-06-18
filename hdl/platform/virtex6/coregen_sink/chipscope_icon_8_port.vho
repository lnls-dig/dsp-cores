-------------------------------------------------------------------------------
-- Copyright (c) 2014 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 13.4
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : chipscope_icon_8_port.vho
-- /___/   /\     Timestamp  : Fri Jun 13 11:37:00 BRT 2014
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-- Component Identifier: xilinx.com:ip:chipscope_icon:1.06.a
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component chipscope_icon_8_port
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL1 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL2 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL3 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL4 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL5 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL6 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CONTROL7 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

end component;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : chipscope_icon_8_port
  port map (
    CONTROL0 => CONTROL0,
    CONTROL1 => CONTROL1,
    CONTROL2 => CONTROL2,
    CONTROL3 => CONTROL3,
    CONTROL4 => CONTROL4,
    CONTROL5 => CONTROL5,
    CONTROL6 => CONTROL6,
    CONTROL7 => CONTROL7);

-- INST_TAG_END ------ End INSTANTIATION Template ------------
