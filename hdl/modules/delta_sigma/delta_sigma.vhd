-------------------------------------------------------------------------------
-- Title      : Delta_sigma calculator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : delta_sigma.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-16
-- Last update: 2014-05-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module gets a,b,c and d values and calculates X, Y, Q and
-- SUM.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-16  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------

entity ds_first_stage is
  generic (
    g_width : natural := 32
    );
  port(
    a_i   : in  std_logic_vector(g_width-1 downto 0);
    b_i   : in  std_logic_vector(g_width-1 downto 0);
    c_i   : in  std_logic_vector(g_width-1 downto 0);
    d_i   : in  std_logic_vector(g_width-1 downto 0);
    clk_i : in  std_logic;
    ce_i  : in  std_logic;
    x_o   : out std_logic_vector(g_width-1 downto 0);
    y_o   : out std_logic_vector(g_width-1 downto 0);
    q_o   : out std_logic_vector(g_width-1 downto 0);
    sum_o : out std_logic_vector(g_width-1 downto 0)
    );
end entity ds_first_stage;

architecture behavioral of ds_first_stage is

begin

  stage1 : process(clk_i)
    variable a, b, c, d, x, y, q, sum : signed(g_width-1 downto 0);
  begin
    if rising_edge(clk_i) then
      if ce_i = '1' then
        a := signed(a_i); b := signed(b_i); c := signed(c_i); d := signed(d_i);

        x   := (b + c) - (a + d);
        y   := (a + b) - (c + d);
        q   := (a + c) - (b + d);
        sum := (a + b) + (c + d);

        x_o   <= std_logic_vector(x);
        y_o   <= std_logic_vector(y);
        q_o   <= std_logic_vector(q);
        sum_o <= std_logic_vector(sum);
      end if;
    end if;
  end process;

end architecture behavioral;  --ds_first_stage

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ds_output_stage is
  generic (
    g_width   : natural := 32;
    g_k_width : natural := 32
    );
  port(
    x_i       : in std_logic_vector(g_width-1 downto 0);
    kx_i      : in std_logic_vector(g_k_width-1 downto 0);
    x_valid_i : in std_logic;

    y_i       : in std_logic_vector(g_width-1 downto 0);
    ky_i      : in std_logic_vector(g_k_width-1 downto 0);
    y_valid_i : in std_logic;

    q_i       : in std_logic_vector(g_width-1 downto 0);
    q_valid_i : in std_logic;

    sum_i       : in std_logic_vector(g_width-1 downto 0);
    ksum_i      : in std_logic_vector(g_k_width-1 downto 0);
    sum_valid_i : in std_logic;

    clk_i : in std_logic;
    ce_i  : in std_logic;

    x_o   : out std_logic_vector(g_width-1 downto 0);
    y_o   : out std_logic_vector(g_width-1 downto 0);
    q_o   : out std_logic_vector(g_width-1 downto 0);
    sum_o : out std_logic_vector(g_width-1 downto 0)
    );
end entity ds_output_stage;

architecture behavioral of ds_output_stage is
  signal x_reg   : std_logic_vector(g_width-1 downto 0);
  signal y_reg   : std_logic_vector(g_width-1 downto 0);
  signal q_reg   : std_logic_vector(g_width-1 downto 0);
  signal sum_reg : std_logic_vector(g_width-1 downto 0);

begin

  process(clk_i)
    variable x_temp   : signed(g_width+g_k_width-1 downto 0);
    variable y_temp   : signed(g_width+g_k_width-1 downto 0);
    variable sum_temp : signed(g_width+g_k_width-1 downto 0);
  begin
    if rising_edge(clk_i) then
      if x_valid_i = '1' then
        x_temp := signed(x_i) * signed(kx_i);
        x_reg  <= std_logic_vector(x_temp(g_width+g_k_width-2 downto g_k_width-1));
      end if;

      if y_valid_i = '1' then
        y_temp := signed(y_i) * signed(ky_i);
        y_reg  <= std_logic_vector(y_temp(g_width+g_k_width-2 downto g_k_width-1));
      end if;

      if q_valid_i = '1' then
        q_reg <= q_i;
      end if;

      if sum_valid_i = '1' then
        sum_temp := signed(sum_i) * signed(ksum_i);
        sum_reg  <= std_logic_vector(sum_temp(g_width+g_k_width-2 downto g_k_width-1));
      end if;

      if ce_i = '1' then
        x_o   <= x_reg;
        y_o   <= y_reg;
        q_o   <= q_reg;
        sum_o <= sum_reg;
      end if;
    end if;
  end process;

end architecture behavioral;  --ds_output_stage


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delta_sigma is

  generic (
    g_width   : natural := 32;
    g_k_width : natural := 24
    );

  port (
    a_i    : in  std_logic_vector(g_width-1 downto 0);
    b_i    : in  std_logic_vector(g_width-1 downto 0);
    c_i    : in  std_logic_vector(g_width-1 downto 0);
    d_i    : in  std_logic_vector(g_width-1 downto 0);
    kx_i   : in  std_logic_vector(g_k_width-1 downto 0);
    ky_i   : in  std_logic_vector(g_k_width-1 downto 0);
    ksum_i : in  std_logic_vector(g_k_width-1 downto 0);
    clk_i  : in  std_logic;
    ce_i   : in  std_logic;
    rst_i  : in  std_logic;
    x_o    : out std_logic_vector(g_width-1 downto 0);
    y_o    : out std_logic_vector(g_width-1 downto 0);
    q_o    : out std_logic_vector(g_width-1 downto 0);
    sum_o  : out std_logic_vector(g_width-1 downto 0)
    );

