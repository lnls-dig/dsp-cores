-------------------------------------------------------------------------------
-- Title      : Partial delta/sigma core
-- Project    :
-------------------------------------------------------------------------------
-- File       : part_delta_sigma.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    :
-- Created    : 2015-07-15
-- Last update: 2022-10-18
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module gets a, b, c and d values and calculates x, y, q
--              and sum using the partial delta/sigma method.
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
-- Date        Version  Author            Description
-- 2015-07-15  1.0      finotti           Created
-- 2022-10-21  2.0      guilherme.ricioli Refactored and added offset stage
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

-- computes partial terms
entity pds_first_stage is
  generic (
    g_WIDTH                 : natural := 32
  );
  port (
    clk_i                   : in  std_logic;
    a_i                     : in  std_logic_vector(g_WIDTH-1 downto 0);
    b_i                     : in  std_logic_vector(g_WIDTH-1 downto 0);
    c_i                     : in  std_logic_vector(g_WIDTH-1 downto 0);
    d_i                     : in  std_logic_vector(g_WIDTH-1 downto 0);
    ce_i                    : in  std_logic;
    valid_i                 : in  std_logic;
    diff_ac_o               : out std_logic_vector(g_WIDTH-1 downto 0);
    diff_bd_o               : out std_logic_vector(g_WIDTH-1 downto 0);
    diff_cd_minus_diff_ba_o : out std_logic_vector(g_WIDTH-1 downto 0);
    sum_ac_o                : out std_logic_vector(g_WIDTH-1 downto 0);
    sum_bd_o                : out std_logic_vector(g_WIDTH-1 downto 0);
    sum_not_scaled_o        : out std_logic_vector(g_WIDTH-1 downto 0);
    valid_o                 : out std_logic
  );
end entity pds_first_stage;

architecture arch of pds_first_stage is
  -- signals
  signal diff_ba, diff_cd, diff_ac, diff_bd : signed(g_WIDTH-1 downto 0);
  signal sum_ac, sum_bd                     : signed(g_WIDTH-1 downto 0);
  signal valid_d0                           : std_logic := '0';
begin
  -- processes
  process(clk_i)
    variable a, b, c, d : signed(g_WIDTH-1 downto 0);
  begin
    -- to avoid multiple stages of combinatorial logic, the process was divided
    -- into two sequential stages
    if rising_edge(clk_i) then
      if ce_i = '1' then
        a := signed(a_i); b := signed(b_i); c := signed(c_i); d := signed(d_i);

        -- first stage
        diff_ba   <= b - a;
        diff_cd   <= c - d;
        diff_ac   <= a - c;
        diff_bd   <= b - d;
        sum_ac    <= a + c;
        sum_bd    <= b + d;
        valid_d0  <= valid_i;

        -- second stage
        diff_ac_o               <= std_logic_vector(diff_ac);
        diff_bd_o               <= std_logic_vector(diff_bd);
        sum_ac_o                <= std_logic_vector(sum_ac);
        sum_bd_o                <= std_logic_vector(sum_bd);
        sum_not_scaled_o        <= std_logic_vector(sum_ac + sum_bd);
        diff_cd_minus_diff_ba_o <= std_logic_vector(diff_cd - diff_ba);
        valid_o                 <= valid_d0;
      end if;
    end if;

  end process;

end architecture arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

-- scales x, y and sum (q is just pipelined)
entity pds_scaling_stage is
  generic (
    g_WIDTH                     : natural := 32;
    g_K_WIDTH                   : natural := 32
  );
  port (
    clk_i                       : in std_logic;
    diff_ac_over_sum_ac_i       : in std_logic_vector(g_WIDTH-1 downto 0);
    diff_ac_over_sum_ac_valid_i : in std_logic;
    diff_bd_over_sum_bd_i       : in std_logic_vector(g_WIDTH-1 downto 0);
    diff_bd_over_sum_bd_valid_i : in std_logic;
    sum_not_scaled_i            : in std_logic_vector(g_WIDTH-1 downto 0);
    sum_not_scaled_valid_i      : in std_logic;
    q_i                         : in std_logic_vector(g_WIDTH-1 downto 0);
    q_valid_i                   : in std_logic;
    kx_i                        : in std_logic_vector(g_K_WIDTH-1 downto 0);
    ky_i                        : in std_logic_vector(g_K_WIDTH-1 downto 0);
    ksum_i                      : in std_logic_vector(g_K_WIDTH-1 downto 0);
    ce_i                        : in std_logic;
    x_scaled_o                  : out std_logic_vector(g_WIDTH-1 downto 0);
    y_scaled_o                  : out std_logic_vector(g_WIDTH-1 downto 0);
    q_o                         : out std_logic_vector(g_WIDTH-1 downto 0);
    sum_scaled_o                : out std_logic_vector(g_WIDTH-1 downto 0);
    valid_o                     : out std_logic
  );
