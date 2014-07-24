-------------------------------------------------------------------------------
-- Title      : Look-up table sweeper
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lut_sweep.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-07
-- Last update: 2014-03-07
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Tool for sweeping through look-up table addresses
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-07  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

-------------------------------------------------------------------------------

entity lut_sweep is
  generic (
    g_bus_size      : natural := 8;
    g_first_address : natural := 0;
    g_last_address  : natural := 202;
    g_sweep_mode    : string  := "sawtooth"
    ); 
  port (
    reset_n_i : in  std_logic;
    clock_i   : in  std_logic;
    ce_i      : in  std_logic;
    address_o : out std_logic_vector(g_bus_size-1 downto 0));
end entity lut_sweep;

-------------------------------------------------------------------------------

architecture str of lut_sweep is

begin  -- architecture str

  counting : process(clock_i)
    variable count : natural := 0;
  begin

    if rising_edge(clock_i) then

      if reset_n_i = '0' then
        count        := 0;

      elsif ce_i = '1' then
        if count = g_last_address then
          count := g_first_address;
        else
          count := count + 1;
        end if;  --count = last_address

        address_o <= std_logic_vector(to_unsigned(count, g_bus_size));
      end if;  -- reset
    end if;  -- rising_edge

  end process counting;


end architecture str;

-------------------------------------------------------------------------------
