-------------------------------------------------------------------------------
-- Title      : Generic Multiplier
-- Project    : 
-------------------------------------------------------------------------------
-- File       : generic_multiplier.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-02-25
-- Last update: 2014-04-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A multiplier where each input and output widths are determined
-- by generics. The inputs may be both unsigned, one signed or both signed, and
-- the ouput always have only one sign bit + MSBs.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-02-25  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity generic_multiplier is

  generic (
    g_a_width : natural := 16; -- width for each input.
    g_b_width : natural := 16;

    g_signed : boolean := true; -- signed or unsigned multiplication? Signed
                                -- multiplication will have only one sign bit
                                -- at the output

    g_p_width : natural := 16); -- width for output. Must be less than
                                -- g_a_width + g_b_width if unsigned,
                                -- g_a_width+g_b_width-1 if signed.

  port (
    a_i       : in  std_logic_vector(g_a_width-1 downto 0);
    b_i       : in  std_logic_vector(g_b_width-1 downto 0);
    p_o       : out std_logic_vector(g_p_width-1 downto 0);
    clk_i     : in  std_logic;
    reset_n_i : in  std_logic);

end entity generic_multiplier;

-------------------------------------------------------------------------------

architecture behavioural of generic_multiplier is

begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------
  multiplication : process(clk_i)
    constant c_product_width : natural := g_a_width + g_b_width;

    variable product : std_logic_vector(c_product_width-1 downto 0);
  begin
    if rising_edge(clk_i) then
      if reset_n_i = '0' then
        p_o <= (others => '0');
      else
        -- If both are signed, there are two signals. Drop the redundancy.
        if g_signed = true then
          product := std_logic_vector(signed(a_i) * signed(b_i));
          p_o     <= product(c_product_width-2 downto c_product_width - g_p_width - 1);

          else
          product := std_logic_vector(unsigned(a_i) * unsigned(b_i));
          p_o     <= product(c_product_width-1 downto c_product_width - g_p_width);

        end if;
      end if;  -- reset
    end if;  -- clk
  end process multiplication;

end architecture behavioural;

-------------------------------------------------------------------------------
