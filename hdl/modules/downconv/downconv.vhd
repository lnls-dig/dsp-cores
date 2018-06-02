-------------------------------------------------------------------------------
-- Title      : Fofb Downconversion module
-- Project    :
-------------------------------------------------------------------------------
-- File       : fofb_downconv.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-06
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Downconverts a button signal to FOFB rate
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-06  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.dsp_cores_pkg.all;

entity downconv is

  generic (
    -- Widths for different busses
    g_input_width  : natural := 16;
    g_mixed_width  : natural := 24;
    g_output_width : natural := 32;
    g_phase_width  : natural := 8;

    -- Parameters for sin/cos dds
    g_sin_file         : string  := "./dds_sin.nif";
    g_cos_file         : string  := "./dds_cos.nif";
    g_number_of_points : natural := 6;

    -- CIC parameters
    g_diff_delay      : natural := 2;
    g_stages          : natural := 3;
    g_decimation_rate : natural := 1000

    );

  port (
    signal_i : in  std_logic_vector(g_input_width-1 downto 0);
    clk_i    : in  std_logic;
    ce_i     : in  std_logic;
    reset_i  : in  std_logic;
    phase_i  : in  std_logic_vector(g_phase_width-1 downto 0);
    I_o      : out std_logic_vector(g_output_width-1 downto 0);
    Q_o      : out std_logic_vector(g_output_width-1 downto 0);
    valid_o  : out std_logic
    );

end entity downconv;

-------------------------------------------------------------------------------

architecture str of downconv is

  -- Constant values
  constant c_cic_bus_width : natural := natural(ceil(log2(real(g_decimation_rate))));

  -- Internal signal declarations

  signal I_sig : std_logic_vector(g_mixed_width-1 downto 0);
  signal Q_sig : std_logic_vector(g_mixed_width-1 downto 0);


begin  -- architecture str

  cmp_mixer : mixer
    generic map (
      g_sin_file         => g_sin_file,
      g_cos_file         => g_cos_file,
      g_number_of_points => g_number_of_points,
      g_dds_width        => g_phase_width,    -- changed to update component
      g_input_width      => g_input_width,
      g_output_width     => g_mixed_width)
    port map (
      reset_i     => reset_i,
      clk_i       => clk_i,
      ce_i        => ce_i,
      signal_i    => signal_i,
      I_out       => I_sig,
      Q_out       => Q_sig);

  cmp_cic: cic_dual
    generic map (
      g_input_width  => g_mixed_width,
      g_output_width => g_output_width,
      g_stages       => g_stages,
      g_delay        => g_diff_delay,
      g_max_rate     => g_decimation_rate,
      g_bus_width    => c_cic_bus_width)
    port map (
      clk_i   => clk_i,
      reset_i => reset_i,
      ce_i    => ce_i,
      valid_i => '1', -- chosen as default value, since this port was not used
                      -- originally
      I_i     => I_sig,
      Q_i     => Q_sig,
      ratio_i => std_logic_vector(to_unsigned(g_decimation_rate, c_cic_bus_width)),
      I_o     => I_o,
      Q_o     => Q_o,
      valid_o => valid_o);

  --cmp_cic_I : cic_dyn
  --  generic map (
  --    g_input_width  => g_mixed_width,
  --    g_output_width => g_output_width,
  --    g_stages       => g_stages,
  --    g_delay        => g_diff_delay,
  --    g_max_rate     => g_decimation_rate,
  --    g_bus_width    => c_cic_bus_width)
  --  port map (
  --    clk_i   => clk_i,
  --    reset_i => reset_i,
  --    ce_i    => ce_i,
  --    data_i  => I_sig,
  --    ratio_i => std_logic_vector(to_unsigned(g_decimation_rate, c_cic_bus_width)),
  --    data_o  => I_o,
  --    valid_o => valid_o);

  --cmp_cic_Q : cic_dyn
  --  generic map (
  --    g_input_width  => g_mixed_width,
  --    g_output_width => g_output_width,
  --    g_stages       => g_stages,
  --    g_delay        => g_diff_delay,
  --    g_max_rate     => g_decimation_rate,
  --    g_bus_width    => c_cic_bus_width)
  --  port map (
  --    clk_i   => clk_i,
  --    reset_i => reset_i,
  --    ce_i    => ce_i,
  --    data_i  => Q_sig,
  --    ratio_i => std_logic_vector(to_unsigned(g_decimation_rate, c_cic_bus_width)),
  --    data_o  => Q_o,
  --    valid_o => valid_o);


end architecture str;

-------------------------------------------------------------------------------
