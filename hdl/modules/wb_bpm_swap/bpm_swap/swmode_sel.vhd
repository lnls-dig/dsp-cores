------------------------------------------------------------------------------
-- Title      : BPM RF channels swapping and de-swapping mode selector
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Select among distinct swapping and de-swapping modes affecting
--              how the swap master clock is propagated to the swap and de-swap
--              output signals.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- DSP Cores
use work.dsp_cores_pkg.all;

entity swmode_sel is
port(
  clk_i                                     :    in  std_logic;
  rst_n_i                                   :    in  std_logic;
  
  -- Swap master clock
  clk_swap_i                                :    in  std_logic;

  -- Swap and de-swap signals
  swap_o                                    :    out std_logic;
  deswap_o                                  :    out std_logic;
  
  -- Swap mode setting
  swap_mode_i                               :    in  t_swap_mode
);
end swmode_sel;

architecture rtl of swmode_sel is

  signal swap   : std_logic;
  signal deswap : std_logic;

begin
  p_swap_mode : process(clk_i)
  begin
  if rising_edge(clk_i) then
    if rst_n_i = '0' then
      swap <= '0';
      deswap <= '0';
    else
      case swap_mode_i is
        when c_swmode_swap_deswap =>
          if clk_swap_i = '1' then
            swap <= '1';
            deswap <= '1';
          else
            swap <= '0';
            deswap <= '0';
          end if;

        when c_swmode_static_direct =>
          swap <= '0';
          deswap <= '0';

        when c_swmode_static_inverted =>
          swap <= '1';
          deswap <= '0';

        when c_swmode_rffe_swap =>
          if clk_swap_i = '1' then
            swap <= '1';
          else
            swap <= '0';
          end if;

          deswap <= '0';
      end case;
    end if;
  end if;
  end process p_swap_mode;

  swap_o   <= swap;
  deswap_o <= deswap;

end rtl;
