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

  -------------------------------------------------------------------------------
  -- Types
  -------------------------------------------------------------------------------

  -------------------------------------------------------------------------------
  -- Functions
  -------------------------------------------------------------------------------

  --------------------------------------------------------------------
  -- Components
  --------------------------------------------------------------------

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
      g_tag_width : natural := 1;
      g_p_width : natural := 16;
      g_round_convergent : natural := 0;
      g_levels  : natural := 7);
    port (
      a_i     : in  std_logic_vector(g_a_width-1 downto 0);
      b_i     : in  std_logic_vector(g_b_width-1 downto 0);
      valid_i : in  std_logic;
      tag_i   : in  std_logic_vector(g_tag_width-1 downto 0) := (others => '0');
      p_o     : out std_logic_vector(g_p_width-1 downto 0);
      valid_o : out std_logic;
      tag_o   : out std_logic_vector(g_tag_width-1 downto 0);
      ce_i    : in  std_logic;
      clk_i   : in  std_logic;
      rst_i   : in  std_logic);
  end component generic_multiplier;

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
      g_k_width : natural := 24;
      g_offset_width : natural := 32);
    port (
      a_i     : in  std_logic_vector(g_width-1 downto 0);
      b_i     : in  std_logic_vector(g_width-1 downto 0);
      c_i     : in  std_logic_vector(g_width-1 downto 0);
      d_i     : in  std_logic_vector(g_width-1 downto 0);
      kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
      offset_x_i  : in std_logic_vector(g_offset_width-1 downto 0) := (others => '0');
      offset_y_i  : in std_logic_vector(g_offset_width-1 downto 0) := (others => '0');
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

  component ds_k_scaling is
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
  end component ds_k_scaling;

  component ds_offset_scaling
  generic (
    g_width            : natural := 32;
    g_precision        : natural := 8;
    g_offset_width     : natural := 32;
    g_offset_precision : natural := 0);
  port(
    clk_i      : in std_logic;
    ce_i       : in std_logic;
    x_i        : in std_logic_vector(g_width-1 downto 0);
    y_i        : in std_logic_vector(g_width-1 downto 0);
    q_i        : in std_logic_vector(g_width-1 downto 0);
    sum_i      : in std_logic_vector(g_width-1 downto 0);
    valid_i    : in std_logic;
    offset_x_i : in std_logic_vector(g_offset_width-1 downto 0);
    offset_y_i : in std_logic_vector(g_offset_width-1 downto 0);
    x_o        : out std_logic_vector(g_width-1 downto 0);
    y_o        : out std_logic_vector(g_width-1 downto 0);
    q_o        : out std_logic_vector(g_width-1 downto 0);
    sum_o      : out std_logic_vector(g_width-1 downto 0);
    valid_o    : out std_logic);
  end component ds_offset_scaling;

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
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ce_i     : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component strobe_gen;

  component cic_dyn is
    generic (
      g_input_width      : natural := 16;
      g_output_width     : natural := 16;
      g_stages           : natural := 1;      -- aka "N"
      g_delay            : natural := 1;      -- aka "M"
      g_max_rate         : natural := 2048;   -- Max decimation rate
      g_tag_desync_cnt_width : natural := 14;
      g_bus_width        : natural := 11;     -- Decimation ratio bus width.
      g_with_ce_synch    : boolean := false;
      g_tag_width        : natural := 1;      -- Input data tag width
      g_data_mask_width  : natural := 16;     -- Input data mask width
      g_round_convergent : natural := 0
      );
    port (
      clk_i            : in  std_logic                                      := '0';
      rst_i            : in  std_logic                                      := '0';
      ce_i             : in  std_logic                                      := '0';
      ce_out_i         : in  std_logic                                      := '0';
      valid_i          : in  std_logic                                      := '0';
      data_i           : in  std_logic_vector(g_input_width-1 downto 0)     := (others => '0');
      data_tag_i       : in  std_logic_vector(g_tag_width-1 downto 0)       := (others => '0');
      data_tag_en_i    : in  std_logic                                      := '0';
      data_tag_desync_cnt_rst_i : in std_logic                              := '0';
      data_tag_desync_cnt_o     : out std_logic_vector(g_tag_desync_cnt_width-1 downto 0);
      data_mask_num_samples_beg_i : in  unsigned(g_data_mask_width-1 downto 0)  := (others => '0');
      data_mask_num_samples_end_i : in  unsigned(g_data_mask_width-1 downto 0)  := (others => '0');
      data_mask_en_i   : in  std_logic                                      := '0';
      ratio_i          : in  std_logic_vector(g_bus_width-1 downto 0)       := (others => '0');
      data_o           : out std_logic_vector(g_output_width-1 downto 0)    := (others => '0');
      valid_o          : out std_logic                                      := '0'
      );
  end component cic_dyn;

  component cic_dual is
    generic (
      g_input_width              : natural := 16;
      g_output_width             : natural := 16;
      g_stages                   : natural := 1;      -- aka "N"
      g_delay                    : natural := 1;      -- aka "M"
      g_max_rate                 : natural := 2048;   -- Max decimation rate
      g_tag_desync_cnt_width     : natural := 14;
      g_bus_width                : natural := 11;     -- Decimation ratio bus width.
      g_with_ce_synch            : boolean := false;
      g_tag_width                : natural := 1;      -- Input data tag width
      g_data_mask_width          : natural := 16;     -- Input data mask width
      g_round_convergent         : natural := 0
    );
    port (
      clk_i                      : in std_logic;
      rst_i                      : in std_logic;
      ce_i                       : in std_logic;
      ce_out_i                   : in std_logic                                     := '0';
      valid_i                    : in std_logic;
      I_i                        : in std_logic_vector(g_input_width-1 downto 0);
      I_tag_i                    : in std_logic_vector(g_tag_width-1 downto 0)      := (others => '0');
      I_tag_en_i                 : in std_logic                                     := '0';
      I_tag_desync_cnt_rst_i     : in std_logic                                     := '0';
      I_tag_desync_cnt_o         : out std_logic_vector(g_tag_desync_cnt_width-1 downto 0);
      I_mask_num_samples_beg_i   : in unsigned(g_data_mask_width-1 downto 0)        := (others => '0');
      I_mask_num_samples_end_i   : in unsigned(g_data_mask_width-1 downto 0)        := (others => '0');
      I_mask_en_i                : in std_logic                                     := '0';
      Q_i                        : in std_logic_vector(g_input_width-1 downto 0);
      Q_tag_i                    : in std_logic_vector(g_tag_width-1 downto 0)      := (others => '0');
      Q_tag_en_i                 : in std_logic                                     := '0';
      Q_tag_desync_cnt_rst_i     : in std_logic                                     := '0';
      Q_tag_desync_cnt_o         : out std_logic_vector(g_tag_desync_cnt_width-1 downto 0);
      Q_mask_num_samples_beg_i   : in unsigned(g_data_mask_width-1 downto 0)        := (others => '0');
      Q_mask_num_samples_end_i   : in unsigned(g_data_mask_width-1 downto 0)        := (others => '0');
      Q_mask_en_i                : in std_logic                                     := '0';
      ratio_i                    : in std_logic_vector(g_bus_width-1 downto 0);
      I_o                        : out std_logic_vector(g_output_width-1 downto 0);
      Q_o                        : out std_logic_vector(g_output_width-1 downto 0);
      valid_o                    : out std_logic
      );
  end component cic_dual;

  component cic_decim is
    generic(
      DATAIN_WIDTH     : integer := 16;
      DATAOUT_WIDTH    : integer := 16;
      M                : integer := 2;
      N                : integer := 5;
      MAXRATE          : integer := 64;
      BITGROWTH        : integer := 35;
      ROUND_CONVERGENT : integer := 0
    );
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

end dsp_cores_pkg;
