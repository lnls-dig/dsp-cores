-------------------------------------------------------------------------------
-- Title      : CORDIC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cordic.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-18
-- Last update: 2014-03-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Wrapper around Doolitle's CORDIC 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-18  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity cordic is

  generic (
    g_width : natural := 24;
    g_mode  : string  := "rect_to_polar"  -- or "polar_to_rect"
    );

  port (
    clock_i   : in std_logic;
    reset_n_i : in std_logic;
    -- inputs and ouputs are enabled according to g_mode setting
    I_i       : in std_logic_vector(g_width-1 downto 0) := (others => '0');  -- I 
    Q_i       : in std_logic_vector(g_width-1 downto 0) := (others => '0');  -- Q
    mag_i     : in std_logic_vector(g_width-1 downto 0) := (others => '0');
    phase_i   : in std_logic_vector(g_width downto 0)   := (others => '0');

    I_o     : out std_logic_vector(g_width-1 downto 0);  -- I or Magnitude 
    Q_o     : out std_logic_vector(g_width-1 downto 0);  -- Q or Phase
    mag_o   : out std_logic_vector(g_width-1 downto 0);
    phase_o : out std_logic_vector(g_width downto 0)
    );

end entity cordic;

-------------------------------------------------------------------------------

architecture str of cordic is

  signal I_temp     : std_logic_vector(g_width downto 0);
  signal Q_temp     : std_logic_vector(g_width downto 0);
  signal mag_temp   : std_logic_vector(g_width downto 0);
  signal phase_temp : std_logic_vector(g_width+1 downto 0);

  component cordicg is
    generic(
      width  : integer;
      def_op : integer);
    port(
      clk      : in  std_logic;
      opin     : in  std_logic_vector(1 downto 0);
      xin      : in  std_logic_vector(g_width downto 0);
      yin      : in  std_logic_vector(g_width downto 0);
      phasein  : in  std_logic_vector(g_width+1 downto 0);
      xout     : out std_logic_vector(g_width downto 0);
      yout     : out std_logic_vector(g_width downto 0);
      phaseout : out std_logic_vector(g_width+1 downto 0));
  end component cordicg;
  
begin  -- architecture str



  -- FIXME: actual cordic input size is one bit larger than the wrapper size.
  -- This is a workaround for a glitch where values above 0.5DR get calculated wrongly.
  -- This is an ugly workaround and a proper solution must be found.
  rect_to_polar_mode:
  if g_mode = "rect_to_polar" generate
    I_temp <= '0' & I_i;
    Q_temp <= '0' & Q_i;

    cmp_vectoring_cordic : cordicg
      generic map (
        width  => g_width+1,
        def_op => 1)
      port map (
        clk      => clock_i,
        opin     => "01",
        xin      => I_temp,
        yin      => Q_temp,
        phasein  => (others => '0'),
        xout     => mag_temp,
        yout     => open,
        phaseout => phase_temp);
    mag_o   <= mag_temp(g_width-1 downto 0);
    phase_o <= phase_temp(g_width+1 downto 1);
  end generate;

  polar_to_rect_mode:
  if g_mode = "polar_to_rect" generate
    cmp_rotating_mode : cordicg
      generic map (
        width  => g_width+1,
        def_op => 0)
      port map (
        clk      => clock_i,
        opin     => "00",
        xin      => mag_i,
        yin      => (others => '0'),
        phasein  => phase_i,
        xout     => I_o,
        yout     => Q_o,
        phaseout => open);
  end generate;

end architecture str;

-------------------------------------------------------------------------------
