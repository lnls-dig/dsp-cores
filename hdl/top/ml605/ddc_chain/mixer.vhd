-------------------------------------------------------------------------------
-- Title      : BPM Mixer
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mixer.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS - CNPEM
-- Created    : 2014-01-21
-- Last update: 2014-01-23
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Mixer at input stage for BPM
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-21  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity mixer is
  generic(
    g_center_freq : real := 20.0e6;
    g_input_clk   : real := 130.0e6);
  port(
    rst   : in  std_logic;
    clk   : in  std_logic;
    input : in  std_logic_vector(31 downto 0);
    I_out : out std_logic_vector(31 downto 0);
    Q_out : out std_logic_vector(31 downto 0));
end mixer;

architecture rtl of mixer is

  constant c_THETA_CARRIER : integer :=
    integer((g_center_freq*(2.0**32.0))/g_input_clk);

  constant c_THETA_VECTOR : unsigned(31 downto 0) :=
    to_unsigned(C_THETA_CARRIER, 32);

  signal sine   : std_logic_vector(31 downto 0);
  signal cosine : std_logic_vector(31 downto 0);

  signal I_temp : std_logic_vector(63 downto 0);
  signal Q_temp : std_logic_vector(63 downto 0);

  component dds_mixer
    port(
      aclk                : in  std_logic;
      s_axis_phase_tvalid : in  std_logic;
      s_axis_phase_tdata  : in  std_logic_vector(31 downto 0);
      m_axis_data_tvalid  : out std_logic;
      m_axis_data_tdata   : out std_logic_vector(63 downto 0));  -- sin/cos 26 bits,
                                        -- sign extended
                                        -- to 32
  end component;

  component multiplier_s32_s32_s64
    port (
      clk : in  std_logic;
      a   : in  std_logic_vector(31 downto 0);
      b   : in  std_logic_vector(31 downto 0);
      p   : out std_logic_vector(63 downto 0)
      );
  end component;
  
begin

  cmp_dds : dds_mixer
    port map(
      aclk                            => clk,
      s_axis_phase_tvalid             => '1',
      s_axis_phase_tdata              => std_logic_vector(c_THETA_VECTOR),
      m_axis_data_tvalid              => open,
      m_axis_data_tdata(63 downto 32) => sine,   --only 26 significant bits
      m_axis_data_tdata(31 downto 0)  => cosine  --only 26 significant bits
      );

  cmp_I_mult : multiplier_s32_s32_s64
    port map(
      clk            => clk,
      a(31 downto 6) => cosine(25 downto 0),
      a(5 downto 0)  => (others => '0'),
      b              => input,
      p              => I_temp
      );

  I_out <= I_temp(63 downto 32);

  
  cmp_Q_mult : multiplier_s32_s32_s64
    port map(
      clk            => clk,
      a(31 downto 6) => sine(25 downto 0),
      a(5 downto 0)  => (others => '0'),
      b              => input,
      p              => Q_temp
      );
  Q_out <= Q_temp(63 downto 32);

end rtl;
