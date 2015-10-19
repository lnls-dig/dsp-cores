------------------------------------------------------------------------------
-- Title      : Position Calcualtion Error Counters (single)
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2014-01-13
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Simple counters for errors on the DSP chain
-------------------------------------------------------------------------------
-- Copyright (c) 2014 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2014-01-13  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.position_calc_core_pkg.all;

entity position_calc_counters is
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
end position_calc_counters;

architecture rtl of position_calc_counters is

begin

  -------------------------------------------------------------------------------
  -- TBT error counters
  -------------------------------------------------------------------------------

  cmp_tbt_ch01_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => tbt_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => tbt_decim_q_ch01_incorrect_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => tbt_decim_err_clr_i,

    -- Output counter
    cntr_o                                    => tbt_incorrect_ctnr_ch01_o
  );

  cmp_tbt_ch23_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => tbt_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => tbt_decim_q_ch23_incorrect_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => tbt_decim_err_clr_i,

    -- Output counter
    cntr_o                                    => tbt_incorrect_ctnr_ch23_o
  );

  -------------------------------------------------------------------------------
  -- FOFB error counters
  -------------------------------------------------------------------------------

  cmp_fofb_ch01_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => fofb_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => fofb_decim_q_ch01_missing_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => fofb_decim_err_clr_i,

    -- Output counter
    cntr_o                                    => fofb_incorrect_ctnr_ch01_o
  );

  cmp_fofb_ch23_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => fofb_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => fofb_decim_q_ch23_missing_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => fofb_decim_err_clr_i,

    -- Output counter
    cntr_o                                    => fofb_incorrect_ctnr_ch23_o
  );

  -------------------------------------------------------------------------------
  -- Monit part 1 error counters
  -------------------------------------------------------------------------------

  cmp_monit_cic_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => monit_cic_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => monit_cic_unexpected_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => monit_part1_err_clr_i,

    -- Output counter
    cntr_o                                    => monit_cic_incorrect_ctnr_o
  );

  cmp_monit_cfir_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => monit_cfir_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => monit_cfir_incorrect_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => monit_part1_err_clr_i,

    -- Output counter
    cntr_o                                    => monit_cfir_incorrect_ctnr_o
  );

  -------------------------------------------------------------------------------
  -- Monit part 2 error counters
  -------------------------------------------------------------------------------

  cmp_monit_pfir_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => monit_pfir_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => monit_pfir_incorrect_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => monit_part2_err_clr_i,

    -- Output counter
    cntr_o                                    => monit_pfir_incorrect_ctnr_o
  );

  cmp_monit_0_1_calc_counters : position_calc_counters_single
  port map (
    fs_clk2x_i                                => fs_clk2x_i,
    fs_rst2x_n_i                              => fs_rst2x_n_i,

    -- Clock enable
    ce_i                                      => monit_01_ce_i,

    -- Error inputs (one clock cycle long)
    err1_i                                    => monit_pos_1_incorrect_i,
    -- Counter clear (synchronous to fs_clk2x_i and NOT to fs_clk2x_i and ce_i)
    cntr_clr_i                                => monit_part2_err_clr_i,

    -- Output counter
    cntr_o                                    => monit_01_incorrect_ctnr_o
  );

end rtl;
