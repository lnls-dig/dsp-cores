----------------------------------------------------------------------------------
-- Engineer:	   Matthias Werner
-- Create Date:	   23:53:29 06/26/2014
-- Module Name:	   cordic_iter - Behavioral
-- Target Devices: tried for Virtex-5 and Virtex-6, Artix-7,
--						 other devices should be possible
----------------------------------------------------------------------------------
-- Description:

-- One CORDIC iteration

-- Example for ITER_PER_CLK and TAB_OFFS: for 12 iterations total and 3 iterations per clk:
-- ITER_PER_CLK:  always 3 because 3 iterations per clk.
-- TAB_OFFS: 0 for 1st stage, 1 for 2nd stage, 2 for 3rd stage
-- u_loop_ix_in: start with 0 and increment for every clk
-------------------------------------------------------------------------------
--                                              C O P Y R I G H T    N O T E :
-------------------------------------------------------------------------------
-- This file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This code is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License.
-- If not, see <http://www.gnu.org/licenses/>.
-- Copyright (c) 2015 Matthias Werner
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;
use IEEE.NUMERIC_STD.all;
use work.rp_math_pack.all;		-- rp_arctan_nosqrt(), real_to_signed()

library work;
use work.dsp_cores_pkg.all;

entity cordic_iter is
  generic (XY_WID	: positive := 16;  -- Bit width of X and Y input
	   PH_WID	: positive := 18;  -- Bit width of phase output
	   NUM_LOOPS	: positive := 18;  -- Total number of clocks
	   TAB_AD_WID	: positive := 5;  -- Address width of phase table = CEIL(Log2(NUM_LOOPS))
	   ITER_PER_CLK : positive := 2;  -- One table entry per ITER_PER_CLK iterations
	   TAB_OFFS	: natural  := 0);  -- First table entry for iteration TAB_OFFS (first iteration = 0)
  port (s_x_in	     : in  signed (XY_WID-1 downto 0);
	s_y_in	     : in  signed (XY_WID-1 downto 0);
	u_loop_ix_in : in  unsigned (TAB_AD_WID-1 downto 0);  -- Loop index (one loop per clock)
	s_ph_in	     : in  signed (PH_WID-1 downto 0);
	s_x_o	     : out signed (XY_WID-1 downto 0);
	s_y_o	     : out signed (XY_WID-1 downto 0);
	s_ph_o	     : out signed (PH_WID-1 downto 0));
end cordic_iter;

architecture Behavioral of cordic_iter is

  -- Signals
  signal s_delt_x  : signed (XY_WID-1 downto 0);
  signal s_delt_y  : signed (XY_WID-1 downto 0);
  signal s_delt_ph : signed (PH_WID-1 downto 0);
  signal b_sign_y  : std_logic;
  signal i_shift   : integer range 0 to ITER_PER_CLK*NUM_LOOPS-1;

  type t_atan_list is array(0 to NUM_LOOPS-1) of signed(PH_WID-1 downto 0);
  type t_f_arr is array(0 to NUM_LOOPS-1) of real;  -- Only for test


  -----------------------
  -- Generate arctan list
  -----------------------
  function init_atan return t_atan_list is
    variable f_arg_v	    : real;	-- Argument for arctan()
    variable f_rad_v	    : real;	-- Phase in radians
    variable f_ph45_v	    : real;	-- Phase scaled to (45 deg -> 1.0)
    variable as_atan_list_v : t_atan_list;
  begin
    for i in 0 to NUM_LOOPS-1 loop
      f_arg_v		:= 2.0**(-(i*ITER_PER_CLK + TAB_OFFS));
      -- Improved arctan (full precision of real datatype)
      f_rad_v		:= rp_arctan_nosqrt(f_arg_v);
      f_ph45_v		:= 2.0**(PH_WID-1) / MATH_PI * f_rad_v;
      -- with function "real_to_signed": only limited by precision of "real"
      as_atan_list_v(i) := real_to_signed(f_ph45_v, PH_WID);
    end loop;
    return as_atan_list_v;
  end function init_atan;
  -- Assign to constant
  constant as_atan_list : t_atan_list := init_atan;


  --------------------------------------------------------------------------
  -- Only Test: show results of built-in and self-made arctan() in simulator
  --------------------------------------------------------------------------
  function test_atan return t_f_arr is
    variable as_atan_list_v : t_atan_list;
    variable f_rad_v	    : real;
    variable af_rad_v	    : t_f_arr;
  begin
    for i in 0 to NUM_LOOPS-1 loop
      ------------------
      -- Built-in arctan
      f_rad_v	  := arctan(2.0**(real(-(i*ITER_PER_CLK + TAB_OFFS))));
      -- Self-made arctan
--			f_rad_v := my_arctan(2.0**(real(-(i*ITER_PER_CLK + TAB_OFFS))));
      ------------------
      -- Test different possibilities of power() function
--			f_rad_v := 2.0**i;			-- Test of precision: is precise!
--			f_rad_v := 2.0**real(i);	-- Test of precision: is NOT precise!
      ------------------
      af_rad_v(i) := f_rad_v;
--			as_atan_list_v(i) := to_signed(integer(2.0**(PH_WID-1) / MATH_PI * f_rad_v) ,PH_WID);
    end loop;
    return af_rad_v;
  end function test_atan;
  constant af_test : t_f_arr := test_atan;  -- This constant array can be viewed in simulator
  ----------- end of test code ---------------------------------------------


begin

  -- Type conversion
  i_shift <= TAB_OFFS + ITER_PER_CLK * to_integer(u_loop_ix_in);

  -- Shifted values and sign
  s_delt_x  <= SHIFT_RIGHT(s_x_in, i_shift);
  s_delt_y  <= SHIFT_RIGHT(s_y_in, i_shift);
  s_delt_ph <= as_atan_list(to_integer(u_loop_ix_in));
  b_sign_y  <= s_y_in(s_y_in'high);

  -- Accumulate X
  s_x_o <= s_x_in + s_delt_y when b_sign_y = '0' else
	   s_x_in - s_delt_y;

  -- Accumulate Y
  s_y_o <= s_y_in - s_delt_x when b_sign_y = '0' else
	   s_y_in + s_delt_x;

  -- Accumulate phase
  s_ph_o <= s_ph_in + s_delt_ph when b_sign_y = '0' else
	    s_ph_in - s_delt_ph;


end Behavioral;