end entity pds_scaling_stage;

architecture arch of pds_scaling_stage is
  -- constants
  constant c_LEVELS     : natural := 7;

  -- signals
  signal diff_ac_over_sum_ac  : std_logic_vector(g_WIDTH-1 downto 0);
  signal diff_bd_over_sum_bd  : std_logic_vector(g_WIDTH-1 downto 0);
  signal sum_not_scaled       : std_logic_vector(g_WIDTH-1 downto 0);
  signal q                    : std_logic_vector(g_WIDTH-1 downto 0);
  signal x_not_scaled         : std_logic_vector(g_WIDTH-1 downto 0);
  signal y_not_scaled         : std_logic_vector(g_WIDTH-1 downto 0);

begin
  -- registering diff_ac_over_sum_ac_i
  cmp_pipeline_diff_ac_over_sum_ac_i : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => 1
    )
    port map (
      data_i  => diff_ac_over_sum_ac_i,
      clk_i   => clk_i,
      ce_i    => ce_i and diff_ac_over_sum_ac_valid_i,
      data_o  => diff_ac_over_sum_ac
    );

  -- registering diff_bd_over_sum_bd_i
  cmp_pipeline_diff_bd_over_sum_bd_i : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => 1
    )
    port map (
      data_i  => diff_bd_over_sum_bd_i,
      clk_i   => clk_i,
      ce_i    => ce_i and diff_bd_over_sum_bd_valid_i,
      data_o  => diff_bd_over_sum_bd
    );

  -- registering sum_not_scaled_i
  cmp_pipeline_sum_not_scaled_i : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => 1
    )
    port map (
      data_i  => sum_not_scaled_i,
      clk_i   => clk_i,
      ce_i    => ce_i and sum_not_scaled_valid_i,
      data_o  => sum_not_scaled
    );

  -- registering q_i
  cmp_pipeline_q_i : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => 1
    )
    port map (
      data_i  => q_i,
      clk_i   => clk_i,
      ce_i    => ce_i and q_valid_i,
      data_o  => q
    );

  -- single stage process to compute {x,y}_not_scaled
  process(clk_i)
    variable v_half_diff_ac_over_sum_ac : signed(g_WIDTH-1 downto 0);
    variable v_half_diff_bd_over_sum_bd : signed(g_WIDTH-1 downto 0);
  begin
    if rising_edge(clk_i) then
      if ce_i = '1' then
        v_half_diff_ac_over_sum_ac :=                           -- 0.5[(a - c)/(a + c)]
          shift_right(signed(diff_ac_over_sum_ac), 1);
        v_half_diff_bd_over_sum_bd :=                           -- 0.5[(b - d)/(b + d)]
          shift_right(signed(diff_bd_over_sum_bd), 1);

        x_not_scaled <=
          std_logic_vector(
            v_half_diff_ac_over_sum_ac - v_half_diff_bd_over_sum_bd);
        y_not_scaled <=
          std_logic_vector(
            v_half_diff_ac_over_sum_ac + v_half_diff_bd_over_sum_bd);
      end if;
    end if;
  end process;

  -- scaling x
  cmp_generic_multiplier_x : generic_multiplier
    generic map (
      g_A_WIDTH => g_WIDTH,
      g_B_WIDTH => g_K_WIDTH,
      g_SIGNED  => true,
      g_P_WIDTH => g_WIDTH,
      g_LEVELS  => c_LEVELS
    )
    port map (
      a_i       => x_not_scaled,
      b_i       => kx_i,
      valid_i   => '1',
      p_o       => x_scaled_o,
      ce_i      => ce_i,
      clk_i     => clk_i,
      rst_i     => '0'
    );

  -- scaling y
  cmp_generic_multiplier_y : generic_multiplier
    generic map (
      g_A_WIDTH => g_WIDTH,
      g_B_WIDTH => g_K_WIDTH,
      g_SIGNED  => true,
      g_P_WIDTH => g_WIDTH,
      g_LEVELS  => c_LEVELS
    )
    port map (
      a_i       => y_not_scaled,
      b_i       => ky_i,
      valid_i   => '1',
      p_o       => y_scaled_o,
      ce_i      => ce_i,
      clk_i     => clk_i,
      rst_i     => '0'
    );

  -- scaling sum
  cmp_generic_multiplier_sum : generic_multiplier
    generic map (
      g_A_WIDTH => g_WIDTH,
      g_B_WIDTH => g_K_WIDTH,
      g_SIGNED  => true,
      g_P_WIDTH => g_WIDTH,
      g_LEVELS  => c_LEVELS
    )
    port map (
      a_i       => sum_not_scaled,
      b_i       => ksum_i,
      valid_i   => '1',
      p_o       => sum_scaled_o,
      ce_i      => ce_i,
      clk_i     => clk_i,
      rst_i     => '0'
    );

  -- pipelining q to tevel the delay of:
  --  {x,y}_not_scaled computation (1 stage);
  --  scalings (c_LEVELS + 3 stages)
  cmp_pipeline_q : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => c_LEVELS + 4
    )
    port map (
      data_i  => q,
      clk_i   => clk_i,
      ce_i    => ce_i,
      data_o  => q_o
    );

  -- pipelining valid to tevel the delay of:
  --  registering (1 stage);
  --  {x,y}_not_scaled computation (1 stage);
  --  scalings (c_LEVELS + 3 stages)
  cmp_pipeline_valid : pipeline
    generic map (
      g_WIDTH   => 1,
      g_DEPTH   => c_LEVELS + 5
    )
    port map (
      data_i(0) => q_valid_i,   -- it could also be diff_{ac,bd}_over_sum_{ac,bd}_valid
      clk_i     => clk_i,
      ce_i      => ce_i,
      data_o(0) => valid_o
    );

