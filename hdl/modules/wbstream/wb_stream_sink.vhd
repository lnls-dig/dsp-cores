-------------------------------------------------------------------------------
-- Title      : Wishbone Stream Sink
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_sink.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-27
-- Last update: 2015-08-21
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

-- use work.genram_pkg.all;
use work.wb_stream_pkg.all;


entity wb_stream_sink is
  generic(
    g_dat_width : natural := 32;
    g_adr_width : natural := 4;
    g_tgd_width : natural := 4
    );

  port (
    clk_i : in std_logic;
    rst_i : in std_logic;
    ce_i  : in std_logic;

    -- Wishbone Fabric Interface I/O
    snk_i : in  t_wbs_sink_in  := cc_dummy_snk_in;
    snk_o : out t_wbs_sink_out := cc_dummy_src_in;

    -- Decoded & buffered fabric
    adr_o     : out std_logic_vector(g_adr_width-1 downto 0);
    dat_o     : out std_logic_vector(g_dat_width-1 downto 0);
    tgd_o     : out std_logic_vector(g_tgd_width-1 downto 0);
    dvalid_o  : out std_logic;
    busy_i    : in  std_logic;
    ce_core_i : in  std_logic
    );

end wb_stream_sink;

architecture behavior of wb_stream_sink is

  -- Internal signals
  signal update_out : std_logic := '0';

  -- Creating other input/output registers
  signal r_snk_ack_o   : std_logic := '0';
  signal r_snk_stall_o : std_logic := '0';

  signal r_adr_o                    : std_logic_vector(g_adr_width-1 downto 0);
  signal r_dat_o                    : std_logic_vector(g_dat_width-1 downto 0);
  signal r_tgd_o                    : std_logic_vector(g_tgd_width-1 downto 0);
  signal r_dvalid_o_0, r_dvalid_o_1 : std_logic := '0';

  signal r_mid_adr : std_logic_vector(g_adr_width-1 downto 0);
  signal r_mid_dat : std_logic_vector(g_dat_width-1 downto 0);
  signal r_mid_tgd : std_logic_vector(g_tgd_width-1 downto 0);
  signal r_mid     : std_logic := '0';

begin

  -- Combinatinal logic
  --update_out <= (snk_i.cyc and snk_i.stb and not (busy_i));
  -- update_out <= ((snk_i.cyc and snk_i.stb) or r_mid) and not (busy_i);
  update_out <= (snk_i.cyc or r_mid) and not (busy_i);

  clock_process : process(clk_i) is
  begin  -- process clock_process

    if rising_edge(clk_i) then
      if rst_i = '1' then
        -- Reset registers;

        r_snk_ack_o   <= '0';
        r_snk_stall_o <= '0';

        r_adr_o <= (others => '0');
        r_dat_o <= (others => '0');

        r_tgd_o <= (others => '0');

        r_mid_adr <= (others => '0');
        r_mid_dat <= (others => '0');
        r_mid_tgd <= (others => '0');
        r_mid     <= '0';

      -- Writing outputs  
      else
        if (ce_i = '1') then
          r_snk_stall_o <= busy_i;
          r_snk_ack_o   <= update_out and (snk_i.cyc); -- Condition to only set
          -- ack when new data is received

          if (update_out = '1') then
            if (r_snk_stall_o = '1') then  -- recovering from "stall"
              r_adr_o <= r_mid_adr;
              r_dat_o <= r_mid_dat;
              r_tgd_o <= r_mid_tgd;
              r_mid   <= '0';              -- data in middle registers was used
            else                           -- normal operation
              r_adr_o(g_adr_width-1 downto 0) <= snk_i.adr(g_adr_width-1 downto 0);

              r_dat_o(g_dat_width-1 downto 0) <= snk_i.dat(g_dat_width-1 downto 0);

              r_tgd_o(g_tgd_width-1 downto 0) <= snk_i.tgd(g_tgd_width-1 downto 0);
            end if;
          end if;

          -- Storing temporarily inputs
          if (r_snk_stall_o = '0' and busy_i = '1') then
            r_mid_adr(g_adr_width-1 downto 0) <= snk_i.adr(g_adr_width-1 downto 0);

            r_mid_dat(g_dat_width-1 downto 0) <= snk_i.dat(g_dat_width-1 downto 0);

            r_mid_tgd(g_tgd_width-1 downto 0) <= snk_i.tgd(g_tgd_width-1 downto 0);
            r_mid                             <= '1';  -- represents valid data on middle registers
          end if;

        -- Pass data if cyc and stb = '0' bus middle registers have data
        end if;  -- ce_i
      end if;
    end if;  -- clk_i
    
  end process clock_process;


  -- purpose: Process that allows sink and core to run with different "ce"
  -- type   : sequential
  -- inputs : (ce_i, ce_core_i), rst_i, ce_core_i, busy_i, update_out
  -- outputs: r_dvalid_o
  dvalid_logic : process (clk_i, rst_i) is
  begin  -- process dvalid_logic
    if rising_edge(clk_i) then
      if rst_i = '1' then               -- asynchronous reset (active high)
        r_dvalid_o_0 <= '0';
      elsif (ce_i = '1') and (busy_i = '0') then  -- assert valid/invalid data
        
        r_dvalid_o_0 <= r_dvalid_o_1;   -- normal operation
        
      elsif (ce_core_i = '1') and (busy_i = '0') then  -- consume data
        r_dvalid_o_0 <= '0';
      end if;
      r_dvalid_o_1 <= update_out;
    end if;  -- clk_i
  end process dvalid_logic;

  -- Connecting outputs
  snk_o.ack   <= r_snk_ack_o;
  snk_o.stall <= r_snk_stall_o;

  adr_o    <= r_adr_o;
  dat_o    <= r_dat_o;
  tgd_o    <= r_tgd_o;
  dvalid_o <= r_dvalid_o_0;

end behavior;
