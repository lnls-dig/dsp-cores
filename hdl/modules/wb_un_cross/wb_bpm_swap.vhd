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
  g_interface_mode                          : t_wishbone_interface_mode      := CLASSIC;
  g_address_granularity                     : t_wishbone_address_granularity := WORD
);
port
(
  rst_n_i                                   : in std_logic;
  clk_sys_i                                 : in std_logic;
  fs_rst_n_i                                : in std_logic;
  fs_clk_i                                  : in std_logic;

  -----------------------------
  -- Wishbone signals
  -----------------------------

  wb_adr_i                                  : in  std_logic_vector(c_wishbone_address_width-1 downto 0) := (others => '0');
  wb_dat_i                                  : in  std_logic_vector(c_wishbone_data_width-1 downto 0) := (others => '0');
  wb_dat_o                                  : out std_logic_vector(c_wishbone_data_width-1 downto 0);
  wb_sel_i                                  : in  std_logic_vector(c_wishbone_data_width/8-1 downto 0) := (others => '0');
  wb_we_i                                   : in  std_logic := '0';
  wb_cyc_i                                  : in  std_logic := '0';
  wb_stb_i                                  : in  std_logic := '0';
  wb_ack_o                                  : out std_logic;
  wb_stall_o                                : out std_logic;

  -----------------------------
  -- External ports
  -----------------------------
  -- Input from ADC FMC board
  cha_i                                     : in  std_logic_vector(15 downto 0);
  chb_i                                     : in  std_logic_vector(15 downto 0);
  chc_i                                     : in  std_logic_vector(15 downto 0);
  chd_i                                     : in  std_logic_vector(15 downto 0);

  -- Output to data processing level
  cha_o                                     : out std_logic_vector(15 downto 0);
  chb_o                                     : out std_logic_vector(15 downto 0);
  chc_o                                     : out std_logic_vector(15 downto 0);
  chd_o                                     : out std_logic_vector(15 downto 0);

  mode1_o                                   : out std_logic_vector(1 downto 0);                                   
  mode2_o                                   : out std_logic_vector(1 downto 0);

  wdw_rst_o                                 : out std_logic;     -- Reset Windowing module
  wdw_sw_clk_i                              : in std_logic;      -- Switching clock from Windowing module
  wdw_use_o                                 : out std_logic;     -- Use Windowing module
  wdw_dly_o                                 : out std_logic_vector(15 downto 0); -- Delay to apply the window

  -- Output to RFFE board
  clk_swap_o                                : out std_logic;
  clk_swap_en_o                             : out std_logic;
  flag1_o                                   : out std_logic;
  flag2_o                                   : out std_logic;
  ctrl1_o                                   : out std_logic_vector(7 downto 0);
  ctrl2_o                                   : out std_logic_vector(7 downto 0)
);
end wb_bpm_swap;

