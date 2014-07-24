-------------------------------------------------------------------------------
-- Title      : CORDIC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cordic.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-18
-- Last update: 2014-04-01
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
    phase_i   : in std_logic_vector(g_width-1 downto 0) := (others => '0');

    I_o     : out std_logic_vector(g_width-1 downto 0);  -- I or Magnitude 
    Q_o     : out std_logic_vector(g_width-1 downto 0);  -- Q or Phase
    mag_o   : out std_logic_vector(g_width-1 downto 0);
    phase_o : out std_logic_vector(g_width-1 downto 0)
    );

end entity cordic;

-------------------------------------------------------------------------------

architecture str of cordic is

  signal I_temp     : std_logic_vector(g_width downto 0);
  signal Q_temp     : std_logic_vector(g_width downto 0);
  signal mag_temp   : std_logic_vector(g_width downto 0);
  signal phase_temp : std_logic_vector(g_width+1 downto 0);
  signal temp       : std_logic_vector(g_width+1 downto 0);

  component cordicg is
    generic(
      width  : integer;
      def_op : integer);
    port(
      clk      : in  std_logic;
      opin     : in  std_logic_vector(1 downto 0);
      xin      : in  std_logic_vector;
      yin      : in  std_logic_vector;
      phasein  : in  std_logic_vector;
      xout     : out std_logic_vector;
      yout     : out std_logic_vector;
      phaseout : out std_logic_vector);
  end component cordicg;
  
begin  -- architecture str



  -- Signal amplitude may be 1.41 times higher than the highest input value.
  -- The Verilog CORDIC does NOT provide for this, so we make it one bit wider
  rect_to_polar_mode:
  if g_mode = "rect_to_polar" generate
    I_temp <= I_i(g_width-1) & I_i;     --signal extension
    Q_temp <= Q_i(g_width-1) & Q_i;

    cmp_vectoring_cordic : cordicg
      generic map (
        width  => g_width+1,
        def_op => 1)
      port map (
        clk      => clock_i,
        opin     => "01",
        xin      => I_temp,
        yin      => Q_temp,
        phasein  => (g_width+1 downto 0 => '0'),
        xout     => mag_temp,
        yout     => temp(g_width downto 0),
        phaseout => phase_temp);
    mag_o   <= mag_temp(g_width downto 1);
    phase_o <= phase_temp(g_width+1 downto 2);
  end generate;

  polar_to_rect_mode:
  if g_mode = "polar_to_rect" generate
    phase_temp(g_width+1 downto 0) <= phase_i(g_width-1 downto 0) & "00";
    mag_temp                       <= mag_i(g_width-1) & mag_i(g_width-1 downto 0);

    cmp_rotating_mode : cordicg
      generic map (
        width  => g_width+1,
        def_op => 0)
      port map (
        clk      => clock_i,
        opin     => "00",
        xin      => mag_temp,
        yin      => (g_width downto 0 => '0'),
        phasein  => phase_temp(g_width+1 downto 0),
        xout     => I_temp,
        yout     => Q_temp,
        phaseout => temp);

    I_o <= I_temp(g_width downto 1);
    Q_o <= Q_temp(g_width downto 1);
  end generate;

end architecture str;

-------------------------------------------------------------------------------
