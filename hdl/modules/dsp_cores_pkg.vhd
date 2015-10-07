library ieee;
use ieee.std_logic_1164.all;

library std;
use std.textio.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;

package dsp_cores_pkg is

  --------------------------------------------------------------------
  -- Constants
  --------------------------------------------------------------------

  constant c_dsp_ref_num_bits               : natural := 24;
  constant c_dsp_pos_num_bits               : natural := 26;
  constant c_dsp_ref_num_bits_ns            : natural := 32;
  constant c_dsp_pos_num_bits_ns            : natural := 32;
  constant c_machine_name                   : string  := "UVX";

  -------------------------------------------------------------------------------
  -- Functions Declaration
  -------------------------------------------------------------------------------
  subtype t_string2                         is string(2 downto 1);
  subtype t_string3                         is string(3 downto 1);

  --function f_window_file(g_rffe_version : t_string2) return string;
  --function f_dds_cos_file(g_machine_name : t_string3) return string;
  --function f_dds_sin_file(g_machine_name : t_string3)  return string;
  function f_dds_num_points(g_machine_name : t_string3) return natural;

  --------------------------------------------------------------------
  -- Components
  --------------------------------------------------------------------
  component position_calc is
    generic (
      g_input_width       : natural;
      g_mixed_width       : natural;
      g_adc_ratio         : natural;
      g_dds_width         : natural;
      g_dds_points        : natural;
      g_sin_file          : string;
      g_cos_file          : string;
      g_tbt_cic_delay     : natural;
      g_tbt_cic_stages    : natural;
      g_tbt_ratio         : natural;
      g_tbt_decim_width   : natural;
      g_fofb_cic_delay    : natural;
      g_fofb_cic_stages   : natural;
      g_fofb_ratio        : natural;
      g_fofb_decim_width  : natural;
      g_monit1_cic_delay  : natural;
      g_monit1_cic_stages : natural;
      g_monit1_ratio      : natural;
      g_monit2_cic_delay  : natural;
      g_monit2_cic_stages : natural;
      g_monit2_ratio      : natural;
      g_k_width           : natural;
      g_IQ_width          : natural);
    port (
      adc_ch0_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch1_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch2_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch3_i          : in  std_logic_vector(g_input_width-1 downto 0);
      clk_i              : in  std_logic;
      rst_i              : in  std_logic;
      ksum_i             : in  std_logic_vector(g_k_width-1 downto 0);
      kx_i               : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i               : in  std_logic_vector(g_k_width-1 downto 0);
      mix_ch0_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch0_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch1_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch1_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch2_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch2_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch3_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch3_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_valid_o : out std_logic;
      mix_ce_o : out std_logic;
      tbt_decim_ch0_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch0_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch1_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch1_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch2_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch2_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch3_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch3_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_valid_o : out std_logic;
      tbt_decim_ce_o : out std_logic;
      tbt_amp_ch0_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch1_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch2_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch3_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_valid_o : out std_logic;
      tbt_amp_ce_o : out std_logic;
      tbt_pha_ch0_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch1_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch2_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch3_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_valid_o : out std_logic;
      tbt_pha_ce_o : out std_logic;
      fofb_decim_ch0_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch0_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch1_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch1_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch2_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch2_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch3_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch3_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_valid_o : out std_logic;
      fofb_decim_ce_o : out std_logic;
      fofb_amp_ch0_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch1_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch2_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch3_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_valid_o : out std_logic;
      fofb_amp_ce_o : out std_logic;
      fofb_pha_ch0_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch1_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch2_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch3_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_valid_o : out std_logic;
      fofb_pha_ce_o : out std_logic;
      monit_amp_ch0_o    : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_amp_ch1_o    : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_amp_ch2_o    : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_amp_ch3_o    : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_amp_valid_o : out std_logic;
      monit_amp_ce_o : out std_logic;

      tbt_pos_x_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_y_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_q_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_sum_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_valid_o : out std_logic;
      tbt_pos_ce_o :out std_logic;

      fofb_pos_x_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_y_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_q_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_sum_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_valid_o : out std_logic;
      fofb_pos_ce_o :out std_logic;

      monit_pos_x_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_pos_y_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_pos_q_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_pos_sum_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      monit_pos_valid_o : out std_logic;
      monit_pos_ce_o :out std_logic);
  end component position_calc;

  component wb_bpm_swap
  generic
  (
    g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
    g_address_granularity                     : t_wishbone_address_granularity := WORD
  );
  port
  (
    rst_n_i                                   : in std_logic;
    clk_sys_i                                 : in std_logic;
    fs_rst_n_i                                : in std_logic;
    fs_clk_i                                  : in std_logic;

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
    -- External ports
    -----------------------------
    -- Input from ADC FMC board
    cha_i                                     : in  std_logic_vector(15 downto 0);
    chb_i                                     : in  std_logic_vector(15 downto 0);
    chc_i                                     : in  std_logic_vector(15 downto 0);
    chd_i                                     : in  std_logic_vector(15 downto 0);

    -- Output to data processing level
    cha_o                                     : out std_logic_vector(15 downto 0);
    chb_o                                     : out std_logic_vector(15 downto 0);
    chc_o                                     : out std_logic_vector(15 downto 0);
    chd_o                                     : out std_logic_vector(15 downto 0);

    mode1_o                                   : out std_logic_vector(1 downto 0);
    mode2_o                                   : out std_logic_vector(1 downto 0);

    wdw_rst_o                                 : out std_logic;     -- Reset Windowing module
    wdw_sw_clk_i                              : in std_logic;      -- Switching clock from Windowing module
    wdw_use_o                                 : out std_logic;     -- Use Windowing module
    wdw_dly_o                                 : out std_logic_vector(15 downto 0); -- Delay to apply the window

    -- Output to RFFE board
    clk_swap_o                                : out std_logic;
    clk_swap_en_o                             : out std_logic;
    flag1_o                                   : out std_logic;
    flag2_o                                   : out std_logic;
    ctrl1_o                                   : out std_logic_vector(7 downto 0);
    ctrl2_o                                   : out std_logic_vector(7 downto 0)
  );
  end component;

  component xwb_bpm_swap
  generic
  (
    g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
    g_address_granularity                     : t_wishbone_address_granularity := WORD
  );
  port
  (
    rst_n_i                                   : in std_logic;
    clk_sys_i                                 : in std_logic;
    fs_rst_n_i                                : in std_logic;
    fs_clk_i                                  : in std_logic;

    -----------------------------
    -- Wishbone signals
    -----------------------------

    wb_slv_i                                  : in t_wishbone_slave_in;
    wb_slv_o                                  : out t_wishbone_slave_out;

    -----------------------------
    -- External ports
    -----------------------------
    -- Input from ADC FMC board
    cha_i                                     : in  std_logic_vector(15 downto 0);
    chb_i                                     : in  std_logic_vector(15 downto 0);
    chc_i                                     : in  std_logic_vector(15 downto 0);
    chd_i                                     : in  std_logic_vector(15 downto 0);

    -- Output to data processing level
    cha_o                                     : out std_logic_vector(15 downto 0);
    chb_o                                     : out std_logic_vector(15 downto 0);
    chc_o                                     : out std_logic_vector(15 downto 0);
    chd_o                                     : out std_logic_vector(15 downto 0);

    mode1_o                                   : out std_logic_vector(1 downto 0);
    mode2_o                                   : out std_logic_vector(1 downto 0);

    wdw_rst_o                                 : out std_logic;     -- Reset Windowing module
    wdw_sw_clk_i                              : in std_logic;      -- Switching clock from Windowing module
    wdw_use_o                                 : out std_logic;     -- Use Windowing module
    wdw_dly_o                                 : out std_logic_vector(15 downto 0); -- Delay to apply the window

    -- Output to RFFE board
    clk_swap_o                                : out std_logic;
    clk_swap_en_o                             : out std_logic;
    flag1_o                                   : out std_logic;
    flag2_o                                   : out std_logic;
    ctrl1_o                                   : out std_logic_vector(7 downto 0);
    ctrl2_o                                   : out std_logic_vector(7 downto 0)
  );
  end component;

  component input_conditioner
  generic (
    --g_clk_freq     : real    := 120.0e6;  -- System clock frequency
    --g_sw_freq      : real    := 100.0e3;  -- Desired switching frequency
    g_sw_interval  : natural := 1000;
    g_input_width  : natural := 16;
    g_output_width : natural := 24;
    g_window_width : natural := 24;
    g_input_delay  : natural := 2;
    g_window_coef_file : string);
  port (
    reset_n_i : in std_logic;             -- Reset data
    clk_i     : in std_logic;             -- Main clock
    adc_a_i   : in std_logic_vector(g_input_width-1 downto 0);
    adc_b_i   : in std_logic_vector(g_input_width-1 downto 0);
    adc_c_i   : in std_logic_vector(g_input_width-1 downto 0);
    adc_d_i   : in std_logic_vector(g_input_width-1 downto 0);

    switch_o : out std_logic;           -- Switch position output
    switch_en_i : in std_logic;
    switch_delay_i : in std_logic_vector(15 downto 0);

    a_o      : out std_logic_vector(g_output_width-1 downto 0);
    b_o      : out std_logic_vector(g_output_width-1 downto 0);
    c_o      : out std_logic_vector(g_output_width-1 downto 0);
    d_o      : out std_logic_vector(g_output_width-1 downto 0);
    dbg_cur_address_o : out std_logic_vector(31 downto 0));

  end component;

  component wb_position_calc_core
  generic
  (
    g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
    g_address_granularity                     : t_wishbone_address_granularity := WORD;
    g_with_extra_wb_reg                       : boolean := false;
    g_rffe_version			                      : string  := "V2";

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
    g_k_width                                 : natural := 24;

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
  end component;

  component xwb_position_calc_core
  generic
  (
    g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
    g_address_granularity                     : t_wishbone_address_granularity := WORD;
    g_with_extra_wb_reg                       : boolean := false;
    g_rffe_version			                      : string  := "V2";

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
    g_k_width                                 : natural := 24;

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
    wb_slv_i                                  : in t_wishbone_slave_in;
    wb_slv_o                                  : out t_wishbone_slave_out;

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
  end component;

  component position_calc_cdc_fifo
  generic
  (
    g_data_width                              : natural;
    g_size                                    : natural
  );
  port
  (
    clk_wr_i                                  : in std_logic;
    data_i                                    : in std_logic_vector(g_data_width-1 downto 0);
    valid_i                                   : in std_logic;

    clk_rd_i                                  : in std_logic;
    data_o                                    : out std_logic_vector(g_data_width-1 downto 0);
    valid_o                                   : out std_logic
  );
  end component;

  component default_clock_driver
  generic (
    pipeline_regs                             : integer := 5
  );
  port (
    sysce                                     : in std_logic;
    sysce_clr                                 : in std_logic;
    sysclk                                    : in std_logic;
    ce_1                                      : out std_logic;
    ce_10000                                  : out std_logic;
    ce_1120                                   : out std_logic;
    ce_1400000                                : out std_logic;
    ce_2                                      : out std_logic;
    ce_2240                                   : out std_logic;
    ce_22400000                               : out std_logic;
    ce_224000000                              : out std_logic;
    ce_2500                                   : out std_logic;
    ce_2800000                                : out std_logic;
    ce_35                                     : out std_logic;
    ce_4480                                   : out std_logic;
    ce_44800000                               : out std_logic;
    ce_5000                                   : out std_logic;
    ce_560                                    : out std_logic;
    ce_5600000                                : out std_logic;
    ce_56000000                               : out std_logic;
    ce_70                                     : out std_logic;
    ce_logic_1                                : out std_logic;
    ce_logic_1400000                          : out std_logic;
    ce_logic_2240                             : out std_logic;
    ce_logic_22400000                         : out std_logic;
    ce_logic_2800000                          : out std_logic;
    ce_logic_560                              : out std_logic;
    ce_logic_5600000                          : out std_logic;
    ce_logic_70                               : out std_logic;
    clk_1                                     : out std_logic;
    clk_10000                                 : out std_logic;
    clk_1120                                  : out std_logic;
    clk_1400000                               : out std_logic;
    clk_2                                     : out std_logic;
    clk_2240                                  : out std_logic;
    clk_22400000                              : out std_logic;
    clk_224000000                             : out std_logic;
    clk_2500                                  : out std_logic;
    clk_2800000                               : out std_logic;
    clk_35                                    : out std_logic;
    clk_4480                                  : out std_logic;
    clk_44800000                              : out std_logic;
    clk_5000                                  : out std_logic;
    clk_560                                   : out std_logic;
    clk_5600000                               : out std_logic;
    clk_56000000                              : out std_logic;
    clk_70                                    : out std_logic
  );
  end component;

  component xlclockdriver
  generic (
    period                                    : integer := 2;
    log_2_period                              : integer := 0;
    pipeline_regs                             : integer := 5;
    use_bufg                                  : integer := 0
  );
  port (
    sysclk                                    : in std_logic;
    sysclr                                    : in std_logic;
    sysce                                     : in std_logic;
    clk                                       : out std_logic;
    clr                                       : out std_logic;
    ce                                        : out std_logic;
    ce_logic                                  : out std_logic
  );
  end component;

end dsp_cores_pkg;

package body dsp_cores_pkg is

  -- Unsupported in Vivado 2014.4
  --function f_window_file(g_rffe_version : t_string2)
  --  return string
  --is
  --  variable filepath : line;
  --begin
  --  case g_rffe_version is
  --    when "V1" =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/sw_windowing/window_n_500.ram"));
  --    when "V2" =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/sw_windowing/window_n_500_tukey_0_2.ram"));
  --    when others =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/sw_windowing/window_n_500_tukey_0_2.ram"));
  --  end case;
  --
  -- return filepath.all;
  --end f_window_file;

  --function f_dds_cos_file(g_machine_name : t_string3)
  --  return string
  --is
  --  variable filepath : line;
  --begin
  --  case g_machine_name is
  --    when "SLC" => -- SLAC
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/position_calc/dds_lut/dds_cos_slac_50_372.ram"));
  --    when "UVX" =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/position_calc/dds_lut/dds_cos_uvx_35_148.ram"));
  --    when others =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/position_calc/dds_lut/dds_cos_uvx_35_148.ram"));
  --  end case;

  --  return filepath.all;
  --end f_dds_cos_file;

  --function f_dds_sin_file(g_machine_name : t_string3)
  --  return string
  --is
  --  variable filepath : line;
  --begin
  --  case g_machine_name is
  --    when "SLC" => -- SLAC
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/position_calc/dds_lut/dds_sin_slac_50_372.ram"));
  --    when "UVX" =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/position_calc/dds_lut/dds_sin_uvx_35_148.ram"));
  --    when others =>
  --      WRITE(filepath, string'("../../../ip_cores/dsp-cores/hdl/modules/position_calc/dds_lut/dds_sin_uvx_35_148.ram"));
  --  end case;

  --  return filepath.all;
  --end f_dds_sin_file;

  function f_dds_num_points(g_machine_name : t_string3)
    return natural
  is
    variable num_points : natural;
  begin
    case g_machine_name is
      when "SLC" => -- SLAC
        num_points := 50;
      when "UVX" =>
        num_points := 35;
      when others =>
        num_points := 35;
    end case;

    return num_points;
  end f_dds_num_points;

end dsp_cores_pkg;