end entity delta_sigma;

-------------------------------------------------------------------------------

architecture str of delta_sigma is

  signal x_pre : std_logic_vector(g_width-1 downto 0);
  signal y_pre : std_logic_vector(g_width-1 downto 0);
  signal q_pre : std_logic_vector(g_width-1 downto 0);
  signal sigma : std_logic_vector(g_width-1 downto 0);

  signal x_pos : std_logic_vector(g_width-1 downto 0);
  signal x_rdo : std_logic;
  signal y_pos : std_logic_vector(g_width-1 downto 0);
  signal y_rdo : std_logic;
  signal q_pos : std_logic_vector(g_width-1 downto 0);
  signal q_rdo : std_logic;

  component ds_first_stage is
    generic (
      g_width : natural);
    port (
      a_i   : in  std_logic_vector(g_width-1 downto 0);
      b_i   : in  std_logic_vector(g_width-1 downto 0);
      c_i   : in  std_logic_vector(g_width-1 downto 0);
      d_i   : in  std_logic_vector(g_width-1 downto 0);
      clk_i : in  std_logic;
      ce_i  : in  std_logic;
      x_o   : out std_logic_vector(g_width-1 downto 0);
      y_o   : out std_logic_vector(g_width-1 downto 0);
      q_o   : out std_logic_vector(g_width-1 downto 0);
      sum_o : out std_logic_vector(g_width-1 downto 0));
  end component ds_first_stage;

  component div_fixedpoint is
    generic (
      G_DATAIN_WIDTH : integer range 2 to 48;
      G_PRECISION    : integer range 1 to 47);
    port (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      n_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      d_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      q_o   : out std_logic_vector(G_PRECISION downto 0);
      r_o   : out std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      trg_i : in  std_logic;
      rdy_o : out std_logic;
      err_o : out std_logic);
  end component div_fixedpoint;

  component ds_output_stage is
    generic (
      g_width   : natural;
      g_k_width : natural);
    port (
      x_i         : in  std_logic_vector(g_width-1 downto 0);
      kx_i        : in  std_logic_vector(g_k_width-1 downto 0);
      x_valid_i   : in  std_logic;
      y_i         : in  std_logic_vector(g_width-1 downto 0);
      ky_i        : in  std_logic_vector(g_k_width-1 downto 0);
      y_valid_i   : in  std_logic;
      q_i         : in  std_logic_vector(g_width-1 downto 0);
      q_valid_i   : in  std_logic;
      sum_i       : in  std_logic_vector(g_width-1 downto 0);
      ksum_i      : in  std_logic_vector(g_k_width-1 downto 0);
      sum_valid_i : in  std_logic;
      clk_i       : in  std_logic;
      ce_i        : in  std_logic;
      x_o         : out std_logic_vector(g_width-1 downto 0);
      y_o         : out std_logic_vector(g_width-1 downto 0);
      q_o         : out std_logic_vector(g_width-1 downto 0);
      sum_o       : out std_logic_vector(g_width-1 downto 0));
  end component ds_output_stage;
  
begin  -- architecture str


  cmp_first_stage : ds_first_stage
    generic map (
      g_width => g_width)
    port map (
      a_i   => a_i,
      b_i   => b_i,
      c_i   => c_i,
      d_i   => d_i,
      clk_i => clk_i,
      ce_i  => ce_i,
      x_o   => x_pre,
      y_o   => y_pre,
      q_o   => q_pre,
      sum_o => sigma);

  cmp_divider_x : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      n_i   => x_pre,
      d_i   => sigma,
      q_o   => x_pos,
      r_o   => open,
      trg_i => ce_i,
      rdy_o => x_rdo,
      err_o => open);

  cmp_divider_y : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      n_i   => y_pre,
      d_i   => sigma,
      q_o   => y_pos,
      r_o   => open,
      trg_i => ce_i,
      rdy_o => y_rdo,
      err_o => open);

  cmp_divider_q : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      n_i   => q_pre,
      d_i   => sigma,
      q_o   => q_pos,
      r_o   => open,
      trg_i => ce_i,
      rdy_o => q_rdo,
      err_o => open);

  cmp_output_buffer : ds_output_stage
    generic map (
      g_width   => g_width,
      g_k_width => g_k_width)
    port map (
      x_i         => x_pos,
      kx_i        => kx_i,
      x_valid_i   => x_rdo,
      y_i         => y_pos,
      ky_i        => ky_i,
      y_valid_i   => y_rdo,
      q_i         => q_pre,
      q_valid_i   => q_rdo,
      sum_i       => sigma,
      ksum_i      => ksum_i,
      sum_valid_i => ce_i,
      clk_i       => clk_i,
      ce_i        => ce_i,
      x_o         => x_o,
      y_o         => y_o,
      q_o         => q_o,
      sum_o       => sum_o);

end architecture str;

-------------------------------------------------------------------------------
