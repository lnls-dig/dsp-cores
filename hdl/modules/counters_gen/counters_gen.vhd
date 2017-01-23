------------------------------------------------------------------------------
-- Title      : Simple Position Counters for debugging
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2017-01-20
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Core for generating coutners sync'ed with each incoming data rate.
-- Used for debugging.
-------------------------------------------------------------------------------
-- Copyright (c) 2017 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2017-01-20  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- Counter Generator Definitions
use work.counters_gen_pkg.all;

entity counters_gen is
generic
(
  g_cnt_width                               : t_cnt_width_array := c_default_cnt_width_array
)
port
(
  rst_n_i                                   : in std_logic;
  clk_i                                     : in std_logic;

  ---------------------------------
  -- Counter generation interface
  ---------------------------------
  cnt_ce_array_i                            : in std_logic_vector(g_cnt_width'length-1 downto 0);
  cnt_up_array_i                            : in std_logic_vector(g_cnt_width'length-1 downto 0);
  cnt_array_o                               : out t_cnt_array (g_cnt_width'length-1 downto 0)

);
end counters_gen;

architecture rtl of counters_gen is

  -- Constants
  constant c_num_counters                   : natural := g_cnt_width'length;

  -- Signals
  signal cnt_array                          : t_cnt_array (c_num_counters-1 downto 0);

begin

  gen_counters : for i in 0 to c_num_counters-1 generate

    p_counters : process(clk_i)
    begin
      if rising_edge(clk_i) then
        if rst_n_i = '0' then
          cnt_array(i) <= to_unsigned(0, cnt_array(i)'length);
        elsif cnt_ce_array_i(i) = '1' then

          if cnt_up_array_i(i) = '1' then
            if cnt_array(i) = 2**g_cnt_width(i)-1 then
              cnt_array(i) <= to_unsigned(0, cnt_array(i)'length);
            else
              cnt_array(i) <= cnt_array(i) + 1;
            end if;
          end if;

        end if;
      end if;
    end process;

  end generate;

  cnt_array_o <= cnt_array;

end rtl;
