------------------------------------------------------------------------------
-- Title      : Wishbone FMC516 ADC Interface
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2013-12-07
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: General definitions package for position calc core
-------------------------------------------------------------------------------
-- Copyright (c) 2012 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-12-07  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.wishbone_pkg.all;

package position_calc_core_pkg is

  -------------------------------------------------------------------------------
  -- Components Declaration
  -------------------------------------------------------------------------------

  component position_calc_counters_single
  generic (
    g_cntr_size                               : natural := 16
  );
  port (
    fs_clk2x_i                                : in std_logic; -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
    fs_rst2x_n_i                              : in std_logic;

    -- Clock enable
    ce_i                                      : in std_logic;

    -- Error inputs (one clock cycle long)
    err1_i                                    : in std_logic;
    -- Counter clear
    cntr_clr_i                                : in std_logic;

    -- Output counter
    cntr_o                                    : out std_logic_vector(g_cntr_size-1 downto 0)
  );
  end component;

  component position_calc_counters
  generic (
    g_cntr_size                             : natural := 16
  );
  port (
    fs_clk2x_i                              : in std_logic; -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
    fs_rst2x_n_i                            : in std_logic;

    -- Clock enables for various rates
    tbt_ce_i                                : in std_logic;
    fofb_ce_i                               : in std_logic;
    monit_cic_ce_i                          : in std_logic;
    monit_cfir_ce_i                         : in std_logic;
    monit_pfir_ce_i                         : in std_logic;
    monit_01_ce_i                           : in std_logic;

    tbt_decim_q_ch01_incorrect_i            : in std_logic;
    tbt_decim_q_ch23_incorrect_i            : in std_logic;
    tbt_decim_err_clr_i                     : in std_logic;

    fofb_decim_q_ch01_missing_i             : in std_logic;
    fofb_decim_q_ch23_missing_i             : in std_logic;
    fofb_decim_err_clr_i                    : in std_logic;

    monit_cic_unexpected_i                  : in std_logic;
    monit_cfir_incorrect_i                  : in std_logic;
    monit_part1_err_clr_i                   : in std_logic;

    monit_pfir_incorrect_i                  : in std_logic;
    monit_pos_1_incorrect_i                 : in std_logic;
    monit_part2_err_clr_i                   : in std_logic;

    tbt_incorrect_ctnr_ch01_o               : out std_logic_vector(g_cntr_size-1 downto 0);
    tbt_incorrect_ctnr_ch23_o               : out std_logic_vector(g_cntr_size-1 downto 0);

    fofb_incorrect_ctnr_ch01_o              : out std_logic_vector(g_cntr_size-1 downto 0);
    fofb_incorrect_ctnr_ch23_o              : out std_logic_vector(g_cntr_size-1 downto 0);

    monit_cic_incorrect_ctnr_o              : out std_logic_vector(g_cntr_size-1 downto 0);
    monit_cfir_incorrect_ctnr_o             : out std_logic_vector(g_cntr_size-1 downto 0);
    monit_pfir_incorrect_ctnr_o             : out std_logic_vector(g_cntr_size-1 downto 0);

    monit_01_incorrect_ctnr_o               : out std_logic_vector(g_cntr_size-1 downto 0)
  );
  end component;

  component trigger2tag
  generic (
    g_delay_width                          : natural := 9;
    g_tag_size                             : natural := 1
  );
  port (
    fs_clk_i                               : in std_logic;
    fs_rst_n_i                             : in std_logic;

    -- Pulse programmable delay
    pulse_dly_i                            : in std_logic_vector(g_delay_width-1 downto 0);
    -- Pulse input
    pulse_i                                : in std_logic;

    -- Output counter
    tag_o                                  : out std_logic
  );
  end component;

  --------------------------------------------------------------------
  -- SDB Devices Structures
  --------------------------------------------------------------------

  constant c_xwb_bpm_swap_sdb : t_sdb_device := (
    abi_class     => x"0000",                 -- undocumented device
    abi_ver_major => x"01",
    abi_ver_minor => x"00",
    wbd_endian    => c_sdb_endian_big,
    wbd_width     => x"4",                     -- 8/16/32-bit port granularity (0100)
    sdb_component => (
    addr_first    => x"0000000000000000",
    addr_last     => x"00000000000000FF",
    product => (
    vendor_id     => x"1000000000001215",     -- LNLS
    device_id     => x"12897592",
    version       => x"00000001",
    date          => x"20130703",
    name          => "LNLS_BPM_SWAP      ")));

  constant c_xwb_pos_calc_core_regs_sdb : t_sdb_device := (
    abi_class     => x"0000",                 -- undocumented device
    abi_ver_major => x"01",
    abi_ver_minor => x"00",
    wbd_endian    => c_sdb_endian_big,
    wbd_width     => x"4",                     -- 8/16/32-bit port granularity (0100)
    sdb_component => (
    addr_first    => x"0000000000000000",
    addr_last     => x"00000000000000FF",
    product => (
    vendor_id     => x"1000000000001215",     -- LNLS
    device_id     => x"1bafbf1e",
    version       => x"00000001",
    date          => x"20130703",
    name          => "LNLS_POS_CALC_REGS ")));

end position_calc_core_pkg;
