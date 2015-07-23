-------------------------------------------------------------------------------
-- Title      : Wishbone Stream Source
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_source.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-22
-- Last update: 2015-07-23
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Wishbone stream "source" block.
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
-- 2015-07-22  1.0      vfinotti        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.genram_pkg.all;
use work.wb_stream_pkg.all;


entity wb_stream_source is
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
    src_i : in  t_wbs_sink_in;
    src_o : out t_wbs_sink_out;

    -- Decoded & buffered fabric
    addr_i   : out std_logic_vector(g_addr_width-1 downto 0);
    data_i   : out std_logic_vector(g_data_width-1 downto 0);
    tgd_i    : out std_logic_vector(g_tgd_width-1 downto 0);
    dvalid_i : out std_logic;
    busy_o   : in  std_logic
    );

end wb_stream_source;

architecture behavior of wb_stream_source is

  -- Internal signals
  signal ce_data : out std_logic := '0';
  signal stb     : out std_logic := '0';

  -- Creating other input/output registers
  signal r_src_addr_o : out std_logic_vector(g_addr_width-1 downto 0);
  signal r_src_data_o : out std_logic_vector(g_data_width-1 downto 0);
  signal r_src_tgd_o  : out std_logic_vector(g_tgd_width-1 downto 0);

  signal r_cyc : out std_logic := '0';
  
begin

  -- Combinatinal logic
  ce_data <= (dvalid_i and not(stb));
  stb     <= (r_cyc and not(src_i.ack));

  clock_process : process (clk_i, rst_i) is
  begin  -- process clock_process

    if rising_edge(clk_i) then
      if rst_i then
        -- Reset registers
        r_cyc <= '0';

        r_addr_o <= (others => 'X');
        r_data_o <= (others => 'X');
        r_tgd_o  <= (others => 'X');
        
      else
        if (ce_data) then
          r_src_addr_o <= addr_i;
          r_src_data_o <= data_i;
          r_src_tgd_o  <= tgd_i;
        end if;

        if not(stb) then
          cyc = dvalid_i;
          
        end if;
        
      end if;
    end if;
    
  end process clock_process;

  
  -- Connecting outputs
  busy_o <= scr_i.stall;
  
  src_o.stb  <= stb;
  src_o.cyc  <= cyc;
  src_o.data <= data;
  src_o.addr <= addr;
  src_o.tgd  <= tgd;

end behavior;
