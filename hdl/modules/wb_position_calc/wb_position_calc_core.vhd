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
  g_with_extra_wb_reg                       : boolean := false;
  g_rffe_version			                : string  := "V2";

  -- input sizes
  g_input_width                             : natural := 16;
  g_mixed_width                             : natural := 16;
  g_adc_ratio                               : natural := 2;

  -- mixer
  g_dds_width                               : natural := 16;
  g_dds_points                              : natural := 35;
  g_sin_file                                : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_sin.nif";
  g_cos_file                                : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_cos.nif";

  -- CIC setup
  g_tbt_cic_delay                           : natural := 1;
  g_tbt_cic_stages                          : natural := 2;
  g_tbt_ratio                               : natural := 35;  -- ratio between
  g_tbt_decim_width                         : natural := 32;

  g_fofb_cic_delay                          : natural := 1;
  g_fofb_cic_stages                         : natural := 2;
  g_fofb_ratio                              : natural := 980;  -- ratio between adc and fofb rates
  g_fofb_decim_width                        : natural := 32;

  g_monit1_cic_delay                        : natural := 1;
  g_monit1_cic_stages                       : natural := 1;
  g_monit1_ratio                            : natural := 100;  --ratio between fofb and monit 1

  g_monit2_cic_delay                        : natural := 1;
  g_monit2_cic_stages                       : natural := 1;
  g_monit2_ratio                            : natural := 100; -- ratio between monit 1 and 2

  g_monit_decim_width                       : natural := 32;

  -- width of K constants
  g_k_width                                 : natural := 16;

  --width for IQ output
  g_IQ_width                                : natural := 32
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

  adc_ch0_i                                 : in std_logic_vector(g_input_width-1 downto 0);
  adc_ch1_i                                 : in std_logic_vector(g_input_width-1 downto 0);
  adc_ch2_i                                 : in std_logic_vector(g_input_width-1 downto 0);
  adc_ch3_i                                 : in std_logic_vector(g_input_width-1 downto 0);

  -----------------------------
  -- Position calculation at various rates
  -----------------------------

  adc_ch0_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch1_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch2_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch3_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);

  -----------------------------
  -- MIX Data
  -----------------------------

  mix_ch0_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch0_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch1_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch1_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch2_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch2_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch3_i_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_ch3_q_o                               : out std_logic_vector(g_IQ_width-1 downto 0);
  mix_valid_o                               : out std_logic;

  -----------------------------
  -- TBT Data
  -----------------------------

  tbt_decim_ch0_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch0_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch1_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch1_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch2_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch2_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch3_i_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_ch3_q_o                         : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_decim_valid_o                         : out std_logic;

  tbt_amp_ch0_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_ch1_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_ch2_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_ch3_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_amp_valid_o                           : out std_logic;

  tbt_pha_ch0_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_ch1_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_ch2_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_ch3_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pha_valid_o                           : out std_logic;

  -----------------------------
  -- FOFB Data
  -----------------------------

  fofb_decim_ch0_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch0_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch1_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch1_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch2_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch2_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch3_i_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_ch3_q_o                        : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_decim_valid_o                        : out std_logic;

  fofb_amp_ch0_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_ch1_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_ch2_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_ch3_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_amp_valid_o                          : out std_logic;

  fofb_pha_ch0_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_ch1_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_ch2_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_ch3_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pha_valid_o                          : out std_logic;

  -----------------------------
  -- Monit. Data
  -----------------------------

  monit_amp_ch0_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch1_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch2_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch3_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_valid_o                         : out std_logic;

  -----------------------------
  -- Position Data
  -----------------------------

  pos_x_tbt_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_y_tbt_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_q_tbt_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_sum_tbt_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  pos_tbt_valid_o                           : out std_logic;

  pos_x_fofb_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_y_fofb_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_q_fofb_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_sum_fofb_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  pos_fofb_valid_o                          : out std_logic;

  pos_x_monit_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_y_monit_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_q_monit_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_sum_monit_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  pos_monit_valid_o                         : out std_logic;

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

  ce_adc_o                                  : out std_logic;
  ce_tbt_o                                  : out std_logic;
  ce_monit_o                                : out std_logic;
  ce_fofb_o                                 : out std_logic;

  dbg_cur_address_o                         : out std_logic_vector(31 downto 0);
  dbg_adc_ch0_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch1_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch2_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch3_cond_o                        : out std_logic_vector(g_input_width-1 downto 0)
);
end wb_position_calc_core;

