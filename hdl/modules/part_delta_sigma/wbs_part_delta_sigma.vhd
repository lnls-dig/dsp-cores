-------------------------------------------------------------------------------
-- Title      : Partial Delta_Sigma Calculator - Wishbone Stream version
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wbs_part_delta_sigma.vhd
-- Author     : Vitor Finotti Ferreira  <vfinotti@finotti-Inspiron-7520>
-- Company    : Brazilian Synchrotron Light Laboratory, LNLS/CNPEM
-- Created    : 2015-08-17
-- Last update: 2015-09-02
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Module "part_delta_sigma" wrapped by an wishbone stream wrapper
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
-- 2015-08-17  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

library work;
use work.wb_stream_pkg.all;

-------------------------------------------------------------------------------

entity wbs_part_delta_sigma is

  generic (
    g_input_width  : natural := 64;
    g_output_width : natural := 64;
    g_tgd_width    : natural := 4;
    g_adr_width    : natural := 4;
    g_ce_core      : natural := 5;
    g_pipe_depth   : natural := 1;
    -- core specific parameters
    g_width        : natural := 16;
    g_k_width      : natural := 16);

  port (
    clk_i : in  std_logic;
    rst_i : in  std_logic;
    ce_i  : in  std_logic;
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;
    src_i : in  t_wbs_source_in;
    src_o : out t_wbs_source_out);

end entity wbs_part_delta_sigma;

architecture behavior of wbs_part_delta_sigma is

  -----------------------------------------------------------------------------
  -- Signal declarations
  -----------------------------------------------------------------------------

  -- Global signals
  signal s_clk : std_ulogic := '0';     -- clock signal
  signal s_rst : std_ulogic := '1';     -- reset signal
  signal s_ce  : std_ulogic := '0';     -- clock enable

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  -- component ports
  signal s_snk_i     : t_wbs_sink_in    := cc_dummy_snk_in;
  signal s_snk_o     : t_wbs_sink_out   := cc_dummy_src_in;
  signal s_src_i     : t_wbs_source_in  := cc_dummy_src_in;
  signal s_src_o     : t_wbs_source_out := cc_dummy_snk_in;
  signal s_dat_o     : std_logic_vector(g_input_width-1 downto 0);
  signal s_dat_i     : std_logic_vector(g_output_width-1 downto 0);
  signal s_busy_i    : std_logic;
  signal s_valid_o   : std_logic;
  signal s_valid_i   : std_logic;
  signal s_ce_core_o : std_logic;

  signal r_valid_o, r_valid_i : std_logic := '0';

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  constant c_kx   : std_logic_vector(g_k_width-1 downto 0) := ((g_k_width-1) => '0', others => '1');  --"011111111111111111111111";
  constant c_ky   : std_logic_vector(g_k_width-1 downto 0) := ((g_k_width-1) => '0', others => '1');
  constant c_ksum : std_logic_vector(g_k_width-1 downto 0) := ((g_k_width-1) => '0', others => '1');

  --signal clock     : std_logic := '0';
  --signal endoffile : bit       := '0';
  --signal ce        : std_logic := '0';
  --signal reset     : std_logic := '0';
  --signal valid     : std_logic := '0';
  --signal valid_out : std_logic := '0';

  signal s_a, s_b, s_c, s_d                   : std_logic_vector(g_width-1 downto 0);
  signal s_x_out, s_y_out, s_q_out, s_sum_out : std_logic_vector(g_width-1 downto 0);

  -----------------------------------------------------------------------------
  -- Component declarations
  -----------------------------------------------------------------------------

  component wb_stream_wrapper is
    generic (
      g_input_width  : natural;
      g_output_width : natural;
      g_tgd_width    : natural;
      g_adr_width    : natural;
      g_ce_core      : natural;
      g_pipe_depth   : natural);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      ce_i      : in  std_logic;
      snk_i     : in  t_wbs_sink_in;
      snk_o     : out t_wbs_sink_out;
      src_i     : in  t_wbs_source_in;
      src_o     : out t_wbs_source_out;
      dat_o     : out std_logic_vector;
      dat_i     : in  std_logic_vector;
      busy_i    : in  std_logic;
      valid_o   : out std_logic;
      valid_i   : in  std_logic;
      ce_core_o : out std_logic);
  end component wb_stream_wrapper;

  component part_delta_sigma is
    generic (
      g_width   : natural;
      g_k_width : natural);
    port (
      a_i     : in  std_logic_vector(g_width-1 downto 0);
      b_i     : in  std_logic_vector(g_width-1 downto 0);
      c_i     : in  std_logic_vector(g_width-1 downto 0);
      d_i     : in  std_logic_vector(g_width-1 downto 0);
      kx_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i    : in  std_logic_vector(g_k_width-1 downto 0);
      ksum_i  : in  std_logic_vector(g_k_width-1 downto 0);
      clk_i   : in  std_logic;
      ce_i    : in  std_logic;
      valid_i : in  std_logic;
      valid_o : out std_logic;
      rst_i   : in  std_logic;
      x_o     : out std_logic_vector(g_width-1 downto 0);
      y_o     : out std_logic_vector(g_width-1 downto 0);
      q_o     : out std_logic_vector(g_width-1 downto 0);
      sum_o   : out std_logic_vector(g_width-1 downto 0));
  end component part_delta_sigma;

