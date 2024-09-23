-------------------------------------------------------------------------------
-- Title      : CIC decimator testbench
-------------------------------------------------------------------------------
-- Author     : Augusto Fraga Giachero
-- Company    : CNPEM LNLS-GIE
-- Platform   : Simulation
-- Standard   : VHDL 2008
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2023-01-23 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2023-01-23  1.0      augusto.fraga         Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;

entity cic_decim_tb is
  generic (
    g_DATAIN_WIDTH     : integer := 16;
    g_DATAOUT_WIDTH    : integer := 32;
    g_CIC_DELAY        : integer := 1;
    g_CIC_STAGES       : integer := 1;
    g_MAX_RATE         : integer := 2048;
    g_BITGROWTH        : integer := 11;
    g_ROUND_CONVERGENT : boolean := false
    );
end cic_decim_tb;

architecture rtl of cic_decim_tb is
  function bool_to_int(x : boolean) return integer is
  begin
    if x then
      return 1;
    else
      return 0;
    end if;
  end function;

  procedure f_gen_clk(constant freq : in    natural;
                      signal   clk  : inout std_logic) is
  begin
    loop
      wait for (0.5 / real(freq)) * 1 sec;
      clk <= not clk;
    end loop;
  end procedure f_gen_clk;

  procedure f_wait_cycles(signal   clk    : in std_logic;
                          constant cycles : natural) is
  begin
    for i in 1 to cycles loop
      wait until rising_edge(clk);
    end loop;
  end procedure f_wait_cycles;

  type t_cic_decim_iface is record
    en_i    : std_logic;
    decim_i : std_logic;
    valid_i : std_logic;
    valid_o : std_logic;
    data_i  : std_logic_vector(g_DATAIN_WIDTH-1 downto 0);
    data_o  : std_logic_vector(g_DATAOUT_WIDTH-1 downto 0);
  end record;

  procedure f_cic_decim_write(signal cic_if : inout t_cic_decim_iface;
                              data          : signed(g_DATAIN_WIDTH-1 downto 0);
                              signal clk    : in std_logic) is
  begin
    cic_if.en_i <= '1';
    cic_if.data_i <= std_logic_vector(data);
    cic_if.valid_i <= '1';
    wait until rising_edge(clk);
    cic_if.valid_i <= '0';
  end procedure;

  procedure f_cic_decim_read(signal cic_if : inout t_cic_decim_iface;
                             signal data   : out signed(g_DATAOUT_WIDTH-1 downto 0);
                             signal clk    : in std_logic) is
  begin
    cic_if.en_i <= '1';
    cic_if.decim_i <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    cic_if.decim_i <= '0';
    wait until cic_if.valid_o = '1';
    data <= signed(cic_if.data_o);
  end procedure;

  signal cic_decim_iface : t_cic_decim_iface := (
    en_i    => '0',
    decim_i => '0',
    valid_i => '0',
    valid_o => '0',
    data_i  => (others => '0'),
    data_o  => (others => '0')
    );
  signal result  : signed(g_DATAOUT_WIDTH-1 downto 0) := (others => '0');
  signal clk     : std_logic := '0';
  signal rst     : std_logic := '1';
begin

  cmp_cic_decim: cic_decim
    generic map (
      DATAIN_WIDTH     => g_DATAIN_WIDTH,
      DATAOUT_WIDTH    => g_DATAOUT_WIDTH,
      M                => g_CIC_DELAY,
      N                => g_CIC_STAGES,
      MAXRATE          => g_MAX_RATE,
      BITGROWTH        => g_BITGROWTH,
      ROUND_CONVERGENT => bool_to_int(g_ROUND_CONVERGENT)
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => cic_decim_iface.en_i,
      data_i    => cic_decim_iface.data_i,
      data_o    => cic_decim_iface.data_o,
      act_i     => cic_decim_iface.valid_i,
      act_out_i => cic_decim_iface.decim_i,
      val_o     => cic_decim_iface.valid_o
      );

  f_gen_clk(100e6, clk);
  process
  begin
    f_wait_cycles(clk, 5);
    rst <= '0';
    f_wait_cycles(clk, 1);
    for i in 1 to 20 loop
      f_cic_decim_write(cic_decim_iface, to_signed(20, g_DATAIN_WIDTH), clk);
    end loop;
    f_cic_decim_read(cic_decim_iface, result, clk);
    std.env.finish;
  end process;

end architecture rtl;
