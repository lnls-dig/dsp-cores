------------------------------------------------------------------------------
-- Title      : Swapping Channel Pairs under Counter, Top entity
------------------------------------------------------------------------------
-- Author     : José Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description:  This design uses a counter to divide clock input frequency and
--              apply it as enable signal to swap the switches of rf_ch_swap
--              block. The counting constant is a generic parameter.
--               Is possible to select the blocks independently. This option
--              allow us to compare with x without swiching mode of channels to
--              see how useful is switching mode to mitigate board drifts.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-01-24  1.0      jose.berkenbrock      Created
-- 2013-01-25  1.1      jose.berkenbrock      Independently mode selection
-- 2013-01-30  1.1      jose.berkenbrock      Core description
-- 2013-02-14  1.2      jose.berkenbrock      Set enable divider as generic
-- 2013-02-18  2.0      jose.berkenbrock      New outputs swap and en_inv[2:1]
-- 2013-02-21  3.0      jose.berkenbrock      New flag output, en_inv supressed
-- 2013-02-22  4.0      jose.berkenbrock      New status out;flag/swap supressed
-- 2013-03-09  5.0      jose.berkenbrock      swap_div_f_i added
-- 2013-07-01  5.1      lucas.russo           Changed to synchronous resets
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library unisim;
--use unisim.vcomponents.all;

entity swap_cnt_top is
generic(
    --g_en_swap_div : natural := 1023
    g_swap_div_freq_vec_width : natural range 0 to 16 := 10
);
port(
    clk_i                                   : in  std_logic;
    rst_n_i                                 : in  std_logic;

    mode1_i                                 : in  std_logic_vector(1 downto 0);
    mode2_i                                 : in  std_logic_vector(1 downto 0);

    swap_div_f_i                            : in  std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);

    clk_swap_o                              : out std_logic;
    --blink_fmc                               : out std_logic;

    status1_o                               : out std_logic;
    status2_o                               : out std_logic;
    ctrl1_o                                 : out std_logic_vector(7 downto 0);
    ctrl2_o                                 : out std_logic_vector(7 downto 0)
  );
end swap_cnt_top;

architecture rtl of swap_cnt_top is

  component rf_ch_swap
  generic(
    g_direct      : std_logic_vector(7 downto 0) := "10100101";
    g_inverted    : std_logic_vector(7 downto 0) := "01011010");
  port(
    clk_i     :   in   std_logic;
    rst_n_i   :   in   std_logic;
    en_swap_i :   in   std_logic;
    mode_i    :   in   std_logic_vector(1 downto 0);
    status_o  :   out  std_logic;
    ctrl_o    :   out  std_logic_vector(7 downto 0)
  );
  end component;

signal  count                 : natural range 0 to 2**g_swap_div_freq_vec_width-1;
signal  cnst_swap_div_f       : natural range 0 to 2**g_swap_div_freq_vec_width-1;
signal  count2                : natural range 0 to 20000000;
signal  blink                 : std_logic;
signal  swap                  : std_logic;
signal  status1, status1_old  : std_logic;
signal  status2, status2_old  : std_logic;

begin

cnst_swap_div_f <= (to_integer(unsigned(swap_div_f_i))+1);
------------------------------------------------------------------
---- Mode Register
----------------------------------
--  p_reg_mode : process(clk_i)
--  begin
--    if rising_edge(clk_i) then
--      if rst_n_i = '0' then
--        s_mode <= (others => '0');
--      else
--         s_mode <= mode_i;
--      end if;
--    end if;
--  end process p_reg_mode;
----------------------------------------------------------------
-- Swapp_ch_rf Components Instantiation
----------------------------------------------------------------
  swapp_inst_1: rf_ch_swap
  port map (
    clk_i     => clk_i,
    rst_n_i   => rst_n_i,
    en_swap_i => swap,
    mode_i    => mode1_i,
    status_o  => status1,
    ctrl_o    => ctrl1_o
  );

  swapp_inst_2: rf_ch_swap
  port map (
    clk_i     => clk_i,
    rst_n_i   => rst_n_i,
    en_swap_i => swap,
    mode_i    => mode2_i,
    status_o  => status2,
    ctrl_o    => ctrl2_o
  );
----------------------------------------------------------------
  p_freq_swap : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        count <= 0;
        swap  <= '0';
      else
        if count = cnst_swap_div_f then
          count <= 0;
          swap  <= not swap;
        else
          count <= count + 1;
        end if;
      end if;
    end if;
  end process p_freq_swap;
----------------------------------------------------------------
  p_status : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        status1_old <= '0';
        status2_old <= '0';
      else
        status1_old <= status1;
        status2_old <= status2;
      end if;
    end if;
  end process p_status;
----------------------------------------------------------------

clk_swap_o  <= swap;
status1_o   <= status1 xor status1_old;
status2_o   <= status2 xor status2_old;

end;
