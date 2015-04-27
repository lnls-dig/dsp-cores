-------------------------------------------------------------------------------
-- Title      : Inversion stage
-- Project    : 
-------------------------------------------------------------------------------
-- File       : inversion_stage.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-09
-- Last update: 2014-09-29
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: The CORDIC algorithm only converges to the proper value if the
-- initial point to be converted is in the right half plane. So, if the point is in
-- the left halfplane, rotate it 180o and apply the rotation value .
-------------------------------------------------------------------------------
-- This file is part of Concordic.
--
-- Concordic is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- Concordic is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Foobar. If not, see <http://www.gnu.org/licenses/>.
-- Copyright (c) 2014 Aylons Hazzud
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-09  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-------------------------------------------------------------------------------

entity inversion_stage is

  generic (
    g_mode : string := "rect_to_polar"
    );

  port (
    x_i     : in  signed;
    y_i     : in  signed;
    z_i     : in  signed;
    clk_i   : in  std_logic;
    ce_i    : in  std_logic;
    valid_i : in  std_logic;
    rst_i   : in  std_logic;
    x_o     : out signed;
    y_o     : out signed;
    z_o     : out signed;
    valid_o : out std_logic := '0'
    );

end entity inversion_stage;

-------------------------------------------------------------------------------

architecture str of inversion_stage is
  constant width          : integer := z_i'length;
  constant rotation_angle : signed  := to_signed(integer(-2**(width-1)), width);
  -- rotate 180o

begin  -- architecture str

  process(clk_i) is
    variable left_halfplane : boolean := false;
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        x_o <= (x_o'length-1 downto 0 => '0');
        y_o <= (y_o'length-1 downto 0 => '0');
        z_o <= (z_o'length-1 downto 0 => '0');
        valid_o <= '0';
      else
        if ce_i = '1' then

          left_halfplane := (x_i < 0);

          if left_halfplane then
            x_o <= -x_i;
            y_o <= -y_i;
            z_o <= rotation_angle;
          else
            x_o <= x_i;
            y_o <= y_i;
            z_o <= to_signed(0, width);
          end if;  -- left_halfplane

          valid_o <= valid_i;
        end if;  --clock enable
      end if;  --reset
    end if;  --rising edge
  end process;

end architecture str;

-------------------------------------------------------------------------------
