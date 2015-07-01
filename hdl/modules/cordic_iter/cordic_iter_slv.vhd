-------------------------------------------------------------------------------
-- Title      : Iterative cordic SLV wrapper
-- Project    : 
-------------------------------------------------------------------------------
-- File       : cordic_iter_slv.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2015-06-03
-- Last update: 2015-06-12
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This wrapper allows for the iterative cordic to run at a rate
-- higher than the input's clock enable rate, while avoiding duplicate signal
-- inputs or losing inputs. It also converts the signed cordic core signals to
-- the std_logic_vector type.
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
-- 2015-06-03  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity cordic_input is

  generic (
    g_input_width : positive := 16);    -- input size for x and y

  port (
    clk_i          : in  std_logic;     -- clock input
    ce_data_i      : in  std_logic;     -- clock enable for data input
    valid_i        : in  std_logic;     -- valid data input
    x_i            : in  std_logic_vector(g_input_width-1 downto 0);  -- input for x (or I)
    y_i            : in  std_logic_vector(g_input_width-1 downto 0);  -- input for y (or Q)
    ce_cordic_i    : in  std_logic;     -- clock enable for cordic core
    stall_cordic_i : in  std_logic;     -- signals the cordic core is busy
    valid_o        : out std_logic;     -- indicates valid signal is stored
    x_o            : out std_logic_vector(g_input_width-1 downto 0);  -- data output for x
    y_o            : out std_logic_vector(g_input_width-1 downto 0)  -- data output for y
    );
end entity cordic_input;

architecture behavioural of cordic_input is

  signal x, y  : std_logic_vector(g_input_width-1 downto 0);
  signal valid : std_logic := '0';
  signal stall : std_logic;

begin  -- architecture behavioural

  process(clk_i)
  begin

    if rising_edge(clk_i) then
      --Cordic side: it cordic is not stalled, it will consume the data available
      if ce_cordic_i = '1' and stall_cordic_i = '0' then
        valid <= '0';
      end if;

      if ce_data_i = '1' and valid_i = '1' then
        x     <= x_i;
        y     <= y_i;
        valid <= '1';
      end if;
    end if;
  end process;

  valid_o <= valid;
  x_o     <= x;
  y_o     <= y;

end architecture behavioural;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity cordic_iter_slv is

  generic (
    g_input_width        : positive := 16;  -- input for x and y
    g_xy_calc_width      : positive := 22;  -- xy internal calc width for x,y, including left padding (always 2 bits)
    g_x_output_width     : positive := 16;  -- output for magnitude
    g_phase_calc_width   : positive := 22;  -- internal width for phase, only right padding
    g_phase_output_width : positive := 16;  -- output width for phase signal (2's complement, -pi to pi
    g_stages             : positive := 16;  -- total cordic stages
    g_iter_per_clk       : positive := 2;  -- number of stages per clock cycle. g_stages must be a multiple of g_iter_per_clk
    g_rounding           : boolean  := true  -- Enables unregistered output rouding.
    );

  port (
    clk_i     : in  std_logic;          -- clock input
    ce_data_i : in  std_logic;  -- clock enable for data input (same ce as valid signal)
    valid_i   : in  std_logic;          -- new valid data in input signals
    ce_i      : in  std_logic;          -- clock enable for internal cordic
    x_i       : in  std_logic_vector(g_input_width-1 downto 0);  -- input for x (or I)
    y_i       : in  std_logic_vector(g_input_width-1 downto 0);  -- input for y (or Q)
    mag_o     : out std_logic_vector(g_x_output_width-1 downto 0);  -- magnitude output
    phase_o   : out std_logic_vector(g_phase_output_width-1 downto 0);  -- phase output
    valid_o   : out std_logic);         -- valid data on the output signals

end entity cordic_iter_slv;

architecture structural of cordic_iter_slv is

  signal x_to_cordic  : std_logic_vector(g_input_width-1 downto 0) := (others => '0');
  signal y_to_cordic  : std_logic_vector(g_input_width-1 downto 0) := (others => '0');
  signal valid        : std_logic                                  := '0';
  signal stall        : std_logic                                  := '0';
  signal mag_signed   : signed(g_x_output_width-1 downto 0)        := (others => '0');
  signal phase_signed : signed(g_phase_output_width-1 downto 0)    := (others => '0');


  component cordic is
    generic (
      XY_CALC_WID  : positive;
      XY_IN_WID    : positive;
      X_OUT_WID    : positive;
      PH_CALC_WID  : positive;
      PH_OUT_WID   : positive;
      NUM_ITER     : positive;
      ITER_PER_CLK : positive;
      USE_INREG    : boolean;
      USE_CE       : boolean;
      ROUNDING     : boolean);
    port (
      clk        : in  std_logic;
      ce         : in  std_logic;
      b_start_in : in  std_logic;
      s_x_in     : in  signed (XY_IN_WID-1 downto 0);
      s_y_in     : in  signed (XY_IN_WID-1 downto 0);
      s_x_o      : out signed (X_OUT_WID-1 downto 0);
      s_ph_o     : out signed (PH_OUT_WID-1 downto 0);
      b_rdy_o    : out std_logic;
      b_busy_o   : out std_logic := '0');
  end component cordic;

  component cordic_input is
    generic (
      g_input_width : positive);
    port (
      clk_i          : in  std_logic;
      ce_data_i      : in  std_logic;
      valid_i        : in  std_logic;
      x_i            : in  std_logic_vector(g_input_width-1 downto 0);
      y_i            : in  std_logic_vector(g_input_width-1 downto 0);
      ce_cordic_i    : in  std_logic;
      stall_cordic_i : in  std_logic;
      valid_o        : out std_logic;
      x_o            : out std_logic_vector(g_input_width-1 downto 0);
      y_o            : out std_logic_vector(g_input_width-1 downto 0));
  end component cordic_input;

begin  -- architecture structural

  cmp_input : cordic_input
    generic map (
      g_input_width => g_input_width)
    port map (
      clk_i          => clk_i,
      ce_data_i      => ce_data_i,
      valid_i        => valid_i,
      x_i            => x_i,
      y_i            => y_i,
      ce_cordic_i    => ce_i,
      stall_cordic_i => stall,
      valid_o        => valid,
      x_o            => x_to_cordic,
      y_o            => y_to_cordic);

  cmp_cordic_core : cordic
    generic map (
      XY_CALC_WID  => g_xy_calc_width,
      XY_IN_WID    => g_input_width,
      X_OUT_WID    => g_x_output_width,
      PH_CALC_WID  => g_phase_calc_width,
      PH_OUT_WID   => g_phase_output_width,
      NUM_ITER     => g_stages,
      ITER_PER_CLK => g_iter_per_clk,
      USE_INREG    => false,
      USE_CE       => true,
      ROUNDING     => true)
    port map (
      clk        => clk_i,
      ce         => ce_i,
      b_start_in => valid,
      s_x_in     => signed(x_to_cordic),
      s_y_in     => signed(y_to_cordic),
      s_x_o      => mag_signed,
      s_ph_o     => phase_signed,
      b_rdy_o    => valid_o,
      b_busy_o   => stall);

  mag_o   <= std_logic_vector(mag_signed);
  phase_o <= std_logic_vector(phase_signed);

end architecture structural;
