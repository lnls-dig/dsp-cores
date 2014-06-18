-------------------------------------------------------------------------------
-- Copyright (c) 2014 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 13.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : chipscope_icon.vhd
-- /___/   /\     Timestamp  : Fri Jun 13 11:28:42 BRT 2014
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY chipscope_icon IS
  port (
    CONTROL0: inout std_logic_vector(35 downto 0);
    CONTROL1: inout std_logic_vector(35 downto 0);
    CONTROL2: inout std_logic_vector(35 downto 0);
    CONTROL3: inout std_logic_vector(35 downto 0);
    CONTROL4: inout std_logic_vector(35 downto 0);
    CONTROL5: inout std_logic_vector(35 downto 0);
    CONTROL6: inout std_logic_vector(35 downto 0);
    CONTROL7: inout std_logic_vector(35 downto 0));
END chipscope_icon;

ARCHITECTURE chipscope_icon_a OF chipscope_icon IS
BEGIN

END chipscope_icon_a;
