library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- Counter Generator Definitions
use work.counters_gen_pkg.all;

package dsp_cores_pkg is

  --------------------------------------------------------------------
  -- Constants
  --------------------------------------------------------------------

  constant c_dsp_ref_num_bits    : natural := 24;
  constant c_dsp_pos_num_bits    : natural := 26;
  constant c_dsp_ref_num_bits_ns : natural := 32;
  constant c_dsp_pos_num_bits_ns : natural := 32;
  constant c_machine_name        : string  := "UVX";

  -------------------------------------------------------------------------------
  -- Types
  -------------------------------------------------------------------------------
  subtype t_string2 is string(2 downto 1);
  subtype t_string3 is string(3 downto 1);

  subtype t_swap_mode is std_logic_vector(1 downto 0);
  constant c_swmode_rffe_swap       : t_swap_mode := "00";
  constant c_swmode_static_direct   : t_swap_mode := "01";
  constant c_swmode_static_inverted : t_swap_mode := "10";
  constant c_swmode_swap_deswap     : t_swap_mode := "11";

  -------------------------------------------------------------------------------
  -- Functions
  -------------------------------------------------------------------------------
  --function f_window_file(g_rffe_version : t_string2) return string;
  --function f_dds_cos_file(g_machine_name : t_string3) return string;
  --function f_dds_sin_file(g_machine_name : t_string3)  return string;
  function f_dds_num_points(g_machine_name : t_string3) return natural;

  --------------------------------------------------------------------
  -- Components
  --------------------------------------------------------------------
  component position_calc_counters_single is
    generic (
      g_cntr_size : natural := 16);
    port (
      fs_clk2x_i   : in  std_logic;
      fs_rst2x_n_i : in  std_logic;
      ce_i         : in  std_logic;
      err1_i       : in  std_logic;
      cntr_clr_i   : in  std_logic;
      cntr_o       : out std_logic_vector(g_cntr_size-1 downto 0));
  end component position_calc_counters_single;

  component position_calc_counters is
    generic (
      g_cntr_size : natural := 16);
    port (
      fs_clk2x_i                   : in  std_logic;
      fs_rst2x_n_i                 : in  std_logic;
      tbt_ce_i                     : in  std_logic;
      fofb_ce_i                    : in  std_logic;
      monit_cic_ce_i               : in  std_logic;
      monit_cfir_ce_i              : in  std_logic;
      monit_pfir_ce_i              : in  std_logic;
      monit_01_ce_i                : in  std_logic;
      tbt_decim_q_ch01_incorrect_i : in  std_logic;
      tbt_decim_q_ch23_incorrect_i : in  std_logic;
      tbt_decim_err_clr_i          : in  std_logic;
      fofb_decim_q_ch01_missing_i  : in  std_logic;
      fofb_decim_q_ch23_missing_i  : in  std_logic;
      fofb_decim_err_clr_i         : in  std_logic;
      monit_cic_unexpected_i       : in  std_logic;
      monit_cfir_incorrect_i       : in  std_logic;
      monit_part1_err_clr_i        : in  std_logic;
      monit_pfir_incorrect_i       : in  std_logic;
      monit_pos_1_incorrect_i      : in  std_logic;
      monit_part2_err_clr_i        : in  std_logic;
      tbt_incorrect_ctnr_ch01_o    : out std_logic_vector(g_cntr_size-1 downto 0);
      tbt_incorrect_ctnr_ch23_o    : out std_logic_vector(g_cntr_size-1 downto 0);
      fofb_incorrect_ctnr_ch01_o   : out std_logic_vector(g_cntr_size-1 downto 0);
      fofb_incorrect_ctnr_ch23_o   : out std_logic_vector(g_cntr_size-1 downto 0);
      monit_cic_incorrect_ctnr_o   : out std_logic_vector(g_cntr_size-1 downto 0);
      monit_cfir_incorrect_ctnr_o  : out std_logic_vector(g_cntr_size-1 downto 0);
      monit_pfir_incorrect_ctnr_o  : out std_logic_vector(g_cntr_size-1 downto 0);
      monit_01_incorrect_ctnr_o    : out std_logic_vector(g_cntr_size-1 downto 0));
  end component position_calc_counters;

  component position_calc_cdc_fifo is
    generic (
      g_data_width : natural;
      g_size       : natural);
    port (
      clk_wr_i : in  std_logic;
      data_i   : in  std_logic_vector(g_data_width-1 downto 0);
      valid_i  : in  std_logic;
      clk_rd_i : in  std_logic;
      data_o   : out std_logic_vector(g_data_width-1 downto 0);
      valid_o  : out std_logic);
  end component position_calc_cdc_fifo;

  component input_conditioner is
    generic (
      g_sw_interval      : natural := 1000;
      g_input_width      : natural := 16;
      g_output_width     : natural := 24;
      g_window_width     : natural := 24;
      g_input_delay      : natural := 2;
      g_window_coef_file : string);
    port (
      reset_n_i         : in  std_logic;
      clk_i             : in  std_logic;
      adc_a_i           : in  std_logic_vector(g_input_width-1 downto 0);
      adc_b_i           : in  std_logic_vector(g_input_width-1 downto 0);
      adc_c_i           : in  std_logic_vector(g_input_width-1 downto 0);
      adc_d_i           : in  std_logic_vector(g_input_width-1 downto 0);
      switch_o          : out std_logic;
      switch_en_i       : in  std_logic;
      switch_delay_i    : in  std_logic_vector(15 downto 0);
      a_o               : out std_logic_vector(g_output_width-1 downto 0);
      b_o               : out std_logic_vector(g_output_width-1 downto 0);
      c_o               : out std_logic_vector(g_output_width-1 downto 0);
      d_o               : out std_logic_vector(g_output_width-1 downto 0);
      dbg_cur_address_o : out std_logic_vector(31 downto 0));
  end component input_conditioner;

  component counter is
    generic (
      g_mem_size : natural := 601;
      g_bus_size : natural := 15);
    port (
      clk_i          : in  std_logic;
      ce_i           : in  std_logic;
      reset_n_i      : in  std_logic;
      switch_delay_i : in  std_logic_vector(15 downto 0);
      switch_en_i    : in  std_logic;
      switch_o       : out std_logic;
      index_o        : out std_logic_vector(g_bus_size-1 downto 0));
  end component counter;

  component pipeline is
    generic (
      g_width : natural := 32;
      g_depth : natural := 2);
    port (
      data_i : in  std_logic_vector(g_width-1 downto 0);
      clk_i  : in  std_logic;
      ce_i   : in  std_logic;
      data_o : out std_logic_vector(g_width-1 downto 0));
  end component pipeline;

  component sw_windowing_n_251_tukey_0_2
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector(7 downto 0);
      douta : out std_logic_vector(23 downto 0)
      );
  end component sw_windowing_n_251_tukey_0_2;

  component pds_first_stage is
    generic (
      g_width : natural := 32);
    port (
      a_i       : in  std_logic_vector(g_width-1 downto 0);
      b_i       : in  std_logic_vector(g_width-1 downto 0);
      c_i       : in  std_logic_vector(g_width-1 downto 0);
      d_i       : in  std_logic_vector(g_width-1 downto 0);
      clk_i     : in  std_logic;
      valid_i   : in  std_logic;
      valid_o   : out std_logic;
      ce_i      : in  std_logic;
      diff_ac_o : out std_logic_vector(g_width-1 downto 0);
      diff_db_o : out std_logic_vector(g_width-1 downto 0);
      q_o       : out std_logic_vector(g_width-1 downto 0);
      sum_o     : out std_logic_vector(g_width-1 downto 0);
      sum_ac_o  : out std_logic_vector(g_width-1 downto 0);
      sum_db_o  : out std_logic_vector(g_width-1 downto 0));
  end component pds_first_stage;

  component pds_output_stage is
    generic (
      g_width   : natural := 32;
      g_k_width : natural := 32);
    port (
      diff_ac_i       : in  std_logic_vector(g_width-1 downto 0);
      kx_i            : in  std_logic_vector(g_k_width-1 downto 0);
      diff_ac_valid_i : in  std_logic;
      diff_db_i       : in  std_logic_vector(g_width-1 downto 0);
      ky_i            : in  std_logic_vector(g_k_width-1 downto 0);
      diff_db_valid_i : in  std_logic;
      q_i             : in  std_logic_vector(g_width-1 downto 0);
      q_valid_i       : in  std_logic;
      sum_i           : in  std_logic_vector(g_width-1 downto 0);
      ksum_i          : in  std_logic_vector(g_k_width-1 downto 0);
      sum_valid_i     : in  std_logic;
      clk_i           : in  std_logic;
      ce_i            : in  std_logic;
      x_o             : out std_logic_vector(g_width-1 downto 0);
      y_o             : out std_logic_vector(g_width-1 downto 0);
      q_o             : out std_logic_vector(g_width-1 downto 0);
      sum_o           : out std_logic_vector(g_width-1 downto 0);
      valid_o         : out std_logic);
  end component pds_output_stage;

  component part_delta_sigma is
    generic (
      g_width   : natural := 32;
      g_k_width : natural := 24);
    port (
      a_i     : in  std_logic_vector(g_width-1 downto 0);
      b_i     : in  std_logic_vector(g_width-1 downto 0);
      c_i     : in  std_logic_vector(g_width-1 downto 0);
      d_i     : in  std_logic_vector(g_width-1 downto 0);
      kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      valid_o : out std_logic;
      rst_i   : in  std_logic;
      x_o     : out std_logic_vector(g_width-1 downto 0);
      y_o     : out std_logic_vector(g_width-1 downto 0);
      q_o     : out std_logic_vector(g_width-1 downto 0);
      sum_o   : out std_logic_vector(g_width-1 downto 0));
  end component part_delta_sigma;

  component generic_multiplier is
    generic (
      g_a_width : natural := 16;
      g_b_width : natural := 16;
      g_signed  : boolean := true;
      g_p_width : natural := 16;
      g_levels  : natural := 7);
    port (
      a_i     : in  std_logic_vector(g_a_width-1 downto 0);
      b_i     : in  std_logic_vector(g_b_width-1 downto 0);
      valid_i : in  std_logic;
      p_o     : out std_logic_vector(g_p_width-1 downto 0);
      valid_o : out std_logic;
      ce_i    : in  std_logic;
      clk_i   : in  std_logic;
      reset_i : in  std_logic);
  end component generic_multiplier;

  component mixer is
    generic (
      g_sin_file         : string;
      g_cos_file         : string;
      g_number_of_points : natural := 6;
      g_input_width      : natural := 16;
      g_dds_width        : natural := 16;
      g_output_width     : natural := 32;
      g_mult_levels      : natural := 7);
    port (
      reset_i  : in  std_logic;
      clock_i  : in  std_logic;
      ce_i     : in  std_logic;
      signal_i : in  std_logic_vector(g_input_width-1 downto 0);
      valid_i  : in  std_logic;
      I_out    : out std_logic_vector(g_output_width-1 downto 0);
      Q_out    : out std_logic_vector(g_output_width-1 downto 0);
      valid_o  : out std_logic);
  end component mixer;

  component input_gen is
    generic (
      g_input_width  : natural := 16;
      g_output_width : natural := 16;
      g_ksum         : integer := 1);
    port (
      x_i   : in  std_logic_vector(g_input_width-1 downto 0);
      y_i   : in  std_logic_vector(g_input_width-1 downto 0);
      clk_i : in  std_logic;
      ce_i  : in  std_logic;
      a_o   : out std_logic_vector(g_output_width-1 downto 0);
      b_o   : out std_logic_vector(g_output_width-1 downto 0);
      c_o   : out std_logic_vector(g_output_width-1 downto 0);
      d_o   : out std_logic_vector(g_output_width-1 downto 0));
  end component input_gen;

  component lut_sweep is
    generic (
      g_number_of_points : natural := 203;
      g_bus_size         : natural := 16);
    port (
      reset_i   : in  std_logic;
      clock_i   : in  std_logic;
      ce_i      : in  std_logic;
      valid_i   : in  std_logic;
      address_o : out std_logic_vector(g_bus_size-1 downto 0);
      valid_o   : out std_logic);
  end component lut_sweep;

  component fixed_dds is
    generic (
      g_number_of_points : natural := 203;
      g_output_width     : natural := 16;
      g_sin_file         : string  := "./dds_sin.ram";
      g_cos_file         : string  := "./dds_cos.ram");
    port (
      clock_i : in  std_logic;
      ce_i    : in  std_logic;
      reset_i : in  std_logic;
      valid_i : in  std_logic;
      sin_o   : out std_logic_vector(g_output_width-1 downto 0);
      cos_o   : out std_logic_vector(g_output_width-1 downto 0);
      valid_o : out std_logic);
  end component fixed_dds;

  component downconv is
    generic (
      g_input_width      : natural := 16;
      g_mixed_width      : natural := 24;
      g_output_width     : natural := 32;
      g_phase_width      : natural := 8;
      g_sin_file         : string  := "./dds_sin.nif";
      g_cos_file         : string  := "./dds_cos.nif";
      g_number_of_points : natural := 6;
      g_diff_delay       : natural := 2;
      g_stages           : natural := 3;
      g_decimation_rate  : natural := 1000);
    port (
      signal_i : in  std_logic_vector(g_input_width-1 downto 0);
      clk_i    : in  std_logic;
      ce_i     : in  std_logic;
      reset_i  : in  std_logic;
      phase_i  : in  std_logic_vector(g_phase_width-1 downto 0);
      I_o      : out std_logic_vector(g_output_width-1 downto 0);
      Q_o      : out std_logic_vector(g_output_width-1 downto 0);
      valid_o  : out std_logic);
  end component downconv;

  component div_fixedpoint is
    generic (
      G_DATAIN_WIDTH : integer range 2 to 48;
      G_PRECISION    : integer range 1 to 47);
    port (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
      n_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      d_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      q_o   : out std_logic_vector(G_PRECISION downto 0);
      r_o   : out std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      trg_i : in  std_logic;
      rdy_o : out std_logic;
      err_o : out std_logic);
  end component div_fixedpoint;

  component delta_sigma is
    generic (
      g_width   : natural := 32;
      g_k_width : natural := 24);
    port (
      a_i     : in  std_logic_vector(g_width-1 downto 0);
      b_i     : in  std_logic_vector(g_width-1 downto 0);
      c_i     : in  std_logic_vector(g_width-1 downto 0);
      d_i     : in  std_logic_vector(g_width-1 downto 0);
      kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      valid_o : out std_logic;
      rst_i   : in  std_logic;
      x_o     : out std_logic_vector(g_width-1 downto 0);
      y_o     : out std_logic_vector(g_width-1 downto 0);
      q_o     : out std_logic_vector(g_width-1 downto 0);
      sum_o   : out std_logic_vector(g_width-1 downto 0));
  end component delta_sigma;

  component ds_first_stage is
    generic (
      g_width : natural := 32);
    port (
      a_i     : in  std_logic_vector(g_width-1 downto 0);
      b_i     : in  std_logic_vector(g_width-1 downto 0);
      c_i     : in  std_logic_vector(g_width-1 downto 0);
      d_i     : in  std_logic_vector(g_width-1 downto 0);
      clk_i   : in  std_logic;
      valid_i : in  std_logic;
      valid_o : out std_logic;
      ce_i    : in  std_logic;
      x_o     : out std_logic_vector(g_width-1 downto 0);
      y_o     : out std_logic_vector(g_width-1 downto 0);
      q_o     : out std_logic_vector(g_width-1 downto 0);
      sum_o   : out std_logic_vector(g_width-1 downto 0));
  end component ds_first_stage;

  component ds_output_stage is
    generic (
      g_width   : natural := 32;
      g_k_width : natural := 32);
    port (
      x_i         : in  std_logic_vector(g_width-1 downto 0);
      kx_i        : in  std_logic_vector(g_k_width-1 downto 0);
      x_valid_i   : in  std_logic;
      y_i         : in  std_logic_vector(g_width-1 downto 0);
      ky_i        : in  std_logic_vector(g_k_width-1 downto 0);
      y_valid_i   : in  std_logic;
      q_i         : in  std_logic_vector(g_width-1 downto 0);
      q_valid_i   : in  std_logic;
      sum_i       : in  std_logic_vector(g_width-1 downto 0);
      ksum_i      : in  std_logic_vector(g_k_width-1 downto 0);
      sum_valid_i : in  std_logic;
      clk_i       : in  std_logic;
      ce_i        : in  std_logic;
      x_o         : out std_logic_vector(g_width-1 downto 0);
      y_o         : out std_logic_vector(g_width-1 downto 0);
      q_o         : out std_logic_vector(g_width-1 downto 0);
      sum_o       : out std_logic_vector(g_width-1 downto 0);
      valid_o     : out std_logic);
  end component ds_output_stage;

  component cordic_iter_slv is
    generic (
      g_input_width        : positive := 16;
      g_xy_calc_width      : positive := 22;
      g_x_output_width     : positive := 16;
      g_phase_calc_width   : positive := 22;
      g_phase_output_width : positive := 16;
      g_stages             : positive := 16;
      g_iter_per_clk       : positive := 2;
      g_rounding           : boolean  := true);
    port (
      clk_i     : in  std_logic;
      ce_data_i : in  std_logic;
      valid_i   : in  std_logic;
      ce_i      : in  std_logic;
      x_i       : in  std_logic_vector(g_input_width-1 downto 0);
      y_i       : in  std_logic_vector(g_input_width-1 downto 0);
      mag_o     : out std_logic_vector(g_x_output_width-1 downto 0);
      phase_o   : out std_logic_vector(g_phase_output_width-1 downto 0);
      valid_o   : out std_logic);
  end component cordic_iter_slv;

  component cordic_iter is
    generic (
      XY_WID       : positive := 16;
      PH_WID       : positive := 18;
      NUM_LOOPS    : positive := 18;
      TAB_AD_WID   : positive := 5;
      ITER_PER_CLK : positive := 2;
      TAB_OFFS     : natural  := 0);
    port (
      s_x_in       : in  signed (XY_WID-1 downto 0);
      s_y_in       : in  signed (XY_WID-1 downto 0);
      u_loop_ix_in : in  unsigned (TAB_AD_WID-1 downto 0);
      s_ph_in      : in  signed (PH_WID-1 downto 0);
      s_x_o        : out signed (XY_WID-1 downto 0);
      s_y_o        : out signed (XY_WID-1 downto 0);
      s_ph_o       : out signed (PH_WID-1 downto 0));
  end component cordic_iter;

  component cordic is
    generic (
      XY_CALC_WID  : positive := 32;
      XY_IN_WID    : positive := 26;
      X_OUT_WID    : positive := 26;
      PH_CALC_WID  : positive := 30;
      PH_OUT_WID   : positive := 24;
      NUM_ITER     : positive := 24;
      ITER_PER_CLK : positive := 4;
      USE_INREG    : boolean  := true;
      USE_CE       : boolean  := true;
      ROUNDING     : boolean  := true);
    port (
      clk        : in  std_logic;
      ce         : in  std_logic;
      b_start_in : in  std_logic;
      s_x_in     : in  signed (XY_IN_WID-1 downto 0);
      s_y_in     : in  signed (XY_IN_WID-1 downto 0);
      s_x_o      : out signed (X_OUT_WID-1 downto 0);
      s_ph_o     : out signed (PH_OUT_WID-1 downto 0);
      b_rdy_o    : out std_logic;
      b_busy_o   : out std_logic := '0');
  end component cordic;

  component cordic_input is
    generic (
      g_input_width : positive := 16);
    port (
      clk_i          : in  std_logic;
      ce_data_i      : in  std_logic;
      valid_i        : in  std_logic;
      x_i            : in  std_logic_vector(g_input_width-1 downto 0);
      y_i            : in  std_logic_vector(g_input_width-1 downto 0);
      ce_cordic_i    : in  std_logic;
      stall_cordic_i : in  std_logic;
      valid_o        : out std_logic;
      x_o            : out std_logic_vector(g_input_width-1 downto 0);
      y_o            : out std_logic_vector(g_input_width-1 downto 0));
  end component cordic_input;

  component inversion_stage is
    generic (
      g_mode : string := "rect_to_polar");
    port (
      x_i     : in  signed;
      y_i     : in  signed;
      z_i     : in  signed;
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      rst_i   : in  std_logic;
      x_o     : out signed;
      y_o     : out signed;
      z_o     : out signed;
      valid_o : out std_logic := '0');
  end component inversion_stage;

  component cordic_vectoring_slv is
    generic (
      g_stages : natural := 20;
      g_width  : natural := 32);
    port (
      x_i     : in  std_logic_vector(g_width-1 downto 0) := (others => '0');
      y_i     : in  std_logic_vector(g_width-1 downto 0) := (others => '0');
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      rst_i   : in  std_logic;
      mag_o   : out std_logic_vector(g_width-1 downto 0) := (others => '0');
      phase_o : out std_logic_vector(g_width-1 downto 0) := (others => '0');
      valid_o : out std_logic);
  end component cordic_vectoring_slv;

  component cordic_core is
    generic (
      g_stages     : natural := 20;
      g_bit_growth : natural := 2;
      g_mode       : string  := "rect_to_polar");
    port (
      x_i     : in  signed;
      y_i     : in  signed;
      z_i     : in  signed;
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      rst_i   : in  std_logic;
      valid_i : in  std_logic;
      x_o     : out signed;
      y_o     : out signed;
      z_o     : out signed;
      valid_o : out std_logic);
  end component cordic_core;

  component addsub is
    port (
      a_i        : in  signed;
      b_i        : in  signed;
      sub_i      : in  boolean;
      clk_i      : in  std_logic;
      ce_i       : in  std_logic;
      rst_i      : in  std_logic;
      result_o   : out signed;
      positive_o : out boolean;
      negative_o : out boolean);
  end component addsub;

  component xlclockdriver is
    generic (
      period        : integer := 2;
      log_2_period  : integer := 0;
      pipeline_regs : integer := 5;
      use_bufg      : integer := 0
      );
    port (
      sysclk   : in  std_logic;
      sysclr   : in  std_logic;
      sysce    : in  std_logic;
      clk      : out std_logic;
      clr      : out std_logic;
      ce       : out std_logic;
      ce_logic : out std_logic);
  end component xlclockdriver;

  component ce_synch
    generic (
      g_data_width : natural := 16
    );
    port (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ce_in_i  : in  std_logic;
      valid_i  : in  std_logic;
      data_i   : in  std_logic_vector(g_data_width-1 downto 0);
      ce_out_i : in  std_logic;
      data_o   : out std_logic_vector(g_data_width-1 downto 0);
      valid_o  : out std_logic
    );
  end component;

  component strobe_gen is
    generic (
      g_maxrate   : natural := 2048;
      g_bus_width : natural := 11);
    port (
      clock_i  : in  std_logic;
      reset_i  : in  std_logic;
      ce_i     : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component strobe_gen;

  component cic_dyn is
    generic (
      g_input_width      : natural := 16;
      g_output_width     : natural := 16;
      g_stages           : natural := 1;
      g_delay            : natural := 1;
      g_max_rate         : natural := 2048;
      g_bus_width        : natural := 11;
      g_with_ce_synch    : boolean := false;
      g_round_convergent : natural := 0);
    port (
      clock_i  : in  std_logic;
      reset_i  : in  std_logic;
      ce_i     : in  std_logic;
      ce_out_i : in  std_logic := '0';
      valid_i  : in  std_logic;
      data_i   : in  std_logic_vector(g_input_width-1 downto 0);
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      data_o   : out std_logic_vector(g_output_width-1 downto 0);
      valid_o  : out std_logic);
  end component cic_dyn;

  component cic_dual is
    generic (
      g_input_width      : natural := 16;
      g_output_width     : natural := 16;
      g_stages           : natural := 1;
      g_delay            : natural := 1;
      g_max_rate         : natural := 2048;
      g_bus_width        : natural := 11;
      g_with_ce_synch    : boolean := false,
      g_round_convergent : natural := 0);
    port (
      clock_i  : in  std_logic;
      reset_i  : in  std_logic;
      ce_i     : in  std_logic;
      ce_out_i : in  std_logic := '0';
      valid_i  : in  std_logic;
      I_i      : in  std_logic_vector(g_input_width-1 downto 0);
      Q_i      : in  std_logic_vector(g_input_width-1 downto 0);
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      I_o      : out std_logic_vector(g_output_width-1 downto 0);
      Q_o      : out std_logic_vector(g_output_width-1 downto 0);
      valid_o  : out std_logic);
  end component cic_dual;

  component cic_decim is
    generic(
      DATAIN_WIDTH  : integer := 16;
      DATAOUT_WIDTH : integer := 16;
      M             : integer := 2;
      N             : integer := 5;
      MAXRATE       : integer := 64;
      bitgrowth     : integer := 35);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      en_i      : in  std_logic;
      data_i    : in  std_logic_vector(DATAIN_WIDTH-1 downto 0);
      data_o    : out std_logic_vector(DATAOUT_WIDTH-1 downto 0);
      act_i     : in  std_logic;
      act_out_i : in  std_logic;
      val_o     : out std_logic);
  end component;

  component position_calc is
    generic (
      g_with_downconv            : boolean  := true;
      g_input_width              : natural  := 16;
      g_mixed_width              : natural  := 16;
      g_adc_ratio                : natural  := 2;
      g_dds_width                : natural  := 16;
      g_dds_points               : natural  := 35;
      g_sin_file                 : string   := "../../../dsp-cores/hdl/modules/position_calc/dds_sin.nif";
      g_cos_file                 : string   := "../../../dsp-cores/hdl/modules/position_calc/dds_cos.nif";
      g_tbt_cic_delay            : natural  := 1;
      g_tbt_cic_stages           : natural  := 2;
      g_tbt_ratio                : natural  := 35;
      g_tbt_decim_width          : natural  := 32;
      g_fofb_cic_delay           : natural  := 1;
      g_fofb_cic_stages          : natural  := 2;
      g_fofb_ratio               : natural  := 980;
      g_fofb_decim_width         : natural  := 32;
      g_monit1_cic_delay         : natural  := 1;
      g_monit1_cic_stages        : natural  := 1;
      g_monit1_ratio             : natural  := 100;
      g_monit1_cic_ratio         : positive := 8;
      g_monit2_cic_delay         : natural  := 1;
      g_monit2_cic_stages        : natural  := 1;
      g_monit2_ratio             : natural  := 100;
      g_monit2_cic_ratio         : positive := 8;
      g_monit_decim_width        : natural  := 32;
      g_tbt_cordic_stages        : positive := 12;
      g_tbt_cordic_iter_per_clk  : positive := 3;
      g_tbt_cordic_ratio         : positive := 4;
      g_fofb_cordic_stages       : positive := 15;
      g_fofb_cordic_iter_per_clk : positive := 3;
      g_fofb_cordic_ratio        : positive := 4;
      g_k_width                  : natural  := 24;
      g_IQ_width                 : natural  := 32);
    port (
      adc_ch0_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch1_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch2_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch3_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_valid_i        : in  std_logic;
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
      mix_valid_o        : out std_logic;
      mix_ce_o           : out std_logic;
      tbt_decim_ch0_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch0_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch1_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch1_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch2_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch2_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch3_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch3_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_valid_o  : out std_logic;
      tbt_decim_ce_o     : out std_logic;
      tbt_amp_ch0_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch1_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch2_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch3_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_valid_o    : out std_logic;
      tbt_amp_ce_o       : out std_logic;
      tbt_pha_ch0_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch1_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch2_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch3_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_valid_o    : out std_logic;
      tbt_pha_ce_o       : out std_logic;
      fofb_decim_ch0_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch0_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch1_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch1_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch2_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch2_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch3_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch3_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_valid_o : out std_logic;
      fofb_decim_ce_o    : out std_logic;
      fofb_amp_ch0_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch1_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch2_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch3_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_valid_o   : out std_logic;
      fofb_amp_ce_o      : out std_logic;
      fofb_pha_ch0_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch1_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch2_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch3_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_valid_o   : out std_logic;
      fofb_pha_ce_o      : out std_logic;
      monit_amp_ch0_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_ch1_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_ch2_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_ch3_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_valid_o  : out std_logic;
      monit_amp_ce_o     : out std_logic;
      tbt_pos_x_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_y_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_q_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_sum_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_valid_o    : out std_logic;
      tbt_pos_ce_o       : out std_logic;
      fofb_pos_x_o       : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_y_o       : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_q_o       : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_sum_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_valid_o   : out std_logic;
      fofb_pos_ce_o      : out std_logic;
      monit_pos_x_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_y_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_q_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_sum_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_valid_o  : out std_logic;
      monit_pos_ce_o     : out std_logic);
  end component position_calc;

  component bpm_swap
    generic(
      g_delay_vec_width         : natural := 8;
      g_swap_div_freq_vec_width : natural := 16;
      g_ch_width                : natural := 16
    );
    port(
      clk_i             : in  std_logic;
      rst_n_i           : in  std_logic;

      -- Input data from ADCs
      cha_i             : in  std_logic_vector(g_ch_width-1 downto 0);
      chb_i             : in  std_logic_vector(g_ch_width-1 downto 0);
      chc_i             : in  std_logic_vector(g_ch_width-1 downto 0);
      chd_i             : in  std_logic_vector(g_ch_width-1 downto 0);
      ch_valid_i        : in  std_logic;

      -- Output data to BPM DSP chain
      cha_o             : out std_logic_vector(g_ch_width-1 downto 0);
      chb_o             : out std_logic_vector(g_ch_width-1 downto 0);
      chc_o             : out std_logic_vector(g_ch_width-1 downto 0);
      chd_o             : out std_logic_vector(g_ch_width-1 downto 0);
      ch_valid_o        : out std_logic;

      -- RFFE swap clock (or switchwing clock)
      rffe_swclk_o      : out std_logic;

      -- Swap mode setting
      swap_mode_i       : in  std_logic_vector(1 downto 0);

      -- Swap frequency settings
      swap_div_f_i      : in  std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);

      -- De-swap delay setting
      deswap_delay_i    : in  std_logic_vector(g_delay_vec_width-1 downto 0)
    );
  end component;

  component wb_bpm_swap is
    generic
    (
      g_interface_mode          : t_wishbone_interface_mode      := CLASSIC;
      g_address_granularity     : t_wishbone_address_granularity := WORD;
      g_delay_vec_width         : natural := 8;
      g_swap_div_freq_vec_width : natural := 16;
      g_ch_width                : natural := 16
    );
    port
    (
      rst_n_i         : in std_logic;
      clk_sys_i       : in std_logic;
      fs_rst_n_i      : in std_logic;
      fs_clk_i        : in std_logic;

      -----------------------------
      -- Wishbone signals
      -----------------------------
      wb_adr_i        : in  std_logic_vector(c_wishbone_address_width-1 downto 0) := (others => '0');
      wb_dat_i        : in  std_logic_vector(c_wishbone_data_width-1 downto 0) := (others => '0');
      wb_dat_o        : out std_logic_vector(c_wishbone_data_width-1 downto 0);
      wb_sel_i        : in  std_logic_vector(c_wishbone_data_width/8-1 downto 0) := (others => '0');
      wb_we_i         : in  std_logic := '0';
      wb_cyc_i        : in  std_logic := '0';
      wb_stb_i        : in  std_logic := '0';
      wb_ack_o        : out std_logic;
      wb_stall_o      : out std_logic;

      -----------------------------
      -- External ports
      -----------------------------
      -- Input data from ADCs
      cha_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      chb_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      chc_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      chd_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      ch_valid_i      : in  std_logic;

      -- Output data to BPM DSP chain
      cha_o           : out std_logic_vector(g_ch_width-1 downto 0);
      chb_o           : out std_logic_vector(g_ch_width-1 downto 0);
      chc_o           : out std_logic_vector(g_ch_width-1 downto 0);
      chd_o           : out std_logic_vector(g_ch_width-1 downto 0);
      ch_valid_o      : out std_logic;

      -- RFFE swap clock (or switchwing clock)
      rffe_swclk_o    : out std_logic
    );
  end component wb_bpm_swap;

  component xwb_bpm_swap
    generic
    (
      g_interface_mode      : t_wishbone_interface_mode      := CLASSIC;
      g_address_granularity : t_wishbone_address_granularity := WORD;
      g_ch_width            : natural := 16
    );
    port
    (
      rst_n_i         : in std_logic;
      clk_sys_i       : in std_logic;
      fs_rst_n_i      : in std_logic;
      fs_clk_i        : in std_logic;

      -----------------------------
      -- Wishbone signals
      -----------------------------
      wb_slv_i        : in t_wishbone_slave_in;
      wb_slv_o        : out t_wishbone_slave_out;

      -----------------------------
      -- External ports
      -----------------------------
      -- Input data from ADCs
      cha_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      chb_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      chc_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      chd_i           : in  std_logic_vector(g_ch_width-1 downto 0);
      ch_valid_i      : in  std_logic;

      -- Output data to BPM DSP chain
      cha_o           : out std_logic_vector(g_ch_width-1 downto 0);
      chb_o           : out std_logic_vector(g_ch_width-1 downto 0);
      chc_o           : out std_logic_vector(g_ch_width-1 downto 0);
      chd_o           : out std_logic_vector(g_ch_width-1 downto 0);
      ch_valid_o      : out std_logic;

      -- RFFE swap clock (or switchwing clock)
      rffe_swclk_o    : out std_logic
    );
  end component;

  component dds_sin_lut
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector;
      douta : out std_logic_vector);
  end component dds_sin_lut;

  component dds_cos_lut
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector;
      douta : out std_logic_vector);
  end component dds_cos_lut;

  component wb_position_calc_core
    generic
      (
        g_interface_mode      : t_wishbone_interface_mode      := CLASSIC;
        g_address_granularity : t_wishbone_address_granularity := WORD;
        g_with_extra_wb_reg   : boolean                        := false;
        g_rffe_version        : string                         := "V2";

        -- selection of position_calc stages
        g_with_downconv  : boolean  := true;

        -- input sizes
        g_input_width : natural := 16;
        g_mixed_width : natural := 16;
        g_adc_ratio   : natural := 2;

        -- mixer
        g_dds_width  : natural := 16;
        g_dds_points : natural := 35;
        g_sin_file   : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_sin.nif";
        g_cos_file   : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_cos.nif";

        -- CIC setup
        g_tbt_cic_delay   : natural := 1;
        g_tbt_cic_stages  : natural := 2;
        g_tbt_ratio       : natural := 35;  -- ratio between
        g_tbt_decim_width : natural := 32;

        g_fofb_cic_delay   : natural := 1;
        g_fofb_cic_stages  : natural := 2;
        g_fofb_ratio       : natural := 980;  -- ratio between adc and fofb rates
        g_fofb_decim_width : natural := 32;

        g_monit1_cic_delay  : natural := 1;
        g_monit1_cic_stages : natural := 1;
        g_monit1_ratio      : natural := 100;  --ratio between fofb and monit 1
        g_monit1_cic_ratio  : positive := 8;

        g_monit2_cic_delay  : natural := 1;
        g_monit2_cic_stages : natural := 1;
        g_monit2_ratio      : natural := 100;  -- ratio between monit 1 and 2
        g_monit2_cic_ratio  : positive := 8;

        g_monit_decim_width : natural := 32;

        -- Cordic setup
        g_tbt_cordic_stages       : positive := 12;
        g_tbt_cordic_iter_per_clk : positive := 3;
        g_tbt_cordic_ratio        : positive := 4;

        g_fofb_cordic_stages       : positive := 15;
        g_fofb_cordic_iter_per_clk : positive := 3;
        g_fofb_cordic_ratio        : positive := 4;

        -- width of K constants
        g_k_width : natural := 24;

        --width for IQ output
        g_IQ_width : natural := 32;

        -- Swap/de-swap setup
        g_delay_vec_width         : natural := 8;
        g_swap_div_freq_vec_width : natural := 16
        );
    port
      (
        rst_n_i      : in std_logic;
        clk_i        : in std_logic;    -- Wishbone clock
        fs_rst_n_i   : in std_logic;    -- FS reset
        fs_rst2x_n_i : in std_logic;    -- FS 2x reset
        fs_clk_i     : in std_logic;  -- clock period = 8.8823218389287 ns (112.583175675676 Mhz)
        fs_clk2x_i   : in std_logic;  -- clock period = 4.4411609194644 ns (225.166351351351 Mhz)

        -----------------------------
        -- Wishbone signals
        -----------------------------

        wb_adr_i   : in  std_logic_vector(c_wishbone_address_width-1 downto 0) := (others => '0');
        wb_dat_i   : in  std_logic_vector(c_wishbone_data_width-1 downto 0)    := (others => '0');
        wb_dat_o   : out std_logic_vector(c_wishbone_data_width-1 downto 0);
        wb_sel_i   : in  std_logic_vector(c_wishbone_data_width/8-1 downto 0)  := (others => '0');
        wb_we_i    : in  std_logic                                             := '0';
        wb_cyc_i   : in  std_logic                                             := '0';
        wb_stb_i   : in  std_logic                                             := '0';
        wb_ack_o   : out std_logic;
        wb_stall_o : out std_logic;

        -----------------------------
        -- Raw ADC signals
        -----------------------------

        adc_ch0_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_ch1_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_ch2_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_ch3_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_valid_i : in std_logic;

        -----------------------------
        -- Position calculation at various rates
        -----------------------------

        adc_ch0_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_ch1_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_ch2_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_ch3_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_swap_valid_o : out std_logic;

        -----------------------------
        -- MIX Data
        -----------------------------

        mix_ch0_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch0_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch1_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch1_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch2_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch2_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch3_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch3_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_valid_o : out std_logic;

        -----------------------------
        -- TBT Data
        -----------------------------

        tbt_decim_ch0_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch0_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch1_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch1_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch2_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch2_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch3_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch3_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_valid_o : out std_logic;

        tbt_amp_ch0_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_ch1_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_ch2_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_ch3_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_valid_o : out std_logic;

        tbt_pha_ch0_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_ch1_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_ch2_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_ch3_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_valid_o : out std_logic;

        -----------------------------
        -- FOFB Data
        -----------------------------

        fofb_decim_ch0_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch0_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch1_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch1_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch2_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch2_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch3_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch3_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_valid_o : out std_logic;

        fofb_amp_ch0_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_ch1_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_ch2_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_ch3_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_valid_o : out std_logic;

        fofb_pha_ch0_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_ch1_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_ch2_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_ch3_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_valid_o : out std_logic;

        -----------------------------
        -- Monit. Data
        -----------------------------

        monit_amp_ch0_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_ch1_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_ch2_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_ch3_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_valid_o : out std_logic;

        -----------------------------
        -- Position Data
        -----------------------------

        tbt_pos_x_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_y_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_q_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_sum_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_valid_o : out std_logic;

        fofb_pos_x_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_y_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_q_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_sum_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_valid_o : out std_logic;

        monit_pos_x_o     : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_y_o     : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_q_o     : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_sum_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_valid_o : out std_logic;

        -----------------------------
        -- Output to RFFE board
        -----------------------------

        rffe_swclk_o : out std_logic;

        -----------------------------
        -- Debug signals
        -----------------------------

        dbg_cur_address_o  : out std_logic_vector(31 downto 0);
        dbg_adc_ch0_cond_o : out std_logic_vector(g_input_width-1 downto 0);
        dbg_adc_ch1_cond_o : out std_logic_vector(g_input_width-1 downto 0);
        dbg_adc_ch2_cond_o : out std_logic_vector(g_input_width-1 downto 0);
        dbg_adc_ch3_cond_o : out std_logic_vector(g_input_width-1 downto 0)
        );
  end component;

  component xwb_position_calc_core
    generic
      (
        g_interface_mode      : t_wishbone_interface_mode      := CLASSIC;
        g_address_granularity : t_wishbone_address_granularity := WORD;
        g_with_extra_wb_reg   : boolean                        := false;
        g_rffe_version        : string                         := "V2";

        -- selection of position_calc stages
        g_with_downconv  : boolean  := true;

        -- input sizes
        g_input_width : natural := 16;
        g_mixed_width : natural := 16;
        g_adc_ratio   : natural := 2;

        -- mixer
        g_dds_width  : natural := 16;
        g_dds_points : natural := 35;
        g_sin_file   : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_sin.nif";
        g_cos_file   : string  := "../../../dsp-cores/hdl/modules/position_nosysgen/dds_cos.nif";

        -- CIC setup
        g_tbt_cic_delay   : natural := 1;
        g_tbt_cic_stages  : natural := 2;
        g_tbt_ratio       : natural := 35;  -- ratio between
        g_tbt_decim_width : natural := 32;

        g_fofb_cic_delay   : natural := 1;
        g_fofb_cic_stages  : natural := 2;
        g_fofb_ratio       : natural := 980;  -- ratio between adc and fofb rates
        g_fofb_decim_width : natural := 32;

        g_monit1_cic_delay  : natural := 1;
        g_monit1_cic_stages : natural := 1;
        g_monit1_ratio      : natural := 100;  --ratio between fofb and monit 1
        g_monit1_cic_ratio  : positive := 8;

        g_monit2_cic_delay  : natural := 1;
        g_monit2_cic_stages : natural := 1;
        g_monit2_ratio      : natural := 100;  -- ratio between monit 1 and 2
        g_monit2_cic_ratio  : positive := 8;

        -- Cordic setup
        g_tbt_cordic_stages       : positive := 12;
        g_tbt_cordic_iter_per_clk : positive := 3;
        g_tbt_cordic_ratio        : positive := 4;

        g_fofb_cordic_stages       : positive := 15;
        g_fofb_cordic_iter_per_clk : positive := 3;
        g_fofb_cordic_ratio        : positive := 4;

        g_monit_decim_width : natural := 32;

        -- width of K constants
        g_k_width : natural := 24;

        --width for IQ output
        g_IQ_width : natural := 32;

        -- Swap/de-swap setup
        g_delay_vec_width         : natural := 8;
        g_swap_div_freq_vec_width : natural := 16
        );
    port
      (
        rst_n_i      : in std_logic;
        clk_i        : in std_logic;    -- Wishbone clock
        fs_rst_n_i   : in std_logic;    -- FS reset
        fs_rst2x_n_i : in std_logic;    -- FS 2x reset
        fs_clk_i     : in std_logic;  -- clock period = 8.8823218389287 ns (112.583175675676 Mhz)
        fs_clk2x_i   : in std_logic;  -- clock period = 4.4411609194644 ns (225.166351351351 Mhz)

        -----------------------------
        -- Wishbone signals
        -----------------------------
        wb_slv_i : in  t_wishbone_slave_in;
        wb_slv_o : out t_wishbone_slave_out;

        -----------------------------
        -- Raw ADC signals
        -----------------------------

        adc_ch0_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_ch1_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_ch2_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_ch3_i : in std_logic_vector(g_input_width-1 downto 0);
        adc_valid_i : in std_logic;

        -----------------------------
        -- Position calculation at various rates
        -----------------------------

        adc_ch0_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_ch1_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_ch2_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_ch3_swap_o   : out std_logic_vector(g_input_width-1 downto 0);
        adc_swap_valid_o : out std_logic;

        -----------------------------
        -- MIX Data
        -----------------------------

        mix_ch0_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch0_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch1_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch1_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch2_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch2_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch3_i_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_ch3_q_o : out std_logic_vector(g_IQ_width-1 downto 0);
        mix_valid_o : out std_logic;

        -----------------------------
        -- TBT Data
        -----------------------------

        tbt_decim_ch0_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch0_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch1_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch1_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch2_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch2_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch3_i_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_ch3_q_o : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_decim_valid_o : out std_logic;

        tbt_amp_ch0_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_ch1_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_ch2_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_ch3_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_amp_valid_o : out std_logic;

        tbt_pha_ch0_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_ch1_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_ch2_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_ch3_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pha_valid_o : out std_logic;

        -----------------------------
        -- FOFB Data
        -----------------------------

        fofb_decim_ch0_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch0_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch1_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch1_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch2_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch2_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch3_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_ch3_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_decim_valid_o : out std_logic;

        fofb_amp_ch0_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_ch1_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_ch2_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_ch3_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_amp_valid_o : out std_logic;

        fofb_pha_ch0_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_ch1_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_ch2_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_ch3_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pha_valid_o : out std_logic;

        -----------------------------
        -- Monit. Data
        -----------------------------

        monit_amp_ch0_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_ch1_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_ch2_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_ch3_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_amp_valid_o : out std_logic;

        -----------------------------
        -- Position Data
        -----------------------------

        tbt_pos_x_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_y_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_q_o     : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_sum_o   : out std_logic_vector(g_tbt_decim_width-1 downto 0);
        tbt_pos_valid_o : out std_logic;

        fofb_pos_x_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_y_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_q_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_sum_o   : out std_logic_vector(g_fofb_decim_width-1 downto 0);
        fofb_pos_valid_o : out std_logic;

        monit_pos_x_o     : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_y_o     : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_q_o     : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_sum_o   : out std_logic_vector(g_monit_decim_width-1 downto 0);
        monit_pos_valid_o : out std_logic;

        -----------------------------
        -- Output to RFFE board
        -----------------------------

        rffe_swclk_o : out std_logic;

        -----------------------------
        -- Debug signals
        -----------------------------

        dbg_cur_address_o  : out std_logic_vector(31 downto 0);
        dbg_adc_ch0_cond_o : out std_logic_vector(g_input_width-1 downto 0);
        dbg_adc_ch1_cond_o : out std_logic_vector(g_input_width-1 downto 0);
        dbg_adc_ch2_cond_o : out std_logic_vector(g_input_width-1 downto 0);
        dbg_adc_ch3_cond_o : out std_logic_vector(g_input_width-1 downto 0)
        );
  end component;

  component counters_gen
  generic
  (
    g_cnt_width                               : t_cnt_width_array := c_default_cnt_width_array
  );
  port
  (
    rst_n_i                                   : in std_logic;
    clk_i                                     : in std_logic;

    ---------------------------------
    -- Counter generation interface
    ---------------------------------
    cnt_ce_array_i                            : in std_logic_vector(g_cnt_width'length-1 downto 0);
    cnt_up_array_i                            : in std_logic_vector(g_cnt_width'length-1 downto 0);
    cnt_array_o                               : out t_cnt_array (g_cnt_width'length-1 downto 0)
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
      when "SLC" =>                     -- SLAC
        num_points := 50;
      when "UVX" =>
        num_points := 35;
      when others =>
        num_points := 35;
    end case;

    return num_points;
  end f_dds_num_points;

end dsp_cores_pkg;
