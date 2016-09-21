------------------------------------------------------------------------------
-- Title      : BPM RF channels swapping and de-swapping frequency generator
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Generate swap and de-swap signals for given swapping frequency
--              and de-swapping delay settings.
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

entity swap_freqgen is
  generic(
    g_delay_vec_width                       : natural := 8;
    g_swap_div_freq_vec_width               : natural := 16
  );
  port(
    clk_i                                   : in  std_logic;
    rst_n_i                                 : in  std_logic;
  
    -- Swap and de-swap signals
    swap_o                                  : out std_logic;
    deswap_o                                : out std_logic;
  
    -- Swap mode setting
    swap_mode_i                             : in  t_swap_mode;
  
    -- Swap frequency settings
    swap_div_f_i                            : in  std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
    swap_div_f_load_i                       : in  std_logic;
    swap_div_f_o                            : out std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
  
    -- De-swap delay setting
    deswap_delay_i                          : in  std_logic_vector(g_delay_vec_width-1 downto 0)
  );
end swap_freqgen;

architecture rtl of swap_freqgen is

  component swmode_sel
    port(
      clk_i       : in  std_logic;
      rst_n_i     : in  std_logic;
      clk_swap_i  : in  std_logic;
      swap_mode_i : in  t_swap_mode;
      swap_o      : out std_logic;
      deswap_o    : out std_logic
    );
  end component;

  component gc_shiftreg
    generic (
      g_size : integer
      );
    port (
      clk_i : in  std_logic;
      en_i  : in  std_logic;
      d_i   : in  std_logic;
      q_o   : out std_logic;
      a_i   : in  std_logic_vector
    );
  end component;

  signal count           : natural range 0 to 2**g_swap_div_freq_vec_width-1;
  signal cnst_swap_div_f : natural range 0 to 2**g_swap_div_freq_vec_width-1;
  signal swap_div_f_reg  : std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
  signal clk_swap        : std_logic;
  signal deswap          : std_logic;

begin
  ----------------------------------------------------------------
  -- components instantiation
  ----------------------------------------------------------------
  cmp_swmode_sel: swmode_sel
  port map (
    clk_i        =>  clk_i,
    rst_n_i      =>  rst_n_i,
    clk_swap_i   =>  clk_swap,
    swap_mode_i  =>  swap_mode_i,
    swap_o       =>  swap_o,
    deswap_o     =>  deswap
  );

  cmp_gc_shiftreg: gc_shiftreg
  generic map (
    g_size  =>  2**g_delay_vec_width
  )            
  port map (   
    clk_i   =>  clk_i,
    en_i    =>  '1',
    d_i     =>  deswap,
    q_o     =>  deswap_o,
    a_i     =>  deswap_delay_i
  );

  ----------------------------------------------------------------
  -- RTL logic
  ----------------------------------------------------------------
  p_swap_div_load : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        swap_div_f_reg <= (others => '0');
      else
        if swap_div_f_load_i = '1' then
          swap_div_f_reg <= swap_div_f_i;
        end if;
      end if;
  end if;
  end process p_swap_div_load;

  swap_div_f_o <= swap_div_f_reg;

  p_reg_swap_div : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        cnst_swap_div_f <= 0;
      else
        cnst_swap_div_f <= (to_integer(unsigned(swap_div_f_reg))-1);
      end if;
    end if;
  end process p_reg_swap_div;

  p_freq_swap : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        count <= 0;
        clk_swap  <= '1';
      else
        -- Clear SW counter if we received a new SW divider period
        -- This is important to ensure that we don't swap signals
        -- between crossed antennas
        if swap_div_f_load_i = '1' then
          count <= 0;
          clk_swap <= '1';
        elsif count = cnst_swap_div_f then
          count <= 0;
          clk_swap  <= not clk_swap;
        else
          count <= count + 1;
        end if;
      end if;
    end if;
  end process p_freq_swap;
  
end;
