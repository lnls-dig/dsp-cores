------------------------------------------------------------------------------
-- Title      : DSP48E1-based MAC and data registered data propagation (2 stages)
------------------------------------------------------------------------------
-- Author     : Daniel Tavares
-- Company    : CNPEM LNLS-DIG
-- Created    : 2019-11-23
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Elementary mulitply-accumulate block for systolic FIR filter
--              implementation. Use 2 pipeline stages at the input data.
--              Reference: "DSP: Designing for Optimal Results"
-------------------------------------------------------------------------------
-- Copyright (c) 2019 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author              Description
-- 2019-11-23  1.0      daniel.tavares      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity mac2reg is
port
(
  clk_i  : in  std_logic;
  data_i : in  std_logic_vector (17 downto 0);
  coef_i : in  std_logic_vector (24 downto 0);
  casc_i : in  std_logic_vector (47 downto 0);
  data_o : out std_logic_vector (17 downto 0);
  mac_o :  out std_logic_vector (47 downto 0);
  casc_o : out std_logic_vector (47 downto 0)
);
end mac2reg;

architecture rtl of mac2reg is

  signal coef : std_logic_vector(29 downto 0);

begin

  DSP48E1_inst : DSP48E1
  generic map (
    -- Feature Control Attributes: Data Path Selection
    A_INPUT => "DIRECT",
    B_INPUT => "CASCADE",
    USE_DPORT => FALSE,
    USE_MULT => "MULTIPLY",
    USE_SIMD => "ONE48",
    -- Pattern Detector Attributes: Pattern Detection Configuration
    AUTORESET_PATDET => "NO_RESET", 
    MASK => X"3fffffffffff",
    PATTERN => X"000000000000",
    SEL_MASK => "MASK", 
    SEL_PATTERN => "PATTERN",
    USE_PATTERN_DETECT => "NO_PATDET",
    -- Register Control Attributes: Pipeline Register Configuration
    ACASCREG => 1,
    ADREG => 1,
    ALUMODEREG => 1,
    AREG => 1,
    BCASCREG => 2,
    BREG => 2,
    CARRYINREG => 0,
    CARRYINSELREG => 0,
    CREG => 1,
    DREG => 1,
    INMODEREG => 0,
    MREG => 1,
    OPMODEREG => 0,
    PREG => 1
  )
  port map (
    CLK => clk_i,            

    A => coef,
    B => (others => '0'),
    BCOUT => data_o,
    PCOUT => casc_o,
    P => mac_o,
    BCIN => data_i,
    PCIN => casc_i,
    INMODE => "00001",
    OPMODE => "0010101",
    ALUMODE => "0000",

    -- Reset/Clock Enable Inputs
    CEA1 => '1',
    CEA2 => '0',
    CEAD => '0',
    CEALUMODE => '1',
    CEB1 => '1',
    CEB2 => '1',
    CEC => '0',
    CECARRYIN => '0',
    CECTRL => '1',
    CED => '0',
    CEINMODE => '0',
    CEM => '1',
    CEP => '1',
    RSTA => '0',           
    RSTALLCARRYIN => '0',  
    RSTALUMODE => '0',     
    RSTB => '0',           
    RSTC => '0',           
    RSTCTRL => '0',        
    RSTD => '0',           
    RSTINMODE => '0',      
    RSTM => '0',           
    RSTP => '0',

    -- Unused port
    ACOUT => open,
    CARRYCASCOUT => open,
    MULTSIGNOUT => open,
    OVERFLOW => open,
    PATTERNBDETECT => open,
    PATTERNDETECT => open,
    UNDERFLOW => open,
    CARRYOUT => open,
    ACIN => (others => '0'),
    CARRYCASCIN => '0',
    MULTSIGNIN => '0',
    CARRYINSEL => "000",
    C => (others => '0'),
    CARRYIN => '0',
    D => (others => '0')
  );

  -- Sign extension - DSP48E1 expects 30 bits on port A but multiplier uses only 25 bits
  coef(24 downto 0) <= coef_i;
  coef(29 downto 25) <= (others => coef_i(24));

end rtl;
