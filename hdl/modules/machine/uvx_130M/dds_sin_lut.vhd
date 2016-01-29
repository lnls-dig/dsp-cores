-------------------------------------------------------------------------------
-- Title      : Vivadi DDS sin lut for UVC 130M
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dds_sin_lut.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2015-04-15
-- Last update: 2015-04-15
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Temporary sine lut for UVX machine with 130M ADC generated
-- through Vivado.
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-04-15  1.0      aylons	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
entity dds_sin_lut is
  port (
    clka  : in  std_logic;
    addra : in  std_logic_vector(5 downto 0);
    douta : out std_logic_vector(15 downto 0)
    );
end entity dds_sin_lut;

architecture str of dds_sin_lut is

  component sin_lut_uvx_35_148 is
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector(5 downto 0);
      douta : out std_logic_vector(15 downto 0));
  end component sin_lut_uvx_35_148;

begin

  sin_lut_uvx_35_148_1 : sin_lut_uvx_35_148
    port map (
      clka  => clka,
      addra => addra,
      douta => douta);

end architecture str;