begin  -- architecture behavior

  -----------------------------------------------------------------------------
  -- Processes and Procedures
  -----------------------------------------------------------------------------

  -- purpose: process to set and reset the register r_valid_o
  -- type   : sequential
  -- inputs : clk
  -- outputs: 
  valid_o_process : process (s_clk) is
  begin  -- process valid_o_process
    if rising_edge(s_clk) then
    if s_rst = '1' then
      r_valid_o <= '0';
    else
      if (s_valid_o = '1' and s_busy_i = '0') then
        r_valid_o <= '1';
      elsif (s_ce_core_o = '1') then
        r_valid_o <= '0';
      end if;
    end if;
  end if;
  end process valid_o_process;

  -- purpose: process to set and reset the register r_valid_i
  -- type   : sequential
  -- inputs : s_clk, s
  -- outputs: 
  valid_i_process : process (s_clk) is
  begin  -- process valid_i_process
    if rising_edge(s_clk) then
    if s_rst = '1' then
      r_valid_i <= '0';
    else
      if (s_valid_i = '1') then
        r_valid_i <= '1';
      -- s_busy_i <= '0';
      elsif (s_ce = '1') then
        r_valid_i <= '0';
      end if;
    end if;
  end if;
  end process valid_i_process;

  -- purpose: process to assert "s_busy_i"
  -- type   : sequential
  -- inputs : s_clk
  -- outputs: 
  s_busy_process : process (s_clk) is
  begin  -- process s_busy_process
    --if rising_edge(s_clk) then
      if s_rst = '1' then
        s_busy_i <= '0';
      elsif (r_valid_i = '1') then
        s_busy_i <= '0';
      elsif (r_valid_o = '1') then
        s_busy_i <= '1';
      end if;
   -- end if;
  end process s_busy_process;

  -----------------------------------------------------------------------------
  -- Combinational logic and other signal atributions
  -----------------------------------------------------------------------------

  -- Conversion between data types and connecting internal ports and signals
  s_a <= s_dat_o(g_width-1 downto 0);
  s_b <= s_dat_o(g_width*2-1 downto g_width);
  s_c <= s_dat_o(g_width*3-1 downto g_width*2);
  s_d <= s_dat_o(g_width*4-1 downto g_width*3);

  s_dat_i(g_width-1 downto 0)           <= s_x_out;
  s_dat_i(g_width*2-1 downto g_width)   <= s_y_out;
  s_dat_i(g_width*3-1 downto g_width*2) <= s_q_out;
  s_dat_i(g_width*4-1 downto g_width*3) <= s_sum_out;

  --s_busy_i <= not(s_valid_i);
  --s_busy_i <= '0';

  -- Connecting external ports and signals
  s_clk   <= clk_i;
  s_rst   <= rst_i;
  s_ce    <= ce_i;
  s_snk_i <= snk_i;
  snk_o   <= s_snk_o;
  s_src_i <= src_i;
  src_o   <= s_src_o;


  -----------------------------------------------------------------------------
  -- Port Maps
  -----------------------------------------------------------------------------

  wrapper : wb_stream_wrapper
    generic map (
      g_input_width  => g_input_width,
      g_output_width => g_output_width,
      g_tgd_width    => g_tgd_width,
      g_adr_width    => g_adr_width,
      g_ce_core      => g_ce_core,
      g_pipe_depth   => g_pipe_depth)
    port map (
      clk_i     => s_clk,
      rst_i     => s_rst,
      ce_i      => s_ce,
      snk_i     => s_snk_i,
      snk_o     => s_snk_o,
      src_i     => s_src_i,
      src_o     => s_src_o,
      -- ports connected to core
      dat_o     => s_dat_o,
      dat_i     => s_dat_i,
      busy_i    => s_busy_i,
      valid_o   => s_valid_o,
      valid_i   => r_valid_i,
      ce_core_o => s_ce_core_o);

  core : part_delta_sigma
    generic map (
      g_width   => g_width,
      g_k_width => g_k_width)
    port map (
      a_i     => s_a,
      b_i     => s_b,
      c_i     => s_c,
      d_i     => s_d,
      kx_i    => c_kx,
      ky_i    => c_ky,
      ksum_i  => c_ksum,
      clk_i   => s_clk,
      rst_i   => s_rst,
      ce_i    => s_ce_core_o,
      valid_i => r_valid_o,
      valid_o => s_valid_i,
      x_o     => s_x_out,
      y_o     => s_y_out,
      q_o     => s_q_out,
      sum_o   => s_sum_out);



end architecture behavior;
