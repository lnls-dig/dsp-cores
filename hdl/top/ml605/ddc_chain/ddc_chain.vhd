-------------------------------------------------------------------------------
-- Title      : DSP-core DDC chain
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ddc_chain.vhd
-- Author     : Gustavo BM Bruno
-- Company    : 
-- Created    : 2014-01-30
-- Last update: 2014-06-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: DDC chain down to the FOFB rate, with DSC
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-30  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.gencores_pkg.all;


library UNISIM;
use UNISIM.vcomponents.all;

entity ddc_chain is
  port(
    sys_clk_p_i : in std_logic;
    sys_clk_n_i : in std_logic;

    sys_rst_button_i : in std_logic;

    fmc_mmcm_lock_led_o : out std_logic
    );

end entity ddc_chain;

architecture structural of ddc_chain is


  -- Signal constants
  constant c_number_of_points : natural := 6;

  constant c_button_rst_width : natural := 255;
  constant c_num_adc_bits     : natural := 16;
  constant c_mixed_width      : natural := 24;
  constant c_output_width     : natural := 32;
  constant c_num_clocks       : natural := 1;

  constant c_ksum : std_logic_vector(c_mixed_width-1 downto 0) :=
    std_logic_vector(to_signed(1, c_mixed_width));
  constant c_kx : std_logic_vector(c_mixed_width-1 downto 0) :=
    std_logic_vector(to_signed(8500000, c_mixed_width));
  constant c_ky : std_logic_vector(c_mixed_width-1 downto 0) :=
    std_logic_vector(to_signed(8500000, c_mixed_width));

  --Signal's signals
  signal adc_input : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal debug     : std_logic_vector(31 downto 0);

  signal mixed_i, mixed_q : std_logic_vector(c_mixed_width-1 downto 0);

  signal fofb_ch0_i, fofb_ch0_q : std_logic_vector(c_output_width-1 downto 0);

  signal x_fofb_out, y_fofb_out, q_fofb_out, sum_fofb_out :
    std_logic_vector(c_output_width-1 downto 0);

  signal x_tbt_out, y_tbt_out, q_tbt_out, sum_tbt_out :
    std_logic_vector(c_output_width-1 downto 0);

  signal x_monit_out, y_monit_out, q_monit_out, sum_monit_out :
    std_logic_vector(c_output_width-1 downto 0);


  -- Only one clock domain
  signal reset_clks    : std_logic_vector(c_num_clocks-1 downto 0);
  signal reset_rstn    : std_logic_vector(c_num_clocks-1 downto 0);
  signal clk_fast_rstn : std_logic;
  signal clk_fast_rst  : std_logic;

  signal rst_button_sys    : std_logic;
  signal rst_button_sys_n  : std_logic;
  signal rst_button_sys_pp : std_logic;


  signal clk_adc  : std_logic;
  signal clk_fast : std_logic;
  signal locked   : std_logic;

  signal ce_adc   : std_logic;
  signal ce_fofb  : std_logic;
  signal ce_tbt   : std_logic;
  signal ce_monit : std_logic;

  -- Global Clock Single ended
  signal sys_clk_gen : std_logic;

  -- Chipscope control signals
  signal CONTROL0 : std_logic_vector(35 downto 0);
  signal CONTROL1 : std_logic_vector(35 downto 0);
  signal CONTROL2 : std_logic_vector(35 downto 0);
  signal CONTROL3 : std_logic_vector(35 downto 0);
  --signal CONTROL4 : std_logic_vector(35 downto 0);
  --signal CONTROL5 : std_logic_vector(35 downto 0);
  --signal CONTROL6 : std_logic_vector(35 downto 0);
  --signal CONTROL7 : std_logic_vector(35 downto 0);


