------------------------------------------------------------------------------
-- Title      : Simple Position Counters package for debugging
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2017-01-20
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Core for generating coutners sync'ed with each incoming data rate.
-- Used for debugging.
-------------------------------------------------------------------------------
-- Copyright (c) 2017 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2017-01-20  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.wishbone_pkg.all;

package counters_gen_pkg is

  -------------------------------------------------------------------------------
  -- Constants declaration
  -------------------------------------------------------------------------------
  constant c_max_cnt_width                   : natural := 32;

  -------------------------------------------------------------------------------
  -- Types declaration
  -------------------------------------------------------------------------------
  type t_cnt_width_array is array (natural range <>) of natural;

  type t_cnt_array is array (natural range <>) of unsigned(c_max_cnt_width-1 downto 0);

  -------------------------------------------------------------------------------
  -- Defaults
  -------------------------------------------------------------------------------
  constant c_default_num_counters            : natural := 2;
  constant c_default_cnt_width               : natural := 32;

  constant c_default_cnt_width_array         : t_cnt_width_array(c_default_num_counters-1 downto 0) := (
    c_default_cnt_width, c_default_cnt_width);

  -----------------------------
  -- Functions declaration
  ----------------------------
  function f_dup_counter_array(cnt : unsigned; num_dups : natural)
    return std_logic_vector;

end counters_gen_pkg;

package body counters_gen_pkg is

  function f_dup_counter_array(cnt : unsigned; num_dups : natural)
    return std_logic_vector
  is
    constant c_cnt_size : natural := cnt'length;
    variable cnt_out : std_logic_vector(c_cnt_size*num_dups-1 downto 0) :=
      (others => '0');
    variable cnt_slice : std_logic_vector(c_cnt_size-1 downto 0) :=
      (others => '0');
  begin
    assert (num_dups >= 1)
    report "[f_dup_counter_array] num_dups must be greater or equal than 1"
      severity Failure;

    -- Get only the interesting part of input
    cnt_slice := std_logic_vector(cnt(c_cnt_size-1 downto 0));
    -- Duplicate "num_dups" times the input array
    loop_dup : for i in 0 to num_dups-1 loop
      cnt_out(c_cnt_size*(i+1)-1 downto c_cnt_size*i) :=
        cnt_slice;
    end loop;

    return cnt_out;

  end;

end counters_gen_pkg;
