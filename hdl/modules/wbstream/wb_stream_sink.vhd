-------------------------------------------------------------------------------
-- Title      : Wishbone Stream Sink
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_sink.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-27
-- Last update: 2015-07-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A simple WB packet streaming sink.
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
-- Date        Version  Author          Description
-- 2015-07-27  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.genram_pkg.all;
use work.wb_stream_pkg.all;


entity wb_stream_sink is
  generic(
    g_dat_width : natural := 32;
    g_adr_width : natural := 4;
    g_tgd_width : natural := 4;
    );

  port (
    clk_i : in std_logic;
    rst_i : in std_logic;
    ce_i  : in std_logic;

    -- Wishbone Fabric Interface I/O
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;

    -- Decoded & buffered fabric
    addr_o   : out std_logic_vector(g_adr_width-1 downto 0);
    data_o   : out std_logic_vector(g_dat_width-1 downto 0);
    tgd_o    : out std_logic_vector(g_tgd_width-1 downto 0);
    dvalid_o : out std_logic;
    busy_i   : in  std_logic
    );

end wb_stream_sink;

architecture behavior of wb_stream_sink is

  -- Internal signals
  signal ack : out std_logic := '0';

  -- Creating other input/output registers
  signal r_snk_ack_o : out std_logic := '0';
  signal r_snk_stl_o : out std_logic := '0';

  signal r_addr_o   : out std_logic_vector(g_addr_width-1 downto 0);
  signal r_data_o   : out std_logic_vector(g_data_width-1 downto 0);
  signal r_tgd_o    : out std_logic_vector(g_tgd_width-1 downto 0);
  signal r_dvalid_o : out std_logic := '0';

  signal r_mid_addr : out std_logic_vector(g_addr_width-1 downto 0);
  signal r_mid_data : out std_logic_vector(g_data_width-1 downto 0);
  signal r_mid_tgd  : out std_logic_vector(g_tgd_width-1 downto 0);

begin

  -- Combinatinal logic
  en_rd <= (snk_i.cyc and snk_i.stb and not (busy_i));

  clock_process : process (clk_i, rst_i) is
  begin  -- process clock_process

    if rising_edge(clk_i) then
      if rst_i then
        -- Reset registers;

        r_snk_ack_o <= '0';
        r_snk_stl_o <= '0';

        r_addr_o   <= (others => 'X');
        r_data_o   <= (others => 'X');
        r_tgd_o    <= (others => 'X');
        r_dvalid_o <= '0';

        r_mid_addr <= (others => 'X');
        r_mid_data <= (others => 'X');
        r_mid_tgd  <= (others => 'X');

      -- Writing outputs  
      elsif (ce_i) then
        if (rd_en) then
          if (r_snk_stl_o) then
            r_addr_o <= r_mid_addr;
            r_data_o <= r_mid_data;
            r_tgd_o  <= r_mid_tgd;
          else
            r_addr_o <= snk_i.addr;
            r_data_o <= snk_i.data;
            r_tgd_o  <= snk_i.tgd;
          end if;
        end if;

        -- Storing temporary inputs
        if (not (stall) and busy_i) then
          r_mid_addr_o <= snk_i.adr;
          r_mid_data_o <= snk_i.dat;
          r_mid_tgd_o  <= snk_i.tgd;
        end if;

        -- assert valid/invalid data
        if not(busy_i) then
          r_dvalid_o <= en_rd;
        end if;
      end if;
    end if;

    -- Connecting outputs
    snk_o.ack <= en_rd;
    snk_o.stl <= busy_i;
  end process clock_process;

end behavior;
