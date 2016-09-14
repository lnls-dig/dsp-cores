------------------------------------------------------------------------------
-- Title      : BPM RF channels de-swapping
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Swap data channels when the deswap input signal is high; keep
--              channels paths unchanged otherwise.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deswap_channels is
  generic(
    g_num_bits  : natural := 16
  );
  port( 
    clk_i       : in   std_logic;
    rst_n_i     : in   std_logic;
  
    deswap_i    : in   std_logic;
  
    ch1_i       : in   std_logic_vector(g_num_bits-1 downto 0);
    ch2_i       : in   std_logic_vector(g_num_bits-1 downto 0);
  
    ch1_o       : out  std_logic_vector(g_num_bits-1 downto 0);
    ch2_o       : out  std_logic_vector(g_num_bits-1 downto 0)
  );
end deswap_channels;

architecture rtl of deswap_channels is
begin

  deswap_proc : process (clk_i)
  begin
    if  (rising_edge(clk_i)) then
      if (rst_n_i = '0') then
        ch1_o <= ch1_i;
        ch2_o <= ch2_i;
      else
        if (deswap_i = '1') then
          ch1_o <= ch2_i;
          ch2_o <= ch1_i;
        else
          ch1_o <= ch1_i;
          ch2_o <= ch2_i;
        end if;
      end if;
    end if;
  end process deswap_proc;

end;