-- chipscope ILA 4 signals
  signal TRIG_ILA4_0 : std_logic_vector(31 downto 0);
  signal TRIG_ILA4_1 : std_logic_vector(31 downto 0);
  signal TRIG_ILA4_2 : std_logic_vector(31 downto 0);
  signal TRIG_ILA4_3 : std_logic_vector(31 downto 0);



  -- Chipscope VIO signals
  signal vio_out : std_logic_vector(255 downto 0);


  -- Clock generation
  component clk_gen is
    port(
      sys_clk_p_i : in  std_logic;
      sys_clk_n_i : in  std_logic;
      sys_clk_o   : out std_logic
      );
  end component;


  component fixed_dds is
    generic (
      g_number_of_points : natural;
      g_output_width     : natural;
      g_phase_bus_size   : natural;
      g_sin_file         : string;
      g_cos_file         : string);
    port (
      clock_i     : in  std_logic;
      ce_i        : in  std_logic;
      reset_i     : in  std_logic;
      phase_sel_i : in  std_logic_vector(g_phase_bus_size-1 downto 0);
      sin_o       : out std_logic_vector(g_output_width-1 downto 0);
      cos_o       : out std_logic_vector(g_output_width-1 downto 0));
  end component fixed_dds;

  component position_nosysgen is
    port (
      adc_ch0_i          : in  std_logic_vector(15 downto 0);
      adc_ch1_i          : in  std_logic_vector(15 downto 0);
      adc_ch2_i          : in  std_logic_vector(15 downto 0);
      adc_ch3_i          : in  std_logic_vector(15 downto 0);
      clk                : in  std_logic;
      clr                : in  std_logic;
      ksum_i             : in  std_logic_vector(23 downto 0);
      kx_i               : in  std_logic_vector(23 downto 0);
      ky_i               : in  std_logic_vector(23 downto 0);
      mix_ch0_i_o        : out std_logic_vector(23 downto 0);
      mix_ch0_q_o        : out std_logic_vector(23 downto 0);
      mix_ch1_i_o        : out std_logic_vector(23 downto 0);
      mix_ch1_q_o        : out std_logic_vector(23 downto 0);
      mix_ch2_i_o        : out std_logic_vector(23 downto 0);
      mix_ch2_q_o        : out std_logic_vector(23 downto 0);
      mix_ch3_i_o        : out std_logic_vector(23 downto 0);
      mix_ch3_q_o        : out std_logic_vector(23 downto 0);
      tbt_decim_ch0_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch0_q_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch1_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch1_q_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch2_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch2_q_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch3_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch3_q_o  : out std_logic_vector(31 downto 0);
      tbt_amp_ch0_o      : out std_logic_vector(31 downto 0);
      tbt_amp_ch1_o      : out std_logic_vector(31 downto 0);
      tbt_amp_ch2_o      : out std_logic_vector(31 downto 0);
      tbt_amp_ch3_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch0_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch1_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch2_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch3_o      : out std_logic_vector(31 downto 0);
      fofb_decim_ch0_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch0_q_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch1_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch1_q_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch2_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch2_q_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch3_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch3_q_o : out std_logic_vector(31 downto 0);
      fofb_amp_ch0_o     : out std_logic_vector(31 downto 0);
      fofb_amp_ch1_o     : out std_logic_vector(31 downto 0);
      fofb_amp_ch2_o     : out std_logic_vector(31 downto 0);
      fofb_amp_ch3_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch0_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch1_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch2_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch3_o     : out std_logic_vector(31 downto 0);
      monit_amp_ch0_o    : out std_logic_vector(31 downto 0);
      monit_amp_ch1_o    : out std_logic_vector(31 downto 0);
      monit_amp_ch2_o    : out std_logic_vector(31 downto 0);
      monit_amp_ch3_o    : out std_logic_vector(31 downto 0);
      x_tbt_o            : out std_logic_vector(31 downto 0);
      x_tbt_valid_o      : out std_logic;
      y_tbt_o            : out std_logic_vector(31 downto 0);
      y_tbt_valid_o      : out std_logic;
      q_tbt_o            : out std_logic_vector(31 downto 0);
      q_tbt_valid_o      : out std_logic;
      sum_tbt_o          : out std_logic_vector(31 downto 0);
      sum_tbt_valid_o    : out std_logic;
      x_fofb_o           : out std_logic_vector(31 downto 0);
      x_fofb_valid_o     : out std_logic;
      y_fofb_o           : out std_logic_vector(31 downto 0);
      y_fofb_valid_o     : out std_logic;
      q_fofb_o           : out std_logic_vector(31 downto 0);
      q_fofb_valid_o     : out std_logic;
      sum_fofb_o         : out std_logic_vector(31 downto 0);
      sum_fofb_valid_o   : out std_logic;
      x_monit_o          : out std_logic_vector(31 downto 0);
      x_monit_valid_o    : out std_logic;
      y_monit_o          : out std_logic_vector(31 downto 0);
      y_monit_valid_o    : out std_logic;
      q_monit_o          : out std_logic_vector(31 downto 0);
      q_monit_valid_o    : out std_logic;
      sum_monit_o        : out std_logic_vector(31 downto 0);
      sum_monit_valid_o  : out std_logic;
      clk_ce_1_o         : out std_logic;
      clk_ce_2_o         : out std_logic;
      clk_ce_tbt_o       : out std_logic;
      clk_ce_monit_o     : out std_logic;
      clk_ce_fofb_o      : out std_logic);
  end component position_nosysgen;

  -- Xilinx PLL
  component sys_pll is
    generic(
      -- 200 MHz input clock
      g_divclk_divide  : integer;
      g_clkin_period   : real := 5.000;
      g_clkbout_mult_f : real;

      -- 100 MHz output clock             
      g_clk0_divide_f : real;
      -- 200 MHz output clock                 
      g_clk1_divide   : integer
      );      
    port(
      rst_i    : in  std_logic;
      clk_i    : in  std_logic;
      clk0_o   : out std_logic;
      clk1_o   : out std_logic;
      locked_o : out std_logic
      );
  end component;

  component chipscope_icon_4_port is
    port (
      CONTROL0 : inout std_logic_vector(35 downto 0);
      CONTROL1 : inout std_logic_vector(35 downto 0);
      CONTROL2 : inout std_logic_vector(35 downto 0);
      CONTROL3 : inout std_logic_vector(35 downto 0));
  end component chipscope_icon_4_port;

  component chipscope_ila
    port (
      control : inout std_logic_vector(35 downto 0);
      clk     : in    std_logic;
      trig0   : in    std_logic_vector(31 downto 0);
      trig1   : in    std_logic_vector(31 downto 0);
      trig2   : in    std_logic_vector(31 downto 0);
      trig3   : in    std_logic_vector(31 downto 0)
      );
  end component;

  component chipscope_ila_1t_128d is
    port (
      CONTROL : inout std_logic_vector(35 downto 0);
      CLK     : in    std_logic;
      DATA    : in    std_logic_vector(127 downto 0);
      TRIG0   : in    std_logic_vector(0 to 0));
  end component chipscope_ila_1t_128d;
  
