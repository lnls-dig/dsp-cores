---------------------------------------------------------------------------------------
-- Title          : Wishbone slave core for Position Calculation Core registers
---------------------------------------------------------------------------------------
-- File           : wb_pos_calc_regs_pkg.vhd
-- Author         : auto-generated by wbgen2 from wb_pos_calc_regs.wb
-- Created        : Fri Mar 22 11:13:52 2019
-- Standard       : VHDL'87
---------------------------------------------------------------------------------------
-- THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE wb_pos_calc_regs.wb
-- DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.wbgen2_pkg.all;

package pos_calc_wbgen2_pkg is
  
  
  -- Input registers (user design -> WB slave)
  
  type t_pos_calc_in_registers is record
    ds_tbt_thres_reserved_i                  : std_logic_vector(5 downto 0);
    ds_fofb_thres_reserved_i                 : std_logic_vector(5 downto 0);
    ds_monit_thres_reserved_i                : std_logic_vector(5 downto 0);
    kx_reserved_i                            : std_logic_vector(6 downto 0);
    ky_reserved_i                            : std_logic_vector(6 downto 0);
    ksum_reserved_i                          : std_logic_vector(6 downto 0);
    dsp_ctnr_tbt_ch01_i                      : std_logic_vector(15 downto 0);
    dsp_ctnr_tbt_ch23_i                      : std_logic_vector(15 downto 0);
    dsp_ctnr_fofb_ch01_i                     : std_logic_vector(15 downto 0);
    dsp_ctnr_fofb_ch23_i                     : std_logic_vector(15 downto 0);
    dsp_ctnr1_monit_cic_i                    : std_logic_vector(15 downto 0);
    dsp_ctnr1_monit_cfir_i                   : std_logic_vector(15 downto 0);
    dsp_ctnr2_monit_pfir_i                   : std_logic_vector(15 downto 0);
    dsp_ctnr2_monit_fir_01_i                 : std_logic_vector(15 downto 0);
    dds_cfg_reserved_ch0_i                   : std_logic_vector(5 downto 0);
    dds_cfg_reserved_ch1_i                   : std_logic_vector(6 downto 0);
    dds_cfg_reserved_ch2_i                   : std_logic_vector(6 downto 0);
    dds_cfg_reserved_ch3_i                   : std_logic_vector(6 downto 0);
    dds_pinc_ch0_reserved_i                  : std_logic_vector(1 downto 0);
    dds_pinc_ch1_reserved_i                  : std_logic_vector(1 downto 0);
    dds_pinc_ch2_reserved_i                  : std_logic_vector(1 downto 0);
    dds_pinc_ch3_reserved_i                  : std_logic_vector(1 downto 0);
    dds_poff_ch0_reserved_i                  : std_logic_vector(1 downto 0);
    dds_poff_ch1_reserved_i                  : std_logic_vector(1 downto 0);
    dds_poff_ch2_reserved_i                  : std_logic_vector(1 downto 0);
    dds_poff_ch3_reserved_i                  : std_logic_vector(1 downto 0);
    dsp_monit_amp_ch0_i                      : std_logic_vector(31 downto 0);
    dsp_monit_amp_ch1_i                      : std_logic_vector(31 downto 0);
    dsp_monit_amp_ch2_i                      : std_logic_vector(31 downto 0);
    dsp_monit_amp_ch3_i                      : std_logic_vector(31 downto 0);
    dsp_monit_pos_x_i                        : std_logic_vector(31 downto 0);
    dsp_monit_pos_y_i                        : std_logic_vector(31 downto 0);
    dsp_monit_pos_q_i                        : std_logic_vector(31 downto 0);
    dsp_monit_pos_sum_i                      : std_logic_vector(31 downto 0);
    ampfifo_monit_wr_req_i                   : std_logic;
    ampfifo_monit_amp_ch0_i                  : std_logic_vector(31 downto 0);
    ampfifo_monit_amp_ch1_i                  : std_logic_vector(31 downto 0);
    ampfifo_monit_amp_ch2_i                  : std_logic_vector(31 downto 0);
    ampfifo_monit_amp_ch3_i                  : std_logic_vector(31 downto 0);
    posfifo_monit_wr_req_i                   : std_logic;
    posfifo_monit_pos_x_i                    : std_logic_vector(31 downto 0);
    posfifo_monit_pos_y_i                    : std_logic_vector(31 downto 0);
    posfifo_monit_pos_q_i                    : std_logic_vector(31 downto 0);
    posfifo_monit_pos_sum_i                  : std_logic_vector(31 downto 0);
    dsp_monit1_amp_ch0_i                     : std_logic_vector(31 downto 0);
    dsp_monit1_amp_ch1_i                     : std_logic_vector(31 downto 0);
    dsp_monit1_amp_ch2_i                     : std_logic_vector(31 downto 0);
    dsp_monit1_amp_ch3_i                     : std_logic_vector(31 downto 0);
    dsp_monit1_pos_x_i                       : std_logic_vector(31 downto 0);
    dsp_monit1_pos_y_i                       : std_logic_vector(31 downto 0);
    dsp_monit1_pos_q_i                       : std_logic_vector(31 downto 0);
    dsp_monit1_pos_sum_i                     : std_logic_vector(31 downto 0);
    ampfifo_monit1_wr_req_i                  : std_logic;
    ampfifo_monit1_amp_ch0_i                 : std_logic_vector(31 downto 0);
    ampfifo_monit1_amp_ch1_i                 : std_logic_vector(31 downto 0);
    ampfifo_monit1_amp_ch2_i                 : std_logic_vector(31 downto 0);
    ampfifo_monit1_amp_ch3_i                 : std_logic_vector(31 downto 0);
    posfifo_monit1_wr_req_i                  : std_logic;
    posfifo_monit1_pos_x_i                   : std_logic_vector(31 downto 0);
    posfifo_monit1_pos_y_i                   : std_logic_vector(31 downto 0);
    posfifo_monit1_pos_q_i                   : std_logic_vector(31 downto 0);
    posfifo_monit1_pos_sum_i                 : std_logic_vector(31 downto 0);
    end record;
  
  constant c_pos_calc_in_registers_init_value: t_pos_calc_in_registers := (
    ds_tbt_thres_reserved_i => (others => '0'),
    ds_fofb_thres_reserved_i => (others => '0'),
    ds_monit_thres_reserved_i => (others => '0'),
    kx_reserved_i => (others => '0'),
    ky_reserved_i => (others => '0'),
    ksum_reserved_i => (others => '0'),
    dsp_ctnr_tbt_ch01_i => (others => '0'),
    dsp_ctnr_tbt_ch23_i => (others => '0'),
    dsp_ctnr_fofb_ch01_i => (others => '0'),
    dsp_ctnr_fofb_ch23_i => (others => '0'),
    dsp_ctnr1_monit_cic_i => (others => '0'),
    dsp_ctnr1_monit_cfir_i => (others => '0'),
    dsp_ctnr2_monit_pfir_i => (others => '0'),
    dsp_ctnr2_monit_fir_01_i => (others => '0'),
    dds_cfg_reserved_ch0_i => (others => '0'),
    dds_cfg_reserved_ch1_i => (others => '0'),
    dds_cfg_reserved_ch2_i => (others => '0'),
    dds_cfg_reserved_ch3_i => (others => '0'),
    dds_pinc_ch0_reserved_i => (others => '0'),
    dds_pinc_ch1_reserved_i => (others => '0'),
    dds_pinc_ch2_reserved_i => (others => '0'),
    dds_pinc_ch3_reserved_i => (others => '0'),
    dds_poff_ch0_reserved_i => (others => '0'),
    dds_poff_ch1_reserved_i => (others => '0'),
    dds_poff_ch2_reserved_i => (others => '0'),
    dds_poff_ch3_reserved_i => (others => '0'),
    dsp_monit_amp_ch0_i => (others => '0'),
    dsp_monit_amp_ch1_i => (others => '0'),
    dsp_monit_amp_ch2_i => (others => '0'),
    dsp_monit_amp_ch3_i => (others => '0'),
    dsp_monit_pos_x_i => (others => '0'),
    dsp_monit_pos_y_i => (others => '0'),
    dsp_monit_pos_q_i => (others => '0'),
    dsp_monit_pos_sum_i => (others => '0'),
    ampfifo_monit_wr_req_i => '0',
    ampfifo_monit_amp_ch0_i => (others => '0'),
    ampfifo_monit_amp_ch1_i => (others => '0'),
    ampfifo_monit_amp_ch2_i => (others => '0'),
    ampfifo_monit_amp_ch3_i => (others => '0'),
    posfifo_monit_wr_req_i => '0',
    posfifo_monit_pos_x_i => (others => '0'),
    posfifo_monit_pos_y_i => (others => '0'),
    posfifo_monit_pos_q_i => (others => '0'),
    posfifo_monit_pos_sum_i => (others => '0'),
    dsp_monit1_amp_ch0_i => (others => '0'),
    dsp_monit1_amp_ch1_i => (others => '0'),
    dsp_monit1_amp_ch2_i => (others => '0'),
    dsp_monit1_amp_ch3_i => (others => '0'),
    dsp_monit1_pos_x_i => (others => '0'),
    dsp_monit1_pos_y_i => (others => '0'),
    dsp_monit1_pos_q_i => (others => '0'),
    dsp_monit1_pos_sum_i => (others => '0'),
    ampfifo_monit1_wr_req_i => '0',
    ampfifo_monit1_amp_ch0_i => (others => '0'),
    ampfifo_monit1_amp_ch1_i => (others => '0'),
    ampfifo_monit1_amp_ch2_i => (others => '0'),
    ampfifo_monit1_amp_ch3_i => (others => '0'),
    posfifo_monit1_wr_req_i => '0',
    posfifo_monit1_pos_x_i => (others => '0'),
    posfifo_monit1_pos_y_i => (others => '0'),
    posfifo_monit1_pos_q_i => (others => '0'),
    posfifo_monit1_pos_sum_i => (others => '0')
    );
    
    -- Output registers (WB slave -> user design)
    
    type t_pos_calc_out_registers is record
      ds_tbt_thres_val_o                       : std_logic_vector(25 downto 0);
      ds_fofb_thres_val_o                      : std_logic_vector(25 downto 0);
      ds_monit_thres_val_o                     : std_logic_vector(25 downto 0);
      kx_val_o                                 : std_logic_vector(24 downto 0);
      ky_val_o                                 : std_logic_vector(24 downto 0);
      ksum_val_o                               : std_logic_vector(24 downto 0);
      dsp_err_clr_tbt_o                        : std_logic;
      dsp_err_clr_fofb_o                       : std_logic;
      dsp_err_clr_monit_part1_o                : std_logic;
      dsp_err_clr_monit_part2_o                : std_logic;
      dds_cfg_valid_ch0_o                      : std_logic;
      dds_cfg_test_data_o                      : std_logic;
      dds_cfg_valid_ch1_o                      : std_logic;
      dds_cfg_valid_ch2_o                      : std_logic;
      dds_cfg_valid_ch3_o                      : std_logic;
      dds_pinc_ch0_val_o                       : std_logic_vector(29 downto 0);
      dds_pinc_ch1_val_o                       : std_logic_vector(29 downto 0);
      dds_pinc_ch2_val_o                       : std_logic_vector(29 downto 0);
      dds_pinc_ch3_val_o                       : std_logic_vector(29 downto 0);
      dds_poff_ch0_val_o                       : std_logic_vector(29 downto 0);
      dds_poff_ch1_val_o                       : std_logic_vector(29 downto 0);
      dds_poff_ch2_val_o                       : std_logic_vector(29 downto 0);
      dds_poff_ch3_val_o                       : std_logic_vector(29 downto 0);
      dsp_monit_updt_o                         : std_logic_vector(31 downto 0);
      dsp_monit_updt_wr_o                      : std_logic;
      ampfifo_monit_wr_full_o                  : std_logic;
      ampfifo_monit_wr_empty_o                 : std_logic;
      ampfifo_monit_wr_usedw_o                 : std_logic_vector(3 downto 0);
      posfifo_monit_wr_full_o                  : std_logic;
      posfifo_monit_wr_empty_o                 : std_logic;
      posfifo_monit_wr_usedw_o                 : std_logic_vector(3 downto 0);
      dsp_monit1_updt_o                        : std_logic_vector(31 downto 0);
      dsp_monit1_updt_wr_o                     : std_logic;
      ampfifo_monit1_wr_full_o                 : std_logic;
      ampfifo_monit1_wr_empty_o                : std_logic;
      ampfifo_monit1_wr_usedw_o                : std_logic_vector(3 downto 0);
      posfifo_monit1_wr_full_o                 : std_logic;
      posfifo_monit1_wr_empty_o                : std_logic;
      posfifo_monit1_wr_usedw_o                : std_logic_vector(3 downto 0);
      sw_tag_en_o                              : std_logic;
      sw_data_mask_en_o                        : std_logic;
      sw_data_mask_samples_o                   : std_logic_vector(15 downto 0);
      sync_tbt_trig_en_o                       : std_logic;
      sync_tbt_trig_dly_o                      : std_logic_vector(15 downto 0);
      end record;
    
    constant c_pos_calc_out_registers_init_value: t_pos_calc_out_registers := (
      ds_tbt_thres_val_o => (others => '0'),
      ds_fofb_thres_val_o => (others => '0'),
      ds_monit_thres_val_o => (others => '0'),
      kx_val_o => (others => '0'),
      ky_val_o => (others => '0'),
      ksum_val_o => (others => '0'),
      dsp_err_clr_tbt_o => '0',
      dsp_err_clr_fofb_o => '0',
      dsp_err_clr_monit_part1_o => '0',
      dsp_err_clr_monit_part2_o => '0',
      dds_cfg_valid_ch0_o => '0',
      dds_cfg_test_data_o => '0',
      dds_cfg_valid_ch1_o => '0',
      dds_cfg_valid_ch2_o => '0',
      dds_cfg_valid_ch3_o => '0',
      dds_pinc_ch0_val_o => (others => '0'),
      dds_pinc_ch1_val_o => (others => '0'),
      dds_pinc_ch2_val_o => (others => '0'),
      dds_pinc_ch3_val_o => (others => '0'),
      dds_poff_ch0_val_o => (others => '0'),
      dds_poff_ch1_val_o => (others => '0'),
      dds_poff_ch2_val_o => (others => '0'),
      dds_poff_ch3_val_o => (others => '0'),
      dsp_monit_updt_o => (others => '0'),
      dsp_monit_updt_wr_o => '0',
      ampfifo_monit_wr_full_o => '0',
      ampfifo_monit_wr_empty_o => '0',
      ampfifo_monit_wr_usedw_o => (others => '0'),
      posfifo_monit_wr_full_o => '0',
      posfifo_monit_wr_empty_o => '0',
      posfifo_monit_wr_usedw_o => (others => '0'),
      dsp_monit1_updt_o => (others => '0'),
      dsp_monit1_updt_wr_o => '0',
      ampfifo_monit1_wr_full_o => '0',
      ampfifo_monit1_wr_empty_o => '0',
      ampfifo_monit1_wr_usedw_o => (others => '0'),
      posfifo_monit1_wr_full_o => '0',
      posfifo_monit1_wr_empty_o => '0',
      posfifo_monit1_wr_usedw_o => (others => '0'),
      sw_tag_en_o => '0',
      sw_data_mask_en_o => '0',
      sw_data_mask_samples_o => (others => '0'),
      sync_tbt_trig_en_o => '0',
      sync_tbt_trig_dly_o => (others => '0')
      );
    function "or" (left, right: t_pos_calc_in_registers) return t_pos_calc_in_registers;
    function f_x_to_zero (x:std_logic) return std_logic;
    function f_x_to_zero (x:std_logic_vector) return std_logic_vector;
