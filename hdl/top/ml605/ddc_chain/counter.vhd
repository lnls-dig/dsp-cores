-------------------------------------------------------------------------------
-- Title      : Window position index counter
-- Project    : 
-------------------------------------------------------------------------------
-- File	      : counter.vhd
-- Author     : aylons	<aylons@LNLS190>
-- Company    : 
-- Created    : 2014-01-31
-- Last update: 2014-03-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Up/Down for symmetrical window LUT
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2014-01-31  1.0	aylons	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity counter is
  
  generic (
    g_mem_size	   : natural := 601;
    g_bus_size	   : natural := 15;
    g_switch_delay : natural := 2
    );
  port (
    clk_i     : in  std_logic;		-- input clock
    ce_i      : in  std_logic;		-- clock enable
    reset_n_i : in  std_logic;		-- reset
    switch_o  : out std_logic;
    index_o   : out std_logic_vector(g_bus_size-1 downto 0));  -- Memory address to current
							       -- window data

end entity counter;

architecture behavioural of counter is

  -- This is the address of the last sample in a vector with half
  -- the size of the window
  constant last_address : natural   := g_mem_size-1;
  signal switch_state	: std_logic := '0';

  
begin  -- architecture behavioural

  counting : process(clk_i, reset_n_i)
    variable going_up : boolean := true;
    variable count    : natural := 0;	-- internal counter
  begin
    if reset_n_i = '0' then
      count	   := 0;
      going_up	   := true;
      switch_state <= '0';

    elsif rising_edge(clk_i) and ce_i = '1' then

      if going_up then
	count := count + 1;
	if count = last_address then
	  going_up := false;
	end if;	 --count = last_address

      else
	--counting down 
	count := count - 1;
	if count = to_unsigned(0, g_bus_size) then
	  going_up := true;
	end if;	 -- count = 0

	--switch N samples before reaches zero
	if count = switch_delay then
	  switch_state <= '1';
	else
	  switch_state <= '0';
	end if;	 -- count = switch_delay
      end if;  -- going up

      index_o  <= std_logic_vector(to_unsigned(count, g_bus_size));
      switch_o <= switch_state;
      
    end if;  -- reset/rising edge
  end process counting;

  
end architecture behavioural;
