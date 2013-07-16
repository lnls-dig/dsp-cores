------------------------------------------------------------------------------
-- Title      : Delay to Invert one Channel pair
------------------------------------------------------------------------------
-- Author     : José Alvim Berkenbrock
-- Company    : CNPEM LNLS-DAC-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description:  This design counts a delay time which is the cnt_lmt_i input
--              multiplied by period of clk_i input.
--               The trigger input (trg_i) is a pulse what represents a change
--              in state of crossbar switch.
--               Only one pair of channels is covered by this core.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-02-18  1.0      jose.berkenbrock      Created
-- 2013-02-22  2.0      jose.berkenbrock      Swap_i supressed
-- 2013-07-01  2.1      lucas.russo           Changed to synchronous resets
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library unisim;
--use unisim.vcomponents.all;

entity delay_inv_ch is
generic(
    g_delay_vec_width : natural range 0 to 16 := 10
    );
port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    trg_i                                   :  in   std_logic;     --  trigger
    cnt_lmt_i                               :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
    --  counter limit
    en_o                                    :  out  std_logic
    );
end delay_inv_ch;

architecture rtl of delay_inv_ch is

signal count        : natural range 0 to 2**g_delay_vec_width-1;
signal cnst_cnt_lmt : natural range 0 to 2**g_delay_vec_width-1;
signal en           : std_logic;

begin

  cnst_cnt_lmt <= (to_integer(unsigned(cnt_lmt_i))+1);

  p_counter: process(clk_i)
  begin
    if (rising_edge(clk_i)) then
      if (rst_n_i = '0') then
        count <= 0;
      else
        if trg_i = '1' then
          count <= cnst_cnt_lmt;
        elsif count /= 0 then
          count <= count - 1;
        end if;
      end if;
    end if;
  end process p_counter;

  p_output : process(clk_i)
  begin
    if (rising_edge(clk_i)) then
      if rst_n_i = '0' then
         en <= '0';
      else
        if count = 1 then
          en <= '1';
        elsif count = 0 then
          en <= '0';
        end if;
      end if;
    end if;
  end process p_output;

  en_o <= en;

end rtl;
