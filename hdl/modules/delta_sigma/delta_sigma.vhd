-------------------------------------------------------------------------------
-- Title      : Delta_sigma calculator
-- Project    :
-------------------------------------------------------------------------------
-- File       : delta_sigma.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-16
-- Last update: 2016-05-09
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

library work;
use work.dsp_cores_pkg.all;
-------------------------------------------------------------------------------

entity ds_first_stage is
  generic (
    g_width : natural := 32
    );
  port(
    a_i     : in  std_logic_vector(g_width-1 downto 0);
    b_i     : in  std_logic_vector(g_width-1 downto 0);
    c_i     : in  std_logic_vector(g_width-1 downto 0);
    d_i     : in  std_logic_vector(g_width-1 downto 0);
    clk_i   : in  std_logic;
    valid_i : in  std_logic;
    valid_o : out std_logic;
    ce_i    : in  std_logic;
    x_o     : out std_logic_vector(g_width-1 downto 0);
    y_o     : out std_logic_vector(g_width-1 downto 0);
    q_o     : out std_logic_vector(g_width-1 downto 0);
    sum_o   : out std_logic_vector(g_width-1 downto 0)
    );
end entity ds_first_stage;

architecture behavioral of ds_first_stage is
  signal diff_ab, diff_cd                   : signed(g_width-1 downto 0);
  signal sum_ab, sum_cd                     : signed(g_width-1 downto 0);
  signal valid_d0                           : std_logic := '0';
begin


  -- Using these formulas to calculate delta:
  -- x = (a-b) - (c-d)
  -- y = (a+b) - (c+d)
  -- q = (a-b) + (c-d)
  -- sum = a+b+c+d

  stage1 : process(clk_i)
    variable a, b, c, d : signed(g_width-1 downto 0);
  begin
    -- to avoid multiple stages of combinatorial logic, divide it between difference and sum.
    -- Remeber signals are only updated at the end of process

    if rising_edge(clk_i) then
      if ce_i = '1' then
        a := signed(a_i); b := signed(b_i); c := signed(c_i); d := signed(d_i);

        -- First cycle
        diff_ab  <= a - b;
        diff_cd  <= c - d;
        sum_ab   <= a + b;
        sum_cd   <= c + d;
        valid_d0 <= valid_i;

        -- Second cycle

        x_o     <= std_logic_vector(diff_ab - diff_cd);
        y_o     <= std_logic_vector(sum_ab  - sum_cd);
        q_o     <= std_logic_vector(diff_ab + diff_cd);
        sum_o   <= std_logic_vector(sum_ab  + sum_cd);
        valid_o <= valid_d0;
      end if;
    end if;

  end process;

end architecture behavioral;  --ds_first_stage

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

entity ds_k_scaling is
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

    x_o     : out std_logic_vector(g_width-1 downto 0);
    y_o     : out std_logic_vector(g_width-1 downto 0);
    q_o     : out std_logic_vector(g_width-1 downto 0);
    sum_o   : out std_logic_vector(g_width-1 downto 0);
    valid_o : out std_logic
    );
end entity ds_k_scaling;

architecture structural of ds_k_scaling is

  signal x_pre, y_pre, q_pre, sum_pre                                         : std_logic_vector(g_width-1 downto 0);
  signal x_valid_int, y_valid_int, q_valid_int, sum_valid_int                 : std_logic_vector(0 downto 0);
  signal x_valid_pre_int, y_valid_pre_int, q_valid_pre_int, sum_valid_pre_int : std_logic_vector(0 downto 0);
  signal x_valid_pre, y_valid_pre, q_valid_pre, sum_valid_pre                 : std_logic;
  signal x_valid                                                              : std_logic;
  signal y_valid                                                              : std_logic;
  signal q_valid                                                              : std_logic;
  signal sum_valid                                                            : std_logic;

  attribute keep                          : string;
  attribute keep of x_pre, y_pre, sum_pre : signal is "true";

  constant c_levels : natural := 7;


