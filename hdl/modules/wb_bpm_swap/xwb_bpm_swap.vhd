------------------------------------------------------------------------------
-- Title      : Wishbone BPM SWAP interface
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Wishbone interface with BPM Swap core.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-04-11  1.0      jose.berkenbrock      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- Main Wishbone Definitions
use work.wishbone_pkg.all;
-- DSP Cores
use work.dsp_cores_pkg.all;
-- Register Bank
use work.bpm_swap_wbgen2_pkg.all;

entity xwb_bpm_swap is
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
    ch_tag_o        : out std_logic_vector(0 downto 0);
    ch_valid_o      : out std_logic;

    -- RFFE swap clock (or switchwing clock)
    rffe_swclk_o    : out std_logic;

    sync_trig_i     : in std_logic
  );
end xwb_bpm_swap;

architecture rtl of xwb_bpm_swap is

begin

  cmp_wb_bpm_swap : wb_bpm_swap
  generic map
  (
    g_interface_mode                          => g_interface_mode,
    g_address_granularity                     => g_address_granularity,
    g_delay_vec_width                         => g_delay_vec_width,
    g_swap_div_freq_vec_width                 => g_swap_div_freq_vec_width,
    g_ch_width                                => g_ch_width
  )
  port map
  (
    rst_n_i                                   => rst_n_i,
    clk_sys_i                                 => clk_sys_i,
    fs_rst_n_i                                => fs_rst_n_i,
    fs_clk_i                                  => fs_clk_i,

    wb_adr_i                                  => wb_slv_i.adr,
    wb_dat_i                                  => wb_slv_i.dat,
    wb_dat_o                                  => wb_slv_o.dat,
    wb_sel_i                                  => wb_slv_i.sel,
    wb_we_i                                   => wb_slv_i.we,
    wb_cyc_i                                  => wb_slv_i.cyc,
    wb_stb_i                                  => wb_slv_i.stb,
    wb_ack_o                                  => wb_slv_o.ack,
    wb_stall_o                                => wb_slv_o.stall,

    cha_i                                     => cha_i,
    chb_i                                     => chb_i,
    chc_i                                     => chc_i,
    chd_i                                     => chd_i,
    ch_valid_i                                => ch_valid_i,
    cha_o                                     => cha_o,
    chb_o                                     => chb_o,
    chc_o                                     => chc_o,
    chd_o                                     => chd_o,
    ch_tag_o                                  => ch_tag_o,
    ch_valid_o                                => ch_valid_o,
    rffe_swclk_o                              => rffe_swclk_o,
    sync_trig_i                               => sync_trig_i
  );

end rtl;
