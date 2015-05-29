-------------------------------------------------------------------------------
-- Title      : Real precision trigonometric function math package
-- Project    : (some of the functions are taylored for CORDIC implementations
--              and testbenches)
-------------------------------------------------------------------------------
-- File       : rp_math_pack.vhd 
-- Author     : Matthias Werner <Matthias.Werner@desy.de>
-- Company    :  
-- Created    : 2015-01-24
-- Last update: 2015-01-24
-- Platform   :  
-- Standard   : VHDL-93
------------------------------------------------------------------------------- 
-- Description: This package contains the basic trigonometric functions similar
-- to the functions in IEEE.MATH_REAL, but with a higher precision.
-- Additionally, conversion function between real and (un)signed are included. 
-- The functions can be helpful for CORDIC designs and testbenches.
------------------------------------------------------------------------------- 
--						C O P Y R I G H T    N O T E :
------------------------------------------------------------------------------- 
-- This file is free software: you can redistribute it and/or modify 
-- it under the terms of the GNU General Public License as published by 
-- the Free Software Foundation, either version 3 of the License, or 
-- (at your option) any later version. 
-- 
-- This package is distributed in the hope that it will be useful, 
-- but WITHOUT ANY WARRANTY; without even the implied warranty of 
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
-- GNU General Public License for more details. 
-- 
-- You should have received a copy of the GNU General Public License.
-- If not, see <http://www.gnu.org/licenses/>. 
-- Copyright (c) 2015 Matthias Werner
------------------------------------------------------------------------------- 
-- Revisions  : 
-- Date        Version  Author           Description 
-- 2015-01-24  1.0      Matthias Werner  Created 
------------------------------------------------------------------------------- 
-- Detailed description:
--	Package with
--		selfmade trigonometric functions with full precision of real data type
--		selfmade conversion functions for arguments > 32 bit

-- Simulation for trigonometric functions:
--		verified for selected values with external high precision calculator program

-- Simulation for conversion functions done 2014-08-29:
--		For width = 6: all conversion functions tested for all possible numbers, correct rounding verified
--		For numbers around 9.0e15: verified that full precision of real data type is exploited
--		For numbers above 1.0e18: verified that conversion still works with real data type precision

-- Attention:
--		The built-in trigonometric functions and the built-in functions ROUND, FLOOR, CEIL, MOD offer
--		only a limited precision in the order of 32 bits - this has to be considered for the design of
--		the selfmade functions!
--------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.MATH_REAL.all;
use IEEE.NUMERIC_STD.ALL;

package rp_math_pack is

	-- Function declarations
	function rp_sin (constant f_arg : in real) return real;
	function rp_cos (constant f_arg : in real) return real;
	function rp_tan (constant f_arg : in real) return real;
	function rp_arctan(constant f_arg : in real) return real;
	function rp_arctan_nosqrt(constant f_arg : in real) return real;	-- Limited arg range, no sqrt() used
	function rp_arcsin(constant f_arg : in real) return real;
	function rp_arccos(constant f_arg : in real) return real;
	function unsigned_to_real(constant u_arg : in unsigned) return real;
	function signed_to_real(constant s_arg : in signed) return real;
	function mod2(constant f_arg : in real) return real;	-- Modulo 2.0
	function real_to_unsigned(constant f_arg : in real; constant i_wid : in positive) return unsigned;
	function real_to_signed(constant f_arg : in real; constant i_wid : in positive) return signed;
	function real_to_signed_old(constant f_arg : in real; constant WID : in positive) return signed;

end rp_math_pack;

