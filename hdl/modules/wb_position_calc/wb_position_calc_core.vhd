------------------------------------------------------------------------------
-- Title      : Wishbone Position Calculation Core
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2013-07-02
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Core Module for position calculation with de-cross and delay tuning.
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
-- Counter Generator Definitions
use work.counters_gen_pkg.all;
-- WB registers
use work.pos_calc_wbgen2_pkg.all;
-- Common Cores
use work.ifc_common_pkg.all;

entity wb_position_calc_core is
generic
(
  g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
  g_address_granularity                     : t_wishbone_address_granularity := WORD;
  g_with_extra_wb_reg                       : boolean := false;
  g_rffe_version                            : string  := "V2";

  -- selection of position_calc stages
  g_with_downconv                           : boolean  := true;

  -- input sizes
  g_input_width                             : natural := 16;
  g_mixed_width                             : natural := 16;
  g_adc_ratio                               : natural := 1;

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
  g_monit1_cic_ratio                        : positive := 8;

  g_monit2_cic_delay                        : natural := 1;
  g_monit2_cic_stages                       : natural := 1;
  g_monit2_ratio                            : natural := 100; -- ratio between monit 1 and 2
  g_monit2_cic_ratio                        : positive := 8;

  g_monit_decim_width                       : natural := 32;

  -- Cordic setup
  g_tbt_cordic_stages                       : positive := 12;
  g_tbt_cordic_iter_per_clk                 : positive := 3;
  g_tbt_cordic_ratio                        : positive := 4;

  g_fofb_cordic_stages                      : positive := 15;
  g_fofb_cordic_iter_per_clk                : positive := 3;
  g_fofb_cordic_ratio                       : positive := 4;

  -- width of K constants
  g_k_width                                 : natural := 16;

  --width for IQ output
  g_IQ_width                                : natural := 32;

  -- Swap/de-swap setup
  g_delay_vec_width                         : natural := 8;
  g_swap_div_freq_vec_width                 : natural := 16
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
  adc_valid_i                               : in std_logic;

  -----------------------------
  -- Position calculation at various rates
  -----------------------------

  adc_ch0_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch1_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch2_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_ch3_swap_o                            : out std_logic_vector(g_input_width-1 downto 0);
  adc_tag_o                                 : out std_logic_vector(0 downto 0);
  adc_swap_valid_o                          : out std_logic;

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

  monit1_amp_ch0_o                          : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_amp_ch1_o                          : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_amp_ch2_o                          : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_amp_ch3_o                          : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_amp_valid_o                        : out std_logic;

  monit_amp_ch0_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch1_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch2_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_ch3_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_amp_valid_o                         : out std_logic;

  -----------------------------
  -- Position Data
  -----------------------------

  tbt_pos_x_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pos_y_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pos_q_o                               : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pos_sum_o                             : out std_logic_vector(g_tbt_decim_width-1 downto 0);
  tbt_pos_valid_o                           : out std_logic;

  fofb_pos_x_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pos_y_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pos_q_o                              : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pos_sum_o                            : out std_logic_vector(g_fofb_decim_width-1 downto 0);
  fofb_pos_valid_o                          : out std_logic;

  monit1_pos_x_o                            : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_pos_y_o                            : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_pos_q_o                            : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_pos_sum_o                          : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit1_pos_valid_o                        : out std_logic;

  monit_pos_x_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_pos_y_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_pos_q_o                             : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_pos_sum_o                           : out std_logic_vector(g_monit_decim_width-1 downto 0);
  monit_pos_valid_o                         : out std_logic;

  -----------------------------
  -- Output to RFFE board
  -----------------------------

  rffe_swclk_o                              : out std_logic;

  -----------------------------
  -- Synchronization trigger for RFFE swap clock
  -----------------------------

  sync_trig_i                               : in std_logic;

  -----------------------------
  -- Synchronization trigger for TBT Filter Chain
  -----------------------------

  sync_tbt_trig_i                           : in std_logic := '0';

  -----------------------------
  -- Debug signals
  -----------------------------

  dbg_cur_address_o                         : out std_logic_vector(31 downto 0);
  dbg_adc_ch0_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch1_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch2_cond_o                        : out std_logic_vector(g_input_width-1 downto 0);
  dbg_adc_ch3_cond_o                        : out std_logic_vector(g_input_width-1 downto 0)
);
end wb_position_calc_core;

