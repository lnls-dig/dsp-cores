------------------------------------------------------------------------------
-- Title      : Wishbone Position Calculation Core
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2013-07-02
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Core Module for position calculation with de-cross, amplitude compensation
-- and delay tuning.
-------------------------------------------------------------------------------
-- Copyright (c) 2012 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-07-02  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- DSP Cores
use work.dsp_cores_pkg.all;
-- Position Calc
use work.position_calc_core_pkg.all;
-- WB registers
use work.pos_calc_wbgen2_pkg.all;

entity wb_position_calc_core is
generic
(
  g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
  g_address_granularity                     : t_wishbone_address_granularity := WORD;
  g_rffe_version			    : string                         := "V2";
  g_with_switching                          : natural := 0
);
port
(
  rst_n_i                                   : in std_logic;
  clk_i                                     : in std_logic; -- Wishbone clock
  fs_rst_n_i                                : in std_logic; -- FS reset
  fs_rst2x_n_i                              : in std_logic; -- FS 2x reset
  fs_clk_i                                  : in std_logic; -- clock period = 8.8823218389287 ns (112.583175675676 Mhz)
  fs_clk2x_i                                : in std_logic; -- clock period = 4.4411609194644 ns (225.166351351351 Mhz)

  -----------------------------
  -- Wishbone signals
  -----------------------------

  wb_adr_i                                  : in  std_logic_vector(c_wishbone_address_width-1 downto 0) := (others => '0');
  wb_dat_i                                  : in  std_logic_vector(c_wishbone_data_width-1 downto 0) := (others => '0');
  wb_dat_o                                  : out std_logic_vector(c_wishbone_data_width-1 downto 0);
  wb_sel_i                                  : in  std_logic_vector(c_wishbone_data_width/8-1 downto 0) := (others => '0');
  wb_we_i                                   : in  std_logic := '0';
  wb_cyc_i                                  : in  std_logic := '0';
  wb_stb_i                                  : in  std_logic := '0';
  wb_ack_o                                  : out std_logic;
  wb_stall_o                                : out std_logic;

  -----------------------------
  -- Raw ADC signals
  -----------------------------

  adc_ch0_i                                 : in std_logic_vector(15 downto 0);
  adc_ch1_i                                 : in std_logic_vector(15 downto 0);
  adc_ch2_i                                 : in std_logic_vector(15 downto 0);
  adc_ch3_i                                 : in std_logic_vector(15 downto 0);

  -----------------------------
  -- Position calculation at various rates
  -----------------------------

  adc_ch0_dbg_data_o                        : out std_logic_vector(15 downto 0);
  adc_ch1_dbg_data_o                        : out std_logic_vector(15 downto 0);
  adc_ch2_dbg_data_o                        : out std_logic_vector(15 downto 0);
  adc_ch3_dbg_data_o                        : out std_logic_vector(15 downto 0);

  -----------------------------
  -- BPF Data
  -----------------------------

  bpf_ch0_o                                 : out std_logic_vector(23 downto 0);
  bpf_ch1_o                                 : out std_logic_vector(23 downto 0);
  bpf_ch2_o                                 : out std_logic_vector(23 downto 0);
  bpf_ch3_o                                 : out std_logic_vector(23 downto 0);
  bpf_valid_o                               : out std_logic;

  -----------------------------
  -- MIX Data
  -----------------------------

  mix_ch0_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch0_q_o                               : out std_logic_vector(23 downto 0);
  mix_ch1_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch1_q_o                               : out std_logic_vector(23 downto 0);
  mix_ch2_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch2_q_o                               : out std_logic_vector(23 downto 0);
  mix_ch3_i_o                               : out std_logic_vector(23 downto 0);
  mix_ch3_q_o                               : out std_logic_vector(23 downto 0);
  mix_valid_o                               : out std_logic;

  -----------------------------
  -- TBT Data
  -----------------------------

  tbt_decim_ch0_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch0_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch1_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch1_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch2_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch2_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch3_i_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_ch3_q_o                         : out std_logic_vector(23 downto 0);
  tbt_decim_valid_o                         : out std_logic;

  tbt_amp_ch0_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_ch1_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_ch2_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_ch3_o                             : out std_logic_vector(23 downto 0);
  tbt_amp_valid_o                           : out std_logic;

  tbt_pha_ch0_o                             : out std_logic_vector(23 downto 0);
  tbt_pha_ch1_o                             : out std_logic_vector(23 downto 0);
  tbt_pha_ch2_o                             : out std_logic_vector(23 downto 0);
  tbt_pha_ch3_o                             : out std_logic_vector(23 downto 0);
  tbt_pha_valid_o                           : out std_logic;

  -----------------------------
  -- FOFB Data
  -----------------------------

  fofb_decim_ch0_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch0_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch1_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch1_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch2_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch2_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch3_i_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_ch3_q_o                        : out std_logic_vector(23 downto 0);
  fofb_decim_valid_o                        : out std_logic;

  fofb_amp_ch0_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_ch1_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_ch2_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_ch3_o                            : out std_logic_vector(23 downto 0);
  fofb_amp_valid_o                          : out std_logic;

  fofb_pha_ch0_o                            : out std_logic_vector(23 downto 0);
  fofb_pha_ch1_o                            : out std_logic_vector(23 downto 0);
  fofb_pha_ch2_o                            : out std_logic_vector(23 downto 0);
  fofb_pha_ch3_o                            : out std_logic_vector(23 downto 0);
  fofb_pha_valid_o                          : out std_logic;

  -----------------------------
  -- Monit. Data
  -----------------------------

  monit_amp_ch0_o                           : out std_logic_vector(23 downto 0);
  monit_amp_ch1_o                           : out std_logic_vector(23 downto 0);
  monit_amp_ch2_o                           : out std_logic_vector(23 downto 0);
  monit_amp_ch3_o                           : out std_logic_vector(23 downto 0);
  monit_amp_valid_o                         : out std_logic;

  -----------------------------
  -- Position Data
  -----------------------------

  pos_x_tbt_o                               : out std_logic_vector(25 downto 0);
  pos_y_tbt_o                               : out std_logic_vector(25 downto 0);
  pos_q_tbt_o                               : out std_logic_vector(25 downto 0);
  pos_sum_tbt_o                             : out std_logic_vector(25 downto 0);
  pos_tbt_valid_o                           : out std_logic;

  pos_x_fofb_o                              : out std_logic_vector(25 downto 0);
  pos_y_fofb_o                              : out std_logic_vector(25 downto 0);
  pos_q_fofb_o                              : out std_logic_vector(25 downto 0);
  pos_sum_fofb_o                            : out std_logic_vector(25 downto 0);
  pos_fofb_valid_o                          : out std_logic;

  pos_x_monit_o                             : out std_logic_vector(25 downto 0);
  pos_y_monit_o                             : out std_logic_vector(25 downto 0);
  pos_q_monit_o                             : out std_logic_vector(25 downto 0);
  pos_sum_monit_o                           : out std_logic_vector(25 downto 0);
  pos_monit_valid_o                         : out std_logic;

  pos_x_monit_1_o                           : out std_logic_vector(25 downto 0);
  pos_y_monit_1_o                           : out std_logic_vector(25 downto 0);
  pos_q_monit_1_o                           : out std_logic_vector(25 downto 0);
  pos_sum_monit_1_o                         : out std_logic_vector(25 downto 0);
  pos_monit_1_valid_o                       : out std_logic;

  -----------------------------
  -- Output to RFFE board
  -----------------------------

  clk_swap_o                                : out std_logic;
  flag1_o                                   : out std_logic;
  flag2_o                                   : out std_logic;
  ctrl1_o                                   : out std_logic_vector(7 downto 0);
  ctrl2_o                                   : out std_logic_vector(7 downto 0);

  -----------------------------
  -- Clock drivers for various rates
  -----------------------------

  clk_ce_1_o                                : out std_logic;
  clk_ce_1112_o                             : out std_logic;
  clk_ce_11120000_o                         : out std_logic;
  clk_ce_111200000_o                        : out std_logic;
  clk_ce_1390000_o                          : out std_logic;
  clk_ce_2_o                                : out std_logic;
  clk_ce_2224_o                             : out std_logic;
  clk_ce_22240000_o                         : out std_logic;
  clk_ce_222400000_o                        : out std_logic;
  clk_ce_2780000_o                          : out std_logic;
  clk_ce_35_o                               : out std_logic;
  clk_ce_5000_o                             : out std_logic;
  clk_ce_556_o                              : out std_logic;
  clk_ce_5560000_o                          : out std_logic;
  clk_ce_70_o                               : out std_logic;

  dbg_cur_address_o                         : out std_logic_vector(31 downto 0);
  dbg_adc_ch0_cond_o                        : out std_logic_vector(15 downto 0);
  dbg_adc_ch1_cond_o                        : out std_logic_vector(15 downto 0);
  dbg_adc_ch2_cond_o                        : out std_logic_vector(15 downto 0);
  dbg_adc_ch3_cond_o                        : out std_logic_vector(15 downto 0)
);
end wb_position_calc_core;