end package;

package body pos_calc_wbgen2_pkg is
function f_x_to_zero (x:std_logic) return std_logic is
begin
if x = '1' then
return '1';
else
return '0';
end if;
end function;
function f_x_to_zero (x:std_logic_vector) return std_logic_vector is
variable tmp: std_logic_vector(x'length-1 downto 0);
begin
for i in 0 to x'length-1 loop
if(x(i) = 'X' or x(i) = 'U') then
tmp(i):= '0';
else
tmp(i):=x(i);
end if; 
end loop; 
return tmp;
end function;
function "or" (left, right: t_pos_calc_in_registers) return t_pos_calc_in_registers is
variable tmp: t_pos_calc_in_registers;
begin
tmp.ds_tbt_thres_reserved_i := f_x_to_zero(left.ds_tbt_thres_reserved_i) or f_x_to_zero(right.ds_tbt_thres_reserved_i);
tmp.ds_fofb_thres_reserved_i := f_x_to_zero(left.ds_fofb_thres_reserved_i) or f_x_to_zero(right.ds_fofb_thres_reserved_i);
tmp.ds_monit_thres_reserved_i := f_x_to_zero(left.ds_monit_thres_reserved_i) or f_x_to_zero(right.ds_monit_thres_reserved_i);
tmp.kx_reserved_i := f_x_to_zero(left.kx_reserved_i) or f_x_to_zero(right.kx_reserved_i);
tmp.ky_reserved_i := f_x_to_zero(left.ky_reserved_i) or f_x_to_zero(right.ky_reserved_i);
tmp.ksum_reserved_i := f_x_to_zero(left.ksum_reserved_i) or f_x_to_zero(right.ksum_reserved_i);
tmp.dsp_ctnr_tbt_ch01_i := f_x_to_zero(left.dsp_ctnr_tbt_ch01_i) or f_x_to_zero(right.dsp_ctnr_tbt_ch01_i);
tmp.dsp_ctnr_tbt_ch23_i := f_x_to_zero(left.dsp_ctnr_tbt_ch23_i) or f_x_to_zero(right.dsp_ctnr_tbt_ch23_i);
tmp.dsp_ctnr_fofb_ch01_i := f_x_to_zero(left.dsp_ctnr_fofb_ch01_i) or f_x_to_zero(right.dsp_ctnr_fofb_ch01_i);
tmp.dsp_ctnr_fofb_ch23_i := f_x_to_zero(left.dsp_ctnr_fofb_ch23_i) or f_x_to_zero(right.dsp_ctnr_fofb_ch23_i);
tmp.dsp_ctnr1_monit_cic_i := f_x_to_zero(left.dsp_ctnr1_monit_cic_i) or f_x_to_zero(right.dsp_ctnr1_monit_cic_i);
tmp.dsp_ctnr1_monit_cfir_i := f_x_to_zero(left.dsp_ctnr1_monit_cfir_i) or f_x_to_zero(right.dsp_ctnr1_monit_cfir_i);
tmp.dsp_ctnr2_monit_pfir_i := f_x_to_zero(left.dsp_ctnr2_monit_pfir_i) or f_x_to_zero(right.dsp_ctnr2_monit_pfir_i);
tmp.dsp_ctnr2_monit_fir_01_i := f_x_to_zero(left.dsp_ctnr2_monit_fir_01_i) or f_x_to_zero(right.dsp_ctnr2_monit_fir_01_i);
tmp.dds_cfg_reserved_ch0_i := f_x_to_zero(left.dds_cfg_reserved_ch0_i) or f_x_to_zero(right.dds_cfg_reserved_ch0_i);
tmp.dds_cfg_reserved_ch1_i := f_x_to_zero(left.dds_cfg_reserved_ch1_i) or f_x_to_zero(right.dds_cfg_reserved_ch1_i);
tmp.dds_cfg_reserved_ch2_i := f_x_to_zero(left.dds_cfg_reserved_ch2_i) or f_x_to_zero(right.dds_cfg_reserved_ch2_i);
tmp.dds_cfg_reserved_ch3_i := f_x_to_zero(left.dds_cfg_reserved_ch3_i) or f_x_to_zero(right.dds_cfg_reserved_ch3_i);
tmp.dds_pinc_ch0_reserved_i := f_x_to_zero(left.dds_pinc_ch0_reserved_i) or f_x_to_zero(right.dds_pinc_ch0_reserved_i);
tmp.dds_pinc_ch1_reserved_i := f_x_to_zero(left.dds_pinc_ch1_reserved_i) or f_x_to_zero(right.dds_pinc_ch1_reserved_i);
tmp.dds_pinc_ch2_reserved_i := f_x_to_zero(left.dds_pinc_ch2_reserved_i) or f_x_to_zero(right.dds_pinc_ch2_reserved_i);
tmp.dds_pinc_ch3_reserved_i := f_x_to_zero(left.dds_pinc_ch3_reserved_i) or f_x_to_zero(right.dds_pinc_ch3_reserved_i);
tmp.dds_poff_ch0_reserved_i := f_x_to_zero(left.dds_poff_ch0_reserved_i) or f_x_to_zero(right.dds_poff_ch0_reserved_i);
tmp.dds_poff_ch1_reserved_i := f_x_to_zero(left.dds_poff_ch1_reserved_i) or f_x_to_zero(right.dds_poff_ch1_reserved_i);
tmp.dds_poff_ch2_reserved_i := f_x_to_zero(left.dds_poff_ch2_reserved_i) or f_x_to_zero(right.dds_poff_ch2_reserved_i);
tmp.dds_poff_ch3_reserved_i := f_x_to_zero(left.dds_poff_ch3_reserved_i) or f_x_to_zero(right.dds_poff_ch3_reserved_i);
tmp.dsp_monit_amp_ch0_i := f_x_to_zero(left.dsp_monit_amp_ch0_i) or f_x_to_zero(right.dsp_monit_amp_ch0_i);
tmp.dsp_monit_amp_ch1_i := f_x_to_zero(left.dsp_monit_amp_ch1_i) or f_x_to_zero(right.dsp_monit_amp_ch1_i);
tmp.dsp_monit_amp_ch2_i := f_x_to_zero(left.dsp_monit_amp_ch2_i) or f_x_to_zero(right.dsp_monit_amp_ch2_i);
tmp.dsp_monit_amp_ch3_i := f_x_to_zero(left.dsp_monit_amp_ch3_i) or f_x_to_zero(right.dsp_monit_amp_ch3_i);
tmp.dsp_monit_pos_x_i := f_x_to_zero(left.dsp_monit_pos_x_i) or f_x_to_zero(right.dsp_monit_pos_x_i);
tmp.dsp_monit_pos_y_i := f_x_to_zero(left.dsp_monit_pos_y_i) or f_x_to_zero(right.dsp_monit_pos_y_i);
tmp.dsp_monit_pos_q_i := f_x_to_zero(left.dsp_monit_pos_q_i) or f_x_to_zero(right.dsp_monit_pos_q_i);
tmp.dsp_monit_pos_sum_i := f_x_to_zero(left.dsp_monit_pos_sum_i) or f_x_to_zero(right.dsp_monit_pos_sum_i);
tmp.ampfifo_monit_wr_req_i := f_x_to_zero(left.ampfifo_monit_wr_req_i) or f_x_to_zero(right.ampfifo_monit_wr_req_i);
tmp.ampfifo_monit_amp_ch0_i := f_x_to_zero(left.ampfifo_monit_amp_ch0_i) or f_x_to_zero(right.ampfifo_monit_amp_ch0_i);
tmp.ampfifo_monit_amp_ch1_i := f_x_to_zero(left.ampfifo_monit_amp_ch1_i) or f_x_to_zero(right.ampfifo_monit_amp_ch1_i);
tmp.ampfifo_monit_amp_ch2_i := f_x_to_zero(left.ampfifo_monit_amp_ch2_i) or f_x_to_zero(right.ampfifo_monit_amp_ch2_i);
tmp.ampfifo_monit_amp_ch3_i := f_x_to_zero(left.ampfifo_monit_amp_ch3_i) or f_x_to_zero(right.ampfifo_monit_amp_ch3_i);
tmp.posfifo_monit_wr_req_i := f_x_to_zero(left.posfifo_monit_wr_req_i) or f_x_to_zero(right.posfifo_monit_wr_req_i);
tmp.posfifo_monit_pos_x_i := f_x_to_zero(left.posfifo_monit_pos_x_i) or f_x_to_zero(right.posfifo_monit_pos_x_i);
tmp.posfifo_monit_pos_y_i := f_x_to_zero(left.posfifo_monit_pos_y_i) or f_x_to_zero(right.posfifo_monit_pos_y_i);
tmp.posfifo_monit_pos_q_i := f_x_to_zero(left.posfifo_monit_pos_q_i) or f_x_to_zero(right.posfifo_monit_pos_q_i);
tmp.posfifo_monit_pos_sum_i := f_x_to_zero(left.posfifo_monit_pos_sum_i) or f_x_to_zero(right.posfifo_monit_pos_sum_i);
tmp.dsp_monit1_amp_ch0_i := f_x_to_zero(left.dsp_monit1_amp_ch0_i) or f_x_to_zero(right.dsp_monit1_amp_ch0_i);
tmp.dsp_monit1_amp_ch1_i := f_x_to_zero(left.dsp_monit1_amp_ch1_i) or f_x_to_zero(right.dsp_monit1_amp_ch1_i);
tmp.dsp_monit1_amp_ch2_i := f_x_to_zero(left.dsp_monit1_amp_ch2_i) or f_x_to_zero(right.dsp_monit1_amp_ch2_i);
tmp.dsp_monit1_amp_ch3_i := f_x_to_zero(left.dsp_monit1_amp_ch3_i) or f_x_to_zero(right.dsp_monit1_amp_ch3_i);
tmp.dsp_monit1_pos_x_i := f_x_to_zero(left.dsp_monit1_pos_x_i) or f_x_to_zero(right.dsp_monit1_pos_x_i);
tmp.dsp_monit1_pos_y_i := f_x_to_zero(left.dsp_monit1_pos_y_i) or f_x_to_zero(right.dsp_monit1_pos_y_i);
tmp.dsp_monit1_pos_q_i := f_x_to_zero(left.dsp_monit1_pos_q_i) or f_x_to_zero(right.dsp_monit1_pos_q_i);
tmp.dsp_monit1_pos_sum_i := f_x_to_zero(left.dsp_monit1_pos_sum_i) or f_x_to_zero(right.dsp_monit1_pos_sum_i);
tmp.ampfifo_monit1_wr_req_i := f_x_to_zero(left.ampfifo_monit1_wr_req_i) or f_x_to_zero(right.ampfifo_monit1_wr_req_i);
tmp.ampfifo_monit1_amp_ch0_i := f_x_to_zero(left.ampfifo_monit1_amp_ch0_i) or f_x_to_zero(right.ampfifo_monit1_amp_ch0_i);
tmp.ampfifo_monit1_amp_ch1_i := f_x_to_zero(left.ampfifo_monit1_amp_ch1_i) or f_x_to_zero(right.ampfifo_monit1_amp_ch1_i);
tmp.ampfifo_monit1_amp_ch2_i := f_x_to_zero(left.ampfifo_monit1_amp_ch2_i) or f_x_to_zero(right.ampfifo_monit1_amp_ch2_i);
tmp.ampfifo_monit1_amp_ch3_i := f_x_to_zero(left.ampfifo_monit1_amp_ch3_i) or f_x_to_zero(right.ampfifo_monit1_amp_ch3_i);
tmp.posfifo_monit1_wr_req_i := f_x_to_zero(left.posfifo_monit1_wr_req_i) or f_x_to_zero(right.posfifo_monit1_wr_req_i);
tmp.posfifo_monit1_pos_x_i := f_x_to_zero(left.posfifo_monit1_pos_x_i) or f_x_to_zero(right.posfifo_monit1_pos_x_i);
tmp.posfifo_monit1_pos_y_i := f_x_to_zero(left.posfifo_monit1_pos_y_i) or f_x_to_zero(right.posfifo_monit1_pos_y_i);
tmp.posfifo_monit1_pos_q_i := f_x_to_zero(left.posfifo_monit1_pos_q_i) or f_x_to_zero(right.posfifo_monit1_pos_q_i);
tmp.posfifo_monit1_pos_sum_i := f_x_to_zero(left.posfifo_monit1_pos_sum_i) or f_x_to_zero(right.posfifo_monit1_pos_sum_i);
return tmp;
end function;
end package body;
