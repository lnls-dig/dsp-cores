-------------------------------------------------------------------------------
-- Title      : Partial Delta_Sigma Calculator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : part_delta_sigma.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-15
-- Last update: 2015-07-15
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module gets a,b,c and d values and calculates X, Y, Q and
-- SUM using the partial delta/sigma method.
-------------------------------------------------------------------------------
-- Copyright (c) 2015     

-- This program is free software: you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program. If not, see
-- <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-07-15  1.0      finotti	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------

entity pds_first_stage is
  generic (
    g_width : natural := 32
    );
  port(
    a_i       : in  std_logic_vector(g_width-1 downto 0);
    b_i       : in  std_logic_vector(g_width-1 downto 0);
    c_i       : in  std_logic_vector(g_width-1 downto 0);
    d_i       : in  std_logic_vector(g_width-1 downto 0);
    clk_i     : in  std_logic;
    valid_i   : in  std_logic;
    valid_o   : out std_logic;
    ce_i      : in  std_logic;
    diff_ac_o : out std_logic_vector(g_width-1 downto 0);
    diff_db_o : out std_logic_vector(g_width-1 downto 0);
    q_o       : out std_logic_vector(g_width-1 downto 0);
    sum_o     : out std_logic_vector(g_width-1 downto 0);
    sum_ac_o  : out std_logic_vector(g_width-1 downto 0);
    sum_db_o  : out std_logic_vector(g_width-1 downto 0)
    );
end entity pds_first_stage;

architecture behavioral of pds_first_stage is
  signal diff_ba, diff_cd, diff_ac, diff_db : signed(g_width-1 downto 0);
  signal sum_ac, sum_db                     : signed(g_width-1 downto 0);
  signal valid_d0                           : std_logic := '0';
begin


  -- Using these formulas to calculate delta:
  -- x = (a-c) + (d-b)
  -- y = (a-c) + (d-b)
  -- q = (c-d) - (b-a)
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
        diff_ba  <= b - a;
        diff_cd  <= c - d;
--        diff_bd  <= b - d;
        diff_ac  <= a - c;
        diff_db  <= d - b;
--        sum_ab   <= a + b;
--        sum_db   <= d + b;
        sum_ac   <= a + c;
        sum_db   <= d + b;
        valid_d0 <= valid_i;

        -- Second cycle

--        x_o     <= std_logic_vector(diff_ac + something);
--        y_o     <= std_logic_vector(diff_ac + something);
        diff_ac_o <= std_logic_vector(diff_ac);
        diff_db_o <= std_logic_vector(diff_db);
        q_o       <= std_logic_vector(diff_cd - diff_ba);
        sum_o     <= std_logic_vector(sum_ac + sum_db);
        sum_ac_o  <= std_logic_vector(sum_ac);
        sum_db_o  <= std_logic_vector(sum_db);
        valid_o   <= valid_d0;
      end if;
    end if;
    
  end process;

end architecture behavioral;  --pds_first_stage

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pds_output_stage is
  generic (
    g_width   : natural := 32;
    g_k_width : natural := 32
    );
  port(
    diff_ac_i       : in std_logic_vector(g_width-1 downto 0);
    kx_i            : in std_logic_vector(g_k_width-1 downto 0);
    diff_ac_valid_i : in std_logic;

    diff_db_i       : in std_logic_vector(g_width-1 downto 0);
    ky_i            : in std_logic_vector(g_k_width-1 downto 0);
    diff_db_valid_i : in std_logic;

    q_i       : in std_logic_vector(g_width-1 downto 0);
    q_valid_i : in std_logic;

    sum_i       : in std_logic_vector(g_width-1 downto 0);
    ksum_i      : in std_logic_vector(g_k_width-1 downto 0);
    sum_valid_i : in std_logic;

    --sum_ac_i : in std_logic_vector(g_width-1 downto 0);
    --sum_db_i : in std_logic_vector(g_width-1 downto 0);

    clk_i : in std_logic;
    ce_i  : in std_logic;

    x_o     : out std_logic_vector(g_width-1 downto 0);
    y_o     : out std_logic_vector(g_width-1 downto 0);
    q_o     : out std_logic_vector(g_width-1 downto 0);
    sum_o   : out std_logic_vector(g_width-1 downto 0);
    valid_o : out std_logic
    );
