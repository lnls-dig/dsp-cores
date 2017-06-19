-------------------------------------------------------------------------------
-- Title      : Vivado DDS cos lut for SIRIUS 130M
-- Project    :
-------------------------------------------------------------------------------
-- File       : dds_cos_lut.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2015-04-15
-- Last update: 2015-04-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Temporary cosine lut for SIRIUS machine with 130M ADC generated
-- through Vivado.
-------------------------------------------------------------------------------
-- Copyright (c) 2015
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-04-15  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity dds_cos_lut is
  port (
    clka  : in  std_logic;
    addra : in  std_logic_vector(7 downto 0);
    douta : out std_logic_vector(15 downto 0)
    );
end entity dds_cos_lut;

architecture str of dds_cos_lut is

  component cos_lut_sirius_52_203 is
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector(7 downto 0);
      douta : out std_logic_vector(15 downto 0));
  end component cos_lut_sirius_52_203;

begin

  cos_lut_sirius_52_203_1 : cos_lut_sirius_52_203
    port map (
      clka  => clka,
      addra => addra,
      douta => douta);

end architecture str;