architecture rtl of wb_position_calc_core is

  ---------------------------------------------------------
  --                     Constants                       --
  ---------------------------------------------------------
  constant c_periph_addr_size               : natural := 5+2;

  constant c_cdc_data_ref_width             : natural := 4*c_dsp_ref_num_bits; -- c_num_adc_channels ?
  constant c_cdc_data_ref_iq_width          : natural := 8*c_dsp_ref_num_bits; -- c_num_adc_channels*2 ?
  constant c_cdc_data_pos_width             : natural := 4*c_dsp_pos_num_bits; -- c_num_adc_channels ?
  constant c_cdc_ref_size                   : natural := 16;

  -- Crossbar component constants
  -- Number of slaves
  constant c_slaves                         : natural := 2;
  -- Number of masters
  constant c_masters                        : natural := 1;            -- Top master.

  constant c_num_pipeline_regs              : integer := 8;

  -- WB SDB (Self describing bus) layout
  constant c_layout : t_sdb_record_array(c_slaves-1 downto 0) :=
  ( 0 => f_sdb_embed_device(c_xwb_pos_calc_core_regs_sdb,
                                                        x"00000000"),   -- Register interface
    1 => f_sdb_embed_device(c_xwb_bpm_swap_sdb,         x"00000100")    -- WB swap
  );

  -- Self Describing Bus ROM Address. It will be an addressed slave as well.
  constant c_sdb_address                    : t_wishbone_address := x"00000600";

  ---------------------------------------------------------
  --                  General Signals                    --
  ---------------------------------------------------------

  signal sys_clr                            : std_logic;
  signal sys_clr2x                          : std_logic;

  -- Try to reduce fanout of clear signal
  attribute MAX_FANOUT: string;
  attribute MAX_FANOUT of sys_clr: signal is "REDUCE";
  attribute MAX_FANOUT of sys_clr2x: signal is "REDUCE";

  -----------------------------
  -- Wishbone slave adapter signals/structures
  -----------------------------
  signal wb_slv_adp_out                     : t_wishbone_master_out;
  signal wb_slv_adp_in                      : t_wishbone_master_in;
  signal resized_addr                       : std_logic_vector(c_wishbone_address_width-1 downto 0);

  -- Register interface signals
  signal regs_out                           : t_pos_calc_out_registers;
  signal regs_in                            : t_pos_calc_in_registers;

  -----------------------------
  -- Wishbone crossbar signals
  -----------------------------
  -- Crossbar master/slave arrays
  signal cbar_slave_in                      : t_wishbone_slave_in_array (c_masters-1 downto 0);
  signal cbar_slave_out                     : t_wishbone_slave_out_array(c_masters-1 downto 0);
  signal cbar_master_in                     : t_wishbone_master_in_array(c_slaves-1 downto 0);
  signal cbar_master_out                    : t_wishbone_master_out_array(c_slaves-1 downto 0);

  ---------------------------------------------------------
  --               ADC, MIX and BPF data                 --
  ---------------------------------------------------------

  signal adc_ch0_sp                         : std_logic_vector(15 downto 0);
  signal adc_ch1_sp                         : std_logic_vector(15 downto 0);
  signal adc_ch2_sp                         : std_logic_vector(15 downto 0);
  signal adc_ch3_sp                         : std_logic_vector(15 downto 0);

  signal adc_ch0_cond                       : std_logic_vector(15 downto 0);
  signal adc_ch1_cond                       : std_logic_vector(15 downto 0);
  signal adc_ch2_cond                       : std_logic_vector(15 downto 0);
  signal adc_ch3_cond                       : std_logic_vector(15 downto 0);

  -- Input conditioner signals
  signal adc_ch0_pos_calc                   : std_logic_vector(15 downto 0);
  signal adc_ch1_pos_calc                   : std_logic_vector(15 downto 0);
  signal adc_ch2_pos_calc                   : std_logic_vector(15 downto 0);
  signal adc_ch3_pos_calc                   : std_logic_vector(15 downto 0);

  -- BPM Swap signals
  signal sw_mode1                           : std_logic_vector(1 downto 0);
  signal sw_mode2                           : std_logic_vector(1 downto 0);
  signal clk_swap_en                        : std_logic;

  signal wdw_rst                            : std_logic;
  signal wdw_rst_n                          : std_logic;
  signal wdw_input_cond_rst_n               : std_logic;
  signal wdw_sw_clk_in                      : std_logic;
  signal wdw_sw_clk                         : std_logic;
  signal wdw_use_en                         : std_logic;
  signal wdw_dly                            : std_logic_vector(15 downto 0);

  signal bpf_ch0                            : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal bpf_ch1                            : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal bpf_ch2                            : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal bpf_ch3                            : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal bpf_valid                          : std_logic := '1';

  signal mix_ch0_i                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch0_q                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch1_i                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch1_q                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch2_i                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch2_q                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch3_i                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_ch3_q                          : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal mix_valid                          : std_logic := '1';

  ---------------------------------------------------------
  --                     TBT data                        --
  ---------------------------------------------------------

  signal tbt_decim_ch0_i                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch0_q                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch1_i                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch1_q                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch2_i                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch2_q                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch3_i                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_ch3_q                    : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_decim_valid                    : std_logic := '1';

  signal tbt_decim_q_ch01_incorrect_int     : std_logic;
  signal tbt_decim_q_ch23_incorrect_int     : std_logic;

  signal tbt_amp_ch0                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_amp_ch1                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_amp_ch2                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_amp_ch3                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_amp_valid                      : std_logic := '1';

  signal tbt_pha_ch0                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_pha_ch1                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_pha_ch2                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_pha_ch3                        : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal tbt_pha_valid                      : std_logic := '1';

  ---------------------------------------------------------
  --                     FOFB data                       --
  ---------------------------------------------------------

  signal fofb_decim_ch0_i                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch0_q                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch1_i                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch1_q                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch2_i                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch2_q                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch3_i                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_ch3_q                   : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_decim_valid                   : std_logic := '1';

  signal fofb_decim_q_ch01_missing_int      : std_logic;
  signal fofb_decim_q_ch23_missing_int      : std_logic;

  signal fofb_amp_ch0                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_amp_ch1                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_amp_ch2                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_amp_ch3                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_amp_valid                     : std_logic := '1';

  signal fofb_pha_ch0                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_pha_ch1                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_pha_ch2                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_pha_ch3                       : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal fofb_pha_valid                     : std_logic := '1';

  ---------------------------------------------------------
  --                   Monitoring data                   --
  ---------------------------------------------------------

  signal monit_amp_ch0                      : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_ch1                      : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_ch2                      : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_ch3                      : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_valid                    : std_logic := '1';

  signal monit_amp_ch0_fs_sync              : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_ch1_fs_sync              : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_ch2_fs_sync              : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_ch3_fs_sync              : std_logic_vector(c_dsp_ref_num_bits-1 downto 0);
  signal monit_amp_valid_fs_sync            : std_logic := '1';

  signal monit_cic_unexpected_int           : std_logic;
  signal monit_cfir_incorrect_int           : std_logic;
  signal monit_pfir_incorrect_int           : std_logic;
  signal monit_pos_1_incorrect_int          : std_logic;

  ---------------------------------------------------------
  --                   Position data                     --
  ---------------------------------------------------------

  signal x_tbt                              : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal x_tbt_valid                        : std_logic := '1';
  signal y_tbt                              : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal y_tbt_valid                        : std_logic := '1';
  signal q_tbt                              : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal q_tbt_valid                        : std_logic := '1';
  signal sum_tbt                            : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal sum_tbt_valid                      : std_logic := '1';

  signal x_fofb                             : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal x_fofb_valid                       : std_logic := '1';
  signal y_fofb                             : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal y_fofb_valid                       : std_logic := '1';
  signal q_fofb                             : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal q_fofb_valid                       : std_logic := '1';
  signal sum_fofb                           : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal sum_fofb_valid                     : std_logic := '1';

  signal x_monit                            : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal x_monit_valid                      : std_logic := '1';
  signal y_monit                            : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal y_monit_valid                      : std_logic := '1';
  signal q_monit                            : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal q_monit_valid                      : std_logic := '1';
  signal sum_monit                          : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal sum_monit_valid                    : std_logic := '1';

  signal x_monit_fs_sync                    : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal y_monit_fs_sync                    : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal q_monit_fs_sync                    : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal sum_monit_fs_sync                  : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal pos_monit_valid_fs_sync            : std_logic := '1';

  signal x_monit_1                          : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal x_monit_1_valid                    : std_logic := '1';
  signal y_monit_1                          : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal y_monit_1_valid                    : std_logic := '1';
  signal q_monit_1                          : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal q_monit_1_valid                    : std_logic := '1';
  signal sum_monit_1                        : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal sum_monit_1_valid                  : std_logic := '1';

  signal x_monit_1_fs_sync                  : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal y_monit_1_fs_sync                  : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal q_monit_1_fs_sync                  : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal sum_monit_1_fs_sync                : std_logic_vector(c_dsp_pos_num_bits-1 downto 0);
  signal pos_monit_1_valid_fs_sync          : std_logic := '1';

  ---------------------------------------------------------
  -- FIFO CDC signals
  ---------------------------------------------------------

  signal fifo_bpf_in                        : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_bpf_out                       : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_bpf_valid_in                  : std_logic;
  signal fifo_bpf_valid_out                 : std_logic;

  signal fifo_mix_in                        : std_logic_vector(c_cdc_data_ref_iq_width-1 downto 0);
  signal fifo_mix_out                       : std_logic_vector(c_cdc_data_ref_iq_width-1 downto 0);
  signal fifo_mix_valid_in                  : std_logic;
  signal fifo_mix_valid_out                 : std_logic;

  signal fifo_tbt_decim_in                  : std_logic_vector(c_cdc_data_ref_iq_width-1 downto 0);
  signal fifo_tbt_decim_out                 : std_logic_vector(c_cdc_data_ref_iq_width-1 downto 0);
  signal fifo_tbt_decim_valid_in            : std_logic;
  signal fifo_tbt_decim_valid_out           : std_logic;

  signal fifo_tbt_amp_in                    : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_tbt_amp_out                   : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_tbt_amp_valid_in              : std_logic;
  signal fifo_tbt_amp_valid_out             : std_logic;

  signal fifo_tbt_pha_in                    : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_tbt_pha_out                   : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_tbt_pha_valid_in              : std_logic;
  signal fifo_tbt_pha_valid_out             : std_logic;

  signal fifo_tbt_pos_in                    : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_tbt_pos_out                   : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_tbt_pos_valid_in              : std_logic;
  signal fifo_tbt_pos_valid_out             : std_logic;

  signal fifo_fofb_decim_in                 : std_logic_vector(c_cdc_data_ref_iq_width-1 downto 0);
  signal fifo_fofb_decim_out                : std_logic_vector(c_cdc_data_ref_iq_width-1 downto 0);
  signal fifo_fofb_decim_valid_in           : std_logic;
  signal fifo_fofb_decim_valid_out          : std_logic;

  signal fifo_fofb_amp_in                   : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_fofb_amp_out                  : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_fofb_amp_valid_in             : std_logic;
  signal fifo_fofb_amp_valid_out            : std_logic;

  signal fifo_fofb_pha_in                   : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_fofb_pha_out                  : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_fofb_pha_valid_in             : std_logic;
  signal fifo_fofb_pha_valid_out            : std_logic;

  signal fifo_fofb_pos_in                   : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_fofb_pos_out                  : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_fofb_pos_valid_in             : std_logic;
  signal fifo_fofb_pos_valid_out            : std_logic;

  signal fifo_monit_amp_in                  : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_monit_amp_out                 : std_logic_vector(c_cdc_data_ref_width-1 downto 0);
  signal fifo_monit_amp_valid_in            : std_logic;
  signal fifo_monit_amp_valid_out           : std_logic;

  signal fifo_monit_pos_in                  : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_monit_pos_out                 : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_monit_pos_valid_in            : std_logic;
  signal fifo_monit_pos_valid_out           : std_logic;

  signal fifo_monit_1_pos_in                : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_monit_1_pos_out               : std_logic_vector(c_cdc_data_pos_width-1 downto 0);
  signal fifo_monit_1_pos_valid_in          : std_logic;
  signal fifo_monit_1_pos_valid_out         : std_logic;

  ---------------------------------------------------------
  --                Clock Enable signals                 --
  ---------------------------------------------------------
  signal clk_ce_1                            : std_logic;
  signal clk_ce_1112                         : std_logic;
  signal clk_ce_1390000                      : std_logic;
  signal clk_ce_2                            : std_logic;
  signal clk_ce_2224                         : std_logic;
  signal clk_ce_22240000                     : std_logic;
  signal clk_ce_222400000                    : std_logic;
  signal clk_ce_2780000                      : std_logic;
  signal clk_ce_35                           : std_logic;
  signal clk_ce_5000                         : std_logic;
  signal clk_ce_556                          : std_logic;
  signal clk_ce_5560000                      : std_logic;
  signal clk_ce_70                           : std_logic;

  signal clk_ce_11120000_int                 : std_logic;
  signal clk_ce_111200000_int                : std_logic;

  -- Components instatiation

  component wb_pos_calc_regs
  port (
    rst_n_i                                  : in     std_logic;
    clk_sys_i                                : in     std_logic;
    wb_adr_i                                 : in     std_logic_vector(4 downto 0);
    wb_dat_i                                 : in     std_logic_vector(31 downto 0);
    wb_dat_o                                 : out    std_logic_vector(31 downto 0);
    wb_cyc_i                                 : in     std_logic;
    wb_sel_i                                 : in     std_logic_vector(3 downto 0);
    wb_stb_i                                 : in     std_logic;
    wb_we_i                                  : in     std_logic;
    wb_ack_o                                 : out    std_logic;
    wb_stall_o                               : out    std_logic;
    fs_clk_i                                 : in     std_logic;
    fs_clk2x_i                               : in     std_logic;
    regs_i                                   : in     t_pos_calc_in_registers;
    regs_o                                   : out    t_pos_calc_out_registers
  );
  end component;