end entity pds_output_stage;

architecture structural of pds_output_stage is

  signal x_pre_pipe, y_pre_pipe, x_pre, y_pre, q_pre, sum_pre : std_logic_vector(g_width-1 downto 0);
  signal valid                                                : std_logic;
  signal x_ce_valid, y_ce_valid, q_ce_valid, sum_ce_valid     : std_logic;

  signal x, y : signed (g_width-1 downto 0);

  attribute keep                                                  : string;
  attribute keep of x_pre_pipe, y_pre_pipe, x_pre, y_pre, sum_pre : signal is "true";

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
      reset_i : in  std_logic);
  end component generic_multiplier;
  
begin

  ----------------------------------------------------------------
  --Adding the Sum operation between ac and db to obtain x and y--
  ----------------------------------------------------------------

  adder1 : process(clk_i)
    variable ac, db : signed(g_width-1 downto 0);
  begin
    -- Remeber signals are only updated at the end of process

    if rising_edge(clk_i) then
      if ce_i = '1' then
        ac := signed(diff_ac_i); db := signed(diff_db_i);

        -- First cycle

        x <= ac + db;
        y <= ac - db;

        -- Second cycle

        x_pre_pipe <= std_logic_vector(x);
        y_pre_pipe <= std_logic_vector(y);

      end if;
    end if;
    
  end process;


  -- Input registers from division
  x_ce_valid <= ce_i and diff_ac_valid_i;
  cmp_x_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => x_pre_pipe,
      clk_i  => clk_i,
      ce_i   => x_ce_valid,
      data_o => x_pre);

  y_ce_valid <= ce_i and diff_db_valid_i;
  cmp_y_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => y_pre_pipe,
      clk_i  => clk_i,
      ce_i   => y_ce_valid,
      data_o => y_pre);

  sum_ce_valid <= ce_i and sum_valid_i;
  cmp_sum_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => sum_i,
      clk_i  => clk_i,
      ce_i   => sum_ce_valid,
      data_o => sum_pre);

  q_ce_valid <= ce_i and q_valid_i;
  cmp_q_input : pipeline
    generic map (
      g_width => g_width,
      g_depth => 1)
    port map (
      data_i => q_i,
      clk_i  => clk_i,
      ce_i   => q_ce_valid,
      data_o => q_pre);

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
      p_o     => x_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      reset_i => '0');

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
      reset_i => '0');

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
      p_o     => sum_o,
      ce_i    => ce_i,
      clk_i   => clk_i,
      reset_i => '0');

  -- The valid signal must go through the same number of registers as the other
  -- signals, which have the input register and through the ones inside the pipeline 
  cmp_valid_pipe : pipeline
    generic map (
      g_width => 1,
      g_depth => c_levels+3)
    port map (
      data_i(0) => q_valid_i,
      clk_i     => clk_i,
      ce_i      => ce_i,
      data_o(0) => valid_o);



end architecture structural;  --pds_output_stage

-------------------------------------------------------------------------------
-- Top level
-------------------------------------------------------------------------------                                        

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity part_delta_sigma is

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
    ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
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

end entity part_delta_sigma;

-------------------------------------------------------------------------------

