-------------------------------------------------------------------------------
-- Title      : Mixer-CIC clock domain crossing
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mixer_cdc.vhd
-- Author     : aylons  <aylons@aylons-hp1>
-- Company    : 
-- Created    : 2014-01-24
-- Last update: 2014-01-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A cross clock domain crossing enabling the 130MHz-based signal
-- from the mixer reaches the 325MHz-based CIC filter.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-24  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity mixer_cdc is
  generic(
    g_bus_width : natural := 26;
    );
  port(
    clk_adc    : in  std_logic;
    I_in       : in  : std_logic_vector(g_bus_width-1 downto 0);
    Q_in       : in  : std_logic_vector(g_bus_width-1 downto 0);
    clk_fast   : in  std_logic;
    data_out   : out : std_logic_vector(g_bus_width-1 downto 0);
    data_valid : out : std_logic;
    data_last  : out : std_logic_vector;
    );
end mixer_cdc;

architecture behavioural of mixer_cdc is

  signal I_registered : std_logic_vector(g_bus_width-1 downto 0);
  signal Q_registered : std_logic_vector(g_bus_width-1 downto 0);

  signal I_first_ff  : std_logic_vector(g_bus_width-1 downto 0);
  signal I_second_ff : std_logic_vector(g_bus_width-1 downto 0);

  signal Q_first_ff  : std_logic_vector(g_bus_width-1 downto 0);
  signal Q_second_ff : std_logic_vector(g_bus_width-1 downto 0);

  signal I_storage : std_logic_vector(g_bus_width-1 downto 0);
  signal Q_storage : std_logic_vector(g_bus_width-1 downto 0);

  signal dirty : bit := false;

begin
  
  new_data_in : process(clk_adc)
  begin
    if rising_edge(clk_adc) then        --new data is coming
      I_registered <= I_in;
      Q_registered <= Q_in;
    end if;
  end process new_data_in;

  fast_clock_cycle: process(clk_fast)
    begin
      if rising_edge(clk_fast) then
        I_first_ff <= I_registered;
        I_second_ff <= I_first_ff;

        Q_first_ff <= Q_registered;
	Q_second_ff <=  Q_first_ff;
	
        --stabilized clock
        if(I_first_ff = I_second_ff) and (Q_first_ff = Q_second_ff) then
	  I_storage <=  I_second_ff;
	  Q_storage <=  Q_second_ff;
	  dirty        <= true;
	end if;

	if(dirty = true) then
	  
