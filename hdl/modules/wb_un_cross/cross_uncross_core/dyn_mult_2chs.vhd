------------------------------------------------------------------------------
-- Title      : Dynamic Multiplication in One Channel Pair
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DAC-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description:  This design does what we call, dynamic multiplication. It
--              means that we have a specific multiplicator for each
--              different RF channel took by signal.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-03-12  1.0      jose.berkenbrock      Created
-- 2013-03-17  1.1      jose.berkenbrock      Output Changed
-- 2013-07-01  1.2      lucas.russo           Changed to synchronous resets
-------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity dyn_mult_2chs is
port(
    clk_i                                   :  in   std_logic;
    rst_n_i                                 :  in   std_logic;

    en_i                                    :  in   std_logic;

    const_11_i                              :  in   std_logic_vector(9 downto 0);
    const_22_i                              :  in   std_logic_vector(9 downto 0);
    const_12_i                              :  in   std_logic_vector(9 downto 0);
    const_21_i                              :  in   std_logic_vector(9 downto 0);

    ch1_i                                   :  in   std_logic_vector(15 downto 0);
    ch2_i                                   :  in   std_logic_vector(15 downto 0);

    ch1_o                                   :  out  std_logic_vector(15 downto 0);
    ch2_o                                   :  out  std_logic_vector(15 downto 0)
   );
end dyn_mult_2chs;

architecture rtl of dyn_mult_2chs is

signal en, en_old : std_logic;
signal flag       : std_logic;

signal ch11_mult  : std_logic_vector(25 downto 0);
signal ch22_mult  : std_logic_vector(25 downto 0);
signal ch12_mult  : std_logic_vector(25 downto 0);
signal ch21_mult  : std_logic_vector(25 downto 0);

----------------------------------------------------------------
-- Component Declaration
----------------------------------------------------------------

component multiplier_16x10_DSP
  port (
    clk : in  std_logic;
    a   : in  std_logic_vector(15 downto 0);
    b   : in  std_logic_vector(9 downto 0);
    p   : out std_logic_vector(25 downto 0)
  );
end component;


begin

----------------------------------------------------------------
-- Component instantiation
----------------------------------------------------------------

  mult11 : multiplier_16x10_DSP -- Signal 1 by channel 1
    port map (
      clk => clk_i,
      a   => ch1_i,
      b   => const_11_i,
      p   => ch11_mult
    );

  mult22 : multiplier_16x10_DSP -- Signal 2 by channel 2
    port map (
      clk => clk_i,
      a   => ch2_i,
      b   => const_22_i,
      p   => ch22_mult
    );

  mult12 : multiplier_16x10_DSP -- Signal 1 by channel 2
    port map (
      clk => clk_i,
      a   => ch1_i,
      b   => const_12_i,
      p   => ch12_mult
    );

  mult21 : multiplier_16x10_DSP -- Signal 2 by channel 1
    port map (
      clk => clk_i,
      a   => ch2_i,
      b   => const_21_i,
      p   => ch21_mult
    );

reg_en_proc: process(clk_i)
begin
  if (rising_edge(clk_i)) then
    if (rst_n_i = '0') then
      en     <= '0';
      en_old <= '0';
    else
      en     <= en_i;
      en_old <= en;
    end if;
  end if;
end process reg_en_proc;

inv_proc: process(clk_i)
begin
  if (rising_edge(clk_i)) then
    if (rst_n_i = '0') then
      flag <= '0';
    else
      if ((en = '1') and (en_old = '0')) then
        flag <= not flag;
      end if;
    end if;
  end if;
end process inv_proc;

output_proc: process (clk_i)
begin
  if (rising_edge(clk_i)) then
    if (rst_n_i = '0') then
      ch1_o <= ch11_mult(15 downto 0);
      ch2_o <= ch22_mult(15 downto 0);
    else
      if (flag = '1') then -- inverted
        ch1_o <= ch12_mult(15 downto 0);
        ch2_o <= ch21_mult(15 downto 0);
      else
        ch1_o <= ch11_mult(15 downto 0);
        ch2_o <= ch22_mult(15 downto 0);
      end if;
    end if;
  end if;
end process output_proc;

end rtl;

