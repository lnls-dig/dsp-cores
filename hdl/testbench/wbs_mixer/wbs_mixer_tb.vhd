-------------------------------------------------------------------------------
-- Title      :  Testbench for design "wbs_mixer"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_mixer_tb.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-20
-- Last update: 2015-08-26
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
-- Date        Version  Author          Description
-- 2015-08-20  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.wb_stream_pkg.all;
use work.test_pkg.all;

-------------------------------------------------------------------------------

entity wbs_mixer_tb is
end entity wbs_mixer_tb;

architecture test of wbs_mixer_tb is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------

  -- Test_pkg constants
  constant c_CLK_FREQ        : real    := 100.0e6;  -- input clock frequency
  constant c_CYCLES_TO_RESET : natural := 4;  -- number of clock cycles before reset
  constant c_CYCLES_TO_CE    : natural := 20;  -- number of clock cycles before reset

  constant c_INPUT_FILE  : string   := "input.samples";
  constant c_INPUT_WIDTH : positive := 32;  -- width of input data

  constant c_OUTPUT_FILE  : string   := "output.samples";
  constant c_OUTPUT_WIDTH : positive := 64;

  -- Test_pkg signals
  signal s_wbs_ready                       : std_ulogic;  -- negated snk_o.stall
  signal s_snk_adr, s_snk_tgd, s_snk_dat_0 : signed(c_INPUT_WIDTH-1 downto 0);
  signal s_src_adr, s_src_tgd, s_src_dat_0 : signed(c_OUTPUT_WIDTH-1 downto 0) := (others => '0');
  signal s_end_of_file                     : std_ulogic;

  -- component generics
  constant g_input_width  : natural := 16;  -- input of internal data bus
  constant g_output_width : natural := 64;
  constant g_tgd_width    : natural := 10;
  constant g_adr_width    : natural := 4;
  constant g_ce_core      : natural := 5;
  constant g_pipe_depth   : natural := 11;

  constant g_sin_file         : string  := "./dds_sin.nif";
  constant g_cos_file         : string  := "./dds_cos.nif";
  constant g_number_of_points : natural := 35;
  constant g_dds_width        : natural := 16;
  constant g_mult_levels      : natural := 7;

  -- component ports
  signal s_clk   : std_logic        := '0';
  signal s_rst   : std_logic        := '1';
  signal s_ce    : std_logic        := '0';
  signal s_snk_i : t_wbs_sink_in    := cc_dummy_snk_in;
  signal s_snk_o : t_wbs_sink_out   := cc_dummy_src_in;
  signal s_src_i : t_wbs_source_in  := cc_dummy_src_in;
  signal s_src_o : t_wbs_source_out := cc_dummy_snk_in;

  -- auxiliar signals
  signal s_valid_out_procedure : std_logic := '0';  -- output of the procedure
  signal s_valid_out           : std_logic := '0';  -- output of procedure, but turns 0
  -- one clock after file ends
  signal s_valid_new           : std_logic := '0';  -- shows that src data output is new
  signal s_ce_counter          : natural   := 0;  -- count number of ce events

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component wbs_mixer is
    generic (
      g_input_width      : natural;
      g_output_width     : natural;
      g_tgd_width        : natural;
      g_adr_width        : natural;
      g_ce_core          : natural;
      g_pipe_depth       : natural;
      -- core specific parameters
      g_sin_file         : string;
      g_cos_file         : string;
      g_number_of_points : natural;
      g_dds_width        : natural;
      g_mult_levels      : natural);
    port (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
      snk_i : in  t_wbs_sink_in;
      snk_o : out t_wbs_sink_out;
      src_i : in  t_wbs_source_in;
      src_o : out t_wbs_source_out);
  end component wbs_mixer;


