-------------------------------------------------------------------------------
-- Title      : Dual cic filters
-- Project    :
-------------------------------------------------------------------------------
-- File       : cic_dual.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-26
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Dual cic filters with a commom strobe for I/Q decimation.
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-26  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;



entity cic_dual is

  generic (
    g_input_width              : natural := 16;
    g_output_width             : natural := 16;
    g_stages                   : natural := 1;      -- aka "N"
    g_delay                    : natural := 1;      -- aka "M"
    g_max_rate                 : natural := 2048;   -- Max decimation rate
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
    I_mask_num_samples_i       : in unsigned(g_data_mask_width-1 downto 0)        := (others => '0');
    I_mask_en_i                : in std_logic                                     := '0';
    Q_i                        : in std_logic_vector(g_input_width-1 downto 0);
    Q_tag_i                    : in std_logic_vector(g_tag_width-1 downto 0)      := (others => '0');
    Q_tag_en_i                 : in std_logic                                     := '0';
    Q_mask_num_samples_i       : in unsigned(g_data_mask_width-1 downto 0)        := (others => '0');
    Q_mask_en_i                : in std_logic                                     := '0';
    ratio_i                    : in std_logic_vector(g_bus_width-1 downto 0);
    I_o                        : out std_logic_vector(g_output_width-1 downto 0);
    Q_o                        : out std_logic_vector(g_output_width-1 downto 0);
    valid_o                    : out std_logic
    );

end entity cic_dual;



architecture str of cic_dual is
  signal decimation_strobe : std_logic;

begin  -- architecture str

  cmp_cic_decim_I : cic_dyn
    generic map (
      g_input_width      => g_input_width,
      g_output_width     => g_output_width,
      g_stages           => g_stages,
      g_delay            => g_delay,
      g_max_rate         => g_max_rate,
      g_bus_width        => g_bus_width,
      g_with_ce_synch    => g_with_ce_synch,
      g_tag_width        => g_tag_width,
      g_data_mask_width  => g_data_mask_width,
      g_round_convergent => g_round_convergent)
    port map (
      clk_i              => clk_i,
      rst_i              => rst_i  ,
      ce_i               => ce_i,
      ce_out_i           => ce_out_i,
      data_i             => I_i,
      data_tag_i         => I_tag_i,
      data_tag_en_i      => I_tag_en_i,
      data_mask_num_samples_i => I_mask_num_samples_i,
      data_mask_en_i     => I_mask_en_i,
      data_o             => I_o,
      valid_i            => valid_i,
      ratio_i            => ratio_i,
      valid_o            => valid_o);

  cmp_cic_decim_Q : cic_dyn
    generic map (
      g_input_width      => g_input_width,
      g_output_width     => g_output_width,
      g_stages           => g_stages,
      g_delay            => g_delay,
      g_max_rate         => g_max_rate,
      g_bus_width        => g_bus_width,
      g_with_ce_synch    => g_with_ce_synch,
      g_tag_width        => g_tag_width,
      g_data_mask_width  => g_data_mask_width,
      g_round_convergent => g_round_convergent)
    port map (
      clk_i              => clk_i,
      rst_i              => rst_i  ,
      ce_i               => ce_i,
      ce_out_i           => ce_out_i,
      data_i             => Q_i,
      data_tag_i         => Q_tag_i,
      data_tag_en_i      => Q_tag_en_i,
      data_mask_num_samples_i => Q_mask_num_samples_i,
      data_mask_en_i     => Q_mask_en_i,
      data_o             => Q_o,
      valid_i            => valid_i,
      ratio_i            => ratio_i,
      valid_o            => open);

end architecture str;

-------------------------------------------------------------------------------
