-------------------------------------------------------------------------------
-- Title      : Generic Multiplier
-- Project    :
-------------------------------------------------------------------------------
-- File       : generic_multiplier.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-02-25
-- Last update: 2015-10-15
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
use ieee.math_real.all;

-------------------------------------------------------------------------------

entity generic_multiplier is

  generic (
    g_a_width : natural := 16;          -- width for each input.
    g_b_width : natural := 16;

    g_signed : boolean := true;  -- signed or unsigned multiplication? Signed
    -- multiplication will have only one sign bit
    -- at the output

    g_p_width : natural := 16;          -- width for output. Must be less than
    -- g_a_width + g_b_width if unsigned,
    -- g_a_width+g_b_width-1 if signed.

    -- use round convergent or not
    g_round_convergent : natural := 0;

    g_levels : natural := 7);           -- Just multiplier pipeline. Total
                                        -- delay is levels +2

  port (
    a_i     : in  std_logic_vector(g_a_width-1 downto 0);
    b_i     : in  std_logic_vector(g_b_width-1 downto 0);
    valid_i : in  std_logic;
    p_o     : out std_logic_vector(g_p_width-1 downto 0);
    valid_o : out std_logic;
    ce_i    : in  std_logic;
    clk_i   : in  std_logic;
    reset_i : in  std_logic);

  attribute mult_style                       : string;
  attribute mult_style of generic_multiplier : entity is "pipe_block";

end entity generic_multiplier;

-------------------------------------------------------------------------------

architecture behavioural of generic_multiplier is
  constant c_product_width             : natural                                           := g_a_width + g_b_width;
  constant c_product_extra_bits        : natural                                           := c_product_width - g_p_width;
  constant c_zeros_extra_bits_m1       : std_logic_vector(c_product_extra_bits-2 downto 0) := (others => '0');
  constant c_product_extra_bits_mid    : std_logic_vector(c_product_extra_bits-1 downto 0) := '1' & c_zeros_extra_bits_m1;
  constant c_zeros_extra_bits_m2       : std_logic_vector(c_product_extra_bits-3 downto 0) := (others => '0');
  constant c_product_extra_bits_mid_m1 : std_logic_vector(c_product_extra_bits-2 downto 0) := '1' & c_zeros_extra_bits_m2;

  type pipe is array(g_levels-1 downto 0) of std_logic_vector(c_product_width-1 downto 0);
  type pipe_valid is array(g_levels-1 downto 0) of std_logic;

  signal a       : std_logic_vector(g_a_width-1 downto 0) := (others => '0');
  signal b       : std_logic_vector(g_b_width-1 downto 0) := (others => '0');
  signal valid_in : std_logic                             := '0';
  signal product : pipe                                   := (others => (others => '0'));
  signal product_full : std_logic_vector(c_product_width-1 downto 0) := (others => '0');
  signal valid        : pipe_valid                                   := (others => '0');
  signal valid_full   : std_logic                                    := '0';
  signal product_int  : std_logic_vector(c_product_width-1 downto 0) := (others => '0');
  signal product_out  : std_logic_vector(g_p_width-1 downto 0)       := (others => '0');
  signal valid_int    : std_logic                                    := '0';
  signal valid_out    : std_logic                                    := '0';
begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------

  -- Last stage of multiplication pipeline
  product_full <= product(g_levels-1);
  valid_full   <= valid(g_levels-1);

  multiplication : process(clk_i)

  begin
    if rising_edge(clk_i) then

      if reset_i = '1' then
        product_int <= (others => '0');
        valid_int <= '0';

      elsif ce_i = '1' then

        -- Instantiate a register before multiplier to improve speed
        a <= a_i;
        b <= b_i;
        valid_in <= valid_i;

        -- If both are signed, there are two signals. Drop the redundancy.
        if g_signed = true then
          product(0) <= std_logic_vector(signed(a) * signed(b));
          valid(0) <= valid_in;
          for n in 1 to g_levels-1 loop
            product(n) <= product(n-1);
            valid(n) <= valid(n-1);
          end loop;

          if g_p_width < c_product_width then
            product_int <= product_full;
            -- Keep "valid_int" grouped with "product_int" so we don't forget to keep them synchronized
            valid_int <= valid_full;

            -- Output stage. Generate convergent rounding or not
            if (g_round_convergent = 1) then
              if (unsigned(product_int(c_product_extra_bits-1 -1 downto 0)) = unsigned(c_product_extra_bits_mid_m1)) then
                product_out <= std_logic_vector(unsigned(product_int(c_product_width-2 downto c_product_extra_bits-1)) +
                                                unsigned'("" & product_int(c_product_extra_bits-1)));
              else
                product_out <= std_logic_vector(unsigned(product_int(c_product_width-2 downto c_product_extra_bits-1)) +
                                                unsigned'("" & product_int(c_product_extra_bits-1 -1)));
              end if;

              valid_out <= valid_int;
            else
              product_out <= product_int(c_product_width-2 downto c_product_extra_bits - 1);
              -- Keep "valid_int" grouped with "product_int" so we don't forget to keep them synchronized
              valid_out <= valid_int;
            end if;

          else
            product_int <= std_logic_vector(resize(signed(product_full), g_p_width));
            -- Keep "valid_int" grouped with "product_int" so we don't forget to keep them synchronized
            valid_int <= valid_full;

            -- Output stage
            product_out <= product_int;
            valid_out <= valid_int;
          end if;


        else
          product(0) <= std_logic_vector(unsigned(a) * unsigned(b));
          valid(0) <= valid_in;

          for n in 1 to g_levels-1 loop
            product(n) <= product(n-1);
            valid(n) <= valid(n-1);
          end loop;

          if g_p_width < c_product_width then
            product_int <= product_full(c_product_width-1 downto c_product_extra_bits);
            -- Keep "valid_int" grouped with "product_int" so we don't forget to keep them synchronized
            valid_int <= valid_full;

            -- Output stage. Generate convergent rounding or not
            if (g_round_convergent = 1) then
              if (unsigned(product_int(c_product_extra_bits-1 downto 0)) = unsigned(c_product_extra_bits_mid)) then
                product_out <= std_logic_vector(unsigned(product_int(c_product_width-1 downto c_product_extra_bits)) +
                                                unsigned'("" & product_int(c_product_extra_bits)));
              else
                product_out <= std_logic_vector(unsigned(product_int(c_product_width-1 downto c_product_extra_bits)) +
                                                unsigned'("" & product_int(c_product_extra_bits-1)));
              end if;

              valid_out <= valid_int;
            else
              product_out <= product_int(c_product_width-1 downto c_product_extra_bits);
              valid_out <= valid_int;
            end if;

          else
            product_int <= std_logic_vector(resize(signed(product_full), g_p_width));
            -- Keep "valid_int" grouped with "product_int" so we don't forget to keep them synchronized
            valid_int <= valid_full;

            -- Output stage
            product_out <= product_int;
            valid_out <= valid_int;
          end if;

        end if;

      end if;  -- reset
    end if;  -- clk
  end process multiplication;

  p_o <= product_out;
  valid_o <= valid_out;

end architecture behavioural;

-------------------------------------------------------------------------------
