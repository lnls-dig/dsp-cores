-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 13.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : chipscope_vio_256.vhd
-- /___/   /\     Timestamp  : Mon Jul 22 09:04:51 BRT 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY chipscope_vio_256 IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    ASYNC_OUT: out std_logic_vector(255 downto 0));
END chipscope_vio_256;

ARCHITECTURE chipscope_vio_256_a OF chipscope_vio_256 IS
BEGIN

END chipscope_vio_256_a;