begin

  -- Input registers from division
  -- X pipeline
  cmp_x_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => x_i,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => x_pre);

  x_valid_int(0) <= x_valid_i;

  cmp_x_valid_input : pipeline
    generic map (
      g_width => 1,
      g_depth => 1)
    port map (
      data_i => x_valid_int,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => x_valid_pre_int);

  x_valid_pre <= x_valid_pre_int(0);

  -- Y pipeline
  cmp_y_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => y_i,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => y_pre);

  y_valid_int(0) <= y_valid_i;

  cmp_y_valid_input : pipeline
    generic map (
      g_width => 1,
      g_depth => 1)
    port map (
      data_i => y_valid_int,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => y_valid_pre_int);

  y_valid_pre <= y_valid_pre_int(0);

  -- Sum pipeline
  cmp_sum_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => sum_i,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => sum_pre);

  sum_valid_int(0) <= sum_valid_i;

  cmp_sum_valid_input : pipeline
    generic map (
      g_width => 1,
      g_depth => 1)
    port map (
      data_i => sum_valid_int,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => sum_valid_pre_int);

  sum_valid_pre <= sum_valid_pre_int(0);

  -- Q pipeline
  cmp_q_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => q_i,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => q_pre);

  q_valid_int(0) <= q_valid_i;

  cmp_q_valid_input : pipeline
    generic map (
      g_width => 1,
      g_depth => 1)
    port map (
      data_i => q_valid_int,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => q_valid_pre_int);

  q_valid_pre <= q_valid_pre_int(0);

  -- q is special: it won't be multiplied. So, it must be pipelined to level
  -- the delay of the other signals

  cmp_q_pipe : pipeline
    generic map (
      g_width => g_width,
      g_depth => c_levels+2)
    port map (
      data_i => q_pre,
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_o => q_o);

  cmp_mult_x : generic_multiplier
    generic map (
      g_a_width => g_width,
      g_b_width => g_k_width,
      g_signed  => true,
      g_p_width => g_width,
      g_levels  => c_levels)
    port map (
      a_i     => x_pre,
      b_i     => kx_i,
      valid_i => x_valid_pre,
      p_o     => x_o,
      valid_o => x_valid,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

  cmp_mult_y : generic_multiplier
    generic map (
      g_a_width => g_width,
      g_b_width => g_k_width,
      g_signed  => true,
      g_p_width => g_width,
      g_levels  => c_levels)
    port map (
      a_i     => y_pre,
      b_i     => ky_i,
      valid_i => y_valid_pre,
      p_o     => y_o,
      valid_o => y_valid,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

  cmp_mult_sum : generic_multiplier
    generic map (
      g_a_width => g_width,
      g_b_width => g_k_width,
      g_signed  => true,
      g_p_width => g_width,
      g_levels  => c_levels)
    port map (
      a_i     => sum_pre,
      b_i     => ksum_i,
      valid_i => sum_valid_pre,
      p_o     => sum_o,
      valid_o => sum_valid,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

  -- Output X, Y or Sum valid signal as the "valid_o"
  valid_o <= x_valid;


end architecture structural;  --ds_k_scaling

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;
use work.gencores_pkg.all;

entity ds_offset_scaling is
  generic (
    g_width        : natural := 32;
    g_offset_width : natural := 32);
  port(
    clk_i      : in std_logic;
    ce_i       : in std_logic;

    x_i        : in std_logic_vector(g_width-1 downto 0);
    y_i        : in std_logic_vector(g_width-1 downto 0);
    q_i        : in std_logic_vector(g_width-1 downto 0);
    sum_i      : in std_logic_vector(g_width-1 downto 0);
    valid_i    : in std_logic;

    offset_x_i : in std_logic_vector(g_offset_width-1 downto 0);
    offset_y_i : in std_logic_vector(g_offset_width-1 downto 0);

    x_o        : out std_logic_vector(g_width-1 downto 0);
    y_o        : out std_logic_vector(g_width-1 downto 0);
    q_o        : out std_logic_vector(g_width-1 downto 0);
    sum_o      : out std_logic_vector(g_width-1 downto 0);
    valid_o    : out std_logic);
end entity ds_offset_scaling;

architecture structural of ds_offset_scaling is

  constant c_levels : natural := 2+1; -- 2 clock cycles for gc_big_adder2 + 1 for registering

  signal offset_x_n         : std_logic_vector(g_width-1 downto 0);
  signal x_offset           : std_logic_vector(g_width-1 downto 0);
  signal x_offset_valid     : std_logic;
  signal x_offset_reg       : std_logic_vector(g_width-1 downto 0);
  signal x_offset_valid_reg : std_logic;

  signal offset_y_n         : std_logic_vector(g_width-1 downto 0);
  signal y_offset           : std_logic_vector(g_width-1 downto 0);
  signal y_offset_valid     : std_logic;
  signal y_offset_reg       : std_logic_vector(g_width-1 downto 0);

begin

  -- q and sum won't be subtracted. So, it must be pipelined to level
  -- the delay of the other signals

  cmp_q_pipe : pipeline
    generic map (
      g_width => g_width,
      g_depth => c_levels)
    port map (
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_i => q_i,
      data_o => q_o);

  cmp_sum_pipe : pipeline
    generic map (
      g_width => g_width,
      g_depth => c_levels)
    port map (
      clk_i  => clk_i,
      ce_i   => ce_i,
      data_i => sum_i,
      data_o => sum_o);

  ----------------------------------
  -- X Offset
  ----------------------------------
  cmp_x_offset_adder : gc_big_adder2
  generic map (
    g_data_bits  => g_width
  )
  port map (
    clk_i        => clk_i,
    ce_i         => ce_i,
    stall_i      => '0',
    valid_i      => valid_i,
    a_i          => x_i,
    b_i          => offset_x_n,
    c_i          => '1',
    x2_o         => x_offset,
    c2x2_valid_o => x_offset_valid);

  offset_x_n <= not offset_x_i;

  -- gc_big_adder2 outputs are unregistered. So register them.
  p_x_offset_reg : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if ce_i = '1' then
        x_offset_reg <= x_offset;
        x_offset_valid_reg <= x_offset_valid;
      end if;
    end if;
  end process;

  x_o <= x_offset_reg;
  valid_o <= x_offset_valid_reg;

  ----------------------------------
  -- Y Offset
  ----------------------------------
  cmp_y_offset_adder : gc_big_adder2
  generic map (
    g_data_bits  => g_width
  )
  port map (
    clk_i        => clk_i,
    ce_i         => ce_i,
    stall_i      => '0',
    valid_i      => valid_i,
    a_i          => y_i,
    b_i          => offset_y_n,
    c_i          => '1',
    x2_o         => y_offset);

  offset_y_n <= not offset_y_i;

  -- gc_big_adder2 outputs are unregistered. So register them.
  p_y_offset_reg : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if ce_i = '1' then
        y_offset_reg <= y_offset;
      end if;
    end if;
  end process;

  y_o <= y_offset_reg;

end architecture structural;  --ds_offset_scaling

-------------------------------------------------------------------------------
-- Top level
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

entity delta_sigma is

  generic (
    g_width   : natural := 32;
    g_k_width : natural := 24;
    g_offset_width : natural := 32
    );

  port (
    a_i     : in  std_logic_vector(g_width-1 downto 0);
    b_i     : in  std_logic_vector(g_width-1 downto 0);
    c_i     : in  std_logic_vector(g_width-1 downto 0);
    d_i     : in  std_logic_vector(g_width-1 downto 0);
    kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
    ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
    ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
    offset_x_i  : in std_logic_vector(g_offset_width-1 downto 0) := (others => '0');
    offset_y_i  : in std_logic_vector(g_offset_width-1 downto 0) := (others => '0');
    clk_i   : in  std_logic;
    ce_i    : in  std_logic;
    valid_i : in  std_logic;
    valid_o : out std_logic;
    rst_i   : in  std_logic;
    x_o     : out std_logic_vector(g_width-1 downto 0);
    y_o     : out std_logic_vector(g_width-1 downto 0);
    q_o     : out std_logic_vector(g_width-1 downto 0);
    sum_o   : out std_logic_vector(g_width-1 downto 0)
    );

end entity delta_sigma;

-------------------------------------------------------------------------------

architecture str of delta_sigma is

  signal x_pre : std_logic_vector(g_width-1 downto 0);
  signal y_pre : std_logic_vector(g_width-1 downto 0);
  signal q_pre : std_logic_vector(g_width-1 downto 0);
  signal sigma : std_logic_vector(g_width-1 downto 0);
  signal valid_pre : std_logic;

  signal x_pos : std_logic_vector(g_width-1 downto 0);
  signal x_rdo : std_logic;
  signal y_pos : std_logic_vector(g_width-1 downto 0);
  signal y_rdo : std_logic;
  signal q_pos : std_logic_vector(g_width-1 downto 0);
  signal q_rdo : std_logic;


  signal x_scaled     : std_logic_vector(g_width-1 downto 0);
  signal y_scaled     : std_logic_vector(g_width-1 downto 0);
  signal q_scaled     : std_logic_vector(g_width-1 downto 0);
  signal sigma_scaled : std_logic_vector(g_width-1 downto 0);
  signal valid_scaled : std_logic;

begin  -- architecture str


  cmp_first_stage : ds_first_stage
    generic map (
      g_width => g_width)
    port map (
      a_i     => a_i,
      b_i     => b_i,
      c_i     => c_i,
      d_i     => d_i,
      clk_i   => clk_i,
      valid_i => valid_i,
      valid_o => valid_pre,
      ce_i    => ce_i,
      x_o     => x_pre,
      y_o     => y_pre,
      q_o     => q_pre,
      sum_o   => sigma);

  -- x_pos, y_pos and q_pos are all G_PRECISION+1 bits width the
  -- MSB being the sign bit and the decimal point right next to it.
  --
  -- Example: x31 . x30 x29 ... x0
  --
  -- sign bit = x31
  -- decimal point = between x31 and x30

  cmp_divider_x : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => x_pre,
      d_i   => sigma,
      q_o   => x_pos,
      r_o   => open,
      trg_i => valid_pre,
      rdy_o => x_rdo,
      err_o => open);

  cmp_divider_y : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => y_pre,
      d_i   => sigma,
      q_o   => y_pos,
      r_o   => open,
      trg_i => valid_pre,
      rdy_o => y_rdo,
      err_o => open);

  cmp_divider_q : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => q_pre,
      d_i   => sigma,
      q_o   => q_pos,
      r_o   => open,
      trg_i => valid_pre,
      rdy_o => q_rdo,
      err_o => open);

  -- x, y and q are multipled by K factors which are
  -- g_k_width bits (integer), so the decimal point
  -- is shifted to the right by that same amount.

  cmp_k_scaling : ds_k_scaling
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
      q_i         => q_pos,
      q_valid_i   => q_rdo,
      sum_i       => sigma,
      ksum_i      => ksum_i,
      sum_valid_i => valid_pre,
      clk_i       => clk_i,
      ce_i        => ce_i,
      x_o         => x_scaled,
      y_o         => y_scaled,
      q_o         => q_scaled,
      sum_o       => sigma_scaled,
      valid_o     => valid_scaled);

  cmp_offset : ds_offset_scaling
    generic map (
      g_width        => g_width,
      g_offset_width => g_offset_width)
    port map (
      clk_i       => clk_i,
      ce_i        => ce_i,
      x_i         => x_scaled,
      y_i         => y_scaled,
      q_i         => q_scaled,
      sum_i       => sigma_scaled,
      valid_i     => valid_scaled,
      offset_x_i  => offset_x_i,
      offset_y_i  => offset_y_i,
      x_o         => x_o,
      y_o         => y_o,
      q_o         => q_o,
      sum_o       => sum_o,
      valid_o     => valid_o);

end architecture str;

-------------------------------------------------------------------------------
