-------------------------------------------------------------------------------
-- Title      : Testbench for design "wbs_cordic_iter"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_cordic_iter_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-06
-- Last update: 2015-08-10
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
-- 2015-08-06  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.wb_stream_pkg.all;
use work.test_pkg.all;

-------------------------------------------------------------------------------

entity wbs_cordic_iter_tb is
end entity wbs_cordic_iter_tb;

architecture test of wbs_cordic_iter_tb is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------

  -- Test_pkg constants
  constant c_CLK_FREQ        : real    := 100.0e6;  -- input clock frequency
  constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset
  constant c_CYCLES_TO_CE    : natural := 20;  -- number of clock cycles before reset

  constant c_INPUT_FILE  : string   := "input.samples";
  constant c_INPUT_WIDTH : positive := 32;

  -- Test_pkg signals
  signal wbs_ready                              : std_ulogic;  -- negated snk_o.stall
  signal sample_0, sample_1, sample_2, sample_3 : std_logic_vector(c_INPUT_WIDTH-1 downto 0);
  signal end_of_file                            : std_ulogic;

  -- component generics
  constant g_input_width   : natural := 64;
  constant g_output_width  : natural := 64;
  constant g_tgd_width     : natural := 4;
  constant g_adr_width     : natural := 4;
  --constant g_input_depth   : natural := 2;
  --constant g_output_depth  : natural := 2;
  constant g_input_buffer  : natural := 4;
  constant g_output_buffer : natural := 2;
  constant g_ce_core       : natural := 5;

  -- component ports
  signal clk   : std_logic := '0';
  signal rst   : std_logic := '1';
  signal ce    : std_logic := '0';
  signal snk_i : t_wbs_sink_in;
  signal snk_o : t_wbs_sink_out;
  signal src_i : t_wbs_source_in;
  signal src_o : t_wbs_source_out;

  -- auxiliar signals
  signal valid_out_procedure : std_logic := '0';  -- output of the procedure
  signal valid_out           : std_logic := '0';  -- output of procedure, but turns 0
                                                  -- one clock after file ends
  signal ce_counter          : natural   := 0;    -- count number of ce events

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component wbs_cordic_iter is
    generic (
      g_input_width   : natural;
      g_output_width  : natural;
      g_tgd_width     : natural;
      g_adr_width     : natural;
      --g_input_depth   : natural;
      --g_output_depth  : natural;
      g_input_buffer  : natural;
      g_output_buffer : natural;
      g_ce_core       : natural);
    port (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
      snk_i : in  t_wbs_sink_in;
      snk_o : out t_wbs_sink_out;
      src_i : in  t_wbs_source_in;
      src_o : out t_wbs_source_out);
  end component wbs_cordic_iter;


begin  -- architecture test

  -----------------------------------------------------------------------------
  -- Processes and Procedures
  -----------------------------------------------------------------------------

  p_clk_gen (
    clk    => clk,
    c_FREQ => c_CLK_FREQ);

  p_rst_gen (
    clk      => clk,
    rst      => rst,
    c_CYCLES => c_CYCLES_TO_RESET);

  p_ce_gen (
    clk      => clk,
    ce       => ce,
    rst      => rst,
    c_CYCLES => c_CYCLES_TO_CE);

  p_read_tsv_file_std_logic_vector (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 4,              -- number of inputs
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => clk,
    rst                => rst,
    ce                 => ce,
    req                => wbs_ready,
    sample(0)          => sample_0,
    sample(1)          => sample_1,
    sample(2)          => sample_2,
    sample(3)          => sample_3,
    valid              => valid_out_procedure,
    end_of_file        => end_of_file);


  -- purpose: generates snk_i.cyc signal, changing only when EOF happens
  -- type   : sequential
  -- inputs : valid_out, rst
  -- outputs: snk_i.cyc
  cyc_assert : process (clk, rst) is
  begin  -- process cyc_assert
    if rising_edge(clk) then
      if rst = '1' then
        snk_i.cyc <= '0';
      elsif (end_of_file = '1') and (snk_o.stall = '0') and (ce = '1') then
        snk_i.cyc <= '0';
      elsif (valid_out = '1') then
        snk_i.cyc <= '1';
      end if;
    end if;
  end process cyc_assert;

  -- purpose: asserts "src_i.stall" after a determined number of ce cycles 
  -- type   : sequential
  -- inputs : ce, ce, ce_counter
  -- outputs: src_i.stall
  stall_interrupt : process (clk, rst) is
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

  -- purpose: Changes valid_out to zero after EOF of procedure read
  -- type   : sequential
  -- inputs : clk, rst
  -- outputs: 
  valid_out_process : process (clk, valid_out_procedure) is
  begin  -- process valid_out_procedure
    if rst = '1' then
      valid_out <= '0';
    elsif end_of_file = '0' then
      valid_out <= valid_out_procedure;
    else
      valid_out <= '0';
    end if;
  end process valid_out_process;
  -----------------------------------------------------------------------------
  -- Combinational logic and other signal atributions
  -----------------------------------------------------------------------------

  -- As cyc and stb happens always at the same time: 
  snk_i.stb <= snk_i.cyc;

  wbs_ready <= not(snk_o.stall);

  -- convert size of procedure "read" to proper size
  snk_i.tgd(g_tgd_width-1 downto 0)                    <= sample_0(g_tgd_width-1 downto 0);
  snk_i.adr(g_adr_width-1 downto 0)                    <= sample_1(g_adr_width-1 downto 0);
  snk_i.dat(g_input_width/2-1 downto 0)              <= sample_2;  -- x data
  snk_i.dat(g_input_width-1 downto g_input_width/2) <= sample_3;  -- y data

  -- component instantiation
  DUT : wbs_cordic_iter
    generic map (
      g_input_width   => g_input_width,
      g_output_width  => g_output_width,
      g_tgd_width     => g_tgd_width,
      g_adr_width     => g_adr_width,
      --g_input_depth   => g_input_depth,
      --g_output_depth  => g_output_depth,
      g_input_buffer  => g_input_buffer,
      g_output_buffer => g_output_buffer,
      g_ce_core       => g_ce_core)
    port map (
      clk_i => clk,
      rst_i => rst,
      ce_i  => ce,
      snk_i => snk_i,
      snk_o => snk_o,
      src_i => src_i,
      src_o => src_o);  

end architecture test;