architecture str of part_delta_sigma is

  signal diff_ac_pre : std_logic_vector(g_width-1 downto 0);
  signal diff_db_pre : std_logic_vector(g_width-1 downto 0);
  signal q_pre       : std_logic_vector(g_width-1 downto 0);
  signal sigma       : std_logic_vector(g_width-1 downto 0);
  signal sigma_ac    : std_logic_vector(g_width-1 downto 0);
  signal sigma_db    : std_logic_vector(g_width-1 downto 0);

  signal diff_ac_pos : std_logic_vector(g_width-1 downto 0);
  signal diff_ac_rdo : std_logic;
  signal diff_db_pos : std_logic_vector(g_width-1 downto 0);
  signal diff_db_rdo : std_logic;
  signal q_pos       : std_logic_vector(g_width-1 downto 0);
  signal q_rdo       : std_logic;

  signal valid_pre : std_logic;

  component pds_first_stage is
    generic (
      g_width : natural);
    port (
      a_i       : in  std_logic_vector(g_width-1 downto 0);
      b_i       : in  std_logic_vector(g_width-1 downto 0);
      c_i       : in  std_logic_vector(g_width-1 downto 0);
      d_i       : in  std_logic_vector(g_width-1 downto 0);
      clk_i     : in  std_logic;
      valid_i   : in  std_logic;
      valid_o   : out std_logic;
      ce_i      : in  std_logic;
      diff_ac_o : out std_logic_vector(g_width-1 downto 0);
      diff_db_o : out std_logic_vector(g_width-1 downto 0);
      q_o       : out std_logic_vector(g_width-1 downto 0);
      sum_o     : out std_logic_vector(g_width-1 downto 0);
      sum_ac_o  : out std_logic_vector(g_width-1 downto 0);
      sum_db_o  : out std_logic_vector(g_width-1 downto 0));
  end component pds_first_stage;

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

  component pds_output_stage is
    generic (
      g_width   : natural;
      g_k_width : natural);
    port (
      diff_ac_i       : in  std_logic_vector(g_width-1 downto 0);
      kx_i            : in  std_logic_vector(g_k_width-1 downto 0);
      diff_ac_valid_i : in  std_logic;
      diff_db_i       : in  std_logic_vector(g_width-1 downto 0);
      ky_i            : in  std_logic_vector(g_k_width-1 downto 0);
      diff_db_valid_i : in  std_logic;
      q_i             : in  std_logic_vector(g_width-1 downto 0);
      q_valid_i       : in  std_logic;
      sum_i           : in  std_logic_vector(g_width-1 downto 0);
      --sum_ac_i        : in  std_logic_vector(g_width-1 downto 0);
      --sum_db_i        : in  std_logic_vector(g_width-1 downto 0);
      ksum_i          : in  std_logic_vector(g_k_width-1 downto 0);
      sum_valid_i     : in  std_logic;
      clk_i           : in  std_logic;
      ce_i            : in  std_logic;
      x_o             : out std_logic_vector(g_width-1 downto 0);
      y_o             : out std_logic_vector(g_width-1 downto 0);
      q_o             : out std_logic_vector(g_width-1 downto 0);
      sum_o           : out std_logic_vector(g_width-1 downto 0);
      valid_o         : out std_logic);
  end component pds_output_stage;
  
begin  -- architecture str


  cmp_first_stage : pds_first_stage
    generic map (
      g_width => g_width)
    port map (
      a_i       => a_i,
      b_i       => b_i,
      c_i       => c_i,
      d_i       => d_i,
      clk_i     => clk_i,
      valid_i   => valid_i,
      valid_o   => valid_pre,
      ce_i      => ce_i,
      diff_ac_o => diff_ac_pre,
      diff_db_o => diff_db_pre,
      q_o       => q_pre,
      sum_o     => sigma,
      sum_ac_o  => sigma_ac,
      sum_db_o  => sigma_db);

  cmp_divider_ac : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => diff_ac_pre,
      d_i   => sigma_ac,
      q_o   => diff_ac_pos,
      r_o   => open,
      trg_i => valid_pre,
      rdy_o => diff_ac_rdo,
      err_o => open);

  cmp_divider_db : div_fixedpoint
    generic map (
      G_DATAIN_WIDTH => g_width,
      G_PRECISION    => g_width-1)
    port map (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => diff_db_pre,
      d_i   => sigma_db,
      q_o   => diff_db_pos,
      r_o   => open,
      trg_i => valid_pre,
      rdy_o => diff_db_rdo,
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

  cmp_output_buffer : pds_output_stage
    generic map (
      g_width   => g_width,
      g_k_width => g_k_width)
    port map (
      diff_ac_i       => diff_ac_pos,
      kx_i            => kx_i,
      diff_ac_valid_i => diff_ac_rdo,
      diff_db_i       => diff_db_pos,
      ky_i            => ky_i,
      diff_db_valid_i => diff_db_rdo,
      q_i             => q_pos,
      q_valid_i       => q_rdo,
      sum_i           => sigma,
      ksum_i          => ksum_i,
      sum_valid_i     => valid_pre,
      clk_i           => clk_i,
      ce_i            => ce_i,
      x_o             => x_o,
      y_o             => y_o,
      q_o             => q_o,
      sum_o           => sum_o,
      valid_o         => valid_o);

end architecture str;

-------------------------------------------------------------------------------
