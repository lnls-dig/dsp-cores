-------------------------------------------------------------------------------
-- Title      : Daphine calculator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : daphine.vhd
-- Author     : vfinotti
-- Company    : 
-- Created    : 2015-07-01
-- Last update: 2015-07-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module gets a,b,c and d values and calculates X and Y.
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author    Description
-- 2015-07-01  1.0      vfinotti  Created
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
    -- q_o     : out std_logic_vector(g_width-1 downto 0);
    -- sum_o   : out std_logic_vector(g_width-1 downto 0)
    sum_ac_o   : out std_logic_vector(g_width-1 downto 0)
    sum_db_o   : out std_logic_vector(g_width-1 downto 0)
    );
end entity ds_first_stage;

architecture behavioral of ds_first_stage is
  signal diff_ac, diff_db : signed(g_width-1 downto 0);
  signal sum_ac, sum_db                     : signed(g_width-1 downto 0);
  signal valid_d0                           : std_logic := '0';
begin


  -- Using these formulas to calculate delta:
  -- x = (a-c) + (d-b)
  -- y = (a-c) + (d-b)
  -- sum_ac = a+c
  -- sum_db = d+b
  
  stage1 : process(clk_i)
    variable a, b, c, d : signed(g_width-1 downto 0);
  begin
    -- to avoid multiple stages of combinatorial logic, divide it between difference and sum.
    -- Remeber signals are only updated at the end of process

    if rising_edge(clk_i) then
      if ce_i = '1' then
        a := signed(a_i); b := signed(b_i); c := signed(c_i); d := signed(d_i);

        -- First cycle
        diff_ac  <= a - c;
        diff_db  <= d - b;
        sum_ac   <= a + c;
        sum_db   <= d + b;
        valid_d0 <= valid_i;

        -- Second cycle

        x_o     <= std_logic_vector(diff_ac + diff_bd);
        y_o     <= std_logic_vector(diff_ac - diff_bd);
        -- q_o     <= std_logic_vector(diff_cd - diff_ba);
        -- sum_o   <= std_logic_vector(sum_ab + sum_cd);
        sum_ac_o   <= std_logic_vector(sum_ac);
        sum_db_o   <= std_logic_vector(sum_db);
        valid_o <= valid_d0;
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

--    q_i       : in std_logic_vector(g_width-1 downto 0);
--    q_valid_i : in std_logic;

--    sum_i       : in std_logic_vector(g_width-1 downto 0);
--    ksum_i      : in std_logic_vector(g_k_width-1 downto 0);
--    sum_valid_i : in std_logic;

    clk_i : in std_logic;
    ce_i  : in std_logic;

    x_o     : out std_logic_vector(g_width-1 downto 0);
    y_o     : out std_logic_vector(g_width-1 downto 0);
--    q_o     : out std_logic_vector(g_width-1 downto 0);
--    sum_o   : out std_logic_vector(g_width-1 downto 0);
    sum_ac_o   : out std_logic_vector(g_width-1 downto 0);
    sum_db_o   : out std_logic_vector(g_width-1 downto 0);
    valid_o : out std_logic
    );
end entity ds_output_stage;

architecture structural of ds_output_stage is

--  signal x_pre, y_pre, q_pre, sum_pre                     : std_logic_vector(g_width-1 downto 0);
  signal x_pre, y_pre                                     : std_logic_vector(g_width-1 downto 0);
  signal valid                                            : std_logic;
--  signal x_ce_valid, y_ce_valid, q_ce_valid, sum_ce_valid : std_logic;
  signal x_ce_valid, y_ce_valid                           : std_logic;
  
  attribute keep                          : string;
  
--  attribute keep of x_pre, y_pre, sum_pre : signal is "true";
  attribute keep of x_pre, y_pre        : signal is "true";
  
  constant c_levels : natural := 7;

  component pipeline is
    generic (
      g_width : natural;
      g_depth : natural);
    port (
      data_i : in  std_logic_vector(g_width-1 downto 0);
      clk_i  : in  std_logic;
      ce_i   : in  std_logic;
      data_o : out std_logic_vector(g_width-1 downto 0));
  end component pipeline;

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
      rst_i   : in  std_logic);
  end component generic_multiplier;
  
begin

  -- Input registers from division
  x_ce_valid <= ce_i and x_valid_i;
  cmp_x_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => x_i,
      clk_i  => clk_i,
      ce_i   => x_ce_valid,
      data_o => x_pre);

  y_ce_valid <= ce_i and y_valid_i;
  cmp_y_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => y_i,
      clk_i  => clk_i,
      ce_i   => y_ce_valid,
      data_o => y_pre);

--  sum_ce_valid <= ce_i and sum_valid_i;
--  cmp_sum_input : pipeline
--    generic map (
--      g_width => g_width,
--      g_depth => 1)
--    port map (
--      data_i => sum_i,
--      clk_i  => clk_i,
--      ce_i   => sum_ce_valid,
--      data_o => sum_pre);

--  q_ce_valid <= ce_i and q_valid_i;
--  cmp_q_input : pipeline
--    generic map (
--      g_width => g_width,
--      g_depth => 1)
--    port map (
--      data_i => q_i,
--      clk_i  => clk_i,
--      ce_i   => q_ce_valid,
--      data_o => q_pre);

  -- q is special: it won't be multiplied. So, it must be pipelined to level
  -- the delay of the other signals

--  cmp_q_pipe : pipeline
--    generic map (
--      g_width => g_width,
--      g_depth => c_levels+2)
--    port map (
--      data_i => q_pre,
--      clk_i  => clk_i,
--      ce_i   => ce_i,
--      data_o => q_o);

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
      p_o     => x_o,
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
      p_o     => y_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      rst_i   => '0');

