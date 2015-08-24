-------------------------------------------------------------------------------
-- Title      : Testbench for design "wb_stream_wrapper"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_wrapper_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-03
-- Last update: 2015-08-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
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
-- 2015-08-03  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.wb_stream_pkg.all;
use work.test_pkg.all;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity wb_stream_wrapper_tb is

end entity wb_stream_wrapper_tb;

architecture behavior of wb_stream_wrapper_tb is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------

  -- Test_pkg constants
  constant c_CLK_FREQ        : real    := 100.0e6;  -- input clock frequency
  constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset
  constant c_CYCLES_TO_CE    : natural := 20;  -- number of clock cycles before reset

  constant c_INPUT_WIDTH : positive := 32;
  constant c_INPUT_FILE  : string   := "input_wrapper.samples";

  -- Test_pkg signals
  signal clk : std_ulogic := '0';       -- clock signal
  signal rst : std_ulogic := '1';       -- reset signal
  signal ce  : std_ulogic := '0';       -- clock enable

  signal wrapper_ready : std_ulogic;    -- negated snk_o.stall
  signal end_of_file   : std_ulogic;

  -- component generics
  constant g_input_width   : natural := 32;
  constant g_output_width  : natural := 32;
  constant g_tgd_width     : natural := 4;
  constant g_adr_width     : natural := 4;
  constant g_ce_core       : natural := 5;

  -- component ports
  signal snk_i     : t_wbs_sink_in    := cc_dummy_snk_in;
  signal snk_o     : t_wbs_sink_out   := cc_dummy_src_in;
  signal src_i     : t_wbs_source_in  := cc_dummy_src_in;
  signal src_o     : t_wbs_source_out := cc_dummy_snk_in;
  signal dat_o     : std_logic_vector(g_input_width-1 downto 0);  --(g_input_width-1 downto 0);
  signal dat_i     : std_logic_vector(g_output_width-1 downto 0);  --(g_output_width-1 downto 0);
  signal busy_i    : std_logic;
  signal valid_o   : std_logic;
  signal valid_i   : std_logic;
  signal ce_core_o : std_logic;

  -- auxiliar signals

  signal snk_i_tgd_s : std_logic_vector(c_INPUT_WIDTH-1 downto 0);
  signal snk_i_dat_s : std_logic_vector(c_INPUT_WIDTH-1 downto 0);
  signal snk_i_adr_s : std_logic_vector(c_INPUT_WIDTH-1 downto 0);

  signal ce_counter      : natural   := 0;  -- count number of ce events
  signal ce_core_counter : natural   := 0;
  signal valid_out       : std_logic := '0';

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component wb_stream_wrapper is
    generic (
      g_input_width   : natural;
      g_output_width  : natural;
      g_tgd_width     : natural;
      g_adr_width     : natural;
      g_ce_core       : natural);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      ce_i      : in  std_logic;
      snk_i     : in  t_wbs_sink_in    := cc_dummy_snk_in;
      snk_o     : out t_wbs_sink_out   := cc_dummy_src_in;
      src_i     : in  t_wbs_source_in  := cc_dummy_src_in;
      src_o     : out t_wbs_source_out := cc_dummy_snk_in;
      dat_o     : out std_logic_vector(g_input_width-1 downto 0);
      dat_i     : in  std_logic_vector(g_output_width-1 downto 0);
      busy_i    : in  std_logic;
      valid_o   : out std_logic;
      valid_i   : in  std_logic;
      ce_core_o : out std_logic);
  end component wb_stream_wrapper;

  component ce_gen is
    generic (
      g_clk_num : positive);
    port (
      clk_i : in  std_ulogic;
      rst_i : in  std_ulogic;
      ce_o  : out std_ulogic);
  end component ce_gen;

