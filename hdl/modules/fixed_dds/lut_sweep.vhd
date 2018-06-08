-------------------------------------------------------------------------------
-- Title      : Look-up table sweeper
-- Project    :
-------------------------------------------------------------------------------
-- File       : lut_sweep.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-03-07
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Swwep look-up table addresses for Phased DDS
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
    g_number_of_points : natural := 203;
    g_bus_size         : natural := 16  --must be
                                        --ceil(log2(g_number_of_points)) +
                                        --g_phase_bus_size
    );
  port (
    rst_i       : in  std_logic;
    clk_i       : in  std_logic;
    ce_i        : in  std_logic;
    valid_i     : in  std_logic;
    address_o   : out std_logic_vector(g_bus_size-1 downto 0);
    valid_o     : out std_logic);
end entity lut_sweep;

-------------------------------------------------------------------------------

architecture behavioral of lut_sweep is
begin  -- architecture behavioral


  next_output : process(clk_i  )
    variable sample : natural range 0 to g_number_of_points;
  begin
    if rising_edge(clk_i  ) then

      if rst_i   = '1' then
        sample := 0;
        address_o <= std_logic_vector(to_unsigned(0, g_bus_size));
        valid_o <= '0';

      elsif ce_i = '1' then

        if valid_i = '1' then
          if sample = g_number_of_points-1 then
            sample := 0;
          else
            sample := sample + 1;
          end if;
        end if;

        address_o <= std_logic_vector(to_unsigned(sample, g_bus_size));
        valid_o <= valid_i;

      end if;  -- reset
    end if;  -- rising_edge

  end process next_output;


end architecture behavioral;

-------------------------------------------------------------------------------