architecture rtl of wb_position_calc_core is

  ---------------------------------------------------------
  --                     Constants                       --
  ---------------------------------------------------------
  constant c_periph_addr_size               : natural := 5+2;

  constant c_cdc_tbt_width                  : natural := 4*g_tbt_decim_width;
  constant c_cdc_fofb_width                 : natural := 4*g_fofb_decim_width;
  constant c_cdc_monit_width                : natural := 4*g_monit_decim_width;

  constant c_cdc_mix_iq_width               : natural := 8*g_IQ_width;
  constant c_cdc_tbt_iq_width               : natural := 8*g_tbt_decim_width;
  constant c_cdc_fofb_iq_width              : natural := 8*g_fofb_decim_width;

  constant c_cdc_adc_width                  : natural := g_input_width;

  constant c_cdc_ref_size                   : natural := 4;

  constant c_k_width                        : natural := 24;

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

  -- Extra Wishbone registering stage
  signal cbar_slave_in_reg0                 : t_wishbone_slave_in_array (c_masters-1 downto 0);
  signal cbar_slave_out_reg0                : t_wishbone_slave_out_array(c_masters-1 downto 0);

  ---------------------------------------------------------
  --              Clock and Reset signals                --
  ---------------------------------------------------------

  signal fs_rst2x                           : std_logic;

  ---------------------------------------------------------
  --               ADC, MIX and data                     --
  ---------------------------------------------------------

  signal adc_ch0_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch1_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch2_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch3_sp                         : std_logic_vector(g_input_width-1 downto 0);

  signal adc_ch0_cond                       : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch1_cond                       : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch2_cond                       : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch3_cond                       : std_logic_vector(g_input_width-1 downto 0);

  -- Input conditioner signals
  signal adc_ch0_pos_calc                   : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch1_pos_calc                   : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch2_pos_calc                   : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch3_pos_calc                   : std_logic_vector(g_input_width-1 downto 0);

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

  signal mix_ch0_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch0_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch1_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch1_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch2_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch2_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch3_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch3_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_valid                          : std_logic := '1';

  ---------------------------------------------------------
  --                     TBT data                        --
  ---------------------------------------------------------

  signal tbt_decim_ch0_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch0_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch1_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch1_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch2_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch2_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch3_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch3_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_valid                    : std_logic := '1';

  signal tbt_amp_ch0                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_ch1                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_ch2                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_ch3                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_valid                      : std_logic := '1';

  signal tbt_pha_ch0                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_ch1                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_ch2                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_ch3                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_valid                      : std_logic := '1';

  ---------------------------------------------------------
  --                     FOFB data                       --
  ---------------------------------------------------------

  signal fofb_decim_ch0_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch0_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch1_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch1_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch2_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch2_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch3_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch3_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_valid                   : std_logic := '1';

  signal fofb_decim_q_ch01_missing_int      : std_logic;
  signal fofb_decim_q_ch23_missing_int      : std_logic;

  signal fofb_amp_ch0                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_ch1                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_ch2                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_ch3                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_valid                     : std_logic := '1';

  signal fofb_pha_ch0                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_ch1                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_ch2                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_ch3                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_valid                     : std_logic := '1';

  ---------------------------------------------------------
  --                   Monitoring data                   --
  ---------------------------------------------------------

  signal monit_amp_ch0                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch1                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch2                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch3                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_valid                    : std_logic := '1';

  signal monit_amp_ch0_fs_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch1_fs_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch2_fs_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch3_fs_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_valid_fs_sync            : std_logic := '1';

  ---------------------------------------------------------
  --                   Position data                     --
  ---------------------------------------------------------

  signal x_tbt                              : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal y_tbt                              : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal q_tbt                              : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal sum_tbt                            : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_valid                          : std_logic := '1';

  signal x_fofb                             : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal y_fofb                             : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal q_fofb                             : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal sum_fofb                           : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_valid                         : std_logic := '1';

  signal x_monit                            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal y_monit                            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal q_monit                            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal sum_monit                          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_valid                        : std_logic := '1';

  signal x_monit_fs_sync                    : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal y_monit_fs_sync                    : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal q_monit_fs_sync                    : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal sum_monit_fs_sync                  : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal pos_monit_valid_fs_sync            : std_logic := '1';

  ---------------------------------------------------------
  -- CE signals
  ---------------------------------------------------------
  signal ce_adc                             : std_logic;
  signal ce_tbt                             : std_logic;
  signal ce_fofb                            : std_logic;
  signal ce_monit                           : std_logic;

  ---------------------------------------------------------
  -- FIFO CDC signals
  ---------------------------------------------------------

  signal fifo_mix_in                        : std_logic_vector(c_cdc_mix_iq_width-1 downto 0);
  signal fifo_mix_out                       : std_logic_vector(c_cdc_mix_iq_width-1 downto 0);
  signal fifo_mix_valid_in                  : std_logic;
  signal fifo_mix_valid_out                 : std_logic;

  signal fifo_tbt_decim_in                  : std_logic_vector(c_cdc_tbt_iq_width-1 downto 0);
  signal fifo_tbt_decim_out                 : std_logic_vector(c_cdc_tbt_iq_width-1 downto 0);
  signal fifo_tbt_decim_valid_in            : std_logic;
  signal fifo_tbt_decim_valid_out           : std_logic;

  signal fifo_tbt_amp_in                    : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_amp_out                   : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_amp_valid_in              : std_logic;
  signal fifo_tbt_amp_valid_out             : std_logic;

  signal fifo_tbt_pha_in                    : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_pha_out                   : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_pha_valid_in              : std_logic;
  signal fifo_tbt_pha_valid_out             : std_logic;

  signal fifo_tbt_pos_in                    : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_pos_out                   : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_pos_valid_in              : std_logic;
  signal fifo_tbt_pos_valid_out             : std_logic;

  signal fifo_fofb_decim_in                 : std_logic_vector(c_cdc_fofb_iq_width-1 downto 0);
  signal fifo_fofb_decim_out                : std_logic_vector(c_cdc_fofb_iq_width-1 downto 0);
  signal fifo_fofb_decim_valid_in           : std_logic;
  signal fifo_fofb_decim_valid_out          : std_logic;

  signal fifo_fofb_amp_in                   : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_amp_out                  : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_amp_valid_in             : std_logic;
  signal fifo_fofb_amp_valid_out            : std_logic;

  signal fifo_fofb_pha_in                   : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_pha_out                  : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_pha_valid_in             : std_logic;
  signal fifo_fofb_pha_valid_out            : std_logic;

  signal fifo_fofb_pos_in                   : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_pos_out                  : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_pos_valid_in             : std_logic;
  signal fifo_fofb_pos_valid_out            : std_logic;

  signal fifo_monit_amp_in                  : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_amp_out                 : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_amp_valid_in            : std_logic;
  signal fifo_monit_amp_valid_out           : std_logic;

  signal fifo_monit_pos_in                  : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_pos_out                 : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_pos_valid_in            : std_logic;
  signal fifo_monit_pos_valid_out           : std_logic;

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

  -----------------------------
  -- Insert extra Wishbone registering stage for ease timing.
  -- It effectively cuts the bandwidth in half!
  -----------------------------
  gen_with_extra_wb_reg : if g_with_extra_wb_reg generate

    cmp_register_link : xwb_register_link -- puts a register of delay between crossbars
    port map (
      clk_sys_i 			                      => clk_i,
      rst_n_i   			                      => rst_n_i,
      slave_i   			                      => cbar_slave_in_reg0(0),
      slave_o                               => cbar_slave_out_reg0(0),
      master_i                              => cbar_slave_out(0),
      master_o 		                          => cbar_slave_in(0)
    );

    cbar_slave_in_reg0(0).adr               <= wb_adr_i;
    cbar_slave_in_reg0(0).dat               <= wb_dat_i;
    cbar_slave_in_reg0(0).sel               <= wb_sel_i;
    cbar_slave_in_reg0(0).we                <= wb_we_i;
    cbar_slave_in_reg0(0).cyc               <= wb_cyc_i;
    cbar_slave_in_reg0(0).stb               <= wb_stb_i;

    wb_dat_o                                <= cbar_slave_out_reg0(0).dat;
    wb_ack_o                                <= cbar_slave_out_reg0(0).ack;
    wb_stall_o                              <= cbar_slave_out_reg0(0).stall;

  end generate;

  gen_without_extra_wb_reg : if not g_with_extra_wb_reg generate

    -- External master connection
    cbar_slave_in(0).adr                    <= wb_adr_i;
    cbar_slave_in(0).dat                    <= wb_dat_i;
    cbar_slave_in(0).sel                    <= wb_sel_i;
    cbar_slave_in(0).we                     <= wb_we_i;
    cbar_slave_in(0).cyc                    <= wb_cyc_i;
    cbar_slave_in(0).stb                    <= wb_stb_i;

    wb_dat_o                                <= cbar_slave_out(0).dat;
    wb_ack_o                                <= cbar_slave_out(0).ack;
    wb_stall_o                              <= cbar_slave_out(0).stall;

  end generate;

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

  adc_ch0_swap_o                          <= adc_ch0_sp;
  adc_ch1_swap_o                          <= adc_ch1_sp;
  adc_ch2_swap_o                          <= adc_ch2_sp;
  adc_ch3_swap_o                          <= adc_ch3_sp;

  cmp_input_conditioner : input_conditioner
  generic map
  (
    g_sw_interval                             => 1000/2, -- We need to generate 2x the FOFB decimation rate
    g_input_width  	                          => 16, -- FIXME: use ADC constant
    g_output_width 	                          => 16, -- FIXME: use ADC constant
    g_window_width 	                          => 24, -- This must match the MATLAB script
    g_input_delay  	                          => 3+3, -- wb_bpm_swap fixed latency + multiplier pipeline latency
                                                      -- Vivado 2014.4 does not support nice functions
    --g_window_coef_file                        => "../../../ip_cores/dsp-cores/hdl/modules/sw_windowing/window_n_500_tukey_0_2.ram"
    g_window_coef_file                        => "../../../dsp-cores/hdl/modules/sw_windowing/window_n_500_tukey_0_2.ram"

  )
  port map
  (
    reset_n_i                                 => wdw_input_cond_rst_n,
    clk_i                                     => fs_clk_i,

    adc_a_i                                   => adc_ch0_sp,
    adc_b_i                                   => adc_ch1_sp,
    adc_c_i                                   => adc_ch2_sp,
    adc_d_i                                   => adc_ch3_sp,

    switch_o 				                          => wdw_sw_clk,
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

  -- Bypass windowing conditioning if disabled
  adc_ch0_pos_calc <= adc_ch0_cond when wdw_use_en = '1' else adc_ch0_sp;
  adc_ch1_pos_calc <= adc_ch1_cond when wdw_use_en = '1' else adc_ch1_sp;
  adc_ch2_pos_calc <= adc_ch2_cond when wdw_use_en = '1' else adc_ch2_sp;
  adc_ch3_pos_calc <= adc_ch3_cond when wdw_use_en = '1' else adc_ch3_sp;

  cmp_position_calc : position_calc
  generic map
  (
    -- input sizes
    g_input_width                            => g_input_width,
    g_mixed_width                            => g_mixed_width,
    g_adc_ratio                              => g_adc_ratio,

    -- mixer
    g_dds_width                              => g_dds_width,
    g_dds_points                             => g_dds_points,
    g_sin_file                               => g_sin_file,
    g_cos_file                               => g_cos_file,

    -- CIC setup
    g_tbt_cic_delay                          => g_tbt_cic_delay,
    g_tbt_cic_stages                         => g_tbt_cic_stages,
    g_tbt_ratio                              => g_tbt_ratio,
    g_tbt_decim_width                        => g_tbt_decim_width,

    g_fofb_cic_delay                         => g_fofb_cic_delay,
    g_fofb_cic_stages                        => g_fofb_cic_stages,
    g_fofb_ratio                             => g_fofb_ratio,
    g_fofb_decim_width                       => g_fofb_decim_width,

    g_monit1_cic_delay                       => g_monit1_cic_delay,
    g_monit1_cic_stages                      => g_monit1_cic_stages,
    g_monit1_ratio                           => g_monit1_ratio,

    g_monit2_cic_delay                       => g_monit2_cic_delay,
    g_monit2_cic_stages                      => g_monit2_cic_stages,
    g_monit2_ratio                           => g_monit2_ratio,

    g_monit_decim_width                      => g_monit_decim_width,

    -- width of K constants
    g_k_width                                => g_k_width,

    --width for IQ output
    g_IQ_width                               => g_IQ_width
  )
  port map
  (
    adc_ch0_i                               => adc_ch0_pos_calc,
    adc_ch1_i                               => adc_ch1_pos_calc,
    adc_ch2_i                               => adc_ch2_pos_calc,
    adc_ch3_i                               => adc_ch3_pos_calc,

    clk_i                                   => fs_clk2x_i,
    rst_i                                   => '0',

    ksum_i                                  => regs_out.ksum_val_o(c_k_width-1 downto 0),
    kx_i                                    => regs_out.kx_val_o(c_k_width-1 downto 0),
    ky_i                                    => regs_out.ky_val_o(c_k_width-1 downto 0),

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

    x_tbt_o                                 => x_tbt,
    y_tbt_o                                 => y_tbt,
    q_tbt_o                                 => q_tbt,
    sum_tbt_o                               => sum_tbt,
    tbt_valid_o                             => tbt_valid,

    x_fofb_o                                => x_fofb,
    y_fofb_o                                => y_fofb,
    q_fofb_o                                => q_fofb,
    sum_fofb_o                              => sum_fofb,
    fofb_valid_o                            => fofb_valid,

    x_monit_o                               => x_monit,
    y_monit_o                               => y_monit,
    q_monit_o                               => q_monit,
    sum_monit_o                             => sum_monit,
    monit_valid_o                           => monit_valid,

    -- Clock drivers for various rates
    ce_adc_o                                => ce_adc,
    ce_tbt_o                                => ce_tbt,
    ce_fofb_o                               => ce_fofb,
    ce_monit_o                              => ce_monit
  );

  -- Output CE
  ce_adc_o                                  <= ce_adc;
  ce_tbt_o                                  <= ce_tbt;
  ce_fofb_o                                 <= ce_fofb;
  ce_monit_o                                <= ce_monit;

  --------------------------------------------------------------------------
  --    CDC position data (Amplitudes and Position) to fs_clk domain      --
  --------------------------------------------------------------------------

  --------------------------------------------------------------------------
  --                              MIX data                                --
  --------------------------------------------------------------------------

  -- MIX data
  cmp_position_calc_cdc_fifo_mix : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_mix_iq_width,
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
      elsif ce_adc = '1' then
        fifo_mix_in <=  mix_ch3_q &
                        mix_ch3_i &
                        mix_ch2_q &
                        mix_ch2_i &
                        mix_ch1_q &
                        mix_ch1_i &
                        mix_ch0_q &
                        mix_ch0_i;

        fifo_mix_valid_in <= mix_valid;
      else
        fifo_mix_valid_in <= '0';
      end if;
    end if;
  end process;

  mix_ch3_q_o <= fifo_mix_out(8*g_IQ_width-1 downto 7*g_IQ_width);
  mix_ch3_i_o <= fifo_mix_out(7*g_IQ_width-1 downto 6*g_IQ_width);
  mix_ch2_q_o <= fifo_mix_out(6*g_IQ_width-1 downto 5*g_IQ_width);
  mix_ch2_i_o <= fifo_mix_out(5*g_IQ_width-1 downto 4*g_IQ_width);
  mix_ch1_q_o <= fifo_mix_out(4*g_IQ_width-1 downto 3*g_IQ_width);
  mix_ch1_i_o <= fifo_mix_out(3*g_IQ_width-1 downto 2*g_IQ_width);
  mix_ch0_q_o <= fifo_mix_out(2*g_IQ_width-1 downto g_IQ_width);
  mix_ch0_i_o <= fifo_mix_out(g_IQ_width-1 downto 0);

  mix_valid_o <= fifo_mix_valid_out;

  --------------------------------------------------------------------------
  --                              TBT data                                --
  --------------------------------------------------------------------------

  -- TBT Decim data
  cmp_position_calc_cdc_fifo_tbt_decim : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_tbt_iq_width,
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
      elsif ce_tbt = '1' then
        fifo_tbt_decim_in <=  tbt_decim_ch3_q &
                              tbt_decim_ch3_i &
                              tbt_decim_ch2_q &
                              tbt_decim_ch2_i &
                              tbt_decim_ch1_q &
                              tbt_decim_ch1_i &
                              tbt_decim_ch0_q &
                              tbt_decim_ch0_i;

        fifo_tbt_decim_valid_in <= tbt_decim_valid;
      else
        fifo_tbt_decim_valid_in <= '0';
      end if;
    end if;
  end process;

  tbt_decim_ch3_q_o <= fifo_tbt_decim_out(8*g_tbt_decim_width-1 downto 7*g_tbt_decim_width);
  tbt_decim_ch3_i_o <= fifo_tbt_decim_out(7*g_tbt_decim_width-1 downto 6*g_tbt_decim_width);
  tbt_decim_ch2_q_o <= fifo_tbt_decim_out(6*g_tbt_decim_width-1 downto 5*g_tbt_decim_width);
  tbt_decim_ch2_i_o <= fifo_tbt_decim_out(5*g_tbt_decim_width-1 downto 4*g_tbt_decim_width);
  tbt_decim_ch1_q_o <= fifo_tbt_decim_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  tbt_decim_ch1_i_o <= fifo_tbt_decim_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  tbt_decim_ch0_q_o <= fifo_tbt_decim_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  tbt_decim_ch0_i_o <= fifo_tbt_decim_out(g_tbt_decim_width-1 downto 0);

  tbt_decim_valid_o <= fifo_tbt_decim_valid_out;

  --TBT amplitudes data
  cmp_position_calc_cdc_fifo_tbt_amp : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_tbt_width,
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
      elsif ce_tbt = '1' then
        fifo_tbt_amp_in <=  tbt_amp_ch3 &
                            tbt_amp_ch2 &
                            tbt_amp_ch1 &
                            tbt_amp_ch0;

        fifo_tbt_amp_valid_in <= tbt_amp_valid;
      else
        fifo_tbt_amp_valid_in <= '0';
      end if;
    end if;
  end process;

  tbt_amp_ch3_o <= fifo_tbt_amp_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  tbt_amp_ch2_o <= fifo_tbt_amp_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  tbt_amp_ch1_o <= fifo_tbt_amp_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  tbt_amp_ch0_o <= fifo_tbt_amp_out(g_tbt_decim_width-1 downto 0);

  tbt_amp_valid_o <= fifo_tbt_amp_valid_out;

  --TBT phase data
  cmp_position_calc_cdc_fifo_tbt_phase : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_tbt_width,
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
      elsif ce_tbt = '1' then
        fifo_tbt_pha_in <=  tbt_pha_ch3 &
                            tbt_pha_ch2 &
                            tbt_pha_ch1 &
                            tbt_pha_ch0;

        fifo_tbt_pha_valid_in <= tbt_pha_valid;
      else
        fifo_tbt_pha_valid_in <= '0';
      end if;
    end if;
  end process;

  tbt_pha_ch3_o <= fifo_tbt_pha_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  tbt_pha_ch2_o <= fifo_tbt_pha_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  tbt_pha_ch1_o <= fifo_tbt_pha_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  tbt_pha_ch0_o <= fifo_tbt_pha_out(g_tbt_decim_width-1 downto 0);

  tbt_pha_valid_o <= fifo_tbt_pha_valid_out;

  -- TBT position data
  cmp_position_calc_cdc_fifo_tbt_pos : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_tbt_width,
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
      elsif ce_tbt = '1' then
        fifo_tbt_pos_in <=  sum_tbt &
                            q_tbt &
                            y_tbt &
                            x_tbt;

        fifo_tbt_pos_valid_in <= tbt_valid;
      else
        fifo_tbt_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  pos_sum_tbt_o <= fifo_tbt_pos_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  pos_q_tbt_o   <= fifo_tbt_pos_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  pos_y_tbt_o   <= fifo_tbt_pos_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  pos_x_tbt_o   <= fifo_tbt_pos_out(g_tbt_decim_width-1 downto 0);

  pos_tbt_valid_o <= fifo_tbt_pos_valid_out;

  --------------------------------------------------------------------------
  --                            FOFB data                                 --
  --------------------------------------------------------------------------

  -- FOFB Decim data
  cmp_position_calc_cdc_fifo_fofb_decim : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_fofb_iq_width,
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
      elsif ce_fofb = '1' then
        fifo_fofb_decim_in <=  fofb_decim_ch3_q &
                        fofb_decim_ch3_i &
                        fofb_decim_ch2_q &
                        fofb_decim_ch2_i &
                        fofb_decim_ch1_q &
                        fofb_decim_ch1_i &
                        fofb_decim_ch0_q &
                        fofb_decim_ch0_i;

        fifo_fofb_decim_valid_in <= fofb_decim_valid;
      else
        fifo_fofb_decim_valid_in <= '0';
      end if;
    end if;
  end process;

  fofb_decim_ch3_q_o <= fifo_fofb_decim_out(8*g_fofb_decim_width-1 downto 7*g_fofb_decim_width);
  fofb_decim_ch3_i_o <= fifo_fofb_decim_out(7*g_fofb_decim_width-1 downto 6*g_fofb_decim_width);
  fofb_decim_ch2_q_o <= fifo_fofb_decim_out(6*g_fofb_decim_width-1 downto 5*g_fofb_decim_width);
  fofb_decim_ch2_i_o <= fifo_fofb_decim_out(5*g_fofb_decim_width-1 downto 4*g_fofb_decim_width);
  fofb_decim_ch1_q_o <= fifo_fofb_decim_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  fofb_decim_ch1_i_o <= fifo_fofb_decim_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  fofb_decim_ch0_q_o <= fifo_fofb_decim_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  fofb_decim_ch0_i_o <= fifo_fofb_decim_out(g_fofb_decim_width-1 downto 0);

  fofb_decim_valid_o <= fifo_fofb_decim_valid_out;

  --FOFB amplitudes data
  cmp_position_calc_cdc_fifo_fofb_amp : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_fofb_width,
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
      elsif ce_fofb = '1' then
        fifo_fofb_amp_in <=  fofb_amp_ch3 &
                            fofb_amp_ch2 &
                            fofb_amp_ch1 &
                            fofb_amp_ch0;

        fifo_fofb_amp_valid_in <= fofb_amp_valid;
      else
        fifo_fofb_amp_valid_in <= '0';
      end if;
    end if;
  end process;

  fofb_amp_ch3_o <= fifo_fofb_amp_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  fofb_amp_ch2_o <= fifo_fofb_amp_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  fofb_amp_ch1_o <= fifo_fofb_amp_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  fofb_amp_ch0_o <= fifo_fofb_amp_out(g_fofb_decim_width-1 downto 0);

  fofb_amp_valid_o <= fifo_fofb_amp_valid_out;

  -- FOFB phase data
  cmp_position_calc_cdc_fifo_fofb_phase : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_fofb_width,
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
      elsif ce_fofb = '1' then
        fifo_fofb_pha_in <=  fofb_pha_ch3 &
                            fofb_pha_ch2 &
                            fofb_pha_ch1 &
                            fofb_pha_ch0;

        fifo_fofb_pha_valid_in <= fofb_pha_valid;
      else
        fifo_fofb_pha_valid_in <= '0';
      end if;
    end if;
  end process;

  fofb_pha_ch3_o <= fifo_fofb_pha_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  fofb_pha_ch2_o <= fifo_fofb_pha_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  fofb_pha_ch1_o <= fifo_fofb_pha_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  fofb_pha_ch0_o <= fifo_fofb_pha_out(g_fofb_decim_width-1 downto 0);

  fofb_pha_valid_o <= fifo_fofb_pha_valid_out;

  -- FOFB position data
  cmp_position_calc_cdc_fifo_fofb_pos : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_fofb_width,
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
      elsif ce_fofb = '1' then
        fifo_fofb_pos_in <= sum_fofb &
                            q_fofb &
                            y_fofb &
                            x_fofb;

        fifo_fofb_pos_valid_in <= fofb_valid;
      else
        fifo_fofb_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  pos_sum_fofb_o <= fifo_fofb_pos_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  pos_q_fofb_o   <= fifo_fofb_pos_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  pos_y_fofb_o   <= fifo_fofb_pos_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  pos_x_fofb_o   <= fifo_fofb_pos_out(g_fofb_decim_width-1 downto 0);

  pos_fofb_valid_o <= fifo_fofb_pos_valid_out;

  --------------------------------------------------------------------------
  --                         Monitoring data                              --
  --------------------------------------------------------------------------

  -- Monitoring amplitudes data
  cmp_position_calc_cdc_fifo_monit_amp : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_monit_width,
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
      elsif ce_monit = '1' then
        fifo_monit_amp_in <=  monit_amp_ch3 &
                            monit_amp_ch2 &
                            monit_amp_ch1 &
                            monit_amp_ch0;

        fifo_monit_amp_valid_in <= monit_amp_valid;
      else
        fifo_monit_amp_valid_in <= '0';
      end if;
    end if;
  end process;

  monit_amp_ch3_fs_sync <= fifo_monit_amp_out(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit_amp_ch2_fs_sync <= fifo_monit_amp_out(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit_amp_ch1_fs_sync <= fifo_monit_amp_out(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit_amp_ch0_fs_sync <= fifo_monit_amp_out(g_monit_decim_width-1 downto 0);

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
    g_data_width                              => c_cdc_monit_width,
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
      elsif ce_monit = '1' then
        fifo_monit_pos_in <= sum_monit &
                            q_monit &
                            y_monit &
                            x_monit;

        fifo_monit_pos_valid_in <= monit_valid;
      else
        fifo_monit_pos_valid_in <= '0';
      end if;
    end if;
  end process;

  sum_monit_fs_sync  <= fifo_monit_pos_out(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  q_monit_fs_sync    <= fifo_monit_pos_out(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  y_monit_fs_sync    <= fifo_monit_pos_out(2*g_monit_decim_width-1 downto g_monit_decim_width);
  x_monit_fs_sync    <= fifo_monit_pos_out(g_monit_decim_width-1 downto 0);

  pos_monit_valid_fs_sync <= fifo_monit_pos_valid_out;

  pos_sum_monit_o  <=  sum_monit_fs_sync;
  pos_q_monit_o    <=  q_monit_fs_sync;
  pos_y_monit_o    <=  y_monit_fs_sync;
  pos_x_monit_o    <=  x_monit_fs_sync;

  pos_monit_valid_o <= pos_monit_valid_fs_sync;

end rtl;
