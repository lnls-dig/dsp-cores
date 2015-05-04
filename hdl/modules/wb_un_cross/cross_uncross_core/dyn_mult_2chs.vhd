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
    clk_i   : in std_logic;
    rst_n_i : in std_logic;

    en_i : in std_logic;

    const_11_i : in std_logic_vector(15 downto 0);
    const_22_i : in std_logic_vector(15 downto 0);
    const_12_i : in std_logic_vector(15 downto 0);
    const_21_i : in std_logic_vector(15 downto 0);

    ch1_i : in std_logic_vector(15 downto 0);
    ch2_i : in std_logic_vector(15 downto 0);

    ch1_o : out std_logic_vector(15 downto 0);
    ch2_o : out std_logic_vector(15 downto 0)
    );
end dyn_mult_2chs;

architecture rtl of dyn_mult_2chs is

  constant c_sat : std_logic_vector(16 downto 0) := "0" & X"7FFF";
  constant c_one : signed(16 downto 0)           := to_signed(1, 17);

  signal en, en_old : std_logic;
  signal flag       : std_logic;

  signal ch11_mult : std_logic_vector(31 downto 0);
  signal ch22_mult : std_logic_vector(31 downto 0);
  signal ch12_mult : std_logic_vector(31 downto 0);
  signal ch21_mult : std_logic_vector(31 downto 0);

  signal ch11_mult_trunc : std_logic_vector(16 downto 0);
  signal ch22_mult_trunc : std_logic_vector(16 downto 0);
  signal ch12_mult_trunc : std_logic_vector(16 downto 0);
  signal ch21_mult_trunc : std_logic_vector(16 downto 0);

  signal ch11_mult_sat : std_logic_vector(15 downto 0);
  signal ch22_mult_sat : std_logic_vector(15 downto 0);
  signal ch12_mult_sat : std_logic_vector(15 downto 0);
  signal ch21_mult_sat : std_logic_vector(15 downto 0);

  signal pos_sat : signed(16 downto 0);
  signal neg_sat : signed(16 downto 0);

-- The unsigned constant inputs must have a '0' padded in the left side so they
-- can be multiplied with signed inputs using DSP48.

  signal const_11_s : std_logic_vector(16 downto 0) := '0' & const_11_i;
  signal const_22_s : std_logic_vector(16 downto 0) := '0' & const_22_i;
  signal const_12_s : std_logic_vector(16 downto 0) := '0' & const_12_i;
  signal const_21_s : std_logic_vector(16 downto 0) := '0' & const_21_i;
----------------------------------------------------------------
-- Component Declaration
----------------------------------------------------------------
  component generic_multiplier is
    generic (
      g_a_width : natural;
      g_b_width : natural;
      g_signed  : boolean;
      g_p_width : natural;
      g_levels  : natural);
    port (
      a_i     : in  std_logic_vector(g_a_width-1 downto 0);
      b_i     : in  std_logic_vector(g_b_width-1 downto 0);
      p_o     : out std_logic_vector(g_p_width-1 downto 0);
      ce_i    : in  std_logic;
      clk_i   : in  std_logic;
      reset_i : in  std_logic);
  end component generic_multiplier;

begin

----------------------------------------------------------------
-- Component instantiation
----------------------------------------------------------------

  mult11 : generic_multiplier
    generic map (
      g_a_width => 16,
      g_b_width => 17,
      g_signed  => true,
      g_p_width => 32,
      g_levels  => 7)
    port map (
      a_i     => ch1_i,
      b_i     => const_11_s,
      p_o     => ch11_mult,
      ce_i    => '1',
      clk_i   => clk_i,
      reset_i => '0');

  --mult11 : multiplier_u16x16_DSP        -- Signal 1 by channel 1
  --  port map (
  --    clk => clk_i,
  --    a   => ch1_i,
  --    b   => const_11_i,                -- UFIX_16_15
  --    p   => ch11_mult
  --    );

  mult22 : generic_multiplier
    generic map (
      g_a_width => 16,
      g_b_width => 17,
      g_signed  => true,
      g_p_width => 32,
      g_levels  => 7)
    port map (
      a_i     => ch2_i,
      b_i     => const_22_s,
      p_o     => ch22_mult,
      ce_i    => '1',
      clk_i   => clk_i,
      reset_i => '0');


  --mult22 : multiplier_u16x16_DSP        -- Signal 2 by channel 2
  --  port map (
  --    clk => clk_i,
  --    a   => ch2_i,
  --    b   => const_22_i,                -- UFIX_16_15
  --    p   => ch22_mult
  --    );

  mult12 : generic_multiplier
    generic map (
      g_a_width => 16,
      g_b_width => 17,
      g_signed  => true,
      g_p_width => 32,
      g_levels  => 7)
    port map (
      a_i     => ch1_i,
      b_      => const_12_s,
      p_o     => ch12_mult,
      ce_i    => '1',
      clk_i   => clk_i,
      reset_i => '0');

  --mult12 : multiplier_u16x16_DSP        -- Signal 1 by channel 2
  --  port map (
  --    clk => clk_i,
  --    a   => ch1_i,
  --    b   => const_12_i,                -- UFIX_16_15
  --    p   => ch12_mult
  --    );

  mult21 : generic_multiplier
    generic map (
      g_a_width => 16,
      g_b_width => 17,
      g_signed  => true,
      g_p_width => 32,
      g_levels  => 7)
    port map (
      a_i     => ch2_i,
      b_i     => const_21_s,
      p_o     => ch21_mult,
      ce_i    => '1',
      clk_i   => clk_i,
      reset_i => '0');

  --mult21 : multiplier_u16x16_DSP        -- Signal 2 by channel 1
  --  port map (
  --    clk => clk_i,
  --    a   => ch2_i,
  --    b   => const_21_i,                -- UFIX_16_15
  --    p   => ch21_mult
  --    );

  reg_en_proc : process(clk_i)
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

  inv_proc : process(clk_i)
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

