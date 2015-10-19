-------------------------------------------------------------------------------
-- Title      : Dynamic adder/subtractor
-- Project    :
-------------------------------------------------------------------------------
-- File       : addsub.vhd
-- Author     : Aylons  <concordic@aylons.com>
-- Company    :
-- Created    : 2014-05-03
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02/08
-------------------------------------------------------------------------------
-- Description: Depening on sub_i, result_o may be a_i + b_i or a_i - b_i.
-- The three widths must all be the same.
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
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-03  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity addsub is
  port (
    a_i        : in  signed;
    b_i        : in  signed;
    sub_i      : in  boolean;
    clk_i      : in  std_logic;
    ce_i       : in  std_logic;
    rst_i      : in  std_logic;
    result_o   : out signed;
    positive_o : out boolean;
    negative_o : out boolean
    );

end entity addsub;

-------------------------------------------------------------------------------

architecture str of addsub is
  constant width      : natural                  := a_i'length;
  signal a_1, b_1     : signed(width-1 downto 0) := (others => '0');
  signal mux_result   : signed (width-1 downto 0) := (others => '0');
begin  -- architecture str

  assert a_i'length = b_i'length
    report "a_i and b_i have different widths"
    severity error;

  assert a_i'length = result_o'length
    report "invalid result_o width"
    severity error;

  process(clk_i) is
    variable result : signed(width-1 downto 0) := (others => '0');
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        result_o   <= (width-1 downto 0 => '0');
        positive_o <= true;
        negative_o <= false;
      else
        if ce_i = '1' then
          result     := mux_result;

          positive_o <= result(result'left) = '0';
          negative_o <= result(result'left) = '1';
          result_o   <= result;
        end if;
      end if;

    end if;
  end process;

  mux_result <= a_i + b_i when (not sub_i) else a_i - b_i;

end architecture str;

-------------------------------------------------------------------------------
