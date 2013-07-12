------------------------------------------------------------------------------
-- Title      : Inverter of one Channel Pair
------------------------------------------------------------------------------
-- Author     : José Alvim Berkenbrock
-- Company    : CNPEM LNLS-DAC-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description:  This design takes a pair of channel from ADC converter and
--              inverts them.
--              The invertion occurs with rising edge of enable.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-02-18  1.0      jose.berkenbrock      Created
-- 2013-02-25  1.0      jose.berkenbrock      Changes in signals type
-- 2013-07-01  1.1      lucas.russo           Changed to synchronous resets
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inv_ch is
--generic(
--);
port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    en_i                                    :  in   std_logic;

    ch1_i                                   :  in   std_logic_vector(15 downto 0);
    ch2_i                                   :  in   std_logic_vector(15 downto 0);

    ch1_o                                   :  out  std_logic_vector(15 downto 0);
    ch2_o                                   :  out  std_logic_vector(15 downto 0));
end inv_ch;

architecture rtl of inv_ch is

signal en, en_old : std_logic;
signal flag       : std_logic;
----------------------------------------------------------------
begin
reg_en_proc: process(clk_i)
begin
  if  (rising_edge(clk_i)) then
    if (rst_n_i = '0') then
      en     <= '0';
      en_old <= '0';
    else
      en     <= en_i;
      en_old <= en;
    end if;
  end if;
end process reg_en_proc;
----------------------------------------------------------------
inv_proc: process(clk_i)
begin
  if  (rising_edge(clk_i)) then
    if (rst_n_i = '0') then
      flag <= '0';
    else
      if ((en = '1') and (en_old = '0')) then
        flag <= not flag;
      end if;
    end if;
  end if;
end process inv_proc;
----------------------------------------------------------------
output_proc: process (clk_i)
begin
  if  (rising_edge(clk_i)) then
    if (rst_n_i = '0') then
      ch1_o <= ch1_i;
      ch2_o <= ch2_i;
    else
      if (flag = '1') then
        ch1_o <= ch2_i;
        ch2_o <= ch1_i;
      else
        ch1_o <= ch1_i;
        ch2_o <= ch2_i;
      end if;
    end if;
  end if;
end process output_proc;
----------------------------------------------------------------
end;