begin

  -- Clock generation
  cmp_clk_gen : clk_gen
    port map (
      sys_clk_p_i => sys_clk_p_i,
      sys_clk_n_i => sys_clk_n_i,
      sys_clk_o   => sys_clk_gen
      );


  -- Obtain core locking and generate necessary clocks
  cmp_sys_pll_inst : sys_pll
    generic map(
      g_divclk_divide  => 5,
      g_clkbout_mult_f => 24.0,
      g_clk0_divide_f  => 4.0,
      g_clk1_divide    => 8
      )
    port map (
      rst_i    => '0',
      clk_i    => sys_clk_gen,
      clk0_o   => clk_fast,             -- 240Mhz
      clk1_o   => open,                 -- 120MHz
      locked_o => locked                -- '1' when the PLL has locked
      );


  reset_clks <= (c_num_clocks-1 downto 1 => '0') & clk_fast;

  -- Reset synchronization. Hold reset line until few locked cycles have passed.
  cmp_reset : gc_reset
    generic map(
      g_clocks => c_num_clocks          -- CLK_ADC
      )
    port map(
      free_clk_i => clk_fast,
      locked_i   => locked,
      clks_i     => reset_clks,
      rstn_o     => reset_rstn
      );

  clk_fast_rstn <= reset_rstn(0) and rst_button_sys_n;
  clk_fast_rst  <= not clk_fast_rstn;


  -- Generate button reset synchronous to each clock domain
  -- Detect button positive edge of clk_adc
  cmp_button_sys_ffs : gc_sync_ffs
    port map (
      clk_i    => clk_fast,
      rst_n_i  => '1',
      data_i   => sys_rst_button_i,
      ppulse_o => rst_button_sys_pp
      );

  -- Generate the reset signal based on positive edge
  -- of synched sys_rst_button_i
  cmp_button_sys_rst : gc_extend_pulse
    generic map (
      g_width => c_button_rst_width
      )
    port map(
      clk_i      => clk_fast,
      rst_n_i    => '1',
      pulse_i    => rst_button_sys_pp,
      extended_o => rst_button_sys
      );

  rst_button_sys_n <= not rst_button_sys;


  cmp_input_dds : fixed_dds
    generic map (
      g_number_of_points => c_number_of_points,
      g_output_width     => c_num_adc_bits,
      g_phase_bus_size   => 8,
      g_sin_file         => "./dds_sin.nif",
      g_cos_file         => "./dds_cos.nif")
    port map (
      clock_i     => clk_fast,
      ce_i        => ce_adc,
      reset_i     => '0',
      phase_sel_i => (7 downto 0 => '0'),
      sin_o       => adc_input,
      cos_o       => open);

  cmp_position : position_nosysgen
    port map (
      adc_ch0_i          => adc_input,
      adc_ch1_i          => adc_input,
      adc_ch2_i          => adc_input,
      adc_ch3_i          => adc_input,
      clk                => clk_fast,
      clr                => '0',
      ksum_i             => c_ksum,
      kx_i               => c_kx,
      ky_i               => c_ky,
      mix_ch0_i_o        => mixed_i,
      mix_ch0_q_o        => mixed_q,
      mix_ch1_i_o        => open,
      mix_ch1_q_o        => open,
      mix_ch2_i_o        => open,
      mix_ch2_q_o        => open,
      mix_ch3_i_o        => open,
      mix_ch3_q_o        => open,
      tbt_decim_ch0_i_o  => open,
      tbt_decim_ch0_q_o  => open,
      tbt_decim_ch1_i_o  => open,
      tbt_decim_ch1_q_o  => open,
      tbt_decim_ch2_i_o  => open,
      tbt_decim_ch2_q_o  => open,
      tbt_decim_ch3_i_o  => open,
      tbt_decim_ch3_q_o  => open,
      tbt_amp_ch0_o      => open,
      tbt_amp_ch1_o      => open,
      tbt_amp_ch2_o      => open,
      tbt_amp_ch3_o      => open,
      tbt_pha_ch0_o      => open,
      tbt_pha_ch1_o      => open,
      tbt_pha_ch2_o      => open,
      tbt_pha_ch3_o      => open,
      fofb_decim_ch0_i_o => open,
      fofb_decim_ch0_q_o => open,
      fofb_decim_ch1_i_o => open,
      fofb_decim_ch1_q_o => open,
      fofb_decim_ch2_i_o => open,
      fofb_decim_ch2_q_o => open,
      fofb_decim_ch3_i_o => open,
      fofb_decim_ch3_q_o => open,
      fofb_amp_ch0_o     => open,
      fofb_amp_ch1_o     => open,
      fofb_amp_ch2_o     => open,
      fofb_amp_ch3_o     => open,
      fofb_pha_ch0_o     => open,
      fofb_pha_ch1_o     => open,
      fofb_pha_ch2_o     => open,
      fofb_pha_ch3_o     => open,
      monit_amp_ch0_o    => open,
      monit_amp_ch1_o    => open,
      monit_amp_ch2_o    => open,
      monit_amp_ch3_o    => open,
      x_tbt_o            => x_tbt_out,
      x_tbt_valid_o      => open,
      y_tbt_o            => y_tbt_out,
      y_tbt_valid_o      => open,
      q_tbt_o            => q_tbt_out,
      q_tbt_valid_o      => open,
      sum_tbt_o          => sum_tbt_out,
      sum_tbt_valid_o    => open,
      x_fofb_o           => x_fofb_out,
      x_fofb_valid_o     => open,
      y_fofb_o           => y_fofb_out,
      y_fofb_valid_o     => open,
      q_fofb_o           => q_fofb_out,
      q_fofb_valid_o     => open,
      sum_fofb_o         => sum_fofb_out,
      sum_fofb_valid_o   => open,
      x_monit_o          => x_monit_out,
      x_monit_valid_o    => open,
      y_monit_o          => y_monit_out,
      y_monit_valid_o    => open,
      q_monit_o          => q_monit_out,
      q_monit_valid_o    => open,
      sum_monit_o        => sum_monit_out,
      sum_monit_valid_o  => open,
      clk_ce_1_o         => open,
      clk_ce_2_o         => ce_adc,
      clk_ce_tbt_o       => ce_tbt,
      clk_ce_monit_o     => ce_monit,
      clk_ce_fofb_o      => ce_fofb);


  cmp_chipscope_icon : chipscope_icon_4_port
    port map (
      CONTROL0 => CONTROL0,
      CONTROL1 => CONTROL1,
      CONTROL2 => CONTROL2,
      CONTROL3 => CONTROL3);

  cmp_ila0 : chipscope_ila_1t_128d
    port map (
      CONTROL             => CONTROL0,
      CLK                 => clk_fast,
      DATA(127 downto 96) => x_fofb_out,
      DATA(95 downto 64)  => y_fofb_out,
      DATA(63 downto 32)  => q_fofb_out,
      DATA(31 downto 0)   => sum_fofb_out,
      TRIG0(0)            => ce_fofb);

  cmp_ila_1 : chipscope_ila_1t_128d
    port map (
      CONTROL              => CONTROL1,
      CLK                  => clk_fast,
      DATA(127 downto 112) => adc_input,
      DATA(111 downto 88)  => mixed_i,
      DATA(87 downto 64)   => mixed_q,
      DATA(63 downto 0)    => x"DE_AD_BE_EF_13_37_B0_0B",
      TRIG0(0)             => ce_adc);

  cmp_ila2 : chipscope_ila_1t_128d
    port map (
      CONTROL             => CONTROL2,
      CLK                 => clk_fast,
      DATA(127 downto 96) => x_tbt_out,
      DATA(95 downto 64)  => y_tbt_out,
      DATA(63 downto 32)  => q_tbt_out,
      DATA(31 downto 0)   => sum_tbt_out,
      TRIG0(0)            => ce_tbt);

  cmp_ila3 : chipscope_ila_1t_128d
    port map (
      CONTROL             => CONTROL3,
      CLK                 => clk_fast,
      DATA(127 downto 96) => x_monit_out,
      DATA(95 downto 64)  => y_monit_out,
      DATA(63 downto 32)  => q_monit_out,
      DATA(31 downto 0)   => sum_monit_out,
      TRIG0(0)            => ce_monit);

end structural;
