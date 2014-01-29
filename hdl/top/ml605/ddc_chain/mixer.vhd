-------------------------------------------------------------------------------
-- Title      : BPM Mixer
-- Project    : 
-------------------------------------------------------------------------------
-- File	      : mixer.vhd
-- Author     : Gustavo BM Bruno
-- Company    : LNLS - CNPEM
-- Created    : 2014-01-21
-- Last update: 2014-01-29
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Mixer at input stage for BPM
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2014-01-21  1.0	aylons	Created
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
    g_input_clk	  : real := 130.0e6
    );
  port(
    rst	   : in	 std_logic;
    clk	   : in	 std_logic;
    input  : in	 std_logic_vector(31 downto 0);
    I_out  : out std_logic_vector(31 downto 0);
    Q_out  : out std_logic_vector(31 downto 0);
    tvalid : out std_logic
    );

end entity mixer;

architecture rtl of mixer is

  constant c_THETA_CARRIER : integer :=
    integer((g_center_freq*(2.0**32.0))/g_input_clk);

  constant c_THETA_VECTOR : unsigned(31 downto 0) :=
    to_unsigned(C_THETA_CARRIER, 32);

  signal sine	: std_logic_vector(31 downto 0);
  signal cosine : std_logic_vector(31 downto 0);

  signal I_temp : std_logic_vector(63 downto 0);
  signal Q_temp : std_logic_vector(63 downto 0);

  signal I_prereg : std_logic_vector(31 downto 0);  -- result before output register
  signal Q_prereg : std_logic_vector(31 downto 0);

  signal tvalidI : std_logic;
  signal tvalidQ : std_logic;

  signal mixer_valid : std_logic;

  signal debug : std_logic_vector(8 downto 0);
  component dds_mixer
    port(
      aclk		  : in	std_logic;
      s_axis_phase_tvalid : in	std_logic;
      s_axis_phase_tdata  : in	std_logic_vector(31 downto 0);
      m_axis_data_tvalid  : out std_logic;
      m_axis_data_tdata	  : out std_logic_vector(63 downto 0));	 -- sin/cos 26 bits,
					-- sign extended
					-- to 32
  end component;

  component multiplier_s32_s32_s64
    port (
      clk  : in	 std_logic;
      a	   : in	 std_logic_vector(31 downto 0);
      b	   : in	 std_logic_vector(31 downto 0);
      ce   : in	 std_logic;
      sclr : in	 std_logic;
      p	   : out std_logic_vector(63 downto 0)
      );
  end component;

  component cic_130M_100k
    port(
      aclk		 : in  std_logic;
      s_axis_data_tdata	 : in  std_logic_vector(23 downto 0);
      s_axis_data_tvalid : in  std_logic;
      s_axis_data_tready : out std_logic;
      m_axis_data_tdata	 : out std_logic_vector(31 downto 0);
      m_axis_data_tvalid : out std_logic
      );
  end component;

begin

  cmp_dds : dds_mixer
    port map(
      aclk			      => clk,
      s_axis_phase_tvalid	      => '1',
      s_axis_phase_tdata	      => std_logic_vector(c_THETA_VECTOR),
      m_axis_data_tvalid	      => mixer_valid,
      m_axis_data_tdata(63 downto 32) => sine,	 --only 26 significant bits
      m_axis_data_tdata(31 downto 0)  => cosine	 --only 26 significant bits
      );

  cmp_I_mult : multiplier_s32_s32_s64
    port map(
      clk	     => clk,
      a(31 downto 6) => cosine(25 downto 0),
      a(5 downto 0)  => (others => '0'),
      b		     => input,
      ce	     => mixer_valid,
      sclr	     => '0',
      p		     => I_temp
      );


  cmp_Q_mult : multiplier_s32_s32_s64
    port map(
      clk	     => clk,
      a(31 downto 6) => sine(25 downto 0),
      a(5 downto 0)  => (others => '0'),
      b		     => input,
      ce	     => mixer_valid,
      sclr	     => '0',
      p		     => Q_temp
      );

  cic_I : cic_130M_100k
    port map (
      aclk		 => clk,
      s_axis_data_tdata	 => I_temp(63 downto 40),
      s_axis_data_tvalid => mixer_valid, -- if an undefined signal gets in, the
					 -- simulation is lost.
      s_axis_data_tready => open,
      m_axis_data_tdata	 => I_prereg,
      m_axis_data_tvalid => tvalidI
      );

  cic_Q : cic_130M_100k
    port map (
      aclk		 => clk,
      s_axis_data_tdata	 => Q_temp(63 downto 40),
      s_axis_data_tvalid => mixer_valid, -- if an undefined signal gets in, the
					 -- simulation is lost.
      s_axis_data_tready => open,
      m_axis_data_tdata	 => Q_prereg,
      m_axis_data_tvalid => tvalidQ
      );

  -- This process ensures that Q and I are always synchronized and that a good
  -- tvalid system is generated when it happens. This behavioural code should
  -- actually be in a different module, and then integrated in the mixer
  -- structural code.
  registered_output : process(clk)
  begin
    if rising_edge(clk) then
      if(tvalidQ and tvalidI) = '1' then
	I_out  <= I_prereg;
	Q_out  <= Q_prereg;
	tvalid <= '1';
      else
	tvalid <= '0';
      end if;
    end if;
  end process;
  
end rtl;