begin  -- architecture behavior

  -----------------------------------------------------------------------------
  -- Processes and Procedures
  -----------------------------------------------------------------------------
  
  p_clk_gen (
    clk    => clk,
    c_FREQ => c_CLK_FREQ);

  p_rst_gen (
    clk      => clk,
    rst      => rst,
    c_CYCLES => 2);

  --p_ce_gen (
  --  clk      => clk,
  --  ce       => ce,
  --  rst      => rst,
  --  c_CYCLES => c_CYCLES_TO_CE);

  p_read_tsv_file_std_logic_vector (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 3,              -- number of inputs
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => clk,
    rst                => rst,
    ce                 => ce,
    req                => wrapper_ready,
    sample(0)          => snk_i_tgd_s,
    sample(1)          => snk_i_adr_s,
    sample(2)          => snk_i_dat_s,
    valid              => valid_out,
    end_of_file        => end_of_file);


  -- purpose: generates snk_i.cyc signal, changing only when EOF happens
  -- type   : sequential
  -- inputs : valid_out, rst
  -- outputs: snk_i.cyc
  cyc_assert : process (valid_out, end_of_file, rst) is
  begin  -- process cyc_assert
    if rst = '1' then
      snk_i.cyc <= '0';
    elsif end_of_file = '1' then
      snk_i.cyc <= '0';
    elsif rising_edge(valid_out) then
      snk_i.cyc <= '1';
    end if;
  end process cyc_assert;


  -- purpose: asserts "src_i.stall" after a determined number of ce cycles 
  -- type   : sequential
  -- inputs : ce, ce, ce_counter
  -- outputs: src_i.stall
  stall_interrupt : process (clk) is
  begin  -- process busy_interrupt
    if rising_edge(clk) then
      if rst = '1' then
        src_i.stall <= '0';
      elsif ce = '1' then               -- rising clock edge
        if ce_counter = 5 then
          src_i.stall <= '1';
        elsif ce_counter = 8 then
          src_i.stall <= '0';
        end if;
        ce_counter <= ce_counter + 1;   -- increments variable
      end if;
    end if;
  end process stall_interrupt;

  -- purpose: Represents the core behavior, in this case an inverter
  -- type   : sequential
  -- inputs : 
  -- outputs: 
  core_process : process (clk, rst) is
  begin
    if rising_edge(clk) then
      if rst = '1' then
        valid_i <= '0';
        busy_i  <= '0';
      elsif (ce_core_o = '1') then
        if valid_o = '1' then
          dat_i   <= not(dat_o);
          valid_i <= '1';
        else
          valid_i <= '0';
        end if;
      end if;
    end if;
  end process core_process;


-----------------------------------------------------------------------------
-- Component instantiation
-----------------------------------------------------------------------------

  cmp_ce_gen : ce_gen
    generic map (
      g_clk_num => c_CYCLES_TO_CE)
    port map (
      clk_i => clk,
      rst_i => rst,
      ce_o  => ce);
-----------------------------------------------------------------------------
-- Combinational logic and other signal atributions
-----------------------------------------------------------------------------

-- Re-size from default input bus size to working bus size
  snk_i.tgd(g_tgd_width-1 downto 0) <= snk_i_tgd_s(g_tgd_width-1 downto 0);

  snk_i.dat(g_input_width-1 downto 0) <= snk_i_dat_s(g_input_width-1 downto 0);
  snk_i.adr(g_adr_width-1 downto 0)   <= snk_i_adr_s(g_adr_width-1 downto 0);

-- As cyc and stb happens always at the same time: 
  snk_i.stb <= snk_i.cyc;

  wrapper_ready <= not(snk_o.stall);

-- component instantiation
  DUT : wb_stream_wrapper
    generic map (
      g_input_width   => g_input_width,
      g_output_width  => g_output_width,
      g_tgd_width     => g_tgd_width,
      g_adr_width     => g_adr_width,
      g_ce_core       => g_ce_core)
    port map (
      clk_i     => clk,
      rst_i     => rst,
      ce_i      => ce,
      snk_i     => snk_i,
      snk_o     => snk_o,
      src_i     => src_i,
      src_o     => src_o,
      dat_o     => dat_o,
      dat_i     => dat_i,
      busy_i    => busy_i,
      valid_o   => valid_o,
      valid_i   => valid_i,
      ce_core_o => ce_core_o);

end architecture behavior;
