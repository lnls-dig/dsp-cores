-------------------------------------------------------------------------------
-- Copyright (c) 2014 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 13.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : chipscope_ila_1t_128d.vhd
-- /___/   /\     Timestamp  : Thu Jun 26 12:57:05 BRT 2014
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY chipscope_ila_1t_128d IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    DATA: in std_logic_vector(127 downto 0);
    TRIG0: in std_logic_vector(0 to 0));
END chipscope_ila_1t_128d;

ARCHITECTURE chipscope_ila_1t_128d_a OF chipscope_ila_1t_128d IS
BEGIN

END chipscope_ila_1t_128d_a;
