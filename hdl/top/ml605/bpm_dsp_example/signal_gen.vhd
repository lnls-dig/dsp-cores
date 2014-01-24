-------------------------------------------------------------------------------
-- Title      : BPM simulated signal
-- Project    : Sirius BPM DSP core
-------------------------------------------------------------------------------
-- File       : signal_gen.vhd
-- Author     : Gustavo BM Bruno and Lucas Maziero Russo
-- Company    : LNLS
-- Created    : 2013-12-19
-- Last update: 2014-01-16
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simulated signal generator for DSP core testing
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2013-12-19  1.0      aylons	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


library UNISIM;
use UNISIM.vcomponents.all;

entity signal_gen is
  
  generic (
    g_adc_num_bits      : natural := 16;     -- Simulated ADC resolution
    g_carrier_freq      : natural  := 20e6;   -- "Carrier" frequency
    g_modulation_db : real    := -40.0   -- Envelope ratio in DB
    );
  port (
    rst : in std_logic;
    clk_adc  : in  std_logic;           -- ADC clock
    adc_data : out std_logic_vector(g_adc_num_bits-1 downto 0);  -- simulated output data from ADC
    beam_position: in std_logic_vector(15 downto 0);
    debug : out std_logic_vector(31 downto 0)
    );

end entity signal_gen;

architecture rtl of signal_gen is

  -- Signals
  signal carrier : std_logic_vector(g_adc_num_bits-1 downto 0);
  signal modulating_ac : std_logic_vector(31 downto 0);
  signal modulating : std_logic_vector(33 downto 0);
  signal output: std_logic_vector(31 downto 0);

  -- Calculated constants
  -- Phase increment calculated accordind to Xilinx DDS's datasheet
  constant c_THETA_CARRIER : integer := 161319;--integer((g_carrier_freq*(2**20))/130e6);
  constant c_THETA_VECTOR  : unsigned(19 downto 0) := to_unsigned(C_THETA_CARRIER,20);
  
  constant c_MODULATION_FACTOR: real := 10.0**(g_modulation_db/(20.0));

  constant c_MODULATION_VECTOR : unsigned(31 downto 0) :=
    to_unsigned(integer(c_MODULATION_FACTOR*(2.0**32.0)),32);
  
  constant c_ADDING_CONSTANT   : unsigned(31 downto 0) := X"feb851eb";
--    to_unsigned(integer((1.0-(c_MODULATION_FACTOR/2.0))*(2.0**32.0)),32);
  -- Components
  
  component multiplier_16x16_DSP
    port (
      clk : in  std_logic;
      a   : in  std_logic_vector(15 downto 0);
      b   : in  std_logic_vector(15 downto 0);
      p   : out std_logic_vector(15 downto 0)
      );
  end component;

  component multiplier_u32xs16_s32
    port (
      clk : in  std_logic;
      a   : in  std_logic_vector(31 downto 0);
      b   : in  std_logic_vector(15 downto 0);
      p   : out std_logic_vector(31 downto 0)
    );              
  end component;

  component adder_u32_s32_s34
    port(
      a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clk : IN STD_LOGIC;
      s : OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
    );
  end component;
  
  component dds_carrier
    port (
	clk: in std_logic;
	we: in std_logic;
	data: in std_logic_vector(19 downto 0);
	cosine: out std_logic_vector(15 downto 0)
    );
  end component;

begin
  ---------------------------------------
  -- Signal generation and modulation  --
  ---------------------------------------
  cmp_dds_carrier : dds_carrier
    port map (
      clk                => clk_adc,
      we                 => '1',
      data               => std_logic_vector(c_THETA_VECTOR),
      cosine             => carrier
      );

  cmp_beam_gain : multiplier_u32xs16_s32
    port map(
      clk => clk_adc,
      a => std_logic_vector(c_MODULATION_VECTOR),
      b => beam_position,
      p => modulating_ac
      );

  cpm_dc_adder : adder_u32_s32_s34
    port map(
      a => std_logic_vector(c_ADDING_CONSTANT),
      b => modulating_ac,
      clk => clk_adc,
      s => modulating
     );

  debug <= modulating(33 downto 2);
  
  cmp_mixer : multiplier_u32xs16_s32
    port map(
      clk => clk_adc,
      a => modulating(32 downto 1),
      b => carrier,
      p => output
      );

  adc_data <= output(31 downto 16);

end rtl;
