-------------------------------------------------------------------------------
-- Title      : Wishbone Packet Fabric buffered packet sink
-- Project    : WR Cores Collection
-------------------------------------------------------------------------------
-- File       : xwb_fabric_sink.vhd
-- Author     : Tomasz Wlostowski
-- Company    : CERN BE-CO-HT
-- Created    : 2012-01-16
-- Last update: 2015-07-23
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A simple WB packet streaming sink with builtin FIFO buffer.
-- Outputs a trivial interface (start-of-packet, end-of-packet, data-valid)
-------------------------------------------------------------------------------
--
-- Copyright (c) 2011 CERN
--
-- This source file is free software; you can redistribute it
-- and/or modify it under the terms of the GNU Lesser General
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any
-- later version.
--
-- This source is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
-- PURPOSE.  See the GNU Lesser General Public License for more
-- details.
--
-- You should have received a copy of the GNU Lesser General
-- Public License along with this source; if not, download it
-- from http://www.gnu.org/licenses/lgpl-2.1.html
--
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2011-01-16  1.0      twlostow        Created
-------------------------------------------------------------------------------
-- Modified by Lucas Russo <lucas.russo@lnls.br>
-- Modified by Gustavo Bruno <gustavo.bruno@lnls.br>
-- Modified by Vitor Finotti Ferreira <vitor.ferreira@lnls.br>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.genram_pkg.all;
use work.wb_stream_pkg.all;


entity wb_stream_sink is
  generic(
    g_data_width   : natural := 32;
    g_addr_width   : natural := 4;
    g_tgd_width    : natural := 4;
    g_buffer_depth : natural := 4
    );

  port (
    clk_i : in std_logic;
    rst_i : in std_logic;

    -- Wishbone Fabric Interface I/O
    snk_i : in  t_wbs_sink_in;
    snk_o : out t_wbs_sink_out;

    -- Decoded & buffered fabric
    addr_o   : out std_logic_vector(g_addr_width-1 downto 0);
    data_o   : out std_logic_vector(g_data_width-1 downto 0);
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

  signal r_addr_o : out std_logic_vector(g_addr_width-1 downto 0);
  signal r_data_o : out std_logic_vector(g_data_width-1 downto 0);
  signal r_tgd_o  : out std_logic_vector(g_tgd_width-1 downto 0);


begin

  -- Combinatinal logic
  ack         <= (snk_i.cyc and snk_i.stb and not (busy_i));
  snk_o.stall <= busy_i;
  dvalid_o    <= r_snk_ack_o;

  clock_process : process (clk_i, rst_i) is
  begin  -- process clock_process

    if rising_edge(clk_i) then
      if rst_i then
        -- Reset registers
        r_snk_ack_o <= '0';

        r_addr_o <= (others => 'X');
        r_data_o <= (others => 'X');
        r_tgd_o  <= (others => 'X');
        
      elsif (ack) then
        r_snk_ack_o < = '1';

        r_addr_o <= snk_i.addr;
        r_data_o <= snk_i.data;
        r_tgd_o  <= snk_i.tgd;
      end if;
    end if;
    
  end process clock_process;

  -- Connecting outputs
  snk_o.ack <= r_snk_ack_o;

end behavior;
