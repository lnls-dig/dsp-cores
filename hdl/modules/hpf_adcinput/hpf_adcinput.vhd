------------------------------------------------------------------------------
-- Title      : Systolic High Pass FIR Filter
------------------------------------------------------------------------------
-- Author     : Daniel Tavares
-- Company    : CNPEM LNLS-DIG
-- Created    : 2019-11-23
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Systolic FIR for high pass filter.
--              Coefficients are calculated to meet the specification:
--                - Stopband norm. frequency: 0.04545
--                - Passband norm. frequency: 0.4545
--                - Attenuation at stopband: 60 dB
--                - Attenuation ripple at passband: +/- 0.1 dB
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

entity hpf_adcinput is
port
(
  clk_i   : in  std_logic;
  rst_n_i : in  std_logic;
  ce_i    : in  std_logic;
  data_i  : in  std_logic_vector (15 downto 0);
  data_o  : out std_logic_vector (15 downto 0)
);
end hpf_adcinput;

architecture rtl of hpf_adcinput is

  type t_coef is array(12 downto 0) of std_logic_vector(29 downto 0);
  signal coef : t_coef;

  type t_cascade is array(11 downto 0) of std_logic_vector(47 downto 0);
  signal cascade : t_cascade;

  type t_data_io is array(12 downto 0) of std_logic_vector(17 downto 0);
  signal data : t_data_io;

  signal data_full : std_logic_vector(47 downto 0);

  component mac1reg is
  port
  (
    clk_i  : in  std_logic;
    data_i : in  std_logic_vector (17 downto 0);
    coef_i : in  std_logic_vector (29 downto 0);
    data_o : out std_logic_vector (17 downto 0);
    mac_o :  out std_logic_vector (47 downto 0);
    casc_o : out std_logic_vector (47 downto 0)
  );
  end component;

  component mac2reg is
  port
  (
    clk_i  : in  std_logic;
    data_i : in  std_logic_vector (17 downto 0);
    coef_i : in  std_logic_vector (29 downto 0);
    casc_i : in  std_logic_vector (47 downto 0);
    data_o : out std_logic_vector (17 downto 0);
    mac_o :  out std_logic_vector (47 downto 0);
    casc_o : out std_logic_vector (47 downto 0)
  );
  end component;

  signal data_int : std_logic_vector(data_o'range);

begin

  coef <= (
     0 => conv_std_logic_vector(   5982972, 30),
     1 => conv_std_logic_vector(  11633010, 30),
     2 => conv_std_logic_vector(   6159007, 30),
     3 => conv_std_logic_vector( -22871568, 30),
     4 => conv_std_logic_vector( -73433591, 30),
     5 => conv_std_logic_vector(-123682115, 30),
     6 => conv_std_logic_vector( 392008402, 30),
     7 => conv_std_logic_vector(-123682115, 30),
     8 => conv_std_logic_vector( -73433591, 30),
     9 => conv_std_logic_vector( -22871568, 30),
    10 => conv_std_logic_vector(   6159007, 30),
    11 => conv_std_logic_vector(  11633010, 30),
    12 => conv_std_logic_vector(   5982972, 30)
  );
  
  cmp_mac_first : mac1reg
  port map
  (
    clk_i  => clk_i,
    data_i => data_i & "00",
    coef_i => coef(0),
    data_o => data(0),
    casc_o => cascade(0)
  );

  gen_mac_cascade : for i in 1 to 11 generate
    cmp_mac : mac2reg
    port map
    (
      clk_i  => clk_i,
      data_i => data(i-1),
      coef_i => coef(i),
      casc_i => cascade(i-1),
      data_o => data(i),
      mac_o => open,
      casc_o => cascade(i) 
    );
  end generate;

  cmp_mac_last : mac2reg
   port map
   (
     clk_i  => clk_i,
     data_i => data(11),
     coef_i => coef(12),
     casc_i => cascade(11),
     data_o => open,
     mac_o => data_full,
     casc_o => open
   );
   
   data_o <= data_full(47 downto 32);

end rtl;