begin
  -- fs_rst_n_i                              => fs_rst_n_i,
  --sys_clr                                   <= not fs_rst_n_i;
  --sys_clr2x                                 <= not fs_rst2x_n_i;
  sys_clr                                   <= '0';
  sys_clr2x                                 <= '0';

  -----------------------------
  -- WB Position Calc Core Address decoder
  -----------------------------
  -- We need 2 outputs, as in the same wishbone addressing range, 2
  -- other wishbone peripherals must be driven:
  --
  -- 0 -> WB Position Calc Core Register Wishbone Interface
  -- 1 -> WB Uncross module.

  -- The Internal Wishbone B.4 crossbar
  cmp_interconnect : xwb_sdb_crossbar
  generic map(
    g_num_masters                             => c_masters,
    g_num_slaves                              => c_slaves,
    g_registered                              => true,
    g_wraparound                              => true, -- Should be true for nested buses
    g_layout                                  => c_layout,
    g_sdb_addr                                => c_sdb_address
  )
  port map(
    clk_sys_i                                 => clk_i,
    rst_n_i                                   => rst_n_i,
    -- Master connections (INTERCON is a slave)
    slave_i                                   => cbar_slave_in,
    slave_o                                   => cbar_slave_out,
    -- Slave connections (INTERCON is a master)
    master_i                                  => cbar_master_in,
    master_o                                  => cbar_master_out
  );

  -- External master connection
  cbar_slave_in(0).adr                        <= wb_adr_i;
  cbar_slave_in(0).dat                        <= wb_dat_i;
  cbar_slave_in(0).sel                        <= wb_sel_i;
  cbar_slave_in(0).we                         <= wb_we_i;
  cbar_slave_in(0).cyc                        <= wb_cyc_i;
  cbar_slave_in(0).stb                        <= wb_stb_i;

  wb_dat_o                                    <= cbar_slave_out(0).dat;
  wb_ack_o                                    <= cbar_slave_out(0).ack;
  wb_stall_o                                  <= cbar_slave_out(0).stall;

  -----------------------------
  -- Slave adapter for Wishbone Register Interface
  -----------------------------
  cmp_slave_adapter : wb_slave_adapter
  generic map (
    g_master_use_struct                     => true,
    g_master_mode                           => PIPELINED,
    g_master_granularity                    => WORD,
    g_slave_use_struct                      => false,
    g_slave_mode                            => g_interface_mode,
    g_slave_granularity                     => g_address_granularity
  )
  port map (
    clk_sys_i                               => clk_i,
    rst_n_i                                 => rst_n_i,
    master_i                                => wb_slv_adp_in,
    master_o                                => wb_slv_adp_out,
    sl_adr_i                                => resized_addr,
    sl_dat_i                                => cbar_master_out(0).dat,
    sl_sel_i                                => cbar_master_out(0).sel,
    sl_cyc_i                                => cbar_master_out(0).cyc,
    sl_stb_i                                => cbar_master_out(0).stb,
    sl_we_i                                 => cbar_master_out(0).we,
    sl_dat_o                                => cbar_master_in(0).dat,
    sl_ack_o                                => cbar_master_in(0).ack,
    sl_rty_o                                => cbar_master_in(0).rty,
    sl_err_o                                => cbar_master_in(0).err,
    sl_int_o                                => cbar_master_in(0).int,
    sl_stall_o                              => cbar_master_in(0).stall
  );

  resized_addr(c_periph_addr_size-1 downto 0)
                                            <= cbar_master_out(0).adr(c_periph_addr_size-1 downto 0);
  resized_addr(c_wishbone_address_width-1 downto c_periph_addr_size)
                                            <= (others => '0');

  -----------------------------
  -- Position Calc Core Register Wishbone Interface. Word addressed!
  -----------------------------
  --Position Calc Core register interface is the slave number 0, word addressed
  cmp_wb_pos_calc_regs : wb_pos_calc_regs
  port map(
    rst_n_i                                 => rst_n_i,
    clk_sys_i                               => clk_i,
    wb_adr_i                                => wb_slv_adp_out.adr(4 downto 0),
    wb_dat_i                                => wb_slv_adp_out.dat,
    wb_dat_o                                => wb_slv_adp_in.dat,
    wb_cyc_i                                => wb_slv_adp_out.cyc,
    wb_sel_i                                => wb_slv_adp_out.sel,
    wb_stb_i                                => wb_slv_adp_out.stb,
    wb_we_i                                 => wb_slv_adp_out.we,
    wb_ack_o                                => wb_slv_adp_in.ack,
    wb_stall_o                              => wb_slv_adp_in.stall,
    fs_clk_i                                => fs_clk_i,
    fs_clk2x_i                              => fs_clk2x_i,
    regs_i                                  => regs_in,
    regs_o                                  => regs_out
  );

  -- Unused wishbone signals
  wb_slv_adp_in.int                         <= '0';
  wb_slv_adp_in.err                         <= '0';
  wb_slv_adp_in.rty                         <= '0';

  -- Registers fixed assignments
  regs_in.ds_tbt_thres_reserved_i           <= (others => '0');
  regs_in.ds_fofb_thres_reserved_i          <= (others => '0');
  regs_in.ds_monit_thres_reserved_i         <= (others => '0');
  regs_in.kx_reserved_i                     <= (others => '0');
  regs_in.ky_reserved_i                     <= (others => '0');
  regs_in.ksum_reserved_i                   <= (others => '0');
  regs_in.dds_cfg_reserved_ch0_i            <= (others => '0');
  regs_in.dds_cfg_reserved_ch1_i            <= (others => '0');
  regs_in.dds_cfg_reserved_ch2_i            <= (others => '0');
  regs_in.dds_cfg_reserved_ch3_i            <= (others => '0');
  regs_in.dds_pinc_ch0_reserved_i           <= (others => '0');
  regs_in.dds_pinc_ch1_reserved_i           <= (others => '0');
  regs_in.dds_pinc_ch2_reserved_i           <= (others => '0');
  regs_in.dds_pinc_ch3_reserved_i           <= (others => '0');
  regs_in.dds_poff_ch0_reserved_i           <= (others => '0');
  regs_in.dds_poff_ch1_reserved_i           <= (others => '0');
  regs_in.dds_poff_ch2_reserved_i           <= (others => '0');
  regs_in.dds_poff_ch3_reserved_i           <= (others => '0');

  -- Sync with fs_clk
  regs_in.dsp_monit_amp_ch0_i               <=
    std_logic_vector(resize(signed(monit_amp_ch0_fs_sync), regs_in.dsp_monit_amp_ch0_i'length));
  regs_in.dsp_monit_amp_ch1_i               <=
    std_logic_vector(resize(signed(monit_amp_ch1_fs_sync), regs_in.dsp_monit_amp_ch1_i'length));
  regs_in.dsp_monit_amp_ch2_i               <=
    std_logic_vector(resize(signed(monit_amp_ch2_fs_sync), regs_in.dsp_monit_amp_ch2_i'length));
  regs_in.dsp_monit_amp_ch3_i               <=
    std_logic_vector(resize(signed(monit_amp_ch3_fs_sync), regs_in.dsp_monit_amp_ch3_i'length));

  -- Sync with fs_clk
  regs_in.dsp_monit_pos_x_i                 <=
    std_logic_vector(resize(signed(x_monit_fs_sync), regs_in.dsp_monit_pos_x_i'length));
  regs_in.dsp_monit_pos_y_i                 <=
    std_logic_vector(resize(signed(y_monit_fs_sync), regs_in.dsp_monit_pos_y_i'length));
  regs_in.dsp_monit_pos_q_i                 <=
    std_logic_vector(resize(signed(q_monit_fs_sync), regs_in.dsp_monit_pos_q_i'length));
  regs_in.dsp_monit_pos_sum_i               <=
    std_logic_vector(resize(signed(sum_monit_fs_sync), regs_in.dsp_monit_pos_sum_i'length));

  -----------------------------
  -- BPM Swap Module.
  -----------------------------
  -- BPM Swap Module interface is the slave number 1
  cmp_wb_bpm_swap : wb_bpm_swap
  generic map
  (
    g_interface_mode                          => g_interface_mode,
    g_address_granularity                     => g_address_granularity
  )
  port map
  (
    rst_n_i                                   => rst_n_i,
    clk_sys_i                                 => clk_i,
    fs_clk_i                                  => fs_clk_i,
    fs_rst_n_i                                => fs_rst_n_i,

    -----------------------------
    -- Wishbone signals
    -----------------------------
    wb_adr_i                                  => cbar_master_out(1).adr,
    wb_dat_i                                  => cbar_master_out(1).dat,
    wb_dat_o                                  => cbar_master_in(1).dat,
    wb_sel_i                                  => cbar_master_out(1).sel,
    wb_we_i                                   => cbar_master_out(1).we,
    wb_cyc_i                                  => cbar_master_out(1).cyc,
    wb_stb_i                                  => cbar_master_out(1).stb,
    wb_ack_o                                  => cbar_master_in(1).ack,
    wb_stall_o                                => cbar_master_in(1).stall,

    -----------------------------
    -- External ports
    -----------------------------
    -- Input from ADC FMC board
    cha_i                                     => adc_ch0_i,
    chb_i                                     => adc_ch1_i,
    chc_i                                     => adc_ch2_i,
    chd_i                                     => adc_ch3_i,

    -- Output to data processing level
    cha_o                                     => adc_ch0_sp,
    chb_o                                     => adc_ch1_sp,
    chc_o                                     => adc_ch2_sp,
    chd_o                                     => adc_ch3_sp,

    mode1_o                                   => sw_mode1,
    mode2_o                                   => sw_mode2,

    wdw_rst_o                                 => wdw_rst,
    wdw_sw_clk_i                              => wdw_sw_clk_in,
    wdw_use_o                                 => wdw_use_en,
    wdw_dly_o                                 => wdw_dly,

    -- Output to RFFE board
    clk_swap_o                                => clk_swap_o,
    clk_swap_en_o                             => clk_swap_en,
    flag1_o                                   => flag1_o,
    flag2_o                                   => flag2_o,
    ctrl1_o                                   => ctrl1_o,
    ctrl2_o                                   => ctrl2_o
  );

  wdw_sw_clk_in                               <= wdw_sw_clk;
  wdw_rst_n                                   <= not wdw_rst;

  adc_ch0_dbg_data_o                          <= adc_ch0_sp;
  adc_ch1_dbg_data_o                          <= adc_ch1_sp;
  adc_ch2_dbg_data_o                          <= adc_ch2_sp;
  adc_ch3_dbg_data_o                          <= adc_ch3_sp;

  cmp_input_conditioner : input_conditioner
  generic map
  (
    g_sw_interval                             => 1000/2, -- We need to generate 2x the FOFB decimation rate
    g_input_width  	                      => 16, -- FIXME: use ADC constant
    g_output_width 	                      => 16, -- FIXME: use ADC constant
    g_window_width 	                      => 24, -- This must match the MATLAB script
    g_input_delay  	                      => 2+3, -- wb_bpm_swap fixed latency + multiplier pipeline latency
    g_window_coef_file                        => f_window_file(g_rffe_version)
  )
  port map
  (
    reset_n_i                                 => wdw_input_cond_rst_n,
    clk_i                                     => fs_clk_i,

    adc_a_i                                   => adc_ch0_sp,
    adc_b_i                                   => adc_ch1_sp,
    adc_c_i                                   => adc_ch2_sp,
    adc_d_i                                   => adc_ch3_sp,

    switch_o 				      => wdw_sw_clk,
    switch_en_i                               => clk_swap_en,
    switch_delay_i                            => wdw_dly,

    a_o                                       => adc_ch0_cond,
    b_o                                       => adc_ch1_cond,
    c_o                                       => adc_ch2_cond,
    d_o                                       => adc_ch3_cond,

    dbg_cur_address_o                         => dbg_cur_address_o
  );

  wdw_input_cond_rst_n                        <= fs_rst_n_i or wdw_rst_n;

  dbg_adc_ch0_cond_o                          <= adc_ch0_cond;
  dbg_adc_ch1_cond_o                          <= adc_ch1_cond;
  dbg_adc_ch2_cond_o                          <= adc_ch2_cond;
  dbg_adc_ch3_cond_o                          <= adc_ch3_cond;

  -- Bypass windowing conditioning if switching is disabled
  --
  -- sw_mode1 controls channels 0 and 2 : "00" is matched,
  --   "01" is direct, "10" is inverted, "11" is switching
  --
  -- sw_mode2 controls channels 1 and 3 : "00" is matched,
  --   "01" is direct, "10" is inverted, "11" is switching
  --adc_ch0_pos_calc <= adc_ch0_cond when sw_mode1 = "11" else adc_ch0_sp;
  --adc_ch1_pos_calc <= adc_ch1_cond when sw_mode2 = "11" else adc_ch1_sp;
  --adc_ch2_pos_calc <= adc_ch2_cond when sw_mode1 = "11" else adc_ch2_sp;
  --adc_ch3_pos_calc <= adc_ch3_cond when sw_mode2 = "11" else adc_ch3_sp;
  adc_ch0_pos_calc <= adc_ch0_cond when wdw_use_en = '1' else adc_ch0_sp;
  adc_ch1_pos_calc <= adc_ch1_cond when wdw_use_en = '1' else adc_ch1_sp;
  adc_ch2_pos_calc <= adc_ch2_cond when wdw_use_en = '1' else adc_ch2_sp;
  adc_ch3_pos_calc <= adc_ch3_cond when wdw_use_en = '1' else adc_ch3_sp;

  cmp_position_calc: position_calc
  generic map
  (
    g_pipeline_regs                         => c_num_pipeline_regs
  )
  port map
  (
    adc_ch0_i                               => adc_ch0_pos_calc,
    adc_ch1_i                               => adc_ch1_pos_calc,
    adc_ch2_i                               => adc_ch2_pos_calc,
    adc_ch3_i                               => adc_ch3_pos_calc,

    clk                                     => fs_clk2x_i,
    clr                                     => sys_clr2x,

    del_sig_div_fofb_thres_i                => regs_out.ds_tbt_thres_val_o,
    del_sig_div_monit_thres_i               => regs_out.ds_fofb_thres_val_o,
    del_sig_div_tbt_thres_i                 => regs_out.ds_monit_thres_val_o,

    ksum_i                                  => regs_out.ksum_val_o,
    kx_i                                    => regs_out.kx_val_o,
    ky_i                                    => regs_out.ky_val_o,

    dds_config_valid_ch0_i                  => regs_out.dds_cfg_valid_ch0_o,
    dds_config_valid_ch1_i                  => regs_out.dds_cfg_valid_ch1_o,
    dds_config_valid_ch2_i                  => regs_out.dds_cfg_valid_ch2_o,
    dds_config_valid_ch3_i                  => regs_out.dds_cfg_valid_ch3_o,
    dds_pinc_ch0_i                          => regs_out.dds_pinc_ch0_val_o,
    dds_pinc_ch1_i                          => regs_out.dds_pinc_ch1_val_o,
    dds_pinc_ch2_i                          => regs_out.dds_pinc_ch2_val_o,
    dds_pinc_ch3_i                          => regs_out.dds_pinc_ch3_val_o,
    dds_poff_ch0_i                          => regs_out.dds_poff_ch0_val_o,
    dds_poff_ch1_i                          => regs_out.dds_poff_ch1_val_o,
    dds_poff_ch2_i                          => regs_out.dds_poff_ch2_val_o,
    dds_poff_ch3_i                          => regs_out.dds_poff_ch3_val_o,

    --adc_ch0_dbg_data_o                      => adc_ch0_dbg_data_o,
    --adc_ch1_dbg_data_o                      => adc_ch1_dbg_data_o,
    --adc_ch2_dbg_data_o                      => adc_ch2_dbg_data_o,
    --adc_ch3_dbg_data_o                      => adc_ch3_dbg_data_o,
    adc_ch0_dbg_data_o                      => open,
    adc_ch1_dbg_data_o                      => open,
    adc_ch2_dbg_data_o                      => open,
    adc_ch3_dbg_data_o                      => open,

    bpf_ch0_o                               => bpf_ch0,
    bpf_ch1_o                               => bpf_ch1,
    bpf_ch2_o                               => bpf_ch2,
    bpf_ch3_o                               => bpf_ch3,

    mix_ch0_i_o                             => mix_ch0_i,
    mix_ch0_q_o                             => mix_ch0_q,
    mix_ch1_i_o                             => mix_ch1_i,
    mix_ch1_q_o                             => mix_ch1_q,
    mix_ch2_i_o                             => mix_ch2_i,
    mix_ch2_q_o                             => mix_ch2_q,
    mix_ch3_i_o                             => mix_ch3_i,
    mix_ch3_q_o                             => mix_ch3_q,

    tbt_decim_ch0_i_o                       => tbt_decim_ch0_i,
    tbt_decim_ch0_q_o                       => tbt_decim_ch0_q,
    tbt_decim_ch1_i_o                       => tbt_decim_ch1_i,
    tbt_decim_ch1_q_o                       => tbt_decim_ch1_q,
    tbt_decim_ch2_i_o                       => tbt_decim_ch2_i,
    tbt_decim_ch2_q_o                       => tbt_decim_ch2_q,
    tbt_decim_ch3_i_o                       => tbt_decim_ch3_i,
    tbt_decim_ch3_q_o                       => tbt_decim_ch3_q,

    tbt_decim_q_ch01_incorrect_o            => tbt_decim_q_ch01_incorrect_int,
    tbt_decim_q_ch23_incorrect_o            => tbt_decim_q_ch23_incorrect_int,

    tbt_amp_ch0_o                           => tbt_amp_ch0,
    tbt_amp_ch1_o                           => tbt_amp_ch1,
    tbt_amp_ch2_o                           => tbt_amp_ch2,
    tbt_amp_ch3_o                           => tbt_amp_ch3,

    tbt_pha_ch0_o                           => tbt_pha_ch0,
    tbt_pha_ch1_o                           => tbt_pha_ch1,
    tbt_pha_ch2_o                           => tbt_pha_ch2,
    tbt_pha_ch3_o                           => tbt_pha_ch3,

    fofb_decim_ch0_i_o                      => fofb_decim_ch0_i,
    fofb_decim_ch0_q_o                      => fofb_decim_ch0_q,
    fofb_decim_ch1_i_o                      => fofb_decim_ch1_i,
    fofb_decim_ch1_q_o                      => fofb_decim_ch1_q,
    fofb_decim_ch2_i_o                      => fofb_decim_ch2_i,
    fofb_decim_ch2_q_o                      => fofb_decim_ch2_q,
    fofb_decim_ch3_i_o                      => fofb_decim_ch3_i,
    fofb_decim_ch3_q_o                      => fofb_decim_ch3_q,

    fofb_decim_q_01_missing_o               => fofb_decim_q_ch01_missing_int,
    fofb_decim_q_23_missing_o               => fofb_decim_q_ch23_missing_int,

    fofb_amp_ch0_o                          => fofb_amp_ch0,
    fofb_amp_ch1_o                          => fofb_amp_ch1,
    fofb_amp_ch2_o                          => fofb_amp_ch2,
    fofb_amp_ch3_o                          => fofb_amp_ch3,

    fofb_pha_ch0_o                          => fofb_pha_ch0,
    fofb_pha_ch1_o                          => fofb_pha_ch1,
    fofb_pha_ch2_o                          => fofb_pha_ch2,
    fofb_pha_ch3_o                          => fofb_pha_ch3,

    monit_amp_ch0_o                         => monit_amp_ch0,
    monit_amp_ch1_o                         => monit_amp_ch1,
    monit_amp_ch2_o                         => monit_amp_ch2,
    monit_amp_ch3_o                         => monit_amp_ch3,

    monit_cic_unexpected_o                  => monit_cic_unexpected_int,
    monit_cfir_incorrect_o                  => monit_cfir_incorrect_int,
    monit_pfir_incorrect_o                  => monit_pfir_incorrect_int,

    x_tbt_o                                 => x_tbt,
    x_tbt_valid_o                           => x_tbt_valid,
    y_tbt_o                                 => y_tbt,
    y_tbt_valid_o                           => y_tbt_valid,   -- will be removed soon
    q_tbt_o                                 => q_tbt,
    q_tbt_valid_o                           => q_tbt_valid,   -- will be removed soon
    sum_tbt_o                               => sum_tbt,
    sum_tbt_valid_o                         => sum_tbt_valid, -- will be removed soon

    x_fofb_o                                => x_fofb,
    x_fofb_valid_o                          => x_fofb_valid,
    y_fofb_o                                => y_fofb,
    y_fofb_valid_o                          => y_fofb_valid,  -- will be removed soon
    q_fofb_o                                => q_fofb,
    q_fofb_valid_o                          => q_fofb_valid,  -- will be removed soon
    sum_fofb_o                              => sum_fofb,
    sum_fofb_valid_o                        => sum_fofb_valid,-- will be removed soon

    x_monit_o                               => x_monit,
    x_monit_valid_o                         => x_monit_valid,
    y_monit_o                               => y_monit,
    y_monit_valid_o                         => y_monit_valid,   -- will be removed soon
    q_monit_o                               => q_monit,
    q_monit_valid_o                         => q_monit_valid,   -- will be removed soon
    sum_monit_o                             => sum_monit,
    sum_monit_valid_o                       => sum_monit_valid, -- will be removed soon

    x_monit_1_o                             => x_monit_1,
    x_monit_1_valid_o                       => x_monit_1_valid,
    y_monit_1_o                             => y_monit_1,
    y_monit_1_valid_o                       => y_monit_1_valid,  -- will be removed soon
    q_monit_1_o                             => q_monit_1,
    q_monit_1_valid_o                       => q_monit_1_valid,  -- will be removed soon
    sum_monit_1_o                           => sum_monit_1,
    sum_monit_1_valid_o                     => sum_monit_1_valid,-- will be removed soon

    monit_pos_1_incorrect_o                 => monit_pos_1_incorrect_int,

    -- Clock drivers for various rates
    clk_ce_1_o                              => clk_ce_1,
    clk_ce_1112_o                           => clk_ce_1112,
    clk_ce_1390000_o                        => clk_ce_1390000,
    clk_ce_2_o                              => clk_ce_2,
    clk_ce_2224_o                           => clk_ce_2224,
    clk_ce_22240000_o                       => clk_ce_22240000,
    clk_ce_222400000_o                      => clk_ce_222400000,
    clk_ce_2780000_o                        => clk_ce_2780000,
    clk_ce_35_o                             => clk_ce_35,
    clk_ce_5000_o                           => clk_ce_5000,
    clk_ce_556_o                            => clk_ce_556,
    clk_ce_5560000_o                        => clk_ce_5560000,
    clk_ce_70_o                             => clk_ce_70
  );

  --------------------------------------------------------------------------
  --                            Missing CE                                --
  --------------------------------------------------------------------------
  -- Generate missing clk_ce_11120000
  cmp_xlclockdriver_clk_ce_11120000 : xlclockdriver
    generic map (
      log_2_period => 24,
      period => 11200000, -- FIXME: Change CE net name to the correct ones! This is just to avoid changing the interface
      pipeline_regs => c_num_pipeline_regs,
      use_bufg => 0
    )
    port map (
      sysce => '1',
      sysclk => fs_clk2x_i,
      sysclr => sys_clr2x,
      ce => clk_ce_11120000_int,
      clk => open
    );

  clk_ce_11120000_o <= clk_ce_11120000_int;

  -- Generate missing clk_ce_111200000
  cmp_xlclockdriver_clk_ce_111200000 : xlclockdriver
    generic map (
      log_2_period => 27,
      period => 112000000, -- FIXME: Change CE net name to the correct ones! This is just to avoid changing the interface
      pipeline_regs => c_num_pipeline_regs,
      use_bufg => 0
    )
    port map (
      sysce => '1',
      sysclk => fs_clk2x_i,
      sysclr => sys_clr2x,
      ce => clk_ce_111200000_int,
      clk => open
    );

  clk_ce_111200000_o <= clk_ce_111200000_int;

  -- Output CE
  clk_ce_1_o         <= clk_ce_1;
  clk_ce_1112_o      <= clk_ce_1112;
  clk_ce_1390000_o   <= clk_ce_1390000;
  clk_ce_2_o         <= clk_ce_2;
  clk_ce_2224_o      <= clk_ce_2224;
  clk_ce_22240000_o  <= clk_ce_22240000;
  clk_ce_222400000_o <= clk_ce_222400000;
  clk_ce_2780000_o   <= clk_ce_2780000;
  clk_ce_35_o        <= clk_ce_35;
  clk_ce_5000_o      <= clk_ce_5000;
  clk_ce_556_o       <= clk_ce_556;
  clk_ce_5560000_o   <= clk_ce_5560000;
  clk_ce_70_o        <= clk_ce_70;

  --------------------------------------------------------------------------
  -- Position Calc Counters
  --------------------------------------------------------------------------

  cmp_position_calc_counters : position_calc_counters
  port map
  (
    fs_clk2x_i                              => fs_clk2x_i,-- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
    fs_rst2x_n_i                            => fs_rst2x_n_i,

    -- Clock enables for various rates
    tbt_ce_i                                => clk_ce_70,
    fofb_ce_i                               => clk_ce_2224,
    monit_cic_ce_i                          => clk_ce_5560000,
    monit_cfir_ce_i                         => clk_ce_11120000_int, -- check this rate!
    monit_pfir_ce_i                         => clk_ce_22240000,
    monit_01_ce_i                           => clk_ce_222400000,

    tbt_decim_q_ch01_incorrect_i            => tbt_decim_q_ch01_incorrect_int,
    tbt_decim_q_ch23_incorrect_i            => tbt_decim_q_ch23_incorrect_int,
    tbt_decim_err_clr_i                     => regs_out.dsp_err_clr_tbt_o,

    fofb_decim_q_ch01_missing_i             => fofb_decim_q_ch01_missing_int,
    fofb_decim_q_ch23_missing_i             => fofb_decim_q_ch23_missing_int,
    fofb_decim_err_clr_i                    => regs_out.dsp_err_clr_fofb_o,

    monit_cic_unexpected_i                  => monit_cic_unexpected_int,
    monit_cfir_incorrect_i                  => monit_cfir_incorrect_int,
    monit_part1_err_clr_i                   => regs_out.dsp_err_clr_monit_part1_o,

    monit_pfir_incorrect_i                  => monit_pfir_incorrect_int,
    monit_pos_1_incorrect_i                 => monit_pos_1_incorrect_int,
    monit_part2_err_clr_i                   => regs_out.dsp_err_clr_monit_part2_o,

    tbt_incorrect_ctnr_ch01_o               => regs_in.dsp_ctnr_tbt_ch01_i,
    tbt_incorrect_ctnr_ch23_o               => regs_in.dsp_ctnr_tbt_ch23_i,

    fofb_incorrect_ctnr_ch01_o              => regs_in.dsp_ctnr_fofb_ch01_i,
    fofb_incorrect_ctnr_ch23_o              => regs_in.dsp_ctnr_fofb_ch23_i,

    monit_cic_incorrect_ctnr_o              => regs_in.dsp_ctnr1_monit_cic_i,
    monit_cfir_incorrect_ctnr_o             => regs_in.dsp_ctnr1_monit_cfir_i,
    monit_pfir_incorrect_ctnr_o             => regs_in.dsp_ctnr2_monit_pfir_i,

    monit_01_incorrect_ctnr_o               => regs_in.dsp_ctnr2_monit_fir_01_i
  );

  --------------------------------------------------------------------------
  --    CDC position data (Amplitudes and Position) to fs_clk domain      --
  --------------------------------------------------------------------------

  --------------------------------------------------------------------------
  --                        MIX and BPF data                              --
  --------------------------------------------------------------------------

  -- BPF data
  cmp_position_calc_cdc_fifo_bpf : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_bpf_in,
    valid_i                                   => fifo_bpf_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_bpf_out,
    valid_o                                   => fifo_bpf_valid_out
  );

  p_reg_cdc_fifo_bpf_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_bpf_in <= (others => '0');
        fifo_bpf_valid_in <= '0';
      elsif clk_ce_2 = '1' then
        fifo_bpf_in <= bpf_ch3 & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                       bpf_ch2 & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                       bpf_ch1 & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                       bpf_ch0;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_bpf_valid_in <= bpf_valid;
      else
        fifo_bpf_valid_in <= '0';
      end if;
    end if;
  end process;

  bpf_ch3_o <= fifo_bpf_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  bpf_ch2_o <= fifo_bpf_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  bpf_ch1_o <= fifo_bpf_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  bpf_ch0_o <= fifo_bpf_out(c_dsp_ref_num_bits-1 downto 0);

  bpf_valid_o <= fifo_bpf_valid_out;

  -- MIX data
  cmp_position_calc_cdc_fifo_mix : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_iq_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_mix_in,
    valid_i                                   => fifo_mix_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_mix_out,
    valid_o                                   => fifo_mix_valid_out
  );

  p_reg_cdc_fifo_mix_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_mix_in <= (others => '0');
        fifo_mix_valid_in <= '0';
      elsif clk_ce_2 = '1' then
        fifo_mix_in <=  mix_ch3_q & -- 8*c_dsp_ref_num_bits-1 downto 7*c_dsp_ref_num_bits
                        mix_ch3_i & -- 7*c_dsp_ref_num_bits-1 downto 6*c_dsp_ref_num_bits
                        mix_ch2_q & -- 6*c_dsp_ref_num_bits-1 downto 5*c_dsp_ref_num_bits
                        mix_ch2_i & -- 5*c_dsp_ref_num_bits-1 downto 4*c_dsp_ref_num_bits
                        mix_ch1_q & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                        mix_ch1_i & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                        mix_ch0_q & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                        mix_ch0_i;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_mix_valid_in <= mix_valid;
      else
        fifo_mix_valid_in <= '0';
      end if;
    end if;
  end process;

  mix_ch3_q_o <= fifo_mix_out(8*c_dsp_ref_num_bits-1 downto 7*c_dsp_ref_num_bits);
  mix_ch3_i_o <= fifo_mix_out(7*c_dsp_ref_num_bits-1 downto 6*c_dsp_ref_num_bits);
  mix_ch2_q_o <= fifo_mix_out(6*c_dsp_ref_num_bits-1 downto 5*c_dsp_ref_num_bits);
  mix_ch2_i_o <= fifo_mix_out(5*c_dsp_ref_num_bits-1 downto 4*c_dsp_ref_num_bits);
  mix_ch1_q_o <= fifo_mix_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  mix_ch1_i_o <= fifo_mix_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  mix_ch0_q_o <= fifo_mix_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  mix_ch0_i_o <= fifo_mix_out(c_dsp_ref_num_bits-1 downto 0);

  mix_valid_o <= fifo_mix_valid_out;

  --------------------------------------------------------------------------
  --                              TBT data                                --
  --------------------------------------------------------------------------

  -- TBT Decim data
  cmp_position_calc_cdc_fifo_tbt_decim : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_iq_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_tbt_decim_in,
    valid_i                                   => fifo_tbt_decim_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_tbt_decim_out,
    valid_o                                   => fifo_tbt_decim_valid_out
  );

  p_reg_cdc_fifo_tbt_decim_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_tbt_decim_in <= (others => '0');
        fifo_tbt_decim_valid_in <= '0';
      elsif clk_ce_70 = '1' then
        fifo_tbt_decim_in <=  tbt_decim_ch3_q & -- 8*c_dsp_ref_num_bits-1 downto 7*c_dsp_ref_num_bits
                        tbt_decim_ch3_i & -- 7*c_dsp_ref_num_bits-1 downto 6*c_dsp_ref_num_bits
                        tbt_decim_ch2_q & -- 6*c_dsp_ref_num_bits-1 downto 5*c_dsp_ref_num_bits
                        tbt_decim_ch2_i & -- 5*c_dsp_ref_num_bits-1 downto 4*c_dsp_ref_num_bits
                        tbt_decim_ch1_q & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                        tbt_decim_ch1_i & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                        tbt_decim_ch0_q & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                        tbt_decim_ch0_i;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_tbt_decim_valid_in <= tbt_decim_valid;
      else
        fifo_tbt_decim_valid_in <= '0';
      end if;
    end if;
  end process;

  tbt_decim_ch3_q_o <= fifo_tbt_decim_out(8*c_dsp_ref_num_bits-1 downto 7*c_dsp_ref_num_bits);
  tbt_decim_ch3_i_o <= fifo_tbt_decim_out(7*c_dsp_ref_num_bits-1 downto 6*c_dsp_ref_num_bits);
  tbt_decim_ch2_q_o <= fifo_tbt_decim_out(6*c_dsp_ref_num_bits-1 downto 5*c_dsp_ref_num_bits);
  tbt_decim_ch2_i_o <= fifo_tbt_decim_out(5*c_dsp_ref_num_bits-1 downto 4*c_dsp_ref_num_bits);
  tbt_decim_ch1_q_o <= fifo_tbt_decim_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  tbt_decim_ch1_i_o <= fifo_tbt_decim_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  tbt_decim_ch0_q_o <= fifo_tbt_decim_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  tbt_decim_ch0_i_o <= fifo_tbt_decim_out(c_dsp_ref_num_bits-1 downto 0);

  tbt_decim_valid_o <= fifo_tbt_decim_valid_out;

  --TBT amplitudes data
  cmp_position_calc_cdc_fifo_tbt_amp : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_tbt_amp_in,
    valid_i                                   => fifo_tbt_amp_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_tbt_amp_out,
    valid_o                                   => fifo_tbt_amp_valid_out
  );

  p_reg_cdc_fifo_tbt_amp_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_tbt_amp_in <= (others => '0');
        fifo_tbt_amp_valid_in <= '0';
      elsif clk_ce_70 = '1' then
        fifo_tbt_amp_in <=  tbt_amp_ch3 & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                            tbt_amp_ch2 & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                            tbt_amp_ch1 & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                            tbt_amp_ch0;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_tbt_amp_valid_in <= tbt_amp_valid;
      else
        fifo_tbt_amp_valid_in <= '0';
      end if;
    end if;
  end process;

  tbt_amp_ch3_o <= fifo_tbt_amp_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  tbt_amp_ch2_o <= fifo_tbt_amp_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  tbt_amp_ch1_o <= fifo_tbt_amp_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  tbt_amp_ch0_o <= fifo_tbt_amp_out(c_dsp_ref_num_bits-1 downto 0);

  tbt_amp_valid_o <= fifo_tbt_amp_valid_out;

  --TBT phase data
  cmp_position_calc_cdc_fifo_tbt_phase : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_tbt_pha_in,
    valid_i                                   => fifo_tbt_pha_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_tbt_pha_out,
    valid_o                                   => fifo_tbt_pha_valid_out
  );

  p_reg_cdc_fifo_tbt_pha_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_tbt_pha_in <= (others => '0');
        fifo_tbt_pha_valid_in <= '0';
      elsif clk_ce_70 = '1' then
        fifo_tbt_pha_in <=  tbt_pha_ch3 & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                            tbt_pha_ch2 & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                            tbt_pha_ch1 & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                            tbt_pha_ch0;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_tbt_pha_valid_in <= tbt_pha_valid;
      else
        fifo_tbt_pha_valid_in <= '0';
      end if;
    end if;
  end process;

  tbt_pha_ch3_o <= fifo_tbt_pha_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  tbt_pha_ch2_o <= fifo_tbt_pha_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  tbt_pha_ch1_o <= fifo_tbt_pha_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  tbt_pha_ch0_o <= fifo_tbt_pha_out(c_dsp_ref_num_bits-1 downto 0);

  tbt_pha_valid_o <= fifo_tbt_pha_valid_out;

  -- TBT position data
  cmp_position_calc_cdc_fifo_tbt_pos : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_pos_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_tbt_pos_in,
    valid_i                                   => fifo_tbt_pos_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_tbt_pos_out,
    valid_o                                   => fifo_tbt_pos_valid_out
  );

  p_reg_cdc_fifo_tbt_pos_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_tbt_pos_in <= (others => '0');
        fifo_tbt_pos_valid_in <= '0';
      elsif clk_ce_70 = '1' then
        fifo_tbt_pos_in <=  sum_tbt & -- 4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits
                            q_tbt & -- 3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits
                            y_tbt & -- 2*c_dsp_pos_num_bits-1 downto c_dsp_pos_num_bits
                            x_tbt;  -- c_dsp_pos_num_bits-1 downto 0

        fifo_tbt_pos_valid_in <= x_tbt_valid;
      else
        fifo_tbt_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  pos_sum_tbt_o <= fifo_tbt_pos_out(4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits);
  pos_q_tbt_o   <= fifo_tbt_pos_out(3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits);
  pos_y_tbt_o   <= fifo_tbt_pos_out(2*c_dsp_pos_num_bits-1 downto c_dsp_pos_num_bits);
  pos_x_tbt_o   <= fifo_tbt_pos_out(c_dsp_pos_num_bits-1 downto 0);

  pos_tbt_valid_o <= fifo_tbt_pos_valid_out;

  --------------------------------------------------------------------------
  --                            FOFB data                                 --
  --------------------------------------------------------------------------

  -- FOFB Decim data
  cmp_position_calc_cdc_fifo_fofb_decim : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_iq_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_fofb_decim_in,
    valid_i                                   => fifo_fofb_decim_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_fofb_decim_out,
    valid_o                                   => fifo_fofb_decim_valid_out
  );

  p_reg_cdc_fifo_fofb_decim_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_fofb_decim_in <= (others => '0');
        fifo_fofb_decim_valid_in <= '0';
      elsif clk_ce_2224 = '1' then
        fifo_fofb_decim_in <=  fofb_decim_ch3_q & -- 8*c_dsp_ref_num_bits-1 downto 7*c_dsp_ref_num_bits
                        fofb_decim_ch3_i & -- 7*c_dsp_ref_num_bits-1 downto 6*c_dsp_ref_num_bits
                        fofb_decim_ch2_q & -- 6*c_dsp_ref_num_bits-1 downto 5*c_dsp_ref_num_bits
                        fofb_decim_ch2_i & -- 5*c_dsp_ref_num_bits-1 downto 4*c_dsp_ref_num_bits
                        fofb_decim_ch1_q & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                        fofb_decim_ch1_i & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                        fofb_decim_ch0_q & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                        fofb_decim_ch0_i;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_fofb_decim_valid_in <= fofb_decim_valid;
      else
        fifo_fofb_decim_valid_in <= '0';
      end if;
    end if;
  end process;

  fofb_decim_ch3_q_o <= fifo_fofb_decim_out(8*c_dsp_ref_num_bits-1 downto 7*c_dsp_ref_num_bits);
  fofb_decim_ch3_i_o <= fifo_fofb_decim_out(7*c_dsp_ref_num_bits-1 downto 6*c_dsp_ref_num_bits);
  fofb_decim_ch2_q_o <= fifo_fofb_decim_out(6*c_dsp_ref_num_bits-1 downto 5*c_dsp_ref_num_bits);
  fofb_decim_ch2_i_o <= fifo_fofb_decim_out(5*c_dsp_ref_num_bits-1 downto 4*c_dsp_ref_num_bits);
  fofb_decim_ch1_q_o <= fifo_fofb_decim_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  fofb_decim_ch1_i_o <= fifo_fofb_decim_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  fofb_decim_ch0_q_o <= fifo_fofb_decim_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  fofb_decim_ch0_i_o <= fifo_fofb_decim_out(c_dsp_ref_num_bits-1 downto 0);

  fofb_decim_valid_o <= fifo_fofb_decim_valid_out;

  --FOFB amplitudes data
  cmp_position_calc_cdc_fifo_fofb_amp : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_fofb_amp_in,
    valid_i                                   => fifo_fofb_amp_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_fofb_amp_out,
    valid_o                                   => fifo_fofb_amp_valid_out
  );

  p_reg_cdc_fifo_fofb_amp_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_fofb_amp_in <= (others => '0');
        fifo_fofb_amp_valid_in <= '0';
      elsif clk_ce_2224 = '1' then
        fifo_fofb_amp_in <=  fofb_amp_ch3 & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                            fofb_amp_ch2 & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                            fofb_amp_ch1 & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                            fofb_amp_ch0;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_fofb_amp_valid_in <= fofb_amp_valid;
      else
        fifo_fofb_amp_valid_in <= '0';
      end if;
    end if;
  end process;

  fofb_amp_ch3_o <= fifo_fofb_amp_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  fofb_amp_ch2_o <= fifo_fofb_amp_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  fofb_amp_ch1_o <= fifo_fofb_amp_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  fofb_amp_ch0_o <= fifo_fofb_amp_out(c_dsp_ref_num_bits-1 downto 0);

  fofb_amp_valid_o <= fifo_fofb_amp_valid_out;

  -- FOFB phase data
  cmp_position_calc_cdc_fifo_fofb_phase : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_fofb_pha_in,
    valid_i                                   => fifo_fofb_pha_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_fofb_pha_out,
    valid_o                                   => fifo_fofb_pha_valid_out
  );

  p_reg_cdc_fifo_fofb_pha_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_fofb_pha_in <= (others => '0');
        fifo_fofb_pha_valid_in <= '0';
      elsif clk_ce_2224 = '1' then
        fifo_fofb_pha_in <=  fofb_pha_ch3 & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                            fofb_pha_ch2 & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                            fofb_pha_ch1 & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                            fofb_pha_ch0;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_fofb_pha_valid_in <= fofb_pha_valid;
      else
        fifo_fofb_pha_valid_in <= '0';
      end if;
    end if;
  end process;

  fofb_pha_ch3_o <= fifo_fofb_pha_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  fofb_pha_ch2_o <= fifo_fofb_pha_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  fofb_pha_ch1_o <= fifo_fofb_pha_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  fofb_pha_ch0_o <= fifo_fofb_pha_out(c_dsp_ref_num_bits-1 downto 0);

  fofb_pha_valid_o <= fifo_fofb_pha_valid_out;

  -- FOFB position data
  cmp_position_calc_cdc_fifo_fofb_pos : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_pos_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_fofb_pos_in,
    valid_i                                   => fifo_fofb_pos_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_fofb_pos_out,
    valid_o                                   => fifo_fofb_pos_valid_out
  );

  p_reg_cdc_fifo_fofb_pos_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_fofb_pos_in <= (others => '0');
        fifo_fofb_pos_valid_in <= '0';
      elsif clk_ce_2224 = '1' then
        fifo_fofb_pos_in <= sum_fofb & -- 4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits
                            q_fofb &   -- 3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits
                            y_fofb &   -- 2*c_dsp_pos_num_bits-1 downto   c_dsp_pos_num_bits
                            x_fofb;    -- c_dsp_pos_num_bits-1 downto 0

        fifo_fofb_pos_valid_in <= x_fofb_valid;
      else
        fifo_fofb_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  pos_sum_fofb_o <= fifo_fofb_pos_out(4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits);
  pos_q_fofb_o   <= fifo_fofb_pos_out(3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits);
  pos_y_fofb_o   <= fifo_fofb_pos_out(2*c_dsp_pos_num_bits-1 downto c_dsp_pos_num_bits);
  pos_x_fofb_o   <= fifo_fofb_pos_out(c_dsp_pos_num_bits-1 downto 0);

  pos_fofb_valid_o <= fifo_fofb_pos_valid_out;

  --------------------------------------------------------------------------
  --                         Monitoring data                              --
  --------------------------------------------------------------------------

  -- Monitoring amplitudes data
  cmp_position_calc_cdc_fifo_monit_amp : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_ref_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_monit_amp_in,
    valid_i                                   => fifo_monit_amp_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_monit_amp_out,
    valid_o                                   => fifo_monit_amp_valid_out
  );

  p_reg_cdc_fifo_monit_amp_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_monit_amp_in <= (others => '0');
        fifo_monit_amp_valid_in <= '0';
      elsif clk_ce_22240000 = '1' then
        fifo_monit_amp_in <=  monit_amp_ch3 & -- 4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits
                            monit_amp_ch2 & -- 3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits
                            monit_amp_ch1 & -- 2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits
                            monit_amp_ch0;  -- c_dsp_ref_num_bits-1 downto 0

        fifo_monit_amp_valid_in <= monit_amp_valid;
      else
        fifo_monit_amp_valid_in <= '0';
      end if;
    end if;
  end process;

  monit_amp_ch3_fs_sync <= fifo_monit_amp_out(4*c_dsp_ref_num_bits-1 downto 3*c_dsp_ref_num_bits);
  monit_amp_ch2_fs_sync <= fifo_monit_amp_out(3*c_dsp_ref_num_bits-1 downto 2*c_dsp_ref_num_bits);
  monit_amp_ch1_fs_sync <= fifo_monit_amp_out(2*c_dsp_ref_num_bits-1 downto c_dsp_ref_num_bits);
  monit_amp_ch0_fs_sync <= fifo_monit_amp_out(c_dsp_ref_num_bits-1 downto 0);

  monit_amp_valid_fs_sync <= fifo_monit_amp_valid_out;

  monit_amp_ch3_o <= monit_amp_ch3_fs_sync;
  monit_amp_ch2_o <= monit_amp_ch2_fs_sync;
  monit_amp_ch1_o <= monit_amp_ch1_fs_sync;
  monit_amp_ch0_o <= monit_amp_ch0_fs_sync;

  monit_amp_valid_o <= monit_amp_valid_fs_sync;

  -- Monitoring position data
  cmp_position_calc_cdc_fifo_monit_pos : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_pos_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_monit_pos_in,
    valid_i                                   => fifo_monit_pos_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_monit_pos_out,
    valid_o                                   => fifo_monit_pos_valid_out
  );

  p_reg_cdc_fifo_monit_pos_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_monit_pos_in <= (others => '0');
        fifo_monit_pos_valid_in <= '0';
      elsif clk_ce_22240000 = '1' then
        fifo_monit_pos_in <= sum_monit & -- 4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits
                            q_monit &   -- 3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits
                            y_monit &   -- 2*c_dsp_pos_num_bits-1 downto   c_dsp_pos_num_bits
                            x_monit;    -- c_dsp_pos_num_bits-1 downto 0

        fifo_monit_pos_valid_in <= x_monit_valid;
      else
        fifo_monit_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  sum_monit_fs_sync  <= fifo_monit_pos_out(4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits);
  q_monit_fs_sync    <= fifo_monit_pos_out(3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits);
  y_monit_fs_sync    <= fifo_monit_pos_out(2*c_dsp_pos_num_bits-1 downto c_dsp_pos_num_bits);
  x_monit_fs_sync    <= fifo_monit_pos_out(c_dsp_pos_num_bits-1 downto 0);

  pos_monit_valid_fs_sync <= fifo_monit_pos_valid_out;

  pos_sum_monit_o  <=  sum_monit_fs_sync;
  pos_q_monit_o    <=  q_monit_fs_sync;
  pos_y_monit_o    <=  y_monit_fs_sync;
  pos_x_monit_o    <=  x_monit_fs_sync;

  pos_monit_valid_o <= pos_monit_valid_fs_sync;

  --------------------------------------------------------------------------
  --                         Monitoring 1 Hz data                         --
  --------------------------------------------------------------------------

  -- Monitoring 1 Hz position data
  cmp_position_calc_cdc_fifo_monit_1_pos : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_data_pos_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk2x_i,
    data_i                                    => fifo_monit_1_pos_in,
    valid_i                                   => fifo_monit_1_pos_valid_in,

    clk_rd_i                                  => fs_clk_i,
    data_o                                    => fifo_monit_1_pos_out,
    valid_o                                   => fifo_monit_1_pos_valid_out
  );

  p_reg_cdc_fifo_monit_1_pos_inputs : process(fs_clk2x_i)
  begin
    if rising_edge(fs_clk2x_i) then
      if fs_rst2x_n_i = '0' then
        fifo_monit_1_pos_in <= (others => '0');
        fifo_monit_1_pos_valid_in <= '0';
      elsif clk_ce_222400000 = '1' then
        fifo_monit_1_pos_in <= sum_monit_1 & -- 4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits
                            q_monit_1 &   -- 3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits
                            y_monit_1 &   -- 2*c_dsp_pos_num_bits-1 downto   c_dsp_pos_num_bits
                            x_monit_1;    -- c_dsp_pos_num_bits-1 downto 0

        fifo_monit_1_pos_valid_in <= x_monit_1_valid;
      else
        fifo_monit_1_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  sum_monit_1_fs_sync <= fifo_monit_1_pos_out(4*c_dsp_pos_num_bits-1 downto 3*c_dsp_pos_num_bits);
  q_monit_1_fs_sync   <= fifo_monit_1_pos_out(3*c_dsp_pos_num_bits-1 downto 2*c_dsp_pos_num_bits);
  y_monit_1_fs_sync   <= fifo_monit_1_pos_out(2*c_dsp_pos_num_bits-1 downto c_dsp_pos_num_bits);
  x_monit_1_fs_sync   <= fifo_monit_1_pos_out(c_dsp_pos_num_bits-1 downto 0);

  pos_monit_1_valid_fs_sync <= fifo_monit_1_pos_valid_out;

  pos_sum_monit_1_o  <=  sum_monit_1_fs_sync;
  pos_q_monit_1_o    <=  q_monit_1_fs_sync;
  pos_y_monit_1_o    <=  y_monit_1_fs_sync;
  pos_x_monit_1_o    <=  x_monit_1_fs_sync;

  pos_monit_1_valid_o <= pos_monit_1_valid_fs_sync;

end rtl;