---------------
-- Package body
---------------
package body rp_math_pack is

	-----------------------------------------------------------
	-- Selfmade sine function for argument range -PI/2 to +PI/2
	-----------------------------------------------------------
	function rp_sin_lowrange (constant f_arg_lorange : in real) return real is
		variable f_xpow  : real;
		variable f_xpow2 : real;
		variable f_facul : real;
		variable f_sum   : real;
		variable f_2i    : real;
	begin
		-- Init variables
		f_xpow  := f_arg_lorange;
		f_xpow2 := f_arg_lorange * f_arg_lorange;
		f_facul := 1.0;
		f_sum   := f_arg_lorange;
		-- Iteration loop
		for i in 1 to 13 loop
			f_2i := real(2*i);
			f_facul := f_facul * f_2i * (f_2i + 1.0);
			f_xpow := -f_xpow * f_xpow2;
			f_sum := f_sum + f_xpow / f_facul;
		end loop;
		-- Return result
		return f_sum; 
	end rp_sin_lowrange;


	-------------------------------------------------
	-- Selfmade sine function for full argument range
	-------------------------------------------------
	function rp_sin (constant f_arg : in real) return real is
		variable y_flag_neg_result : boolean;
		variable f_arg1 : real;
		variable f_result : real;
	begin
		-- Init variable
		y_flag_neg_result := False;
		-- Reduce range to 0 .. 2*PI
		f_arg1 := f_arg MOD (2.0 * MATH_PI);
		-- Reduce range to 0 .. PI
		if f_arg1 > MATH_PI then
			f_arg1 := f_arg1 - MATH_PI;
			y_flag_neg_result := True;
		end if;
		-- Reduce range to 0 .. PI/2
		if f_arg1 > MATH_PI/2.0 then
			f_arg1 := MATH_PI - f_arg1;
		end if;
		-- Call function for reduced range, negate if necessary and return the result
		f_result := rp_sin_lowrange(f_arg1);
		if y_flag_neg_result then
			f_result := -f_result;
		end if;
		return f_result;
	end rp_sin;
	

	---------------------------------------------------
	-- Selfmade cosine function for full argument range
	---------------------------------------------------
	function rp_cos (constant f_arg : in real) return real is
	begin
		return rp_sin(f_arg + MATH_PI / 2.0);
	end rp_cos;
	

	------------------------------------------------
	-- Selfmade tan function for full argument range
	------------------------------------------------
	function rp_tan (constant f_arg : in real) return real is
	begin
		return rp_sin(f_arg) / rp_cos(f_arg);
	end rp_tan;

	
	---------------------------------
	-- Selfmade arctan for arg <= 0.5
	---------------------------------
	function rp_arctan_lorange(f_arg_lorange : real) return real is
		variable f_arg_v : real := f_arg_lorange;
		variable f_result : real := 0.0;
	begin
		for i in 0 to 25 loop
			f_result := f_result + real((-1)**i) * f_arg_v**(2*i+1) / real(2*i+1);
		end loop;
		return f_result;
	end function rp_arctan_lorange;

	
	------------------------------------------
	-- Selfmade arctan for full argument range
	------------------------------------------
	function rp_arctan (constant f_arg : in real) return real is
		variable f_abs_arg : real;
		variable y_flag_neg_result : boolean;
		variable f_abs_result : real;
	begin
		-- Reduce range to positive values
		f_abs_arg := abs(f_arg);
		
		-- Range 0.0 to 1.0
		if (f_abs_arg <= 1.0) then
			f_abs_result := 2.0 * rp_arctan_lorange(f_abs_arg / (1.0 + sqrt(1.0 + f_abs_arg * f_abs_arg)));
		-- Range 1.0 to infinite
		else
			f_abs_result := MATH_PI / 2.0 - 2.0 * rp_arctan_lorange(1.0 / (f_abs_arg + sqrt(1.0 + f_abs_arg * f_abs_arg)));
		end if;
		
		-- Return result regarding argument sign
		if f_arg < 0.0 then
			return -f_abs_result;
		else
			return f_abs_result;
		end if;
	end function rp_arctan;

	
	-------------------------------------------------------------------------------------------
	-- Selfmade arctan without use of sqrt() for arg = 1.0 or arg <= 0.5 (as needed for CORDIC)
	--
	-- Although this algorithm works only for the limited argument range used in CORDIC, its
	-- advantage is that the sqrt() function is not used. This can be good if the precision of
	-- the sqrt() is not known or not high enough. In ISE, however, the sqrt() is precise enough.
	-------------------------------------------------------------------------------------------
	function rp_arctan_nosqrt(constant f_arg : in real) return real is
		variable f_arg_v : real := f_arg;
		variable f_result : real := 0.0;
	begin
		if f_arg > 0.99 AND f_arg < 1.01 then	-- For f_arg = 1.0 (error tolerant)
			return MATH_PI / 4.0;
		else
			return rp_arctan_lorange(f_arg);
		end if;
	end function rp_arctan_nosqrt;

	
	------------------------------------------
	-- Selfmade arcsin for full argument range
	------------------------------------------
	function rp_arcsin (constant f_arg : in real) return real is
	begin
		return 2.0 * rp_arctan(f_arg / (1.0 + sqrt(1.0 - f_arg * f_arg)));
	end rp_arcsin;

	
	------------------------------------------
	-- Selfmade arccos for full argument range
	------------------------------------------
	function rp_arccos (constant f_arg : in real) return real is
	begin
		return MATH_PI/2.0 - rp_arcsin(f_arg);
	end rp_arccos;
	
	
	------------------------------------------------------------------------
	-- Selfmade unsigned to real conversion for numbers up to 2**53 = 9.0e15
	------------------------------------------------------------------------
	function unsigned_to_real(constant u_arg : in unsigned) return real is
		variable f_result : real := 0.0;
	begin
		-- For all bits, starting with MSB
		for i in u_arg'range loop
			-- Loop: multiply by 2, add 1 if bit is '1'
			f_result := f_result * 2.0;
			if u_arg(i) = '1' then
				f_result := f_result + 1.0;
			end if;
		end loop;
		return f_result;
	end unsigned_to_real;


	----------------------------------------------------------------------
	-- Selfmade signed to real conversion for numbers up to 2**53 = 9.0e15
	----------------------------------------------------------------------
	function signed_to_real(constant s_arg : in signed) return real is
		variable s_arg_abs : signed(s_arg'high+1 downto 0);	-- arg extended by 1 bit
		variable u_arg_abs : unsigned(s_arg'high+1 downto 0);	-- s_arg_abs converted to unsigned
		variable f_result : real;
	begin
		-- Absolute value of arg (extended by 1 bit to cover special case 10000....)
		s_arg_abs := abs(resize(s_arg, s_arg'length+1));
		u_arg_abs := unsigned(s_arg_abs);
		-- Convert unsigned to real
		f_result := unsigned_to_real(u_arg_abs);
		-- Include sign and return
		if s_arg < 0 then
			f_result := -f_result;
		end if;
		return f_result;
	end signed_to_real;
	
	
	----------------------------------------
	-- Modulo 2 for numbers < 2**53 = 9.0e15
	----------------------------------------
	-- Called by function real_to_unsigned().
	-- This function was designed because the built-in MOD function works only
	-- correctly for arguments < 2**32.
	-- As also the FLOOR function works only correctly for arguments up to 2**32,
	-- a two-step-trick is applied:
	--		1)The argument is reduced maintaining the MOD 2 properties. In this step a division
	--		  by 2.0**31, followed by a subtraction and subsequent multiplication by 2**31 is used
	--		  to keep the argument for the FLOOR function below 2**32.
	--		2)The built-in MOD 2 function is applied on the reduced argument.
	----------------------------------------
	function mod2(constant f_arg : in real) return real is
		variable f_quot : real;
	begin
		-- The MOD function does only work correctly for arguments < 2**32, therefore a trick is applied
		f_quot := f_arg / 2.0**31;
		return (2.0**31 * (f_quot - floor(f_quot))) MOD 2.0;
	end mod2;


	------------------------------------------------------------------------
	-- Selfmade real to unsigned conversion for numbers up to 2**53 = 9.0e15
	------------------------------------------------------------------------
	-- This function was designed to convert numbers > 2**31 to unsigned.
	-- As the built-in ROUND function works correctly only for arguments < 2**31, a trick was
	-- applied to emulate (ROUND and CONVERT): first 0.49 is added, then the MOD - sub - divide loop
	-- is applied. This results in (almost) correct rounding also for large numbers - this
	-- was verified by simulation for small numbers and for large numbers around 9.0e15.
	------------------------------------------------------------------------
	function real_to_unsigned(constant f_arg : in real; constant i_wid : in positive) return unsigned is
		variable f_arg_04 : real;	-- Argument rounded and increased by 0.4
		variable f_next : real;
		variable u_result : unsigned(i_wid-1 downto 0) := (others => '0');
	begin
		-- Add 0.49 to achieve correct rounding in combination with the algorithm used.
		f_arg_04 := f_arg + 0.49;
		-- Error if negative argument
		-- !!! The assert "fails" for Virtex-5 (not for Artix-7) in Implementation (not in Simulation) if
		-- !!! "f_arg_04 > 0.0" is used instead of "f_arg_04 >= 0.0" even if f_arg_04 is 5.0 (ISE bug ?)
		assert f_arg_04 >= 0.0 report "neg. arg at func. real_to_unsigned" severity failure; -- see comment above
		-- For all bits, starting at LSB
		f_next := f_arg_04;
		for i in 0 to i_wid-1 loop
			-- Loop: check if value MOD 2 is 1; then divide by 2
			if mod2(f_next) >= 0.99 then	-- Selfmade modulo 2 function which works also for arguments > 2**32
				u_result(i) := '1';
				f_next := f_next - 1.0;
			end if;
			f_next := f_next / 2.0;
		end loop;
		-- Detect if result was truncated due to small width parameter
		assert f_next < 0.5 report "i_wid too small in function real_to_unsigned -> truncated" severity warning;
		-- Return result
		return u_result;
	end real_to_unsigned;


	----------------------------------------------------------------------
	-- Selfmade real to signed conversion for numbers up to 2**53 = 9.0e15
	----------------------------------------------------------------------
	function real_to_signed(constant f_arg : in real; constant i_wid : in positive) return signed is
		variable f_arg_abs : real;
		variable b_sign : std_logic;
		variable u_result_long : unsigned(i_wid downto 0); -- Result 1 bit extended, unsigned
		variable s_result_long : signed(i_wid downto 0); -- Result 1 bit extended, signed
		variable s_result : signed(i_wid-1 downto 0); -- Result
	begin
		-- Absolute value, tolerant to rounding errors; remember sign
		if f_arg < -0.25 then
			f_arg_abs := -f_arg;
			b_sign := '1';
		else
			f_arg_abs := f_arg;
			b_sign := '0';
		end if;
		-- Convert to unsigned, result 1 bit longer to cover special case of most negative number 10000...
		u_result_long := real_to_unsigned(f_arg_abs, i_wid+1);
		-- Include sign
		s_result_long := signed(u_result_long);
		if b_sign = '1' then
			s_result_long := -s_result_long;
		end if;
		-- Taylor to desired bit width (1 bit less) and check if truncated
		s_result := resize(s_result_long, i_wid);
		assert s_result_long = s_result
			report "i_wid too small in function real_to_signed -> truncated" severity warning;
		-- Return result
		return s_result;
	end real_to_signed;


	--------------------------------------------------------------------------------------------
	-- Obsolete real to signed conversion, works correctly up to output width of approx. 50 bits
	--
	-- This algorithm was initially used to compute the arctan table; now replaced by real_to_signed()
	-- Works only for positive numbers - just the return value is of signed data type
	--------------------------------------------------------------------------------------------
	function real_to_signed_old(constant f_arg : in real; constant WID : in positive) return signed is
		variable f_arg_v : real := f_arg;
		variable s_result_v : signed(WID downto 0) := (others => '0');
	begin
		-- Scale argument
		f_arg_v := f_arg_v / 2.0**(WID-1);
		-- Extract (WID + 1) bits, use LSB for rounding after loop
		for i in WID downto 0 loop
			if f_arg_v >= 1.0 then
				s_result_v(i) := '1';
				f_arg_v := f_arg_v - 1.0;
			else
				s_result_v(i) := '0';
			end if;
			f_arg_v := f_arg_v * 2.0;
		end loop;
		-- Round
		s_result_v(WID downto 1) := s_result_v(WID downto 1) + ('0' & s_result_v(0));
		return s_result_v(WID downto 1);
	end function real_to_signed_old;

end rp_math_pack;
