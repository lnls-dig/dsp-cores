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

end position_calc_core_pkg;
