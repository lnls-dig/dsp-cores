-------------------------------------------------------------------------------
-- Title      : CIC with dynamically-adjustable decimator
-- Project    :
-------------------------------------------------------------------------------
-- File       : cic.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-03-11
-- Last update: 2016-05-02
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: CIC with dinamically adjustable decimation rate
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-11  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity cic_dyn is

  generic (
    g_input_width   : natural := 16;
    g_output_width  : natural := 16;
    g_stages        : natural := 1;      -- aka "N"
    g_delay         : natural := 1;      -- aka "M"
    g_max_rate      : natural := 2048;   -- Max decimation rate
    g_bus_width     : natural := 11;     -- Decimation ratio bus width.
    g_with_ce_synch : boolean := false
    );
  port (
    clock_i  : in  std_logic                                   := '0';
    reset_i  : in  std_logic                                   := '0';
    ce_i     : in  std_logic                                   := '0';
    ce_out_i : in  std_logic                                   := '0';
    valid_i  : in  std_logic                                   := '1';
    data_i   : in  std_logic_vector(g_input_width-1 downto 0)  := (others => '0');
    ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0)    := (others => '0');
    data_o   : out std_logic_vector(g_output_width-1 downto 0) := (others => '0');
    valid_o  : out std_logic                                   := '0'
    );

end entity cic_dyn;

-------------------------------------------------------------------------------

architecture str of cic_dyn is
  signal decimation_strobe : std_logic := '0';
  signal data_out          : std_logic_vector(g_output_width-1 downto 0) := (others => '0');
  signal valid_out         : std_logic                                   := '0';

  component decimation_strober
    generic (
      g_maxrate   : natural := 2048;
      g_bus_width : natural := 11);
    port (
      clock_i  : in  std_logic;
      reset_i  : in  std_logic;
      ce_i     : in  std_logic;
      valid_i  : in  std_logic;
      ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
      strobe_o : out std_logic);
  end component;

begin  -- architecture str

  cmp_decimation_strober : decimation_strober
    generic map (
      g_maxrate   => g_max_rate,
      g_bus_width => g_bus_width)
    port map (
      clock_i  => clock_i,
      reset_i  => reset_i,
      ce_i     => ce_i,
      valid_i  => valid_i,
      ratio_i  => ratio_i,
      strobe_o => decimation_strobe);

  cmp_cic_decim : cic_decim
    generic map (
      DATAIN_WIDTH  => g_input_width,
      DATAOUT_WIDTH => g_output_width,
      M             => g_delay,
      N             => g_stages,
      MAXRATE       => g_max_rate,
      BITGROWTH     => integer(ceil(real(g_stages)*log2(real(g_delay)*real(g_max_rate)))))
    port map (
      clk_i     => clock_i,
      rst_i     => reset_i,
      en_i      => ce_i,
      data_i    => data_i,
      data_o    => data_out,
      act_i     => valid_i,
      act_out_i => decimation_strobe,
      val_o     => valid_out);

  gen_with_ce_sync : if g_with_ce_synch generate
    cmp_ce_synch : ce_synch
      generic map (
        g_data_width => g_output_width)
      port map (
        clk_i      => clock_i,
        rst_i      => reset_i,

        ce_in_i    => ce_i,
        data_i     => data_out,
        valid_i    => valid_out,

        ce_out_i   => ce_out_i,
        data_o     => data_o,
        valid_o    => valid_o);
    end generate;

    gen_without_ce_sync : if not(g_with_ce_synch) generate
      data_o <= data_out;
      valid_o <=valid_out;
    end generate;

end architecture str;

-------------------------------------------------------------------------------
