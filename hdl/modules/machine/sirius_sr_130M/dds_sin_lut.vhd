-------------------------------------------------------------------------------
-- Title      : Vivadi DDS sin lut for SIRIUS 130M
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
    addra : in  std_logic_vector(7 downto 0);
    douta : out std_logic_vector(15 downto 0)
    );
end entity dds_sin_lut;

architecture str of dds_sin_lut is

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

  cmp_sin_lut_sirius_52_203_1 : generic_rom
  generic map (
    g_data_width                => 16,
    g_size                      => 203,
    g_init_file                 => "sin_lut_sirius_52_203.mif",
    g_fail_if_file_not_found    => true
  )
  port map (
    rst_n_i                     => '1',
    clk_i                       => clka,
    a_i                         => addra,
    q_o                         => douta
  );

end architecture str;
