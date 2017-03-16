------------------------------------------------------------------------------
-- Title      : BPM RF channels swapping controller
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Top level module for BPM RF channels swapping control. User
--              can dynamically set swapping/de-swapping mode, frequency and
--              de-swapping delay.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bpm_swap is
  generic(
    g_delay_vec_width         : natural := 8;
    g_swap_div_freq_vec_width : natural := 16;
    g_ch_width                : natural := 16
  );
  port(
    clk_i             : in  std_logic;
    rst_n_i           : in  std_logic;

    -- Input data from ADCs
    cha_i             : in  std_logic_vector(g_ch_width-1 downto 0);
    chb_i             : in  std_logic_vector(g_ch_width-1 downto 0);
    chc_i             : in  std_logic_vector(g_ch_width-1 downto 0);
    chd_i             : in  std_logic_vector(g_ch_width-1 downto 0);

    -- Output data to BPM DSP chain
    cha_o             : out std_logic_vector(g_ch_width-1 downto 0);
    chb_o             : out std_logic_vector(g_ch_width-1 downto 0);
    chc_o             : out std_logic_vector(g_ch_width-1 downto 0);
    chd_o             : out std_logic_vector(g_ch_width-1 downto 0);

    -- RFFE swap clock (or switchwing clock)
    rffe_swclk_o      : out std_logic;

    -- Swap mode setting
    swap_mode_i       : in  std_logic_vector(1 downto 0);

    -- Swap frequency settings
    swap_div_f_i      : in  std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
    swap_div_f_load_i : in  std_logic;
    swap_div_f_o      : out std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);

    -- De-swap delay setting
    deswap_delay_i    : in  std_logic_vector(g_delay_vec_width-1 downto 0)
  );
end bpm_swap;

architecture rtl of bpm_swap is

  signal swap         : std_logic;
  signal deswap       : std_logic;

  -------------------------------------------------------
  -- components declaration
  -------------------------------------------------------
  component swap_freqgen
  generic(
    g_delay_vec_width         : natural := 8;
    g_swap_div_freq_vec_width : natural := 16
  );
  port(
    clk_i              : in  std_logic;
    rst_n_i            : in  std_logic;
    swap_mode_i        : in  std_logic_vector(1 downto 0);
    swap_div_f_i       : in  std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
    swap_div_f_load_i  : in  std_logic;
    swap_div_f_o       : out std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
    deswap_delay_i     : in  std_logic_vector(g_delay_vec_width-1 downto 0);
    swap_o             : out std_logic;
    deswap_o           : out std_logic
    );
  end component;

  component deswap_channels
  port(
    clk_i    : in  std_logic;
    rst_n_i  : in  std_logic;
    deswap_i : in  std_logic;
    ch1_i    : in  std_logic_vector(g_ch_width-1 downto 0);
    ch2_i    : in  std_logic_vector(g_ch_width-1 downto 0);
    ch1_o    : out std_logic_vector(g_ch_width-1 downto 0);
    ch2_o    : out std_logic_vector(g_ch_width-1 downto 0)
    );
  end component;

begin
  -------------------------------------------------------
  -- components instantiation
  -------------------------------------------------------
  cmp_swap_freqgen : swap_freqgen
  generic map (
    g_delay_vec_width         => g_delay_vec_width,
    g_swap_div_freq_vec_width => g_swap_div_freq_vec_width
  )
  port map (
    clk_i              =>  clk_i,
    rst_n_i            =>  rst_n_i,
    swap_mode_i        =>  swap_mode_i,
    swap_div_f_i       =>  swap_div_f_i,
    swap_div_f_load_i  =>  swap_div_f_load_i,
    swap_div_f_o       =>  swap_div_f_o,
    deswap_delay_i     =>  deswap_delay_i,
    swap_o             =>  swap,
    deswap_o           =>  deswap
    );

  cmp_deswap_ac_channels : deswap_channels
  generic map (
    g_ch_width => g_ch_width
  )
  port map (
    clk_i     =>  clk_i,
    rst_n_i   =>  rst_n_i,
    deswap_i  =>  deswap,
    ch1_i     =>  cha_i,
    ch2_i     =>  chc_i,
    ch1_o     =>  cha_o,
    ch2_o     =>  chc_o
    );

  cmp_deswap_bd_channels : deswap_channels
  generic map (
    g_ch_width => g_ch_width
  )
  port map (
    clk_i     =>  clk_i,
    rst_n_i   =>  rst_n_i,
    deswap_i  =>  deswap,
    ch1_i     =>  chb_i,
    ch2_i     =>  chd_i,
    ch1_o     =>  chb_o,
    ch2_o     =>  chd_o
    );

  -------------------------------------------------------
  -- RTL logic
  -------------------------------------------------------
  -- RFFE v2 expects switching clock signal to be
  -- 'high' when in 'direct path' and 'low' when in 'inverted path'
  rffe_swclk_o <= not swap;

end;
