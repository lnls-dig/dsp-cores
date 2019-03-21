-------------------------------------------------------------------------------
-- Title      : Vivadi DDS sin lut for SIRIUS 130M
-- Project    :
-------------------------------------------------------------------------------
-- File       : dds_sin_lut.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2015-04-15
-- Last update: 2016-05-05
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Temporary sine lut for SIRIUS machine with 130M ADC generated
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

library work;
use work.genram_pkg.all;

-------------------------------------------------------------------------------
entity dds_sin_lut is
  port (
    clka  : in  std_logic;
    addra : in  std_logic_vector(6 downto 0);
    douta : out std_logic_vector(15 downto 0)
    );
end entity dds_sin_lut;

architecture str of dds_sin_lut is

  component sin_lut_uvx_18_65 is
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector(6 downto 0);
      douta : out std_logic_vector(15 downto 0));
  end component sin_lut_uvx_18_65;

begin

  cmp_sin_lut_sirius_18_65_1 : generic_rom
  generic map (
    g_data_width                => 16,
    g_size                      => 65,
    g_init_file                 => "sin_lut_sirius_18_65.mif",
    g_fail_if_file_not_found    => true
  )
  port map (
    rst_n_i                     => '1',
    clk_i                       => clka,
    a_i                         => addra,
    q_o                         => douta
  );

end architecture str;