end architecture arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;
use work.gencores_pkg.all;

-- offsets x and y
entity pds_offset_stage is
  generic (
    g_WIDTH             : natural := 32;
    g_PRECISION         : natural := 8;
    g_OFFSET_WIDTH      : natural := 32;
    g_OFFSET_PRECISION  : natural := 0
  );
  port (
    clk_i               : in std_logic;
    x_scaled_i          : in std_logic_vector(g_WIDTH-1 downto 0);
    y_scaled_i          : in std_logic_vector(g_WIDTH-1 downto 0);
    q_i                 : in std_logic_vector(g_WIDTH-1 downto 0);
    sum_scaled_i        : in std_logic_vector(g_WIDTH-1 downto 0);
    offset_x_i          : in std_logic_vector(g_OFFSET_WIDTH-1 downto 0);
    offset_y_i          : in std_logic_vector(g_OFFSET_WIDTH-1 downto 0);
    ce_i                : in std_logic;
    valid_i             : in std_logic;
    x_o                 : out std_logic_vector(g_WIDTH-1 downto 0);
    y_o                 : out std_logic_vector(g_WIDTH-1 downto 0);
    q_o                 : out std_logic_vector(g_WIDTH-1 downto 0);
    sum_o               : out std_logic_vector(g_WIDTH-1 downto 0);
    valid_o             : out std_logic
  );
end entity pds_offset_stage;

