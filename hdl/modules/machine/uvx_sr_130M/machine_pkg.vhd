-------------------------------------------------------------------------------
-- Title      : Machine parameters
-- Project    :
-------------------------------------------------------------------------------
-- File       : machine_pkg.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2015-04-13
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Paarameters for different machines, to be used as generics.
-------------------------------------------------------------------------------
-- Copyright (c) 2015
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2015-04-13  1.0      aylons          Created
-- 2015-10-14  2.0      vfinotti        Updated
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package machine_pkg is

  constant c_pos_calc_with_downconv             : boolean := true;

  constant c_pos_calc_adc_freq                  : real    := 112583193.0;
  constant c_pos_calc_input_width               : natural := 16;
  constant c_pos_calc_mixed_width               : natural := 16;
  constant c_pos_calc_adc_ratio                 : natural := 1;

  constant c_pos_calc_dds_width                 : natural := 16;
  constant c_pos_calc_dds_points                : natural := 35;
  constant c_pos_calc_sin_file                  : string  := "../../../dsp-cores/hdl/modules/position_calc/dds_sin.nif";
  constant c_pos_calc_cos_file                  : string  := "../../../dsp-cores/hdl/modules/position_calc/dds_cos.nif";

  constant c_pos_calc_tbt_cic_delay             : natural := 1;
  constant c_pos_calc_tbt_cic_stages            : natural := 1;
  constant c_pos_calc_tbt_ratio                 : natural := 35;
  constant c_pos_calc_tbt_decim_width           : natural := 32;

  constant c_pos_calc_fofb_cic_delay            : natural := 1;
  constant c_pos_calc_fofb_cic_stages           : natural := 1;
  constant c_pos_calc_fofb_ratio                : natural := 490;
  constant c_pos_calc_fofb_decim_width          : natural := 32;

  constant c_pos_calc_monit1_cic_delay          : natural := 1;
  constant c_pos_calc_monit1_cic_stages         : natural := 1;
  constant c_pos_calc_monit1_ratio              : natural := 200;  --ratio between fofb and monit 1
  constant c_pos_calc_monit1_cic_ratio          : natural := 8;

  constant c_pos_calc_monit2_cic_delay          : natural := 1;
  constant c_pos_calc_monit2_cic_stages         : natural := 1;
  constant c_pos_calc_monit2_ratio              : natural := 100; -- ratio between monit 1 and 2
  constant c_pos_calc_monit2_cic_ratio          : natural := 8;

  constant c_pos_calc_monit_decim_width         : natural := 32;

  constant c_pos_calc_tbt_cordic_stages         : positive := 12;
  constant c_pos_calc_tbt_cordic_iter_per_clk   : positive := 3;
  constant c_pos_calc_tbt_cordic_ratio          : positive := 4;

  constant c_pos_calc_fofb_cordic_stages        : positive := 15;
  constant c_pos_calc_fofb_cordic_iter_per_clk  : positive := 3;
  constant c_pos_calc_fofb_cordic_ratio         : positive := 4;

  constant c_pos_calc_k_width                   : natural := 24;
  constant c_pos_calc_IQ_width                  : natural := c_pos_calc_mixed_width;

  constant c_pos_calc_k_sum                     : natural := 10e6;
  constant c_pos_calc_k_x                       : natural := 10e6;
  constant c_pos_calc_k_y                       : natural := 10e6;

end machine_pkg;
