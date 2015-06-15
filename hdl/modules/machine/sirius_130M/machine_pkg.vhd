-------------------------------------------------------------------------------
-- Title      : Machine package for Sirius with 130MSps ADC
-- Project    : 
-------------------------------------------------------------------------------
-- File       : machine_pkg.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2015-04-14
-- Last update: 2015-04-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Machine package with parameters for Sirius ADC
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-04-14  1.0      aylons	Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package machine_pkg is

  constant c_adc_width : natural := 16;
  constant c_adc_freq  : real    := 122.804e6;
  constant c_adc_ratio : natural := 2;

  constant c_dds_points   : natural := 203;
  constant c_dds_width    : natural := 16;
  constant c_dds_sin_file : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_sin.nif";
  constant c_dds_cos_file : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_cos.nif";
  constant c_mixed_width  : natural := 16;

  constant c_tbt_cic_delay  : natural := 1; 
  constant c_tbt_cic_stages : natural := 2;
  constant c_tbt_ratio      : natural := 35;
  constant c_tbt_width      : natural := 32;

  constant c_fofb_cic_delay  : natural := 1;
  constant c_fofb_cic_stages : natural := 2;
  constant c_fofb_ratio      : natural := 980;
  constant c_fofb_width      : natural := 32;

  constant c_monit_ratio : natural := 10e3;  --ratio between fofb and monit

  constant c_k_width : natural := 24;
  constant c_k_sum   : natural := 85e5;
  constant c_k_x     : natural := 85e5;
  constant c_k_y     : natural := 85e5;

end machine_pkg;