architecture rtl of wb_position_calc_core is

  ---------------------------------------------------------
  --                     Functions                       --
  ---------------------------------------------------------

  function f_log2_size (A : natural) return natural is
  begin
    for I in 1 to 64 loop               -- Works for up to 64 bits
      if (2**I >= A) then
        return(I);
      end if;
    end loop;
    return(63);
  end f_log2_size;

  ---------------------------------------------------------
  --                     Constants                       --
  ---------------------------------------------------------
  constant c_periph_addr_size               : natural := 6+2;

  constant c_cdc_tbt_width                  : natural := 4*g_tbt_decim_width;
  constant c_cdc_fofb_width                 : natural := 4*g_fofb_decim_width;
  constant c_cdc_monit1_width               : natural := 4*g_monit_decim_width;
  constant c_cdc_monit_width                : natural := 4*g_monit_decim_width;

  constant c_cdc_mix_iq_width               : natural := 8*g_IQ_width;
  constant c_cdc_tbt_iq_width               : natural := 8*g_tbt_decim_width;
  constant c_cdc_fofb_iq_width              : natural := 8*g_fofb_decim_width;

  constant c_cdc_adc_width                  : natural := g_input_width;

  constant c_cdc_ref_size                   : natural := 4;

  constant c_tbt_decim_tag_dly_width        : natural := 9;
  constant c_tbt_tag_desync_cnt_width       : natural := 14;
  constant c_tbt_cic_mask_samples_width     : natural := 10;
  constant c_fofb_decim_desync_cnt_width    : natural := 14;
  constant c_fofb_cic_mask_samples_width    : natural := 16;

  constant c_tbt_ratio_log2                 : natural := f_log2_size(g_tbt_ratio);

  constant c_k_width                        : natural := 24;

  constant c_cnt_width_raw                  : natural := g_adc_ratio;
  constant c_cnt_width_mix                  : natural := g_IQ_width;
  constant c_cnt_width_processed            : natural := g_tbt_decim_width;

  constant c_counters_mix_idx               : natural := 0;
  constant c_counters_tbt_decim_idx         : natural := 1;
  constant c_counters_tbt_amp_idx           : natural := 2;
  constant c_counters_tbt_pha_idx           : natural := 3;
  constant c_counters_tbt_pos_idx           : natural := 4;
  constant c_counters_fofb_decim_idx        : natural := 5;
  constant c_counters_fofb_amp_idx          : natural := 6;
  constant c_counters_fofb_pha_idx          : natural := 7;
  constant c_counters_fofb_pos_idx          : natural := 8;
  constant c_counters_monit1_amp_idx        : natural := 9;
  constant c_counters_monit1_pos_idx        : natural := 10;
  constant c_counters_monit_amp_idx         : natural := 11;
  constant c_counters_monit_pos_idx         : natural := 12;

  constant c_num_counters                   : natural := 13; -- All DSP rates

  constant c_cnt_width_array                : t_cnt_width_array(c_num_counters-1 downto 0) :=
  (
    c_counters_mix_idx                      => c_cnt_width_mix,
    c_counters_tbt_decim_idx                => c_cnt_width_processed,
    c_counters_tbt_amp_idx                  => c_cnt_width_processed,
    c_counters_tbt_pha_idx                  => c_cnt_width_processed,
    c_counters_tbt_pos_idx                  => c_cnt_width_processed,
    c_counters_fofb_decim_idx               => c_cnt_width_processed,
    c_counters_fofb_amp_idx                 => c_cnt_width_processed,
    c_counters_fofb_pha_idx                 => c_cnt_width_processed,
    c_counters_fofb_pos_idx                 => c_cnt_width_processed,
    c_counters_monit1_amp_idx               => c_cnt_width_processed,
    c_counters_monit1_pos_idx               => c_cnt_width_processed,
    c_counters_monit_amp_idx                => c_cnt_width_processed,
    c_counters_monit_pos_idx                => c_cnt_width_processed
  );

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
  signal fs_rst                             : std_logic;

  ---------------------------------------------------------
  --                 Counters signals                    --
  ---------------------------------------------------------

  signal cnt_ce_array                       : std_logic_vector(c_num_counters-1 downto 0);
  signal cnt_up_array                       : std_logic_vector(c_num_counters-1 downto 0);
  signal cnt_array                          : t_cnt_array(c_num_counters-1 downto 0);
  signal test_data                          : std_logic;

  ---------------------------------------------------------
  --               ADC, MIX and data                     --
  ---------------------------------------------------------

  signal adc_ch0_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch1_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch2_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch3_sp                         : std_logic_vector(g_input_width-1 downto 0);
  signal adc_tag_sp                         : std_logic_vector(0 downto 0);
  signal adc_valid_sp                       : std_logic;

  signal dsp_cha                            : std_logic_vector(g_input_width-1 downto 0);
  signal dsp_chb                            : std_logic_vector(g_input_width-1 downto 0);
  signal dsp_chc                            : std_logic_vector(g_input_width-1 downto 0);
  signal dsp_chd                            : std_logic_vector(g_input_width-1 downto 0);
  signal dsp_ch_tag                         : std_logic_vector(0 downto 0);
  signal dsp_ch_tag_en                      : std_logic := '0';
  signal dsp_ch_valid                       : std_logic;

  -- High pass filtering
  signal adc_ch0_hpf                        : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch1_hpf                        : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch2_hpf                        : std_logic_vector(g_input_width-1 downto 0);
  signal adc_ch3_hpf                        : std_logic_vector(g_input_width-1 downto 0);

  -- BPM Swap signals
  signal sw_mode1                           : std_logic_vector(1 downto 0);
  signal sw_mode2                           : std_logic_vector(1 downto 0);
  signal clk_swap_en                        : std_logic;

  signal mix_ch0_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch0_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch1_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch1_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch2_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch2_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch3_i                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_ch3_q                          : std_logic_vector(g_IQ_width-1 downto 0);
  signal mix_valid                          : std_logic;
  signal mix_ce                             : std_logic;

  ---------------------------------------------------------
  --                     TBT data                        --
  ---------------------------------------------------------

  signal tbt_decim_tag_en                   : std_logic := '0';
  signal tbt_decim_tag_dly_c                : std_logic_vector(c_tbt_decim_tag_dly_width-1 downto 0) := (others => '0');
  signal tbt_decim_tag_raw                  : std_logic := '0';
  signal tbt_decim_tag_logic                : std_logic;
  signal tbt_decim_tag                      : std_logic_vector(0 downto 0);
  signal tbt_decim_mask_en                  : std_logic := '0';
  signal tbt_decim_mask_num_samples_beg     : unsigned(c_tbt_cic_mask_samples_width-1 downto 0) := (others => '0');
  signal tbt_decim_mask_num_samples_end     : unsigned(c_tbt_cic_mask_samples_width-1 downto 0) := (others => '0');
  signal tbt_decim_ch0_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch0_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch1_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch1_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch2_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch2_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch3_i                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_ch3_q                    : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_decim_valid                    : std_logic;
  signal tbt_decim_ce                       : std_logic;

  signal tbt_amp_ch0                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_ch1                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_ch2                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_ch3                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_amp_valid                      : std_logic;
  signal tbt_amp_ce                         : std_logic;

  signal tbt_pha_ch0                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_ch1                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_ch2                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_ch3                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pha_valid                      : std_logic;
  signal tbt_pha_ce                         : std_logic;

  ---------------------------------------------------------
  --                     FOFB data                       --
  ---------------------------------------------------------

  signal fofb_decim_mask_en                 : std_logic := '0';
  signal fofb_decim_mask_num_samples        : unsigned(c_fofb_cic_mask_samples_width-1 downto 0) := (others => '0');
  signal fofb_decim_ch0_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch0_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch1_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch1_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch2_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch2_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch3_i                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_ch3_q                   : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_decim_valid                   : std_logic;
  signal fofb_decim_ce                      : std_logic;

  signal fofb_amp_ch0                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_ch1                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_ch2                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_ch3                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_amp_valid                     : std_logic;
  signal fofb_amp_ce                        : std_logic;

  signal fofb_pha_ch0                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_ch1                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_ch2                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_ch3                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pha_valid                     : std_logic;
  signal fofb_pha_ce                        : std_logic;

  ---------------------------------------------------------
  --                   Monitoring data                   --
  ---------------------------------------------------------

  signal monit1_amp_ch0                     : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch1                     : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch2                     : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch3                     : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_valid                   : std_logic;
  signal monit1_amp_ce                      : std_logic;

  signal monit1_amp_ch0_wb_sync             : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch1_wb_sync             : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch2_wb_sync             : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch3_wb_sync             : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_valid_wb_sync           : std_logic;

  signal monit_amp_ch0                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch1                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch2                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch3                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_valid                    : std_logic;
  signal monit_amp_ce                       : std_logic;

  signal monit_amp_ch0_wb_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch1_wb_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch2_wb_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch3_wb_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_valid_wb_sync            : std_logic;

  ---------------------------------------------------------
  --                   Position data                     --
  ---------------------------------------------------------

  signal tbt_pos_x                          : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pos_y                          : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pos_q                          : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pos_sum                        : std_logic_vector(g_tbt_decim_width-1 downto 0);
  signal tbt_pos_valid                      : std_logic;
  signal tbt_pos_ce                         : std_logic;

  signal fofb_pos_x                         : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pos_y                         : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pos_q                         : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pos_sum                       : std_logic_vector(g_fofb_decim_width-1 downto 0);
  signal fofb_pos_valid                     : std_logic;
  signal fofb_pos_ce                        : std_logic;

  signal monit1_pos_x                       : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_y                       : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_q                       : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_sum                     : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_valid                   : std_logic;
  signal monit1_pos_ce                      : std_logic;

  signal monit1_pos_x_wb_sync               : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_y_wb_sync               : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_q_wb_sync               : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_sum_wb_sync             : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_valid_wb_sync           : std_logic;

  signal dsp_monit1_updt                    : std_logic;

  signal monit_pos_x                        : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_y                        : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_q                        : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_sum                      : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_valid                    : std_logic;
  signal monit_pos_ce                       : std_logic;

  signal monit_pos_x_wb_sync                : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_y_wb_sync                : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_q_wb_sync                : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_sum_wb_sync              : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_valid_wb_sync            : std_logic;

  signal dsp_monit_updt                     : std_logic;

  ---------------------------------------------------------
  -- FIFO CDC signals
  ---------------------------------------------------------

  signal fifo_mix_out                       : std_logic_vector(c_cdc_mix_iq_width-1 downto 0);
  signal fifo_mix_valid_out                 : std_logic;

  signal fifo_tbt_decim_out                 : std_logic_vector(c_cdc_tbt_iq_width-1 downto 0);
  signal fifo_tbt_decim_valid_out           : std_logic;

  signal fifo_tbt_amp_out                   : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_amp_valid_out             : std_logic;

  signal fifo_tbt_pha_out                   : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_pha_valid_out             : std_logic;

  signal fifo_tbt_pos_out                   : std_logic_vector(c_cdc_tbt_width-1 downto 0);
  signal fifo_tbt_pos_valid_out             : std_logic;

  signal fifo_fofb_decim_out                : std_logic_vector(c_cdc_fofb_iq_width-1 downto 0);
  signal fifo_fofb_decim_valid_out          : std_logic;

  signal fifo_fofb_amp_out                  : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_amp_valid_out            : std_logic;

  signal fifo_fofb_pha_out                  : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_pha_valid_out            : std_logic;

  signal fifo_fofb_pos_out                  : std_logic_vector(c_cdc_fofb_width-1 downto 0);
  signal fifo_fofb_pos_valid_out            : std_logic;

  signal fifo_monit1_amp_out                 : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit1_amp_valid_out           : std_logic;
  signal fifo_monit1_amp_out_wb_sync         : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit1_amp_valid_out_wb_sync   : std_logic;

  signal fifo_monit1_pos_out                 : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit1_pos_valid_out           : std_logic;
  signal fifo_monit1_pos_out_wb_sync         : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit1_pos_valid_out_wb_sync   : std_logic;

  signal monit1_amp_ch3_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch2_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch1_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_ch0_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_amp_valid_out_wb_sync        : std_logic;

  signal monit1_pos_sum_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_q_out_wb_sync            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_y_out_wb_sync            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_x_out_wb_sync            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit1_pos_valid_out_wb_sync        : std_logic;

  signal fifo_monit_amp_out                 : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_amp_valid_out           : std_logic;
  signal fifo_monit_amp_out_wb_sync         : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_amp_valid_out_wb_sync   : std_logic;

  signal fifo_monit_pos_out                 : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_pos_valid_out           : std_logic;
  signal fifo_monit_pos_out_wb_sync         : std_logic_vector(c_cdc_monit_width-1 downto 0);
  signal fifo_monit_pos_valid_out_wb_sync   : std_logic;

  signal monit_amp_ch3_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch2_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch1_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_ch0_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_amp_valid_out_wb_sync        : std_logic;

  signal monit_pos_sum_out_wb_sync          : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_q_out_wb_sync            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_y_out_wb_sync            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_x_out_wb_sync            : std_logic_vector(g_monit_decim_width-1 downto 0);
  signal monit_pos_valid_out_wb_sync        : std_logic;

  ---------------------------------------------------------
  -- Components instantiation
  ---------------------------------------------------------

  component wb_pos_calc_regs is
    port (
      rst_n_i    : in  std_logic;
      clk_sys_i  : in  std_logic;
      wb_adr_i   : in  std_logic_vector(5 downto 0);
      wb_dat_i   : in  std_logic_vector(31 downto 0);
      wb_dat_o   : out std_logic_vector(31 downto 0);
      wb_cyc_i   : in  std_logic;
      wb_sel_i   : in  std_logic_vector(3 downto 0);
      wb_stb_i   : in  std_logic;
      wb_we_i    : in  std_logic;
      wb_ack_o   : out std_logic;
      wb_stall_o : out std_logic;
      fs_clk2x_i : in  std_logic;
      regs_i     : in  t_pos_calc_in_registers;
      regs_o     : out t_pos_calc_out_registers);
  end component wb_pos_calc_regs;

