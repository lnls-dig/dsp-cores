library ieee;
use ieee.std_logic_1164.all;

package position_calc_uvx_const_pkg is

  --------------------------------------------------------------------
  -- Constants
  --------------------------------------------------------------------
  constant c_pos_calc_input_width           : natural := 16;
  constant c_pos_calc_mixed_width           : natural := 16;
  constant c_pos_calc_adc_ratio             : natural := 2;

  constant c_pos_calc_dds_width             : natural := 16;
  constant c_pos_calc_dds_points            : natural := 35;
  constant c_pos_calc_sin_file              : string  := "../../../dsp-cores/hdl/modules/position_calc/dds_sin.nif";
  constant c_pos_calc_cos_file              : string  := "../../../dsp-cores/hdl/modules/position_calc/dds_cos.nif";

  constant c_pos_calc_tbt_cic_delay         : natural := 1;
  constant c_pos_calc_tbt_cic_stages        : natural := 2;
  constant c_pos_calc_tbt_ratio             : natural := 35;  -- ratio between
  constant c_pos_calc_tbt_decim_width       : natural := 32;

  constant c_pos_calc_fofb_cic_delay        : natural := 1;
  constant c_pos_calc_fofb_cic_stages       : natural := 2;
  constant c_pos_calc_fofb_ratio            : natural := 980;  -- ratio between adc and fofb rates
  constant c_pos_calc_fofb_decim_width      : natural := 32;

  constant c_pos_calc_monit1_cic_delay      : natural := 1;
  constant c_pos_calc_monit1_cic_stages     : natural := 1;
  constant c_pos_calc_monit1_ratio          : natural := 100;  --ratio between fofb and monit 1

  constant c_pos_calc_monit2_cic_delay      : natural := 1;
  constant c_pos_calc_monit2_cic_stages     : natural := 1;
  constant c_pos_calc_monit2_ratio          : natural := 100; -- ratio between monit 1 and 2

  constant c_pos_calc_monit_decim_width     : natural := 32;

  constant c_pos_calc_k_width               : natural := 24;

  constant c_pos_calc_IQ_width              : natural := 32;

end position_calc_uvx_const_pkg;