architecture rtl of wb_bpm_swap is

  -----------------------------
  -- General Contants
  -----------------------------
  constant c_periph_addr_size               : natural := 3+2;

  signal fs_rst_n                           : std_logic;
  signal wdw_use_ext_clk                    : std_logic;
  signal clk_swap_en                        : std_logic;

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

  component wb_bpm_swap_regs
  port (
    rst_n_i               : in     std_logic;
    clk_sys_i             : in     std_logic;
    wb_adr_i              : in     std_logic_vector(2 downto 0);
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

  component un_cross_top
  generic(
    g_delay_vec_width         : natural range 0 to 16 := 16;
    g_swap_div_freq_vec_width : natural range 0 to 16 := 16
  );
  port(
    -- Commom signals
    clk_i        :  in   std_logic;
    rst_n_i      :  in   std_logic;

    -- inv_chs_top core signal
    const_aa_i   :  in   std_logic_vector(15 downto 0);
    const_bb_i   :  in   std_logic_vector(15 downto 0);
    const_cc_i   :  in   std_logic_vector(15 downto 0);
    const_dd_i   :  in   std_logic_vector(15 downto 0);
    const_ac_i   :  in   std_logic_vector(15 downto 0);
    const_bd_i   :  in   std_logic_vector(15 downto 0);
    const_ca_i   :  in   std_logic_vector(15 downto 0);
    const_db_i   :  in   std_logic_vector(15 downto 0);

    delay1_i     :  in   std_logic_vector(g_delay_vec_width-1 downto 0);
    delay2_i     :  in   std_logic_vector(g_delay_vec_width-1 downto 0);

    flag1_o      :  out   std_logic;
    flag2_o      :  out   std_logic;

    -- Input from ADC FMC board
    cha_i        :  in   std_logic_vector(15 downto 0);
    chb_i        :  in   std_logic_vector(15 downto 0);
    chc_i        :  in   std_logic_vector(15 downto 0);
    chd_i        :  in   std_logic_vector(15 downto 0);

    -- Output to data processing level
    cha_o        :  out  std_logic_vector(15 downto 0);
    chb_o        :  out  std_logic_vector(15 downto 0);
    chc_o        :  out  std_logic_vector(15 downto 0);
    chd_o        :  out  std_logic_vector(15 downto 0);

    -- Swap clock for RFFE
    clk_swap_o   : out std_logic;
    clk_swap_en_i  : in std_logic;

    -- swap_cnt_top signal
    mode1_i      :  in    std_logic_vector(1 downto 0);
    mode2_i      :  in    std_logic_vector(1 downto 0);

    swap_div_f_i :  in    std_logic_vector(g_swap_div_freq_vec_width-1 downto 0);
    ext_clk_i    : in std_logic;
    ext_clk_en_i : in std_logic;

    -- Output to RFFE board
    ctrl1_o      :  out   std_logic_vector(7 downto 0);
    ctrl2_o      :  out   std_logic_vector(7 downto 0)
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
    sl_int_o                                => open,
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
    wb_adr_i                                => wb_slv_adp_out.adr(2 downto 0),
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

  -- Unused wishbone signals
  wb_slv_adp_in.int                         <= '0';
  wb_slv_adp_in.err                         <= '0';
  wb_slv_adp_in.rty                         <= '0';

  regs_in.wdw_ctl_reserved_i                <= (others => '0');
  wdw_use_ext_clk                           <= regs_out.wdw_ctl_swclk_ext_o;

  cmd_un_cross : un_cross_top
  generic map (
    g_delay_vec_width                       => 16,
    g_swap_div_freq_vec_width               => 16
    )
  port map (
    clk_i                                   =>  fs_clk_i,
    rst_n_i                                 =>  fs_rst_n_i,

    const_aa_i                              =>  regs_out.a_a_o,
    const_bb_i                              =>  regs_out.c_c_o,
    const_cc_i                              =>  regs_out.b_b_o,
    const_dd_i                              =>  regs_out.d_d_o,
    const_ac_i                              =>  regs_out.a_c_o,
    const_bd_i                              =>  regs_out.b_d_o,
    const_ca_i                              =>  regs_out.c_a_o,
    const_db_i                              =>  regs_out.d_b_o,

    delay1_i                                =>  regs_out.dly_1_o,
    delay2_i                                =>  regs_out.dly_2_o,

    flag1_o                                 => flag1_o,
    flag2_o                                 => flag2_o,

    -- Input
    cha_i                                   =>  cha_i,
    chb_i                                   =>  chb_i,
    chc_i                                   =>  chc_i,
    chd_i                                   =>  chd_i,

    -- Output
    cha_o                                   =>  cha_o,
    chb_o                                   =>  chb_o,
    chc_o                                   =>  chc_o,
    chd_o                                   =>  chd_o,

    -- Swap clock for RFFE
    clk_swap_o                              => clk_swap_o,
    clk_swap_en_i                           => clk_swap_en,

    mode1_i                                 =>  regs_out.ctrl_mode1_o,
    mode2_i                                 =>  regs_out.ctrl_mode2_o,

    swap_div_f_i                            =>  regs_out.ctrl_swap_div_f_o,
    ext_clk_i                               =>  wdw_sw_clk_i,
    ext_clk_en_i                            =>  wdw_use_ext_clk,

    -- Output to RFFE
    ctrl1_o                                 =>  ctrl1_o,
    ctrl2_o                                 =>  ctrl2_o
  );

  clk_swap_en                               <= regs_out.ctrl_clk_swap_en_o;
  clk_swap_en_o                             <= clk_swap_en;

  mode1_o                                   <= regs_out.ctrl_mode1_o;  
  mode2_o                                   <= regs_out.ctrl_mode2_o;
  wdw_use_o                                 <= regs_out.wdw_ctl_use_o;
  --wdw_dly_o                                 <= regs_out.wdw_ctl_dly_o; -- FIXME: this reg is not used!
  wdw_dly_o                                 <= regs_out.dly_1_o;
  wdw_rst_o                                 <= regs_out.wdw_ctl_rst_wdw_o;

end rtl;