begin

  fs_rst2x                            <= not fs_rst2x_n_i;
  fs_rst                              <= not fs_rst_n_i;

  -----------------------------
  -- Insert extra Wishbone registering stage for ease timing.
  -- It effectively cuts the bandwidth in half!
  -----------------------------
  gen_with_extra_wb_reg : if g_with_extra_wb_reg generate

    cmp_register_link : xwb_register_link -- puts a register of delay between crossbars
    port map (
      clk_sys_i                             => clk_i,
      rst_n_i                               => rst_n_i,
      slave_i                               => cbar_slave_in_reg0(0),
      slave_o                               => cbar_slave_out_reg0(0),
      master_i                              => cbar_slave_out(0),
      master_o                              => cbar_slave_in(0)
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
    wb_adr_i                                => wb_slv_adp_out.adr(5 downto 0),
    wb_dat_i                                => wb_slv_adp_out.dat,
    wb_dat_o                                => wb_slv_adp_in.dat,
    wb_cyc_i                                => wb_slv_adp_out.cyc,
    wb_sel_i                                => wb_slv_adp_out.sel,
    wb_stb_i                                => wb_slv_adp_out.stb,
    wb_we_i                                 => wb_slv_adp_out.we,
    wb_ack_o                                => wb_slv_adp_in.ack,
    wb_stall_o                              => wb_slv_adp_in.stall,
    fs_clk2x_i                              => fs_clk_i,
    regs_i                                  => regs_in,
    regs_o                                  => regs_out
  );

  -- Unused wishbone signals
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

  --------------------------------------------------------------------------------
  -- This is the old interface for acquiring data from Monit. It goes like this:
  --   1) Bus must write any value to "updt" register. This will update the output
  --     register to be ready
  --   2) Read dsp_monit_* registers
  --------------------------------------------------------------------------------

  ------------------------------------
  -- Monit 1
  ------------------------------------

  -- Sync with clk_i
  regs_in.dsp_monit1_amp_ch0_i               <=
    std_logic_vector(resize(signed(monit1_amp_ch0_wb_sync), regs_in.dsp_monit1_amp_ch0_i'length));
  regs_in.dsp_monit1_amp_ch1_i               <=
    std_logic_vector(resize(signed(monit1_amp_ch1_wb_sync), regs_in.dsp_monit1_amp_ch1_i'length));
  regs_in.dsp_monit1_amp_ch2_i               <=
    std_logic_vector(resize(signed(monit1_amp_ch2_wb_sync), regs_in.dsp_monit1_amp_ch2_i'length));
  regs_in.dsp_monit1_amp_ch3_i               <=
    std_logic_vector(resize(signed(monit1_amp_ch3_wb_sync), regs_in.dsp_monit1_amp_ch3_i'length));

  -- Sync with clk_i
  regs_in.dsp_monit1_pos_x_i                 <=
    std_logic_vector(resize(signed(monit1_pos_x_wb_sync), regs_in.dsp_monit1_pos_x_i'length));
  regs_in.dsp_monit1_pos_y_i                 <=
    std_logic_vector(resize(signed(monit1_pos_y_wb_sync), regs_in.dsp_monit1_pos_y_i'length));
  regs_in.dsp_monit1_pos_q_i                 <=
    std_logic_vector(resize(signed(monit1_pos_q_wb_sync), regs_in.dsp_monit1_pos_q_i'length));
  regs_in.dsp_monit1_pos_sum_i               <=
    std_logic_vector(resize(signed(monit1_pos_sum_wb_sync), regs_in.dsp_monit1_pos_sum_i'length));

  -- Sync with clk_i
  dsp_monit1_updt <= regs_out.dsp_monit1_updt_wr_o;

  ------------------------------------
  -- Monit
  ------------------------------------

  -- Sync with clk_i
  regs_in.dsp_monit_amp_ch0_i               <=
    std_logic_vector(resize(signed(monit_amp_ch0_wb_sync), regs_in.dsp_monit_amp_ch0_i'length));
  regs_in.dsp_monit_amp_ch1_i               <=
    std_logic_vector(resize(signed(monit_amp_ch1_wb_sync), regs_in.dsp_monit_amp_ch1_i'length));
  regs_in.dsp_monit_amp_ch2_i               <=
    std_logic_vector(resize(signed(monit_amp_ch2_wb_sync), regs_in.dsp_monit_amp_ch2_i'length));
  regs_in.dsp_monit_amp_ch3_i               <=
    std_logic_vector(resize(signed(monit_amp_ch3_wb_sync), regs_in.dsp_monit_amp_ch3_i'length));

  -- Sync with clk_i
  regs_in.dsp_monit_pos_x_i                 <=
    std_logic_vector(resize(signed(monit_pos_x_wb_sync), regs_in.dsp_monit_pos_x_i'length));
  regs_in.dsp_monit_pos_y_i                 <=
    std_logic_vector(resize(signed(monit_pos_y_wb_sync), regs_in.dsp_monit_pos_y_i'length));
  regs_in.dsp_monit_pos_q_i                 <=
    std_logic_vector(resize(signed(monit_pos_q_wb_sync), regs_in.dsp_monit_pos_q_i'length));
  regs_in.dsp_monit_pos_sum_i               <=
    std_logic_vector(resize(signed(monit_pos_sum_wb_sync), regs_in.dsp_monit_pos_sum_i'length));

  -- Sync with clk_i
  dsp_monit_updt <= regs_out.dsp_monit_updt_wr_o;

  --------------------------------------------------------------------------------
  -- This is the new interface for acquiring data from Monit. It goes like this:
  --   1) Bus checks if there is data in the output fifo.
  --   2) If positive, read from the ampfifo_* registers normally
  --------------------------------------------------------------------------------

  ------------------------------------
  -- Monit 1
  ------------------------------------

  regs_in.ampfifo_monit1_wr_req_i         <= monit1_amp_valid_out_wb_sync when
                                             regs_out.ampfifo_monit1_wr_full_o = '0' else '0';
  regs_in.ampfifo_monit1_amp_ch0_i   <=
    std_logic_vector(resize(signed(monit1_amp_ch0_out_wb_sync), regs_in.ampfifo_monit1_amp_ch0_i'length));
  regs_in.ampfifo_monit1_amp_ch1_i   <=
    std_logic_vector(resize(signed(monit1_amp_ch1_out_wb_sync), regs_in.ampfifo_monit1_amp_ch1_i'length));
  regs_in.ampfifo_monit1_amp_ch2_i   <=
    std_logic_vector(resize(signed(monit1_amp_ch2_out_wb_sync), regs_in.ampfifo_monit1_amp_ch2_i'length));
  regs_in.ampfifo_monit1_amp_ch3_i   <=
    std_logic_vector(resize(signed(monit1_amp_ch3_out_wb_sync), regs_in.ampfifo_monit1_amp_ch3_i'length));

  regs_in.posfifo_monit1_wr_req_i         <= monit1_pos_valid_out_wb_sync when
                                          regs_out.posfifo_monit1_wr_full_o = '0' else '0';
  regs_in.posfifo_monit1_pos_x_i     <=
    std_logic_vector(resize(signed(monit1_pos_x_out_wb_sync), regs_in.posfifo_monit1_pos_x_i'length));
  regs_in.posfifo_monit1_pos_y_i     <=
    std_logic_vector(resize(signed(monit1_pos_y_out_wb_sync), regs_in.posfifo_monit1_pos_y_i'length));
  regs_in.posfifo_monit1_pos_q_i     <=
    std_logic_vector(resize(signed(monit1_pos_q_out_wb_sync), regs_in.posfifo_monit1_pos_q_i'length));
  regs_in.posfifo_monit1_pos_sum_i   <=
    std_logic_vector(resize(signed(monit1_pos_sum_out_wb_sync), regs_in.posfifo_monit1_pos_sum_i'length));

  ------------------------------------
  -- Monit
  ------------------------------------

  regs_in.ampfifo_monit_wr_req_i          <= monit_amp_valid_out_wb_sync when
                                          regs_out.ampfifo_monit_wr_full_o = '0' else '0';
  regs_in.ampfifo_monit_amp_ch0_i   <=
    std_logic_vector(resize(signed(monit_amp_ch0_out_wb_sync), regs_in.ampfifo_monit_amp_ch0_i'length));
  regs_in.ampfifo_monit_amp_ch1_i   <=
    std_logic_vector(resize(signed(monit_amp_ch1_out_wb_sync), regs_in.ampfifo_monit_amp_ch1_i'length));
  regs_in.ampfifo_monit_amp_ch2_i   <=
    std_logic_vector(resize(signed(monit_amp_ch2_out_wb_sync), regs_in.ampfifo_monit_amp_ch2_i'length));
  regs_in.ampfifo_monit_amp_ch3_i   <=
    std_logic_vector(resize(signed(monit_amp_ch3_out_wb_sync), regs_in.ampfifo_monit_amp_ch3_i'length));

  regs_in.posfifo_monit_wr_req_i          <= monit_pos_valid_out_wb_sync when
                                          regs_out.posfifo_monit_wr_full_o = '0' else '0';
  regs_in.posfifo_monit_pos_x_i     <=
    std_logic_vector(resize(signed(monit_pos_x_out_wb_sync), regs_in.posfifo_monit_pos_x_i'length));
  regs_in.posfifo_monit_pos_y_i     <=
    std_logic_vector(resize(signed(monit_pos_y_out_wb_sync), regs_in.posfifo_monit_pos_y_i'length));
  regs_in.posfifo_monit_pos_q_i     <=
    std_logic_vector(resize(signed(monit_pos_q_out_wb_sync), regs_in.posfifo_monit_pos_q_i'length));
  regs_in.posfifo_monit_pos_sum_i   <=
    std_logic_vector(resize(signed(monit_pos_sum_out_wb_sync), regs_in.posfifo_monit_pos_sum_i'length));

  -- Test data
  test_data <= regs_out.dds_cfg_test_data_o;

  gen_with_downconv : if (g_with_downconv) generate

    ------------------------------------
    -- High pass filtering on ADC input
    ------------------------------------
    cmp_hpf0 : hpf_adcinput
    port map
    (
        clk_i    => fs_clk_i,
        rst_n_i  => fs_rst_n_i,
        ce_i     => '1',           -- FIXME: create proper CE signal
        data_i   => adc_ch0_i,
        data_o   => adc_ch0_hpf
      );

    cmp_hpf1 : hpf_adcinput
    port map
    (
        clk_i    => fs_clk_i,
        rst_n_i  => fs_rst_n_i,
        ce_i     => '1',           -- FIXME: create proper CE signal
        data_i   => adc_ch1_i,
        data_o   => adc_ch1_hpf
      );

    cmp_hpf2 : hpf_adcinput
    port map
    (
        clk_i    => fs_clk_i,
        rst_n_i  => fs_rst_n_i,
        ce_i     => '1',           -- FIXME: create proper CE signal
        data_i   => adc_ch2_i,
        data_o   => adc_ch2_hpf
      );

    cmp_hpf3 : hpf_adcinput
    port map
    (
        clk_i    => fs_clk_i,
        rst_n_i  => fs_rst_n_i,
        ce_i     => '1',           -- FIXME: create proper CE signal
        data_i   => adc_ch3_i,
        data_o   => adc_ch3_hpf
      );

  end generate;

  gen_without_downconv : if (not g_with_downconv) generate

    adc_ch0_hpf <= adc_ch0_i;
    adc_ch1_hpf <= adc_ch1_i;
    adc_ch2_hpf <= adc_ch2_i;
    adc_ch3_hpf <= adc_ch3_i;

  end generate;

  -----------------------------
  -- BPM Swap Module.
  -----------------------------
  -- BPM Swap Module interface is the slave number 1
  cmp_wb_bpm_swap : wb_bpm_swap
  generic map
  (
    g_interface_mode                          => g_interface_mode,
    g_address_granularity                     => g_address_granularity,
    g_delay_vec_width                         => g_delay_vec_width,
    g_swap_div_freq_vec_width                 => g_swap_div_freq_vec_width,
    g_ch_width                                => g_input_width
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
    cha_i                                     => adc_ch0_hpf,
    chb_i                                     => adc_ch1_hpf,
    chc_i                                     => adc_ch2_hpf,
    chd_i                                     => adc_ch3_hpf,
    ch_valid_i                                => adc_valid_i,
    cha_o                                     => adc_ch0_sp,
    chb_o                                     => adc_ch1_sp,
    chc_o                                     => adc_ch2_sp,
    chd_o                                     => adc_ch3_sp,
    ch_tag_o                                  => adc_tag_sp,
    ch_valid_o                                => adc_valid_sp,
    rffe_swclk_o                              => rffe_swclk_o,
    sync_trig_i                               => sync_trig_i
  );

  adc_ch0_swap_o                              <= adc_ch0_sp;
  adc_ch1_swap_o                              <= adc_ch1_sp;
  adc_ch2_swap_o                              <= adc_ch2_sp;
  adc_ch3_swap_o                              <= adc_ch3_sp;
  adc_tag_o                                   <= adc_tag_sp;
  adc_swap_valid_o                            <= adc_valid_sp;

  -- For compatibility only
  dbg_cur_address_o                           <= (others => '0');
  dbg_adc_ch0_cond_o                          <= (others => '0');
  dbg_adc_ch1_cond_o                          <= (others => '0');
  dbg_adc_ch2_cond_o                          <= (others => '0');
  dbg_adc_ch3_cond_o                          <= (others => '0');

  -- IMPORTANT. Up until this point we were treating the DSP signals
  -- as ch0, ch1, ch2 and ch3, so as to reflect the signal that were
  -- input to the ADC. So, ch0 is the signal coming from ADC ch0, and
  -- so on.
  -- However, in the position calculation application, we have the
  -- switching scheme between ADC channels ch0 <-> ch1 and ch2 <-> ch3
  -- that are in fact connected to the analog signals in the following way:
  --
  -- ch0 <-> A
  -- ch1 <-> C
  -- ch2 <-> B
  -- ch3 <-> D
  --
  -- Next, we use the position calculation formula considering the
  -- analog signal convention (A, B, C, D) as this is how the information
  -- is coded. This have the implication that we must input the A, B, C, D
  -- in the correct order for the position_calc module, but this still
  -- uses ch0, ch1, ch2, ch3 convention.
  --
  -- So, to fix this, we must change the order of the input signal to match
  -- the analog <-> digital signal domains using: ch0 as channel A,
  -- ch1 as channel C, and so on according to the scheme above.
  dsp_cha                                   <= adc_ch0_sp;
  dsp_chb                                   <= adc_ch2_sp;
  dsp_chc                                   <= adc_ch1_sp;
  dsp_chd                                   <= adc_ch3_sp;
  dsp_ch_tag                                <= adc_tag_sp;
  dsp_ch_tag_en                             <= regs_out.sw_tag_en_o;
  dsp_ch_valid                              <= adc_valid_sp;

  tbt_decim_tag_en                          <= regs_out.tbt_tag_en_o;
  tbt_decim_tag_dly_c                       <= regs_out.tbt_tag_dly_o(c_tbt_decim_tag_dly_width-1 downto 0);
  tbt_decim_mask_en                         <= regs_out.tbt_data_mask_ctl_en_o;
  tbt_decim_mask_num_samples_beg            <= unsigned(regs_out.tbt_data_mask_samples_beg_o(c_tbt_cic_mask_samples_width-1 downto 0));
  tbt_decim_mask_num_samples_end            <= unsigned(regs_out.tbt_data_mask_samples_end_o(c_tbt_cic_mask_samples_width-1 downto 0));

  fofb_decim_mask_en                        <= regs_out.sw_data_mask_en_o;
  fofb_decim_mask_num_samples               <= unsigned(regs_out.sw_data_mask_samples_o);

  -- Generate proper tag for TBT
  cmp_tbt_tag : swap_freqgen
  generic map (
    g_delay_vec_width                       => c_tbt_decim_tag_dly_width,
    g_swap_div_freq_vec_width               => c_tbt_ratio_log2
  )
  port map (
    clk_i                                   => fs_clk_i,
    rst_n_i                                 => fs_rst_n_i,

    sync_trig_i                             => sync_tbt_trig_i,

    -- Swap and de-swap signals
    swap_o                                  => open,
    deswap_o                                => tbt_decim_tag_logic,

    -- Swap mode setting
    swap_mode_i                             => c_swmode_swap_deswap,

    -- Swap frequency settings
    swap_div_f_i                            => std_logic_vector(to_unsigned(g_tbt_ratio,
                                                                            c_tbt_ratio_log2)),

    -- De-swap delay setting
    deswap_delay_i                          => tbt_decim_tag_dly_c
  );

  tbt_decim_tag(0) <= tbt_decim_tag_logic;

  cmp_position_calc : position_calc
  generic map
  (
    -- selection of position_calc stages
    g_with_downconv                         => g_with_downconv,

    -- input sizes
    g_input_width                           => g_input_width,
    g_mixed_width                           => g_mixed_width,
    g_adc_ratio                             => g_adc_ratio,

    -- mixer
    g_dds_width                             => g_dds_width,
    g_dds_points                            => g_dds_points,
    g_sin_file                              => g_sin_file,
    g_cos_file                              => g_cos_file,

    g_tbt_tag_desync_cnt_width              => c_tbt_tag_desync_cnt_width,
    g_tbt_cic_mask_samples_width            => c_tbt_cic_mask_samples_width,

    -- CIC setup
    g_tbt_cic_delay                         => g_tbt_cic_delay,
    g_tbt_cic_stages                        => g_tbt_cic_stages,
    g_tbt_ratio                             => g_tbt_ratio,
    g_tbt_decim_width                       => g_tbt_decim_width,

    g_fofb_cic_delay                        => g_fofb_cic_delay,
    g_fofb_cic_stages                       => g_fofb_cic_stages,
    g_fofb_ratio                            => g_fofb_ratio,
    g_fofb_decim_width                      => g_fofb_decim_width,

    g_fofb_decim_desync_cnt_width           => c_fofb_decim_desync_cnt_width,
    g_fofb_cic_mask_samples_width           => c_fofb_cic_mask_samples_width,

    g_monit1_cic_delay                      => g_monit1_cic_delay,
    g_monit1_cic_stages                     => g_monit1_cic_stages,
    g_monit1_ratio                          => g_monit1_ratio,
    g_monit1_cic_ratio                      => g_monit1_cic_ratio,

    g_monit2_cic_delay                      => g_monit2_cic_delay,
    g_monit2_cic_stages                     => g_monit2_cic_stages,
    g_monit2_ratio                          => g_monit2_ratio,
    g_monit2_cic_ratio                      => g_monit2_cic_ratio,

    g_monit_decim_width                     => g_monit_decim_width,

    -- Cordic setup
    g_tbt_cordic_stages                     => g_tbt_cordic_stages,
    g_tbt_cordic_iter_per_clk               => g_tbt_cordic_iter_per_clk,
    g_tbt_cordic_ratio                      => g_tbt_cordic_ratio,

    g_fofb_cordic_stages                    => g_fofb_cordic_stages,
    g_fofb_cordic_iter_per_clk              => g_fofb_cordic_iter_per_clk,
    g_fofb_cordic_ratio                     => g_fofb_cordic_ratio,

    -- width of K constants
    g_k_width                               => g_k_width,

    --width for IQ output
    g_IQ_width                              => g_IQ_width
  )
  port map
  (
    adc_ch0_i                               => dsp_cha,
    adc_ch1_i                               => dsp_chb,
    adc_ch2_i                               => dsp_chc,
    adc_ch3_i                               => dsp_chd,
    adc_tag_i                               => dsp_ch_tag,
    adc_tag_en_i                            => dsp_ch_tag_en,
    adc_valid_i                             => dsp_ch_valid,

    clk_i                                   => fs_clk_i,
    rst_i                                   => fs_rst,

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
    mix_valid_o                             => mix_valid,
    mix_ce_o                                => mix_ce,

    -- Synchronization trigger for TBT filter chain
    tbt_tag_i                               => tbt_decim_tag,
    tbt_tag_en_i                            => tbt_decim_tag_en,
    tbt_tag_desync_cnt_rst_i                => regs_out.tbt_tag_desync_cnt_rst_o,
    tbt_tag_desync_cnt_o                    => regs_in.tbt_tag_desync_cnt_i,
    tbt_decim_mask_en_i                     => tbt_decim_mask_en,
    tbt_decim_mask_num_samples_beg_i        => tbt_decim_mask_num_samples_beg,
    tbt_decim_mask_num_samples_end_i        => tbt_decim_mask_num_samples_end,
    tbt_decim_ch0_i_o                       => tbt_decim_ch0_i,
    tbt_decim_ch0_q_o                       => tbt_decim_ch0_q,
    tbt_decim_ch1_i_o                       => tbt_decim_ch1_i,
    tbt_decim_ch1_q_o                       => tbt_decim_ch1_q,
    tbt_decim_ch2_i_o                       => tbt_decim_ch2_i,
    tbt_decim_ch2_q_o                       => tbt_decim_ch2_q,
    tbt_decim_ch3_i_o                       => tbt_decim_ch3_i,
    tbt_decim_ch3_q_o                       => tbt_decim_ch3_q,
    tbt_decim_valid_o                       => tbt_decim_valid,
    tbt_decim_ce_o                          => tbt_decim_ce,

    tbt_amp_ch0_o                           => tbt_amp_ch0,
    tbt_amp_ch1_o                           => tbt_amp_ch1,
    tbt_amp_ch2_o                           => tbt_amp_ch2,
    tbt_amp_ch3_o                           => tbt_amp_ch3,
    tbt_amp_valid_o                         => tbt_amp_valid,
    tbt_amp_ce_o                            => tbt_amp_ce,

    tbt_pha_ch0_o                           => tbt_pha_ch0,
    tbt_pha_ch1_o                           => tbt_pha_ch1,
    tbt_pha_ch2_o                           => tbt_pha_ch2,
    tbt_pha_ch3_o                           => tbt_pha_ch3,
    tbt_pha_valid_o                         => tbt_pha_valid,
    tbt_pha_ce_o                            => tbt_pha_ce,

    fofb_decim_desync_cnt_rst_i             => regs_out.sw_tag_desync_cnt_rst_o,
    fofb_decim_desync_cnt_o                 => regs_in.sw_tag_desync_cnt_i,
    fofb_decim_mask_en_i                    => fofb_decim_mask_en,
    fofb_decim_mask_num_samples_i           => fofb_decim_mask_num_samples,
    fofb_decim_ch0_i_o                      => fofb_decim_ch0_i,
    fofb_decim_ch0_q_o                      => fofb_decim_ch0_q,
    fofb_decim_ch1_i_o                      => fofb_decim_ch1_i,
    fofb_decim_ch1_q_o                      => fofb_decim_ch1_q,
    fofb_decim_ch2_i_o                      => fofb_decim_ch2_i,
    fofb_decim_ch2_q_o                      => fofb_decim_ch2_q,
    fofb_decim_ch3_i_o                      => fofb_decim_ch3_i,
    fofb_decim_ch3_q_o                      => fofb_decim_ch3_q,
    fofb_decim_valid_o                      => fofb_decim_valid,
    fofb_decim_ce_o                         => fofb_decim_ce,

    fofb_amp_ch0_o                          => fofb_amp_ch0,
    fofb_amp_ch1_o                          => fofb_amp_ch1,
    fofb_amp_ch2_o                          => fofb_amp_ch2,
    fofb_amp_ch3_o                          => fofb_amp_ch3,
    fofb_amp_valid_o                        => fofb_amp_valid,
    fofb_amp_ce_o                           => fofb_amp_ce,

    fofb_pha_ch0_o                          => fofb_pha_ch0,
    fofb_pha_ch1_o                          => fofb_pha_ch1,
    fofb_pha_ch2_o                          => fofb_pha_ch2,
    fofb_pha_ch3_o                          => fofb_pha_ch3,
    fofb_pha_valid_o                        => fofb_pha_valid,
    fofb_pha_ce_o                           => fofb_pha_ce,

    monit1_amp_ch0_o                        => monit1_amp_ch0,
    monit1_amp_ch1_o                        => monit1_amp_ch1,
    monit1_amp_ch2_o                        => monit1_amp_ch2,
    monit1_amp_ch3_o                        => monit1_amp_ch3,
    monit1_amp_valid_o                      => monit1_amp_valid,
    monit1_amp_ce_o                         => monit1_amp_ce,

    monit_amp_ch0_o                         => monit_amp_ch0,
    monit_amp_ch1_o                         => monit_amp_ch1,
    monit_amp_ch2_o                         => monit_amp_ch2,
    monit_amp_ch3_o                         => monit_amp_ch3,
    monit_amp_valid_o                       => monit_amp_valid,
    monit_amp_ce_o                          => monit_amp_ce,

    tbt_pos_x_o                             => tbt_pos_x,
    tbt_pos_y_o                             => tbt_pos_y,
    tbt_pos_q_o                             => tbt_pos_q,
    tbt_pos_sum_o                           => tbt_pos_sum,
    tbt_pos_valid_o                         => tbt_pos_valid,
    tbt_pos_ce_o                            => tbt_pos_ce,

    fofb_pos_x_o                            => fofb_pos_x,
    fofb_pos_y_o                            => fofb_pos_y,
    fofb_pos_q_o                            => fofb_pos_q,
    fofb_pos_sum_o                          => fofb_pos_sum,
    fofb_pos_valid_o                        => fofb_pos_valid,
    fofb_pos_ce_o                           => fofb_pos_ce,

    monit1_pos_x_o                          => monit1_pos_x,
    monit1_pos_y_o                          => monit1_pos_y,
    monit1_pos_q_o                          => monit1_pos_q,
    monit1_pos_sum_o                        => monit1_pos_sum,
    monit1_pos_valid_o                      => monit1_pos_valid,
    monit1_pos_ce_o                         => monit1_pos_ce,

    monit_pos_x_o                           => monit_pos_x,
    monit_pos_y_o                           => monit_pos_y,
    monit_pos_q_o                           => monit_pos_q,
    monit_pos_sum_o                         => monit_pos_sum,
    monit_pos_valid_o                       => monit_pos_valid,
    monit_pos_ce_o                          => monit_pos_ce
  );

  --------------------------------------------------------------------------
  --                        Counters Generation                           --
  --------------------------------------------------------------------------

  cmp_counters_gen : counters_gen
  generic map
  (
    g_cnt_width                             => c_cnt_width_array
  )
  port map
  (
    rst_n_i                                 => fs_rst_n_i,
    clk_i                                   => fs_clk_i,

    ---------------------------------
    -- Counter generation interface
    ---------------------------------
    cnt_ce_array_i                          => cnt_ce_array,
    cnt_up_array_i                          => cnt_up_array,
    cnt_array_o                             => cnt_array
  );

  cnt_ce_array                              <= (
    c_counters_mix_idx         => mix_ce,
    c_counters_tbt_decim_idx   => tbt_decim_ce,
    c_counters_tbt_amp_idx     => tbt_amp_ce,
    c_counters_tbt_pha_idx     => tbt_pha_ce,
    c_counters_tbt_pos_idx     => tbt_pos_ce,
    c_counters_fofb_decim_idx  => fofb_decim_ce,
    c_counters_fofb_amp_idx    => fofb_amp_ce,
    c_counters_fofb_pha_idx    => fofb_pha_ce,
    c_counters_fofb_pos_idx    => fofb_pos_ce,
    c_counters_monit1_amp_idx  => monit1_amp_ce,
    c_counters_monit1_pos_idx  => monit1_pos_ce,
    c_counters_monit_amp_idx   => monit_amp_ce,
    c_counters_monit_pos_idx   => monit_pos_ce);

  -- Don't wait on the actual valid from the DSP rates.
  -- Just assume every test word is valid, which it is.
  cnt_up_array                              <= (
    c_counters_mix_idx        => '1',
    c_counters_tbt_decim_idx  => '1',
    c_counters_tbt_amp_idx    => '1',
    c_counters_tbt_pha_idx    => '1',
    c_counters_tbt_pos_idx    => '1',
    c_counters_fofb_decim_idx => '1',
    c_counters_fofb_amp_idx   => '1',
    c_counters_fofb_pha_idx   => '1',
    c_counters_fofb_pos_idx   => '1',
    c_counters_monit1_amp_idx => '1',
    c_counters_monit1_pos_idx => '1',
    c_counters_monit_amp_idx  => '1',
    c_counters_monit_pos_idx  => '1');

  --------------------------------------------------------------------------
  --    CDC position data (Amplitudes and Position) to fs_clk domain      --
  --------------------------------------------------------------------------

  --------------------------------------------------------------------------
  --                              MIX data                                --
  --------------------------------------------------------------------------

  -- MIX data
  p_reg_cdc_fifo_mix_inputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if mix_ce = '1' then
        if test_data = '1' then
          fifo_mix_out <= f_dup_counter_array(cnt_array(c_counters_mix_idx)(c_cnt_width_array(c_counters_mix_idx)-1 downto 0),
                            8);
          fifo_mix_valid_out <= cnt_up_array(c_counters_mix_idx);
        else
          fifo_mix_out <=  mix_ch3_q &
                          mix_ch3_i &
                          mix_ch2_q &
                          mix_ch2_i &
                          mix_ch1_q &
                          mix_ch1_i &
                          mix_ch0_q &
                          mix_ch0_i;
          fifo_mix_valid_out <= mix_valid;
        end if;

      else
        fifo_mix_valid_out <= '0';
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
  p_reg_cdc_fifo_tbt_decim_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if tbt_decim_ce = '1' then
        if test_data = '1' then
          fifo_tbt_decim_out <= f_dup_counter_array(cnt_array(c_counters_tbt_decim_idx)(c_cnt_width_array(c_counters_tbt_decim_idx)-1 downto 0),
                            8);
          fifo_tbt_decim_valid_out <= cnt_up_array(c_counters_tbt_decim_idx);
        else
          fifo_tbt_decim_out <=  tbt_decim_ch3_q &
                                tbt_decim_ch3_i &
                                tbt_decim_ch2_q &
                                tbt_decim_ch2_i &
                                tbt_decim_ch1_q &
                                tbt_decim_ch1_i &
                                tbt_decim_ch0_q &
                                tbt_decim_ch0_i;
          fifo_tbt_decim_valid_out <= tbt_decim_valid;
        end if;

      else
        fifo_tbt_decim_valid_out <= '0';
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
  p_reg_cdc_fifo_tbt_amp_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if tbt_amp_ce = '1' then
        if test_data = '1' then
          fifo_tbt_amp_out <= f_dup_counter_array(cnt_array(c_counters_tbt_amp_idx)(c_cnt_width_array(c_counters_tbt_amp_idx)-1 downto 0),
                            4);
          fifo_tbt_amp_valid_out <= cnt_up_array(c_counters_tbt_amp_idx);
        else
          fifo_tbt_amp_out <=  tbt_amp_ch3 &
                              tbt_amp_ch2 &
                              tbt_amp_ch1 &
                              tbt_amp_ch0;
          fifo_tbt_amp_valid_out <= tbt_amp_valid;
        end if;

      else
        fifo_tbt_amp_valid_out <= '0';
      end if;
    end if;
  end process;

  tbt_amp_ch3_o <= fifo_tbt_amp_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  tbt_amp_ch2_o <= fifo_tbt_amp_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  tbt_amp_ch1_o <= fifo_tbt_amp_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  tbt_amp_ch0_o <= fifo_tbt_amp_out(g_tbt_decim_width-1 downto 0);

  tbt_amp_valid_o <= fifo_tbt_amp_valid_out;

  --TBT phase data
  p_reg_cdc_fifo_tbt_pha_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if tbt_pha_ce = '1' then
        if test_data = '1' then
          fifo_tbt_pha_out <= f_dup_counter_array(cnt_array(c_counters_tbt_pha_idx)(c_cnt_width_array(c_counters_tbt_pha_idx)-1 downto 0),
                            4);
          fifo_tbt_pha_valid_out <= cnt_up_array(c_counters_tbt_pha_idx);
        else
          fifo_tbt_pha_out <=  tbt_pha_ch3 &
                              tbt_pha_ch2 &
                              tbt_pha_ch1 &
                              tbt_pha_ch0;
          fifo_tbt_pha_valid_out <= tbt_pha_valid;
        end if;

      else
        fifo_tbt_pha_valid_out <= '0';
      end if;
    end if;
  end process;

  tbt_pha_ch3_o <= fifo_tbt_pha_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  tbt_pha_ch2_o <= fifo_tbt_pha_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  tbt_pha_ch1_o <= fifo_tbt_pha_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  tbt_pha_ch0_o <= fifo_tbt_pha_out(g_tbt_decim_width-1 downto 0);

  tbt_pha_valid_o <= fifo_tbt_pha_valid_out;

  -- TBT position data
  p_reg_cdc_fifo_tbt_pos_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if tbt_pos_ce = '1' then
        if test_data = '1' then
          fifo_tbt_pos_out <= f_dup_counter_array(cnt_array(c_counters_tbt_pos_idx)(c_cnt_width_array(c_counters_tbt_pos_idx)-1 downto 0),
                            4);
          fifo_tbt_pos_valid_out <= cnt_up_array(c_counters_tbt_pos_idx);
        else
          fifo_tbt_pos_out <=  tbt_pos_sum &
                              tbt_pos_q &
                              tbt_pos_y &
                              tbt_pos_x;
          fifo_tbt_pos_valid_out <= tbt_pos_valid;
        end if;

      else
        fifo_tbt_pos_valid_out <= '0';
      end if;
    end if;
  end process;

  tbt_pos_sum_o <= fifo_tbt_pos_out(4*g_tbt_decim_width-1 downto 3*g_tbt_decim_width);
  tbt_pos_q_o   <= fifo_tbt_pos_out(3*g_tbt_decim_width-1 downto 2*g_tbt_decim_width);
  tbt_pos_y_o   <= fifo_tbt_pos_out(2*g_tbt_decim_width-1 downto g_tbt_decim_width);
  tbt_pos_x_o   <= fifo_tbt_pos_out(g_tbt_decim_width-1 downto 0);

  tbt_pos_valid_o <= fifo_tbt_pos_valid_out;

  --------------------------------------------------------------------------
  --                            FOFB data                                 --
  --------------------------------------------------------------------------

  -- FOFB Decim data
  p_reg_cdc_fifo_fofb_decim_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if fofb_decim_ce = '1' then
        if test_data = '1' then
          fifo_fofb_decim_out <= f_dup_counter_array(cnt_array(c_counters_fofb_decim_idx)(c_cnt_width_array(c_counters_fofb_decim_idx)-1 downto 0),
                            8);
          fifo_fofb_decim_valid_out <= cnt_up_array(c_counters_fofb_decim_idx);
        else
          fifo_fofb_decim_out <=  fofb_decim_ch3_q &
                          fofb_decim_ch3_i &
                          fofb_decim_ch2_q &
                          fofb_decim_ch2_i &
                          fofb_decim_ch1_q &
                          fofb_decim_ch1_i &
                          fofb_decim_ch0_q &
                          fofb_decim_ch0_i;
          fifo_fofb_decim_valid_out <= fofb_decim_valid;
        end if;

      else
        fifo_fofb_decim_valid_out <= '0';
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
  p_reg_cdc_fifo_fofb_amp_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if fofb_amp_ce = '1' then
        if test_data = '1' then
          fifo_fofb_amp_out <= f_dup_counter_array(cnt_array(c_counters_fofb_amp_idx)(c_cnt_width_array(c_counters_fofb_amp_idx)-1 downto 0),
                            4);
          fifo_fofb_amp_valid_out <= cnt_up_array(c_counters_fofb_amp_idx);
        else
          fifo_fofb_amp_out <=  fofb_amp_ch3 &
                              fofb_amp_ch2 &
                              fofb_amp_ch1 &
                              fofb_amp_ch0;
          fifo_fofb_amp_valid_out <= fofb_amp_valid;
        end if;

      else
        fifo_fofb_amp_valid_out <= '0';
      end if;
    end if;
  end process;

  fofb_amp_ch3_o <= fifo_fofb_amp_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  fofb_amp_ch2_o <= fifo_fofb_amp_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  fofb_amp_ch1_o <= fifo_fofb_amp_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  fofb_amp_ch0_o <= fifo_fofb_amp_out(g_fofb_decim_width-1 downto 0);

  fofb_amp_valid_o <= fifo_fofb_amp_valid_out;

  -- FOFB phase data
  p_reg_cdc_fifo_fofb_pha_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if fofb_pha_ce = '1' then
        if test_data = '1' then
          fifo_fofb_pha_out <= f_dup_counter_array(cnt_array(c_counters_fofb_pha_idx)(c_cnt_width_array(c_counters_fofb_pha_idx)-1 downto 0),
                            4);
          fifo_fofb_pha_valid_out <= cnt_up_array(c_counters_fofb_pha_idx);
        else
          fifo_fofb_pha_out <=  fofb_pha_ch3 &
                              fofb_pha_ch2 &
                              fofb_pha_ch1 &
                              fofb_pha_ch0;
          fifo_fofb_pha_valid_out <= fofb_pha_valid;
        end if;

      else
        fifo_fofb_pha_valid_out <= '0';
      end if;
    end if;
  end process;

  fofb_pha_ch3_o <= fifo_fofb_pha_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  fofb_pha_ch2_o <= fifo_fofb_pha_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  fofb_pha_ch1_o <= fifo_fofb_pha_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  fofb_pha_ch0_o <= fifo_fofb_pha_out(g_fofb_decim_width-1 downto 0);

  fofb_pha_valid_o <= fifo_fofb_pha_valid_out;

  -- FOFB position data
  p_reg_cdc_fifo_fofb_pos_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if fofb_pos_ce = '1' then
        if test_data = '1' then
          fifo_fofb_pos_out <= f_dup_counter_array(cnt_array(c_counters_fofb_pos_idx)(c_cnt_width_array(c_counters_fofb_pos_idx)-1 downto 0),
                            4);
          fifo_fofb_pos_valid_out <= cnt_up_array(c_counters_fofb_pos_idx);
        else
          fifo_fofb_pos_out <= fofb_pos_sum &
                              fofb_pos_q &
                              fofb_pos_y &
                              fofb_pos_x;
          fifo_fofb_pos_valid_out <= fofb_pos_valid;
        end if;

      else
        fifo_fofb_pos_valid_out <= '0';
      end if;
    end if;
  end process;

  fofb_pos_sum_o <= fifo_fofb_pos_out(4*g_fofb_decim_width-1 downto 3*g_fofb_decim_width);
  fofb_pos_q_o   <= fifo_fofb_pos_out(3*g_fofb_decim_width-1 downto 2*g_fofb_decim_width);
  fofb_pos_y_o   <= fifo_fofb_pos_out(2*g_fofb_decim_width-1 downto g_fofb_decim_width);
  fofb_pos_x_o   <= fifo_fofb_pos_out(g_fofb_decim_width-1 downto 0);

  fofb_pos_valid_o <= fifo_fofb_pos_valid_out;

  --------------------------------------------------------------------------
  --                         Monitoring 1 data                            --
  --------------------------------------------------------------------------

  -- Monitoring 1 amplitudes data
  cmp_position_calc_cdc_fifo_monit1_amp_wb : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_monit_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk_i,
    data_i                                    => fifo_monit1_amp_out,
    valid_i                                   => fifo_monit1_amp_valid_out,

    clk_rd_i                                  => clk_i,
    data_o                                    => fifo_monit1_amp_out_wb_sync,
    valid_o                                   => fifo_monit1_amp_valid_out_wb_sync
  );

  monit1_amp_ch3_out_wb_sync   <= fifo_monit1_amp_out_wb_sync(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit1_amp_ch2_out_wb_sync   <= fifo_monit1_amp_out_wb_sync(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit1_amp_ch1_out_wb_sync   <= fifo_monit1_amp_out_wb_sync(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit1_amp_ch0_out_wb_sync   <= fifo_monit1_amp_out_wb_sync(g_monit_decim_width-1 downto 0);
  monit1_amp_valid_out_wb_sync <= fifo_monit1_amp_valid_out_wb_sync;

  p_reg_cdc_fifo_monit1_amp_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if monit1_amp_ce = '1' then
        if test_data = '1' then
          fifo_monit1_amp_out <= f_dup_counter_array(cnt_array(c_counters_monit1_amp_idx)(c_cnt_width_array(c_counters_monit1_amp_idx)-1 downto 0),
                            4);
          fifo_monit1_amp_valid_out <= cnt_up_array(c_counters_monit1_amp_idx);
        else
          fifo_monit1_amp_out <=  monit1_amp_ch3 &
                              monit1_amp_ch2 &
                              monit1_amp_ch1 &
                              monit1_amp_ch0;
          fifo_monit1_amp_valid_out <= monit1_amp_valid;
        end if;

      else
        fifo_monit1_amp_valid_out <= '0';
      end if;
    end if;
  end process;

  monit1_amp_ch3_o <= fifo_monit1_amp_out(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit1_amp_ch2_o <= fifo_monit1_amp_out(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit1_amp_ch1_o <= fifo_monit1_amp_out(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit1_amp_ch0_o <= fifo_monit1_amp_out(g_monit_decim_width-1 downto 0);

  monit1_amp_valid_o <= fifo_monit1_amp_valid_out;

  p_reg_monit1_amp_sync_wb : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        monit1_amp_valid_wb_sync     <= '0';
        monit1_amp_ch3_wb_sync       <= (others => '0');
        monit1_amp_ch2_wb_sync       <= (others => '0');
        monit1_amp_ch1_wb_sync       <= (others => '0');
        monit1_amp_ch0_wb_sync       <= (others => '0');
      else
        monit1_amp_valid_wb_sync <= monit1_amp_valid_out_wb_sync;

        -- FIXME: We don't care to wait for the FIFO valid bit. The data remains
        -- after it. Also, the synchronism between "true" valid data and the DSP
        -- MONIT 1 registers (read from the WB bus) must be fixed in another
        -- way, anyway, rendering the capture of only the "true" valid data by
        -- another register wasteful.
        if dsp_monit1_updt = '1' then
          monit1_amp_ch3_wb_sync <= monit1_amp_ch3_out_wb_sync;
          monit1_amp_ch2_wb_sync <= monit1_amp_ch2_out_wb_sync;
          monit1_amp_ch1_wb_sync <= monit1_amp_ch1_out_wb_sync;
          monit1_amp_ch0_wb_sync <= monit1_amp_ch0_out_wb_sync;
        end if;

      end if;
    end if;
  end process;

  -- Monitoring position data
  cmp_position_calc_cdc_fifo_monit1_pos_wb : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_monit_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk_i,
    data_i                                    => fifo_monit1_pos_out,
    valid_i                                   => fifo_monit1_pos_valid_out,

    clk_rd_i                                  => clk_i,
    data_o                                    => fifo_monit1_pos_out_wb_sync,
    valid_o                                   => fifo_monit1_pos_valid_out_wb_sync
  );

  monit1_pos_sum_out_wb_sync   <= fifo_monit1_pos_out_wb_sync(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit1_pos_q_out_wb_sync     <= fifo_monit1_pos_out_wb_sync(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit1_pos_y_out_wb_sync     <= fifo_monit1_pos_out_wb_sync(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit1_pos_x_out_wb_sync     <= fifo_monit1_pos_out_wb_sync(g_monit_decim_width-1 downto 0);
  monit1_pos_valid_out_wb_sync <= fifo_monit1_pos_valid_out_wb_sync;

  p_reg_cdc_fifo_monit1_pos_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if monit1_pos_ce = '1' then
        if test_data = '1' then
          fifo_monit1_pos_out <= f_dup_counter_array(cnt_array(c_counters_monit1_pos_idx)(c_cnt_width_array(c_counters_monit1_pos_idx)-1 downto 0),
                            4);
        else
          fifo_monit1_pos_out <= monit1_pos_sum &
                              monit1_pos_q &
                              monit1_pos_y &
                              monit1_pos_x;
        end if;

        fifo_monit1_pos_valid_out <= monit1_pos_valid;
      else
        fifo_monit1_pos_valid_out <= '0';
      end if;
    end if;
  end process;

  monit1_pos_sum_o  <= fifo_monit1_pos_out(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit1_pos_q_o    <= fifo_monit1_pos_out(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit1_pos_y_o    <= fifo_monit1_pos_out(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit1_pos_x_o    <= fifo_monit1_pos_out(g_monit_decim_width-1 downto 0);

  monit1_pos_valid_o <= fifo_monit_pos_valid_out;

  p_reg_monit1_pos_sync_wb : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        monit1_pos_valid_wb_sync <= '0';
        monit1_pos_sum_wb_sync       <= (others => '0');
        monit1_pos_q_wb_sync         <= (others => '0');
        monit1_pos_y_wb_sync         <= (others => '0');
        monit1_pos_x_wb_sync         <= (others => '0');
      else
        monit1_pos_valid_wb_sync <= monit1_pos_valid_out_wb_sync;

        -- FIXME: We don't care to wait for the FIFO valid bit. The data remains
        -- after it. Also, the synchronism between "true" valid data and the DSP
        -- MONIT registers (read from the WB bus) must be fixed in another
        -- way, anyway, rendering the capture of only the "true" valid data by
        -- another register wasteful.
        if dsp_monit1_updt = '1' then
          monit1_pos_sum_wb_sync <= monit1_pos_sum_out_wb_sync;
          monit1_pos_q_wb_sync   <= monit1_pos_q_out_wb_sync;
          monit1_pos_y_wb_sync   <= monit1_pos_y_out_wb_sync;
          monit1_pos_x_wb_sync   <= monit1_pos_x_out_wb_sync;
        end if;

      end if;
    end if;
  end process;

  --------------------------------------------------------------------------
  --                         Monitoring data                              --
  --------------------------------------------------------------------------

  -- Monitoring amplitudes data
  cmp_position_calc_cdc_fifo_monit_amp_wb : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_monit_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk_i,
    data_i                                    => fifo_monit_amp_out,
    valid_i                                   => fifo_monit_amp_valid_out,

    clk_rd_i                                  => clk_i,
    data_o                                    => fifo_monit_amp_out_wb_sync,
    valid_o                                   => fifo_monit_amp_valid_out_wb_sync
  );

  monit_amp_ch3_out_wb_sync   <= fifo_monit_amp_out_wb_sync(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit_amp_ch2_out_wb_sync   <= fifo_monit_amp_out_wb_sync(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit_amp_ch1_out_wb_sync   <= fifo_monit_amp_out_wb_sync(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit_amp_ch0_out_wb_sync   <= fifo_monit_amp_out_wb_sync(g_monit_decim_width-1 downto 0);
  monit_amp_valid_out_wb_sync <= fifo_monit_amp_valid_out_wb_sync;

  p_reg_cdc_fifo_monit_amp_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if monit_amp_ce = '1' then
        if test_data = '1' then
          fifo_monit_amp_out <= f_dup_counter_array(cnt_array(c_counters_monit_amp_idx)(c_cnt_width_array(c_counters_monit_amp_idx)-1 downto 0),
                            4);
          fifo_monit_amp_valid_out <= cnt_up_array(c_counters_monit_amp_idx);
        else
          fifo_monit_amp_out <=  monit_amp_ch3 &
                              monit_amp_ch2 &
                              monit_amp_ch1 &
                              monit_amp_ch0;
          fifo_monit_amp_valid_out <= monit_amp_valid;
        end if;

      else
        fifo_monit_amp_valid_out <= '0';
      end if;
    end if;
  end process;

  monit_amp_ch3_o <= fifo_monit_amp_out(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit_amp_ch2_o <= fifo_monit_amp_out(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit_amp_ch1_o <= fifo_monit_amp_out(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit_amp_ch0_o <= fifo_monit_amp_out(g_monit_decim_width-1 downto 0);

  monit_amp_valid_o <= fifo_monit_amp_valid_out;

  p_reg_monit_amp_sync_wb : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        monit_amp_valid_wb_sync     <= '0';
        monit_amp_ch3_wb_sync       <= (others => '0');
        monit_amp_ch2_wb_sync       <= (others => '0');
        monit_amp_ch1_wb_sync       <= (others => '0');
        monit_amp_ch0_wb_sync       <= (others => '0');
      else
        monit_amp_valid_wb_sync <= monit_amp_valid_out_wb_sync;

        -- FIXME: We don't care to wait for the FIFO valid bit. The data remains
        -- after it. Also, the synchronism between "true" valid data and the DSP
        -- MONIT registers (read from the WB bus) must be fixed in another
        -- way, anyway, rendering the capture of only the "true" valid data by
        -- another register wasteful.
        if dsp_monit_updt = '1' then
          monit_amp_ch3_wb_sync <= monit_amp_ch3_out_wb_sync;
          monit_amp_ch2_wb_sync <= monit_amp_ch2_out_wb_sync;
          monit_amp_ch1_wb_sync <= monit_amp_ch1_out_wb_sync;
          monit_amp_ch0_wb_sync <= monit_amp_ch0_out_wb_sync;
        end if;

      end if;
    end if;
  end process;

  -- Monitoring position data
  cmp_position_calc_cdc_fifo_monit_pos_wb : position_calc_cdc_fifo
  generic map
  (
    g_data_width                              => c_cdc_monit_width,
    g_size                                    => c_cdc_ref_size
  )
  port map
  (
    clk_wr_i                                  => fs_clk_i,
    data_i                                    => fifo_monit_pos_out,
    valid_i                                   => fifo_monit_pos_valid_out,

    clk_rd_i                                  => clk_i,
    data_o                                    => fifo_monit_pos_out_wb_sync,
    valid_o                                   => fifo_monit_pos_valid_out_wb_sync
  );

  monit_pos_sum_out_wb_sync   <= fifo_monit_pos_out_wb_sync(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit_pos_q_out_wb_sync     <= fifo_monit_pos_out_wb_sync(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit_pos_y_out_wb_sync     <= fifo_monit_pos_out_wb_sync(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit_pos_x_out_wb_sync     <= fifo_monit_pos_out_wb_sync(g_monit_decim_width-1 downto 0);
  monit_pos_valid_out_wb_sync <= fifo_monit_pos_valid_out_wb_sync;

  p_reg_cdc_fifo_monit_pos_outputs : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if monit_pos_ce = '1' then
        if test_data = '1' then
          fifo_monit_pos_out <= f_dup_counter_array(cnt_array(c_counters_monit_pos_idx)(c_cnt_width_array(c_counters_monit_pos_idx)-1 downto 0),
                            4);
        else
          fifo_monit_pos_out <= monit_pos_sum &
                              monit_pos_q &
                              monit_pos_y &
                              monit_pos_x;
        end if;

        fifo_monit_pos_valid_out <= monit_pos_valid;
      else
        fifo_monit_pos_valid_out <= '0';
      end if;
    end if;
  end process;

  monit_pos_sum_o  <= fifo_monit_pos_out(4*g_monit_decim_width-1 downto 3*g_monit_decim_width);
  monit_pos_q_o    <= fifo_monit_pos_out(3*g_monit_decim_width-1 downto 2*g_monit_decim_width);
  monit_pos_y_o    <= fifo_monit_pos_out(2*g_monit_decim_width-1 downto g_monit_decim_width);
  monit_pos_x_o    <= fifo_monit_pos_out(g_monit_decim_width-1 downto 0);

  monit_pos_valid_o <= fifo_monit_pos_valid_out;

  p_reg_monit_pos_sync_wb : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        monit_pos_valid_wb_sync <= '0';
        monit_pos_sum_wb_sync       <= (others => '0');
        monit_pos_q_wb_sync         <= (others => '0');
        monit_pos_y_wb_sync         <= (others => '0');
        monit_pos_x_wb_sync         <= (others => '0');
      else
        monit_pos_valid_wb_sync <= monit_pos_valid_out_wb_sync;

        -- FIXME: We don't care to wait for the FIFO valid bit. The data remains
        -- after it. Also, the synchronism between "true" valid data and the DSP
        -- MONIT registers (read from the WB bus) must be fixed in another
        -- way, anyway, rendering the capture of only the "true" valid data by
        -- another register wasteful.
        if dsp_monit_updt = '1' then
          monit_pos_sum_wb_sync <= monit_pos_sum_out_wb_sync;
          monit_pos_q_wb_sync   <= monit_pos_q_out_wb_sync;
          monit_pos_y_wb_sync   <= monit_pos_y_out_wb_sync;
          monit_pos_x_wb_sync   <= monit_pos_x_out_wb_sync;
        end if;

      end if;
    end if;
  end process;

end rtl;
