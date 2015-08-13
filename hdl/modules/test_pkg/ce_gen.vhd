-------------------------------------------------------------------------------
-- Title      : Clock Enable Generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ce_gen.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-13
-- Last update: 2015-08-13
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Generates a clock enable signal after given number os input
-- clock cycles.
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Brazilian Synchrotron Light Laboratory, LNLS/CNPEM    

-- This program is free software: you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program. If not, see
-- <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-08-13  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

library work;
use work.wb_stream_pkg.all;

entity ce_gen is
  
  generic (
    g_clk_num : positive := 1);         -- number of clks until ce

  port (
    clk_i : in  std_ulogic;
    rst_i : in  std_ulogic;
    ce_o  : out std_ulogic);

end entity ce_gen;

architecture behavior of ce_gen is

  signal s_clk : std_ulogic := '0';
  signal s_rst : std_ulogic := '0';
  signal r_ce  : std_ulogic := '0';
  
begin  -- architecture behavior


  -- purpose: generetas ce signal
  -- type   : sequential
  -- inputs : clk, rst
  -- outputs: 
  ce_gen_process : process (s_clk) is
    variable ce_counter : natural range g_clk_num downto 0 := 0;
    
  begin  -- process ce_gen_process
    if rising_edge(s_clk) then
      if s_rst = '1' then
        ce_counter := 0;
        r_ce       <= '0';
      else
        ce_counter := ce_counter + 1;
        if ce_counter = g_clk_num then
          r_ce <= '1';
        else
          r_ce <= '0';
        end if;
      end if;
    end if;
  end process ce_gen_process;

  -- Connect signals to ports
  s_clk <= clk_i;
  s_rst <= rst_i;
  ce_o  <= r_ce;

end architecture behavior;
