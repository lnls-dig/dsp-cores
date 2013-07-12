------------------------------------------------------------------------------
-- Title      : RF channels Swapping
------------------------------------------------------------------------------
-- Author     : José Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: This core controls the swapping mechanism for ONE pair of
--              channels. It is possible swapping channels inputs @ clk_in_ext
--              frequency or stay fixed at direct/inverted/off position.
--
--              MODE: 00 turned off, 01 direct, 10 inverted and 11 Swapping.
--
--              CTRL: b1b0d1d0
--              This core was developed to Sirus Synchrotron Light Source.
--              The BPM RFFE uses HSWA2-30DR+ switches and are controlled by
--              arrangement of bits in CTRL.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2012-10-18  1.0      jose.berkenbrock      Created
-- 2012-10-20  1.1      daniel.tavares        Revised
-- 2013-02-22  2.0      jose.berkenbrock      New status output
-- 2013-07-01  2.1      lucas.russo           Changed to synchronous resets
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rf_ch_swap is
generic
(
    g_direct                                : std_logic_vector(7 downto 0) := "10100101";
    g_inverted                              : std_logic_vector(7 downto 0) := "01011010"
);
port(
  clk_i                                     :    in  std_logic;
  rst_n_i                                   :    in  std_logic;
  en_swap_i                                 :    in  std_logic;
  mode_i                                    :    in  std_logic_vector(1 downto 0);
  status_o                                  :    out std_logic;
  ctrl_o                                    :    out std_logic_vector(7 downto 0));
end rf_ch_swap;

architecture rtl of rf_ch_swap is

signal status   :    std_logic;
signal ctrl     :    std_logic_vector(7 downto 0);

begin
--------------------------------
-- Input Register
--------------------------------
--  p_reg_mode : process(clk_i)
--  begin
--    if rising_edge(clk_i) then
--      if rst_n_i = '0' then
--        s_mode <= (others => '0');
--      else
--        s_mode <= mode_i;
--      end if;
--    end if;
--  end process p_reg_mode;
--------------------------------
-- Swapping Process
--------------------------------
  p_swap : process(clk_i)
  begin
  if rising_edge(clk_i) then
    if rst_n_i = '0' then
      ctrl <= "00000000";
    else
      case mode_i is

        when "11" =>            -- crossed Swapping
          if en_swap_i = '0' then
            ctrl <= g_direct;
          else
            ctrl <= g_inverted;
          end if;

        when "10" =>             -- inverted
          ctrl <= g_inverted;

        when "01" =>             -- direct
          ctrl <= g_direct;

        when others =>
          ctrl <= (others=>'0'); -- Swapping off
      end case;
    end if;
  end if;
  end process p_swap;
--------------------------------
-- Status Flag Process
--------------------------------
  p_status_flag : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        status <= '0';
      else
        if ctrl = g_direct then
          status <= '0';
        elsif ctrl = g_inverted then
          status <= '1';
        end if;
      end if;
    end if;
   end process p_status_flag;
--------------------------------
-- Output Register
--------------------------------
  p_output : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        ctrl_o   <= (others => '0');        -- rst_n_i = 0 => Swapping off
        status_o <= '0';
      else
        ctrl_o   <= ctrl;
        status_o <= status;
      end if;
    end if;
  end process p_output;
--------------------------------
end rtl;