begin  -- architecture test

  -----------------------------------------------------------------------------
  -- Processes and Procedures
  -----------------------------------------------------------------------------

  p_clk_gen (
    clk    => s_clk,
    c_FREQ => c_CLK_FREQ);

  p_rst_gen (
    clk      => s_clk,
    rst      => s_rst,
    c_CYCLES => c_CYCLES_TO_RESET);

  p_ce_gen (
    clk      => s_clk,
    ce       => s_ce,
    rst      => s_rst,
    c_CYCLES => c_CYCLES_TO_CE);

  p_read_tsv_file_signed (
    c_INPUT_FILE_NAME  => c_INPUT_FILE,
    c_SAMPLES_PER_LINE => 3,              -- number of inputs
    c_OUTPUT_WIDTH     => c_INPUT_WIDTH,  --input for the testbench, output for
                                          --the procedure
    clk                => s_clk,
    rst                => s_rst,
    ce                 => s_ce,
    req                => s_wbs_ready,
    sample(0)          => s_snk_tgd,
    sample(1)          => s_snk_adr,
    sample(2)          => s_snk_dat_0,
    -- sample(3)          => y,
    valid              => s_valid_out_procedure,
    end_of_file        => s_end_of_file);

  p_write_tsv_file_signed (
    c_OUTPUT_FILE_NAME => c_OUTPUT_FILE,
    c_SAMPLES_PER_LINE => 3,
    c_OUTPUT_WIDTH     => c_OUTPUT_WIDTH,
    clk                => s_clk,
    rst                => s_rst,
    ce                 => s_ce,
    sample(0)          => s_src_tgd,
    sample(1)          => s_src_adr,
    sample(2)          => s_src_dat_0,
    -- sample(3)          => s_src_dat_0(g_input_width-1 downto g_input_width/2),
    valid              => s_src_o.cyc,
    end_of_file        => s_end_of_file);


  -- purpose: generates snk_i.cyc signal, changing only when EOF happens
  -- type   : sequential
  -- inputs : valid_out, rst
  -- outputs: snk_i.cyc
  cyc_assert : process (s_clk, s_rst) is
  begin  -- process cyc_assert
    if rising_edge(s_clk) then
      if s_rst = '1' then
        s_snk_i.cyc <= '0';
      elsif (s_end_of_file = '1') and (s_snk_o.stall = '0') and (s_ce = '1') then
        s_snk_i.cyc <= '0';
      elsif (s_valid_out = '1') then
        s_snk_i.cyc <= '1';
      end if;
    end if;
  end process cyc_assert;

  -- purpose: asserts "src_i.stall" after a determined number of ce cycles 
  -- type   : sequential
  -- inputs : ce, ce, ce_counter
  -- outputs: src_i.stall
  stall_interrupt : process (s_clk, s_rst) is
  begin  -- process busy_interrupt
    if rising_edge(s_clk) then
      if s_rst = '1' then
        s_src_i.stall <= '0';
      elsif s_ce = '1' then                -- rising clock edge
        if s_ce_counter = 5 then
          s_src_i.stall <= '0';
        elsif s_ce_counter = 8 then
          s_src_i.stall <= '0';
        end if;
        s_ce_counter <= s_ce_counter + 1;  -- increments variable
      end if;
    end if;
  end process stall_interrupt;

  -- purpose: Changes valid_out to zero after EOF of procedure read
  -- type   : sequential
  -- inputs : clk, rst
  -- outputs: 
  valid_out_process : process (s_clk, s_valid_out_procedure) is
  begin  -- process valid_out_procedure
    if s_rst = '1' then
      s_valid_out <= '0';
    elsif s_end_of_file = '0' then
      s_valid_out <= s_valid_out_procedure;
    else
      s_valid_out <= '0';
    end if;
  end process valid_out_process;


  -----------------------------------------------------------------------------
  -- Combinational logic and other signal atributions
  -----------------------------------------------------------------------------

  -- As cyc and stb happens always at the same time: 
  s_snk_i.stb <= s_snk_i.cyc;

  s_wbs_ready <= not(s_snk_o.stall);

  -- convert size of procedure "read" to proper size
  s_snk_i.tgd(g_tgd_width-1 downto 0)   <= std_logic_vector(s_snk_tgd(g_tgd_width-1 downto 0));
  s_snk_i.adr(g_adr_width-1 downto 0)   <= std_logic_vector(s_snk_adr(g_adr_width-1 downto 0));
  s_snk_i.dat(g_input_width-1 downto 0) <= std_logic_vector(s_snk_dat_0(g_input_width-1 downto 0));  -- x data
  -- s_snk_i.dat(g_input_width-1 downto g_input_width/2) <= std_logic_vector(y);  -- y data

  s_src_dat_0(g_output_width-1 downto 0) <= signed(s_src_o.dat(g_output_width-1 downto 0));
  -- s_src_dat_0(g_output_width/2-1 downto 0) <= signed(s_src_o.dat(g_output_width-1 downto g_output_width/2));

  s_src_tgd(g_tgd_width-1 downto 0) <= signed(s_src_o.tgd(g_tgd_width-1 downto 0));
  s_src_adr(g_adr_width-1 downto 0) <= signed(s_src_o.adr(g_adr_width-1 downto 0));

  -- component instantiation
  DUT : wbs_mixer
    generic map (
      g_input_width  => g_input_width,
      g_output_width => g_output_width,
      g_tgd_width    => g_tgd_width,
      g_adr_width    => g_adr_width,
      g_ce_core      => g_ce_core,
      g_pipe_depth   => g_pipe_depth,

      g_sin_file         => g_sin_file,
      g_cos_file         => g_cos_file,
      g_number_of_points => g_number_of_points,
      g_dds_width        => g_dds_width,
      g_mult_levels      => g_mult_levels)
    port map (
      clk_i => s_clk,
      rst_i => s_rst,
      ce_i  => s_ce,
      snk_i => s_snk_i,
      snk_o => s_snk_o,
      src_i => s_src_i,
      src_o => s_src_o);  

end architecture test;