architecture arch of pds_offset_stage is
  -- constants
  -- 2 stages for gc_big_adder + 1 stage for registering its output
  constant c_LEVELS         : natural := 2+1;

  -- signals
  signal offset_x_n         : std_logic_vector(g_WIDTH-1 downto 0);
  signal offset_x_shift     : std_logic_vector(g_WIDTH-1 downto 0);
  signal offset_y_n         : std_logic_vector(g_WIDTH-1 downto 0);
  signal offset_y_shift     : std_logic_vector(g_WIDTH-1 downto 0);

  signal x_reg              : std_logic_vector(g_WIDTH-1 downto 0);
  signal x_valid_reg        : std_logic;
  signal y_reg              : std_logic_vector(g_WIDTH-1 downto 0);
  signal x                  : std_logic_vector(g_WIDTH-1 downto 0);
  signal x_valid            : std_logic;
  signal y                  : std_logic_vector(g_WIDTH-1 downto 0);

  function f_shift_left_gen (arg : signed; count : integer) return signed is
    variable v_count  : natural := 0;
    variable v_ret    : signed(arg'range);
  begin
    if count >= 0 then
      v_count := count;
      v_ret   := shift_left(arg, v_count);
    else
      v_count := -count;
      v_ret   := shift_right(arg, v_count);
    end if;

    return v_ret;
  end f_shift_left_gen;

begin
  -- align binary points
  offset_x_shift  <=
    std_logic_vector(
      f_shift_left_gen(signed(offset_x_i), g_PRECISION - g_OFFSET_PRECISION));
  offset_x_n      <= not offset_x_shift;

  offset_y_shift  <=
    std_logic_vector(
      f_shift_left_gen(signed(offset_y_i), g_PRECISION - g_OFFSET_PRECISION));
  offset_y_n      <= not offset_y_shift;

  -- x offset subtraction
  cmp_gc_big_adder2_x_offset : gc_big_adder2
    generic map (
      g_DATA_BITS   => g_WIDTH
    )
    port map (
      clk_i         => clk_i,
      ce_i          => ce_i,
      stall_i       => '0',
      valid_i       => valid_i,
      a_i           => x_scaled_i,
      b_i           => offset_x_n,
      c_i           => '1',
      x2_o          => x,
      c2x2_valid_o  => x_valid
    );

  -- gc_big_adder2 outputs are unregistered, so register them
  p_x_offset_reg : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if ce_i = '1' then
        x_reg       <= x;
        x_valid_reg <= x_valid;
      end if;
    end if;
  end process;

  x_o <= x_reg;

  -- y offset subtraction
  cmp_gc_big_adder2_y_offset : gc_big_adder2
    generic map (
      g_DATA_BITS => g_WIDTH
    )
    port map (
      clk_i       => clk_i,
      ce_i        => ce_i,
      stall_i     => '0',
      valid_i     => valid_i,
      a_i         => y_scaled_i,
      b_i         => offset_y_n,
      c_i         => '1',
      x2_o        => y
    );

  -- gc_big_adder2 outputs are unregistered, so register them
  p_y_offset_reg : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if ce_i = '1' then
        y_reg <= y;
      end if;
    end if;
  end process;

  y_o <= y_reg;

  -- pipelining q to tevel the delay of the subtraction (c_LEVELS)
  cmp_pipeline_q : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => c_LEVELS
    )
    port map (
      clk_i   => clk_i,
      ce_i    => ce_i,
      data_i  => q_i,
      data_o  => q_o
    );

  -- pipelining sum_scaled to tevel the delay of the subtraction (c_LEVELS)
  cmp_pipeline_sum_scaled : pipeline
    generic map (
      g_WIDTH => g_WIDTH,
      g_DEPTH => c_LEVELS
    )
    port map (
      clk_i   => clk_i,
      ce_i    => ce_i,
      data_i  => sum_scaled_i,
      data_o  => sum_o
    );

  valid_o <= x_valid_reg; -- it could be y_valid_reg
end architecture arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

-- main entity
-- NOTE: div_fixedpoint is not pipelined, so its delay dictates the maximum
--       input rate (currently g_WIDTH-1 ce pulses)
entity part_delta_sigma is
  generic (
    g_WIDTH         : natural := 32;
    g_K_WIDTH       : natural := 24;
    g_OFFSET_WIDTH  : natural := 32
  );
  port (
    clk_i           : in std_logic;
    rst_i           : in std_logic;
    a_i             : in std_logic_vector(g_WIDTH-1 downto 0);                            -- fp: 0
    b_i             : in std_logic_vector(g_WIDTH-1 downto 0);                            -- fp: 0
    c_i             : in std_logic_vector(g_WIDTH-1 downto 0);                            -- fp: 0
    d_i             : in std_logic_vector(g_WIDTH-1 downto 0);                            -- fp: 0
    kx_i            : in std_logic_vector(g_K_WIDTH-1 downto 0);                          -- fp: 0
    ky_i            : in std_logic_vector(g_K_WIDTH-1 downto 0);                          -- fp: 0
    ksum_i          : in std_logic_vector(g_K_WIDTH-1 downto 0);                          -- fp: 0
    offset_x_i      : in std_logic_vector(g_OFFSET_WIDTH-1 downto 0) := (others => '0');  -- fp: 0
    offset_y_i      : in std_logic_vector(g_OFFSET_WIDTH-1 downto 0) := (others => '0');  -- fp: 0
    ce_i            : in std_logic;
    valid_i         : in std_logic;
    x_o             : out std_logic_vector(g_WIDTH-1 downto 0);                           -- fp: g_WIDTH - (1+g_K_WIDTH) + 1
    y_o             : out std_logic_vector(g_WIDTH-1 downto 0);                           -- fp: g_WIDTH - (1+g_K_WIDTH) + 1
    q_o             : out std_logic_vector(g_WIDTH-1 downto 0);                           -- fp: g_WIDTH-1
    sum_o           : out std_logic_vector(g_WIDTH-1 downto 0);                           -- fp: g_WIDTH - (g_WIDTH+g_K_WIDTH) + 1
    valid_o         : out std_logic
  );