--  cmp_mult_sum : generic_multiplier
--    generic map (
--      g_a_width => g_width,
--      g_b_width => g_k_width,
--      g_signed  => true,
--      g_p_width => g_width,
--      g_levels  => c_levels)
--    port map (
--      a_i     => sum_pre,
--      b_i     => ksum_i,
--      p_o     => sum_o,
--      ce_i    => ce_i,
--      clk_i   => clk_i,
--      rst_i   => '0');

  -- The valid signal must go through the same number of registers as the other
  -- signals, which have the input register and through the ones inside the pipeline 
--  cmp_valid_pipe : pipeline
--    generic map (
--      g_width => 1,
--      g_depth => c_levels+3)
--    port map (
--      data_i(0) => q_valid_i,
--      clk_i     => clk_i,
--      ce_i      => ce_i,
--      data_o(0) => valid_o);


end architecture structural;  --ds_output_stage

-------------------------------------------------------------------------------
-- Top level
-------------------------------------------------------------------------------                                        

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity daphine is

  generic (
    g_width   : natural := 32;
    g_k_width : natural := 24
    );

  port (
    a_i     : in  std_logic_vector(g_width-1 downto 0);
    b_i     : in  std_logic_vector(g_width-1 downto 0);
    c_i     : in  std_logic_vector(g_width-1 downto 0);
    d_i     : in  std_logic_vector(g_width-1 downto 0);
    kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
    ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
--    ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
    clk_i   : in  std_logic;
    ce_i    : in  std_logic;
    valid_i : in  std_logic;
    valid_o : out std_logic;
    rst_i   : in  std_logic;
    x_o     : out std_logic_vector(g_width-1 downto 0);
    y_o     : out std_logic_vector(g_width-1 downto 0);
--    q_o     : out std_logic_vector(g_width-1 downto 0);
--    sum_o   : out std_logic_vector(g_width-1 downto 0);
    sum_ac_o   : out std_logic_vector(g_width-1 downto 0);
    sum_db_o   : out std_logic_vector(g_width-1 downto 0);
    );

end entity daphine;

-------------------------------------------------------------------------------

architecture str of daphine is

  signal x_pre : std_logic_vector(g_width-1 downto 0);
  signal y_pre : std_logic_vector(g_width-1 downto 0);
--  signal q_pre : std_logic_vector(g_width-1 downto 0);
  signal sigma_ac : std_logic_vector(g_width-1 downto 0);
  signal sigma_db : std_logic_vector(g_width-1 downto 0);

  signal x_pos : std_logic_vector(g_width-1 downto 0);
  signal x_rdo : std_logic;
  signal y_pos : std_logic_vector(g_width-1 downto 0);
  signal y_rdo : std_logic;
--  signal q_pos : std_logic_vector(g_width-1 downto 0);
--  signal q_rdo : std_logic;

  signal valid_pre : std_logic;

  component ds_first_stage is
    generic (
      g_width : natural);
    port (
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
--      q_o     : out std_logic_vector(g_width-1 downto 0);
--      sum_o   : out std_logic_vector(g_width-1 downto 0));
      sum_ac_o   : out std_logic_vector(g_width-1 downto 0);
      sum_db_o   : out std_logic_vector(g_width-1 downto 0);
  end component ds_first_stage;

  component div_fixedpoint is
    generic (
      G_DATAIN_WIDTH : integer range 2 to 48;
      G_PRECISION    : integer range 1 to 47);
    port (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
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
--      q_i         : in  std_logic_vector(g_width-1 downto 0);
--      q_valid_i   : in  std_logic;
--      sum_i       : in  std_logic_vector(g_width-1 downto 0);
--      ksum_i      : in  std_logic_vector(g_k_width-1 downto 0);
--      sum_valid_i : in  std_logic;
      clk_i       : in  std_logic;
      ce_i        : in  std_logic;
      x_o         : out std_logic_vector(g_width-1 downto 0);
      y_o         : out std_logic_vector(g_width-1 downto 0);
--      q_o         : out std_logic_vector(g_width-1 downto 0);
--      sum_o       : out std_logic_vector(g_width-1 downto 0);
      sum_ac_o   : out std_logic_vector(g_width-1 downto 0);
      sum_db_o   : out std_logic_vector(g_width-1 downto 0);
      valid_o     : out std_logic);
  end component ds_output_stage;
  
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
--      q_o     => q_pre,
--      sum_o   => sigma);
      sum_ac_o   => sigma_ac,
      sum_bd_o   => sigma_bd);

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

--  --cmp_divider_q : div_fixedpoint
  --  generic map (
  --    G_DATAIN_WIDTH => g_width,
  --    G_PRECISION    => g_width-1)
  --  port map (
  --    clk_i => clk_i,
  --    rst_i => rst_i,
  --    ce_i  => ce_i,
  --    n_i   => q_pre,
  --    d_i   => sigma,
  --    q_o   => q_pos,
  --    r_o   => open,
  --    trg_i => valid_pre,
  --    rdy_o => q_rdo,
  --    err_o => open);

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
--      q_i         => q_pos,
--      q_valid_i   => q_rdo,
--      sum_i       => sigma,
--      ksum_i      => ksum_i,
--      sum_valid_i => valid_pre,
      clk_i       => clk_i,
      ce_i        => ce_i,
      x_o         => x_o,
      y_o         => y_o,
--      q_o         => q_o,
--      sum_o       => sum_o,
      sum_ac_o       => sum_ac_o,
      sum_db_o       => sum_db_o,
      valid_o     => valid_o);

end architecture str;

-------------------------------------------------------------------------------
