-------------------------------------------------------------------------------
-- Title      : TOP DSP design for Sirius BPM
-- Project    : 
-------------------------------------------------------------------------------
-- File       : bpm_dsp_example.vhd
-- Author     : Lucas Maziero Russo and Gustavo BM Bruno
-- Company    : 
-- Created    : 2013-12-13
-- Last update: 2014-01-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Top design for testing DSP cores for Sirius BPM
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2013-12-13  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.wishbone_pkg.all;
use work.gencores_pkg.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity bpm_dsp_example is
  port(
    -----------------------------------------
    -- Clocking pins
    -----------------------------------------
    sys_clk_p_i : in std_logic;
    sys_clk_n_i : in std_logic;

    -----------------------------------------
    -- Reset Button
    -----------------------------------------
    sys_rst_button_i : in std_logic;

    -----------------------------------------
    -- General board status
    -----------------------------------------
    fmc_mmcm_lock_led_o : out std_logic
    );
end bpm_dsp_example;

architecture rtl of bpm_dsp_example is

  constant c_button_rst_width : natural := 255;
  constant c_num_adc_bits     : natural := 16;
  constant c_num_clocks       : natural := 2;

  signal debug        : std_logic_vector(31 downto 0);
  -- Clocks and resets signals
  signal clk_adc      : std_logic;
  signal clk_fast     : std_logic;
  signal locked       : std_logic;
  signal clk_adc_rstn : std_logic;
  signal clk_adc_rst  : std_logic;

  signal rst_button_sys_pp : std_logic;
  signal rst_button_sys    : std_logic;
  signal rst_button_sys_n  : std_logic;

  -- Only one clock domain
  signal reset_clks : std_logic_vector(c_num_clocks-1 downto 0);
  signal reset_rstn : std_logic_vector(c_num_clocks-1 downto 0);

  -- 200 Mhz clocck for iodelay_ctrl


  -- Global Clock Single ended
  signal sys_clk_gen : std_logic;

  -- DDS test
  signal beam_position : std_logic_vector(15 downto 0);

  signal dds_sine_gain_ch1 : std_logic_vector(9 downto 0);
  signal dds_sine_gain_ch2 : std_logic_vector(9 downto 0);
  signal dds_sine_gain_ch3 : std_logic_vector(9 downto 0);

  signal synth_adc0 : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal synth_adc1 : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal synth_adc2 : std_logic_vector(c_num_adc_bits-1 downto 0);
  signal synth_adc3 : std_logic_vector(c_num_adc_bits-1 downto 0);

  signal synth_adc0_full : std_logic_vector(25 downto 0);
  signal synth_adc1_full : std_logic_vector(25 downto 0);
  signal synth_adc2_full : std_logic_vector(25 downto 0);
  signal synth_adc3_full : std_logic_vector(25 downto 0);

  -- Chipscope control signals
  signal CONTROL0 : std_logic_vector(35 downto 0);
  signal CONTROL1 : std_logic_vector(35 downto 0);

  -- Chipscope ILA 0 signals
  signal TRIG_ILA0_0 : std_logic_vector(31 downto 0);
  signal TRIG_ILA0_1 : std_logic_vector(31 downto 0);
  signal TRIG_ILA0_2 : std_logic_vector(31 downto 0);
  signal TRIG_ILA0_3 : std_logic_vector(31 downto 0);

  -- Chipscope VIO signals
  signal vio_out : std_logic_vector(255 downto 0);

  ---------------------------
  --      Components       --
  ---------------------------

  --ADC simulator
  component signal_gen is
    generic (
      g_adc_num_bits  : natural := 16;  -- Simulated ADC resolution
      g_carrier_freq  : natural := 20e6;  -- "Carrier" frequency
      g_modulation_db : real    := -40.0
      );
    port (
      rst           : in  std_logic;
      clk_adc       : in  std_logic;    -- ADC clock
      beam_position : in  std_logic_vector(15 downto 0);
      adc_data      : out std_logic_vector(15 downto 0);  -- simulated output data from ADC
      debug         : out std_logic_vector(31 downto 0)
      );
  end component;

  component beam_position_gen is
    generic(
      g_resolution : natural := 16;
      g_frequency  : natural := 2e3;
      g_clock      : natural := 130e6
      );
    port(
      rst           : in  std_logic;
      clk           : in  std_logic;    -- main clock
      beam_position : out std_logic_vector(15 downto 0)
      );
  end component;

  -- Clock generation
  component clk_gen is
    port(
      sys_clk_p_i : in  std_logic;
      sys_clk_n_i : in  std_logic;
      sys_clk_o   : out std_logic
      );
  end component;

  -- Xilinx PLL
  component sys_pll is
    generic(
      -- 200 MHz input clock
      g_divclk_divide  : integer := 4;
      g_clkin_period   : real    := 5.000;
      g_clkbout_mult_f : real    := 13.000;

      -- 100 MHz output clock             
      g_clk0_divide_f : real    := 2.0;
      -- 200 MHz output clock                 
      g_clk1_divide   : integer := 5
      );      
    port(
      rst_i    : in  std_logic := '0';
      clk_i    : in  std_logic := '0';
      clk0_o   : out std_logic;
      clk1_o   : out std_logic;
      locked_o : out std_logic
      );
  end component;

  -- Xilinx Chipscope Controller
  component chipscope_icon_2_port
    port (
      CONTROL0 : inout std_logic_vector(35 downto 0);
      CONTROL1 : inout std_logic_vector(35 downto 0)
      );
  end component;

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

  -- Xilinx Chipscope Logic Analyser
  component chipscope_ila_1024
    port (
      control : inout std_logic_vector(35 downto 0);
      clk     : in    std_logic;
      trig0   : in    std_logic_vector(7 downto 0);
      trig1   : in    std_logic_vector(31 downto 0);
      trig2   : in    std_logic_vector(31 downto 0);
      trig3   : in    std_logic_vector(31 downto 0);
      trig4   : in    std_logic_vector(31 downto 0));
  end component;

  component chipscope_ila_65536
    port (
      control : inout std_logic_vector(35 downto 0);
      clk     : in    std_logic;
      trig0   : in    std_logic_vector(7 downto 0);
      trig1   : in    std_logic_vector(31 downto 0);
      trig2   : in    std_logic_vector(31 downto 0);
      trig3   : in    std_logic_vector(31 downto 0);
      trig4   : in    std_logic_vector(31 downto 0));
  end component;

  component chipscope_ila_131072
    port (
      control : inout std_logic_vector(35 downto 0);
      clk     : in    std_logic;
      trig0   : in    std_logic_vector(7 downto 0);
      trig1   : in    std_logic_vector(15 downto 0);
      trig2   : in    std_logic_vector(15 downto 0);
      trig3   : in    std_logic_vector(15 downto 0);
      trig4   : in    std_logic_vector(15 downto 0));
  end component;

  component chipscope_vio_256 is
    port (
      control   : inout std_logic_vector(35 downto 0);
      async_out : out   std_logic_vector(255 downto 0)
      );
  end component;

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
      g_divclk_divide  => 4,
      g_clkbout_mult_f => 13.0,
      g_clk0_divide_f  => 2.0,
      g_clk1_divide    => 5
      )
    port map (
      rst_i    => '0',
      clk_i    => sys_clk_gen,
      clk0_o   => clk_fast,             -- 325Mhz
      clk1_o   => clk_adc,              -- 130MHz
      locked_o => locked                -- '1' when the PLL has locked
      );

  -- Reset synchronization. Hold reset line until few locked cycles have passed.
  cmp_reset : gc_reset
    generic map(
      g_clocks => c_num_clocks          -- CLK_ADC
      )
    port map(
      free_clk_i => sys_clk_gen,
      locked_i   => locked,
      clks_i     => reset_clks,
      rstn_o     => reset_rstn
      );

  reset_clks   <= clk_fast & clk_adc;
  clk_adc_rstn <= reset_rstn(0) and rst_button_sys_n;
  clk_adc_rst  <= not clk_adc_rstn;

  -- Generate button reset synchronous to each clock domain
  -- Detect button positive edge of clk_adc
  cmp_button_sys_ffs : gc_sync_ffs
    port map (
      clk_i    => clk_adc,
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
      clk_i      => clk_adc,
      rst_n_i    => '1',
      pulse_i    => rst_button_sys_pp,
      extended_o => rst_button_sys
      );

  rst_button_sys_n <= not rst_button_sys;

  ----------------------------------------------------------------------
  --                      DSP Chain Core                              --
  ----------------------------------------------------------------------

  cmp_signal_gen : signal_gen
    port map(
      rst           => '1',
      clk_adc       => clk_adc,
      adc_data      => synth_adc0,
      beam_position => beam_position,
      debug         => debug
      );

  cmp_beam_position : beam_position_gen
    port map(
      rst           => '1',
      clk           => clk_adc,
      beam_position => beam_position
      );

  -- Chipscope Analysis
  cmp_chipscope_icon_2 : chipscope_icon_2_port
    port map (
      CONTROL0 => CONTROL0,
      CONTROL1 => CONTROL1
      );

  cmp_chipscope_ila_0_adc : chipscope_ila
    port map (
      CONTROL => CONTROL0,
      CLK     => clk_adc,
      TRIG0   => TRIG_ILA0_0,
      TRIG1   => TRIG_ILA0_1,
      TRIG2   => TRIG_ILA0_2,
      TRIG3   => TRIG_ILA0_3
      );


  synth_adc1 <= beam_position;
  synth_adc2 <= std_logic_vector(to_unsigned(0, synth_adc2'length));
  synth_adc3 <= std_logic_vector(to_unsigned(0, synth_adc3'length));

  -- ADC Data
  TRIG_ILA0_0 <= synth_adc1 & synth_adc0;
  TRIG_ILA0_1 <= debug;

  TRIG_ILA0_2 <= (others => '0');
  TRIG_ILA0_3 <= (others => '0');

  -- Controllable gain for test data
  cmp_chipscope_vio_256 : chipscope_vio_256
    port map (
      CONTROL   => CONTROL1,
      ASYNC_OUT => vio_out
      );                 

  --dds_sine_gain_ch0 <= vio_out(10-1 downto 0);
  --dds_sine_gain_ch1 <= vio_out(20-1 downto 10);
  --dds_sine_gain_ch2 <= vio_out(30-1 downto 20);
  --dds_sine_gain_ch3 <= vio_out(40-1 downto 30);

end rtl;