end entity part_delta_sigma;

architecture arch of part_delta_sigma is
  -- signals
  signal diff_ac                    : std_logic_vector(g_WIDTH-1 downto 0);
  signal diff_bd                    : std_logic_vector(g_WIDTH-1 downto 0);
  signal diff_cd_minus_diff_ba      : std_logic_vector(g_WIDTH-1 downto 0);
  signal sum_ac                     : std_logic_vector(g_WIDTH-1 downto 0);
  signal sum_bd                     : std_logic_vector(g_WIDTH-1 downto 0);
  signal sum_not_scaled             : std_logic_vector(g_WIDTH-1 downto 0);
  signal pds_first_stage_valid      : std_logic;
  signal diff_ac_over_sum_ac        : std_logic_vector(g_WIDTH-1 downto 0);
  signal diff_ac_over_sum_ac_valid  : std_logic;
  signal diff_bd_over_sum_bd        : std_logic_vector(g_WIDTH-1 downto 0);
  signal diff_bd_over_sum_bd_valid  : std_logic;
  signal q_0, q_1                   : std_logic_vector(g_WIDTH-1 downto 0);
  signal q_valid                    : std_logic;
  signal x_scaled                   : std_logic_vector(g_WIDTH-1 downto 0);
  signal y_scaled                   : std_logic_vector(g_WIDTH-1 downto 0);
  signal sum_scaled                 : std_logic_vector(g_WIDTH-1 downto 0);
  signal pds_scaling_stage_valid    : std_logic;

