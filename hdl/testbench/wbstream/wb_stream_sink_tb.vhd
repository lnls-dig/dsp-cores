-------------------------------------------------------------------------------
-- Title      : Testbench for design "wb_stream_sink"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_sink_tb.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-22
-- Last update: 2015-07-23
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2015     

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
-- 2015-07-22  1.0      finotti Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.wb_stream_pkg.all;
use work.test_pkg.all;

-------------------------------------------------------------------------------

entity wb_stream_sink_tb is

  architecture test of wb_stream_sink_tb is

      -- Test_pkg constants
      constant c_CLK_FREQ : real := 100.0e6;        -- input clock frequency
        constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset
        constant c_CYCLES_TO_CE    : natural := 10;  -- number of clock cycles before reset

        constant c_INPUT_WIDTH    : positive   := 32;
        constant c_OUTPUT_WIDTH   : positive   := 32;
        constant c_INTERNAL_WIDTH : positive   := 38;  -- output_width + log2(c_ITER) +
                                                       -- 2
        -- Test_pkg signals
        signal clk                : std_ulogic := '0';  -- clock signal
        signal rst                : std_ulogic := '1';  -- reset signal
        signal ce                 : std_ulogic := '0';  -- clock enable

        signal valid_in     : std_ulogic;  -- signals valid input data
        signal valid_out    : std_ulogic;  -- signals new valid output
        signal cordic_busy  : std_ulogic;  -- signals cordic not ready for new inputs
        signal cordic_ready : std_ulogic;  -- negated cordic_busy
        signal end_of_file  : std_ulogic;

        -- component generics
        constant g_data_width   : natural := 32;
        constant g_addr_width   : natural := 4;
        constant g_tgd_width    : natural := 4;
        constant g_buffer_depth : natural := 4;

        -- component ports
        signal clk_i    : std_logic;
        signal rst_i    : std_logic;
        signal snk_i    : t_wbs_sink_in;
        signal snk_o    : t_wbs_sink_out;
        signal addr_o   : std_logic_vector(g_addr_width-1 downto 0);
        signal data_o   : std_logic_vector(g_data_width-1 downto 0);
        signal tgd_o    : std_logic_vector(g_tgd_width-1 downto 0);
        signal dvalid_o : std_logic;
        signal busy_i   : std_logic;

    begin  -- architecture test

        p_clk_gen (
            clk      => clk,
              c_FREQ => c_CLK_FREQ);

          p_rst_gen (
              clk        => clk,
                rst      => rst,
                c_CYCLES => 2);

          p_ce_gen (
              clk        => clk,
                ce       => ce,
                rst      => rst,
                c_CYCLES => c_CYCLES_TO_CE);


          p_read_tsv_file_signed (
              c_INPUT_FILE_NAME    => c_INPUT_FILE,
                c_SAMPLES_PER_LINE => 3,              -- number of inputs
                c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                                      --the procedure
                clk                => clk,
                rst                => rst,
                ce                 => clk,
                req                => not_busy,
                sample(0)          => addr,
                sample(1)          => data,
                sample(2)          => tgd,
                valid              => valid_in,
                end_of_file        => end_of_file);

        snk_i. <=
          

          -- component instantiation
          UUT : entity work.wb_stream_sink
              generic map (
                  g_data_width     => g_data_width,
                    g_addr_width   => g_addr_width,
                    g_tgd_width    => g_tgd_width,
                    g_buffer_depth => g_buffer_depth)
              port map (
                  clk_i      => clk_i,
                    rst_i    => rst_i,
                    snk_i    => snk_i,
                    snk_o    => snk_o,
                    addr_o   => addr_o,
                    data_o   => data_o,
                    tgd_o    => tgd_o,
                    dvalid_o => dvalid_o,
                    busy_i   => busy_i);


          -- waveform generation
          WaveGen_Proc : process
            begin
                -- insert signal assignments here

                tset

                    wait until Clk = '1';
              end process WaveGen_Proc;



              end architecture test;

-------------------------------------------------------------------------------

                  configuration wb_stream_sink_tb_test_cfg of wb_stream_sink_tb is
                    for test
                  end for;
                  end wb_stream_sink_tb_test_cfg;

-------------------------------------------------------------------------------

                  end entity wb_stream_sink_tb;

-------------------------------------------------------------------------------
