-------------------------------------------------------------------------------
-- Title      : Vivado DDS cos lut for UVX 250M
-- Project    :
-------------------------------------------------------------------------------
-- File       : dds_cos_lut.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2015-04-15
-- Last update: 2016-05-05
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Temporary cosine lut for UVX machine with 250M ADC generated
-- through Vivado.
-------------------------------------------------------------------------------
-- Copyright (c) 2015
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-04-04  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.genram_pkg.all;

entity dds_cos_lut is
  port (
    clka  : in  std_logic;
    addra : in  std_logic_vector(6 downto 0);
    douta : out std_logic_vector(15 downto 0)
    );
end entity dds_cos_lut;

architecture str of dds_cos_lut is

  component generic_rom
  generic (
    g_data_width                : natural := 32;
    g_size                      : natural := 16384;
    g_init_file                 : string  := "";
    g_fail_if_file_not_found    : boolean := true
  );
  port (
    rst_n_i                     : in std_logic;             -- synchronous reset, active LO
    clk_i                       : in std_logic;             -- clock input
    -- address input
    a_i                         : in std_logic_vector(f_log2_size(g_size)-1 downto 0);
    -- data output
    q_o                         : out std_logic_vector(g_data_width-1 downto 0)
  );
  end component;

begin

  cmp_cos_lut_uvx_18_65_1 : generic_rom
  generic map (
    g_data_width                => 16,
    g_size                      => 65,
    g_init_file                 => "cos_lut_uvx_18_65.mif",
    g_fail_if_file_not_found    => true
  )
  port map (
    rst_n_i                     => '1',
    clk_i                       => clka,
    a_i                         => addra,
    q_o                         => douta
  );

end architecture str;
