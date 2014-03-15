-------------------------------------------------------------------------------
-- Title      : Strobe generator
-- Project    : 
-------------------------------------------------------------------------------
-- File	      : strobe_gen.vhd
-- Author     : aylons	<aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-11
-- Last update: 2014-03-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Generates strobes at decimation rate for CIC filter
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2014-03-11  1.0	aylons	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

-------------------------------------------------------------------------------

entity strobe_gen is

  generic (
    g_maxrate	: natural := 2048;
    g_bus_width : natural := 11
    );

  port (
    clock_i   : in  std_logic;
    reset_n_i : in  std_logic;
    ce_i      : in  std_logic;
    ratio_i   : in  std_logic_vector(g_bus_width-1 downto 0);
    strobe_o  : out std_logic
    );

end entity strobe_gen;

-------------------------------------------------------------------------------

architecture str of strobe_gen is

begin  -- architecture str

  counting : process(clock_i)
    variable count : natural := 0;
  begin

    if rising_edge(clock_i) then

      if reset_n_i = '0' then
	count := to_integer(unsigned(ratio_i));

      elsif ce_i = '1' then
	if count = 0 then
	  count	   := to_integer(unsigned(ratio_i));
	  strobe_o <= '1';
	else
	  count	   := count - 1;
	  strobe_o <= '0';
	end if;	 --count = 0

      end if;  -- reset
    end if;  -- rising_edge

  end process counting;
  
end architecture str;

-------------------------------------------------------------------------------
