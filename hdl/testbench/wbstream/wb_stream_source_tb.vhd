-------------------------------------------------------------------------------
-- Title      : Testbench for design "wb_stream_source"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_source_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-07-30
-- Last update: 2015-08-10
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testbench for wishbone stream "source" block.
-------------------------------------------------------------------------------
-- Copyright (c) 2015 Brazilian Synchrotron Light Laboratory, LNLS/CNPEM    

-- This program is free software: you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this program. If not, see
-- <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2015-07-30  1.0      vfinotti        Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.wb_stream_pkg.all;
use work.test_pkg.all;

-------------------------------------------------------------------------------

entity wb_stream_source_tb is
end entity wb_stream_source_tb;

architecture tb of wb_stream_source_tb is

  -- Test_pkg constants
  constant c_CLK_FREQ        : real    := 100.0e6;  -- input clock frequency
  constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset
  constant c_CYCLES_TO_CE    : natural := 10;  -- number of clock cycles before reset

  constant c_INPUT_WIDTH : positive := 32;
  constant c_INPUT_FILE  : string   := "input_source.samples";

  -- Test_pkg signals
  signal clk : std_ulogic := '0';       -- clock signal
  signal rst : std_ulogic := '1';       -- reset signal
  signal ce  : std_ulogic := '0';       -- clock enable

  signal source_ready : std_ulogic;     -- negated busy_o
  signal end_of_file  : std_ulogic;

  -- component generics
  constant g_dat_width : natural := 32;
  constant g_adr_width : natural := 4;
  constant g_tgd_width : natural := 4;

  -- component ports
  signal src_i  : t_wbs_source_in := ('0', '0');
  signal src_o  : t_wbs_source_out;
  signal adr    : std_logic_vector(g_adr_width-1 downto 0);
  signal dat    : std_logic_vector(g_dat_width-1 downto 0);
  signal tgd    : std_logic_vector(g_tgd_width-1 downto 0);
  signal dvalid : std_logic;
  signal busy   : std_logic       := '0';

  -- auxiliar signals

  signal tgd_i_s : std_logic_vector(c_INPUT_WIDTH-1 downto 0);
  signal dat_i_s : std_logic_vector(g_dat_width-1 downto 0);
  signal adr_i_s : std_logic_vector(c_INPUT_WIDTH-1 downto 0);

  signal ce_counter : natural   := 0;   -- count number of ce events
  signal valid_out  : std_logic := '0';


  component wb_stream_source is
    generic (
      g_dat_width : natural;
      g_adr_width : natural;
      g_tgd_width : natural);
    port (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      ce_i     : in  std_logic;
      src_i    : in  t_wbs_source_in;
      src_o    : out t_wbs_source_out;
      adr_i    : in  std_logic_vector(g_adr_width-1 downto 0);
      dat_i    : in  std_logic_vector;
      tgd_i    : in  std_logic_vector(g_tgd_width-1 downto 0);
      dvalid_i : in  std_logic;
      busy_o   : out std_logic);
  end component wb_stream_source;

  
begin  -- architecture test

  p_clk_gen (
    clk    => clk,
    c_FREQ => c_CLK_FREQ);

  p_rst_gen (
    clk      => clk,
    rst      => rst,
    c_CYCLES => 2);

  p_ce_gen (
    clk      => clk,
    ce       => ce,
    rst      => rst,
    c_CYCLES => c_CYCLES_TO_CE);

  source_ready <= not(busy);

  p_read_tsv_file_std_logic_vector (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 3,              -- number of inputs
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => clk,
    rst                => rst,
    ce                 => ce,
    req                => source_ready,
    sample(0)          => tgd_i_s,
    sample(1)          => adr_i_s,
    sample(2)          => dat_i_s,
    valid              => valid_out,
    end_of_file        => end_of_file);

  -- Convert from signed to std_logic_vector

  tgd <= tgd_i_s(g_tgd_width-1 downto 0);
    dat <= dat_i_s(g_dat_width-1 downto 0);
  adr <= adr_i_s(g_adr_width-1 downto 0);


  -- purpose: generates dvalid signal, changing only when EOF happens
  -- type   : sequential
  -- inputs : valid_out, rst_i
  -- outputs: dvalid
  dvalid_assert : process (valid_out, end_of_file, rst) is
  begin  -- process dvalid_assert
    if rst = '1' then
      dvalid <= '0';
    elsif end_of_file = '1' then        -- asynchronous reset (active low)
      dvalid <= '0';
    elsif valid_out'event and valid_out = '1' then  -- rising clock edge
      dvalid <= '1';
    end if;
  end process dvalid_assert;

  -- purpose: asserts "src_i.stall" after a determined number of ce cycles 
  -- type   : sequential
  -- inputs : ce, ce, ce_counter
  -- outputs: src_i.stall
  stall_interrupt : process (ce) is
  begin  -- process busy_interrupt
    if ce'event and ce = '1' then       -- rising clock edge
      if ce_counter = 5 then
        src_i.stall <= '1';
      elsif ce_counter = 8 then
        src_i.stall <= '0';
      end if;
      ce_counter <= ce_counter + 1;     -- increments variable
    end if;
  end process stall_interrupt;

  -- component instantiation
  DUT : wb_stream_source
    generic map (
      g_dat_width => g_dat_width,
      g_adr_width => g_adr_width,
      g_tgd_width => g_tgd_width)
    port map (
      clk_i    => clk,
      rst_i    => rst,
      ce_i     => ce,
      src_i    => src_i,
      src_o    => src_o,
      adr_i    => adr,
      dat_i    => dat,
      tgd_i    => tgd,
      dvalid_i => dvalid,
      busy_o   => busy);

end architecture tb;

-------------------------------------------------------------------------------