-- Truncate data with 1 additional bit
  ch11_mult_trunc <= ch11_mult(31 downto 15);
  ch22_mult_trunc <= ch22_mult(31 downto 15);
  ch12_mult_trunc <= ch12_mult(31 downto 15);
  ch21_mult_trunc <= ch21_mult(31 downto 15);

-- Cut from project fmc-adc-100m14b4cha-gw, file hdl/adc/rtl/offset_gain_s.vhd.
-- Available at http://www.ohwr.org/projects/fmc-adc-100m14b4cha-gw/repository/
-- revisions/94c7ce240a/entry/hdl/adc/rtl/offset_gain.vhd
------------------------------------------------------------------------------
-- Saturate addition and multiplication result
------------------------------------------------------------------------------
  pos_sat <= signed(c_sat);
  neg_sat <= signed(not(pos_sat)) + c_one;

  p_saturate_ch11 : process (clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_n_i = '0') then
        ch11_mult_sat <= (others => '0');
      elsif signed(ch11_mult_trunc) >= pos_sat then
        ch11_mult_sat <= std_logic_vector(pos_sat(15 downto 0));  -- saturate positive
      elsif signed(ch11_mult_trunc) <= neg_sat then
        ch11_mult_sat <= std_logic_vector(neg_sat(15 downto 0));  -- saturate negative
      else
        ch11_mult_sat <= ch11_mult_trunc(15 downto 0);
      end if;
    end if;
  end process p_saturate_ch11;

  p_saturate_ch22 : process (clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_n_i = '0') then
        ch22_mult_sat <= (others => '0');
      elsif signed(ch22_mult_trunc) >= pos_sat then
        ch22_mult_sat <= std_logic_vector(pos_sat(15 downto 0));  -- saturate positive
      elsif signed(ch22_mult_trunc) <= neg_sat then
        ch22_mult_sat <= std_logic_vector(neg_sat(15 downto 0));  -- saturate negative
      else
        ch22_mult_sat <= ch22_mult_trunc(15 downto 0);
      end if;
    end if;
  end process p_saturate_ch22;

  p_saturate_ch12 : process (clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_n_i = '0') then
        ch12_mult_sat <= (others => '0');
      elsif signed(ch12_mult_trunc) >= pos_sat then
        ch12_mult_sat <= std_logic_vector(pos_sat(15 downto 0));  -- saturate positive
      elsif signed(ch12_mult_trunc) <= neg_sat then
        ch12_mult_sat <= std_logic_vector(neg_sat(15 downto 0));  -- saturate negative
      else
        ch12_mult_sat <= ch12_mult_trunc(15 downto 0);
      end if;
    end if;
  end process p_saturate_ch12;

  p_saturate_ch21 : process (clk_i)
  begin
    if rising_edge(clk_i) then
      if (rst_n_i = '0') then
        ch21_mult_sat <= (others => '0');
      elsif signed(ch21_mult_trunc) >= pos_sat then
        ch21_mult_sat <= std_logic_vector(pos_sat(15 downto 0));  -- saturate positive
      elsif signed(ch21_mult_trunc) <= neg_sat then
        ch21_mult_sat <= std_logic_vector(neg_sat(15 downto 0));  -- saturate negative
      else
        ch21_mult_sat <= ch21_mult_trunc(15 downto 0);
      end if;
    end if;
  end process p_saturate_ch21;

-- Output stage
  output_proc : process (clk_i)
  begin
    if (rising_edge(clk_i)) then
      if (rst_n_i = '0') then
        ch1_o <= ch11_mult_sat;
        ch2_o <= ch22_mult_sat;
      else
        if (flag = '1') then            -- inverted
          ch1_o <= ch12_mult_sat;
          ch2_o <= ch21_mult_sat;
        else
          ch1_o <= ch11_mult_sat;
          ch2_o <= ch22_mult_sat;
        end if;
      end if;
    end if;
  end process output_proc;

end rtl;

