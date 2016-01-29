------------------------------------------------------------------------------
-- Title      : Position Calcualtion Error Counters
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2014-01-13
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Simple counters for errors on the DSP chain
-------------------------------------------------------------------------------
-- Copyright (c) 2014 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2014-01-13  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

entity position_calc_counters_single is
generic (
  g_cntr_size                               : natural := 16
);
port (
  fs_clk2x_i                                : in std_logic; -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
  fs_rst2x_n_i                              : in std_logic;

  -- Clock enable
  ce_i                                      : in std_logic;

  -- Error inputs (one clock cycle long)
  err1_i                                    : in std_logic;
  -- Counter clear
  cntr_clr_i                                : in std_logic;

  -- Output counter
  cntr_o                                    : out std_logic_vector(g_cntr_size-1 downto 0)
);
end position_calc_counters_single;

architecture rtl of position_calc_counters_single is

  signal cntr_clr_int                       : std_logic;
  signal cntr_int                           : unsigned(g_cntr_size-1 downto 0);

begin

 -- Hold counter clear until it is visible by the remaing of logic with
 -- clock enable

  p_hold_clr : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        cntr_clr_int <= '0';
      else
        if cntr_clr_i = '1' then
          cntr_clr_int <= '1';
        elsif ce_i = '1' then
          cntr_clr_int <= '0';
        end if;
      end if;
    end if;
  end process;

  p_ctnr : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        cntr_int <= to_unsigned(0, cntr_int'length);
      elsif ce_i = '1' then
        if cntr_clr_int = '1' then
          cntr_int <= to_unsigned(0, cntr_int'length);
        elsif err1_i = '1' then
          cntr_int <= cntr_int + 1;
        end if;
      end if;
    end if;
  end process;

  -- Output counters
  cntr_o <= std_logic_vector(cntr_int);

end rtl;