begin
  -- components
  cmp_pds_first_stage : pds_first_stage
    generic map (
      g_WIDTH                 => g_WIDTH
    )
    port map (
      clk_i                   => clk_i,
      a_i                     => a_i,                           -- a
      b_i                     => b_i,                           -- b
      c_i                     => c_i,                           -- c
      d_i                     => d_i,                           -- d
      ce_i                    => ce_i,
      valid_i                 => valid_i,
      diff_ac_o               => diff_ac,                       -- (a - c)
      diff_bd_o               => diff_bd,                       -- (b - d)
      diff_cd_minus_diff_ba_o => diff_cd_minus_diff_ba,         -- [(c - d) - (b - a)]
      sum_ac_o                => sum_ac,                        -- (a + c)
      sum_bd_o                => sum_bd,                        -- (b + d)
      sum_not_scaled_o        => sum_not_scaled,                -- (a + b + c + d)
      valid_o                 => pds_first_stage_valid
  );

  cmp_div_fixedpoint_diff_ac_over_sum_ac : div_fixedpoint
    generic map (
      g_DATAIN_WIDTH  => g_WIDTH,
      g_PRECISION     => g_WIDTH-1                              -- ranges from -1 to "1"
    )
    port map (
      clk_i           => clk_i,
      rst_i           => rst_i,
      ce_i            => ce_i,
      n_i             => diff_ac,                               -- (a - c)
      d_i             => sum_ac,                                -- (a + c)
      q_o             => diff_ac_over_sum_ac,                   -- (a - c)/(a + c)
      r_o             => open,
      trg_i           => pds_first_stage_valid,
      rdy_o           => diff_ac_over_sum_ac_valid,
      err_o           => open
    );

  cmp_div_fixedpoint_diff_bd_over_sum_bd : div_fixedpoint
    generic map (
      g_DATAIN_WIDTH  => g_WIDTH,
      g_PRECISION     => g_WIDTH-1                              -- ranges from -1 to "1"
    )
    port map (
      clk_i           => clk_i,
      rst_i           => rst_i,
      ce_i            => ce_i,
      n_i             => diff_bd,                               -- (b - d)
      d_i             => sum_bd,                                -- (b + d)
      q_o             => diff_bd_over_sum_bd,                   -- (b - d)/(b + d)
      r_o             => open,
      trg_i           => pds_first_stage_valid,
      rdy_o           => diff_bd_over_sum_bd_valid,
      err_o           => open
    );

  cmp_div_fixedpoint_q : div_fixedpoint
    generic map (
      g_DATAIN_WIDTH  => g_WIDTH,
      g_PRECISION     => g_WIDTH-1                              -- ranges from -1 to "1"
    )
    port map (
      clk_i           => clk_i,
      rst_i           => rst_i,
      ce_i            => ce_i,
      n_i             => diff_cd_minus_diff_ba,                 -- [(c - d) - (b - a)]
      d_i             => sum_not_scaled,                        -- (a + b + c + d)
      q_o             => q_0,                                   -- [(c - d) - (b - a)]/(a + b + c + d)
      r_o             => open,
      trg_i           => pds_first_stage_valid,
      rdy_o           => q_valid,
      err_o           => open
    );

  cmp_pds_scaling_stage : pds_scaling_stage
    generic map (
      g_WIDTH                     => g_WIDTH,
      g_K_WIDTH                   => g_K_WIDTH
    )
    port map (
      clk_i                       => clk_i,
      diff_ac_over_sum_ac_i       => diff_ac_over_sum_ac,       -- (a - c)/(a + c)
      diff_ac_over_sum_ac_valid_i => diff_ac_over_sum_ac_valid,
      diff_bd_over_sum_bd_i       => diff_bd_over_sum_bd,       -- (b - d)/(b + d)
      diff_bd_over_sum_bd_valid_i => diff_bd_over_sum_bd_valid,
      sum_not_scaled_i            => sum_not_scaled,            -- (a + b + c + d)
      sum_not_scaled_valid_i      => pds_first_stage_valid,
      q_i                         => q_0,                       -- [(c - d) - (b - a)]/(a + b + c + d)
      q_valid_i                   => q_valid,
      kx_i                        => kx_i,
      ky_i                        => ky_i,
      ksum_i                      => ksum_i,
      ce_i                        => ce_i,
      x_scaled_o                  => x_scaled,                  -- (kx)(0.5)[(a - c)/(a + c) - (b - d)/(b + d)]
      y_scaled_o                  => y_scaled,                  -- (ky)(0.5)[(a - c)/(a + c) + (b - d)/(b + d)]
      q_o                         => q_1,                       -- same as q_i
      sum_scaled_o                => sum_scaled,                -- ksum[a + b + c + d]
      valid_o                     => pds_scaling_stage_valid
    );

  cmp_pds_offset_stage : pds_offset_stage
    generic map (
      g_WIDTH             => g_WIDTH,
      g_PRECISION         => g_WIDTH-g_K_WIDTH,
      g_OFFSET_WIDTH      => g_OFFSET_WIDTH,
      g_OFFSET_PRECISION  => 0
    )
    port map (
      clk_i               => clk_i,
      ce_i                => ce_i,
      x_scaled_i          => x_scaled,                -- (kx)(0.5)[(a - c)/(a + c) - (b - d)/(b + d)]
      y_scaled_i          => y_scaled,                -- (ky)(0.5)[(a - c)/(a + c) + (b - d)/(b + d)]
      q_i                 => q_1,                     -- [(c - d) - (b - a)]/(a + b + c + d)
      sum_scaled_i        => sum_scaled,              -- ksum[a + b + c + d]
      valid_i             => pds_scaling_stage_valid,
      offset_x_i          => offset_x_i,
      offset_y_i          => offset_y_i,
      x_o                 => x_o,                     -- (kx)(0.5)[(a - c)/(a + c) - (b - d)/(b + d)] - offset_x
      y_o                 => y_o,                     -- (ky)(0.5)[(a - c)/(a + c) + (b - d)/(b + d)] - offset_y
      q_o                 => q_o,                     -- same as q_i
      sum_o               => sum_o,                   -- same as sum_scaled_i
      valid_o             => valid_o
    );

end architecture arch;
