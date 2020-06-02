------------------------------------------------------------------------------
-- Title      : Wishbone BPM SWAP flat interface
------------------------------------------------------------------------------
-- Author     : Jose Alvim Berkenbrock
-- Company    : CNPEM LNLS-DIG
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Wishbone interface with BPM Swap core. In flat style.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2013-04-12  1.0      jose.berkenbrock      Created
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

entity wb_bpm_swap is
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
    ch_tag_o        : out std_logic_vector(0 downto 0);
    ch_valid_o      : out std_logic;

    -- RFFE swap clock (or switchwing clock)
    rffe_swclk_o    : out std_logic;

    -- RFFE swap clock synchronization trigger
    sync_trig_i     : in std_logic

  );
end wb_bpm_swap;

architecture rtl of wb_bpm_swap is

  constant c_periph_addr_size               : natural := 1+2;

  signal fs_rst_n                           : std_logic;

  -----------------------------
  -- Wishbone Register Interface signals
  -----------------------------
  -- wb_bpm_swap reg structure
  signal regs_in                            : t_bpm_swap_in_registers;
  signal regs_out                           : t_bpm_swap_out_registers;

  -----------------------------
  -- Wishbone slave adapter signals/structures
  -----------------------------
  signal wb_slv_adp_out                     : t_wishbone_master_out;
  signal wb_slv_adp_in                      : t_wishbone_master_in;
  signal resized_addr                       : std_logic_vector(c_wishbone_address_width-1 downto 0);

  signal deswap_delay                       : std_logic_vector(g_delay_vec_width-1 downto 0);

  component wb_bpm_swap_regs
  port (
    rst_n_i               : in     std_logic;
    clk_sys_i             : in     std_logic;
    wb_adr_i              : in     std_logic_vector(0 downto 0);
    wb_dat_i              : in     std_logic_vector(31 downto 0);
    wb_dat_o              : out    std_logic_vector(31 downto 0);
    wb_cyc_i              : in     std_logic;
    wb_sel_i              : in     std_logic_vector(3 downto 0);
    wb_stb_i              : in     std_logic;
    wb_we_i               : in     std_logic;
    wb_ack_o              : out    std_logic;
    wb_stall_o            : out    std_logic;
    fs_clk_i              : in     std_logic;
    regs_i                : in     t_bpm_swap_in_registers;
    regs_o                : out    t_bpm_swap_out_registers
  );
  end component;

begin

  -----------------------------
  -- Slave adapter for Wishbone Register Interface
  -----------------------------
  cmp_slave_adapter : wb_slave_adapter
  generic map (
    g_master_use_struct                     => true,
    g_master_mode                           => PIPELINED,
    g_master_granularity                    => WORD,
    g_slave_use_struct                      => false,
    g_slave_mode                            => g_interface_mode,
    g_slave_granularity                     => g_address_granularity
  )
  port map (
    clk_sys_i                               => clk_sys_i,
    rst_n_i                                 => rst_n_i,
    master_i                                => wb_slv_adp_in,
    master_o                                => wb_slv_adp_out,
    sl_adr_i                                => resized_addr,
    sl_dat_i                                => wb_dat_i,
    sl_sel_i                                => wb_sel_i,
    sl_cyc_i                                => wb_cyc_i,
    sl_stb_i                                => wb_stb_i,
    sl_we_i                                 => wb_we_i,
    sl_dat_o                                => wb_dat_o,
    sl_ack_o                                => wb_ack_o,
    sl_rty_o                                => open,
    sl_err_o                                => open,
    sl_stall_o                              => wb_stall_o
  );

  -- See wb_bpm_swap_port.vhd for register bank addresses.
  resized_addr(c_periph_addr_size-1 downto 0) <= wb_adr_i(c_periph_addr_size-1 downto 0); --cbar_master_out(0).adr(c_periph_addr_size-1 downto 0);
  resized_addr(c_wishbone_address_width-1 downto c_periph_addr_size) <= (others => '0');

  -- Register Bank / Wishbone Interface
  cmp_wb_bpm_swap_regs : wb_bpm_swap_regs
  port map (
    rst_n_i                                 => rst_n_i,
    clk_sys_i                               => clk_sys_i,
    wb_adr_i                                => wb_slv_adp_out.adr(0 downto 0),
    wb_dat_i                                => wb_slv_adp_out.dat,
    wb_dat_o                                => wb_slv_adp_in.dat,
    wb_cyc_i                                => wb_slv_adp_out.cyc,
    wb_sel_i                                => wb_slv_adp_out.sel,
    wb_stb_i                                => wb_slv_adp_out.stb,
    wb_we_i                                 => wb_slv_adp_out.we,
    wb_ack_o                                => wb_slv_adp_in.ack,
    wb_stall_o                              => wb_slv_adp_in.stall,
    fs_clk_i                                => fs_clk_i,
    regs_i                                  => regs_in,
    regs_o                                  => regs_out
  );

  -- Registers assignment
  regs_in.ctrl_reserved_i                   <= (others => '0');
  regs_in.dly_reserved_i                    <= (others => '0');

  -- Unused wishbone signals
  wb_slv_adp_in.err                         <= '0';
  wb_slv_adp_in.rty                         <= '0';

  cmp_bpm_swap : bpm_swap
  generic map (
    g_delay_vec_width                       => g_delay_vec_width,
    g_swap_div_freq_vec_width               => g_swap_div_freq_vec_width,
    g_ch_width                              => g_ch_width
    )
  port map (
    clk_i                                   =>  fs_clk_i,
    rst_n_i                                 =>  fs_rst_n_i,
    cha_i                                   =>  cha_i,
    chb_i                                   =>  chb_i,
    chc_i                                   =>  chc_i,
    chd_i                                   =>  chd_i,
    ch_valid_i                              =>  ch_valid_i,
    cha_o                                   =>  cha_o,
    chb_o                                   =>  chb_o,
    chc_o                                   =>  chc_o,
    chd_o                                   =>  chd_o,
    ch_tag_o                                =>  ch_tag_o,
    ch_valid_o                              =>  ch_valid_o,
    rffe_swclk_o                            =>  rffe_swclk_o,
    sync_trig_i                             =>  sync_trig_i,
    swap_mode_i                             =>  regs_out.ctrl_mode_o,
    swap_div_f_i                            =>  regs_out.ctrl_swap_div_f_o,
    deswap_delay_i                          =>  deswap_delay
  );

  deswap_delay <= regs_out.dly_deswap_o(g_delay_vec_width-1 downto 0);

end rtl;
