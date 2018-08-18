-------------------------------------------------------------------------------
-- Title      : Machine parameters for Sirius with 250MSps ADC
-- Project    :
-------------------------------------------------------------------------------
-- File       : machine_pkg.vhd<sirius_250M>
-- Author     :   <aylons@dig-jobs>
-- Company    :
-- Created    : 2016-04-04
-- Last update: 2016-04-06
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Machine parameters for Sirius with 250MSps ADC
-------------------------------------------------------------------------------
-- Copyright (c) 2016

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
-- 2016-04-04  1.0      aylons	Created
-------------------------------------------------------------------------------




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package machine_pkg is

  constant c_pos_calc_with_downconv             : boolean := true;

  constant c_pos_calc_adc_freq                  : real    := 221.644e6;
  constant c_pos_calc_input_width               : natural := 16;
  constant c_pos_calc_mixed_width               : natural := 16;
  constant c_pos_calc_adc_ratio                 : natural := 1;

  constant c_pos_calc_dds_width                 : natural := 16;
  constant c_pos_calc_dds_points                : natural := 191;
  constant c_pos_calc_sin_file                  : string  := "../../../dsp-cores/hdl/modules/position_calc/dds_sin.nif";
  constant c_pos_calc_cos_file                  : string  := "../../../dsp-cores/hdl/modules/position_calc/dds_cos.nif";

  constant c_pos_calc_tbt_cic_delay             : natural := 1;
  constant c_pos_calc_tbt_cic_stages            : natural := 1;
  constant c_pos_calc_tbt_ratio                 : natural := 382;
  constant c_pos_calc_tbt_decim_width           : natural := 32;

  constant c_pos_calc_fofb_cic_delay            : natural := 1;
  constant c_pos_calc_fofb_cic_stages           : natural := 1;
  constant c_pos_calc_fofb_ratio                : natural := 8786;
  constant c_pos_calc_fofb_decim_width          : natural := 32;

  constant c_pos_calc_monit1_cic_delay          : natural := 1;
  constant c_pos_calc_monit1_cic_stages         : natural := 2;
  constant c_pos_calc_monit1_ratio              : natural := 26;  --ratio between fofb and monit 1
  constant c_pos_calc_monit1_cic_ratio          : natural := 8;

  constant c_pos_calc_monit2_cic_delay          : natural := 1;
  constant c_pos_calc_monit2_cic_stages         : natural := 2;
  constant c_pos_calc_monit2_ratio              : natural := 96; -- ratio between monit 1 and 2
  constant c_pos_calc_monit2_cic_ratio          : natural := 8;

  constant c_pos_calc_monit_decim_width         : natural := 32;

  constant c_pos_calc_tbt_cordic_stages         : positive := 12;
  constant c_pos_calc_tbt_cordic_iter_per_clk   : positive := 3;
  constant c_pos_calc_tbt_cordic_ratio          : positive := 8;

  constant c_pos_calc_fofb_cordic_stages        : positive := 15;
  constant c_pos_calc_fofb_cordic_iter_per_clk  : positive := 3;
  constant c_pos_calc_fofb_cordic_ratio         : positive := 8;

  constant c_pos_calc_k_width                   : natural := 24;
  constant c_pos_calc_IQ_width                  : natural := c_pos_calc_mixed_width;

  constant c_pos_calc_k_sum                     : natural := 85e5;
  constant c_pos_calc_k_x                       : natural := 85e5;
  constant c_pos_calc_k_y                       : natural := 85e5;

end machine_pkg;
