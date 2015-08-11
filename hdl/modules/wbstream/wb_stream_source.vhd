-------------------------------------------------------------------------------
-- Title      : Wishbone Stream Source
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_source.vhd
-- Author     : Vitor Finotti Ferreira  <finotti@finotti-Inspiron-7520>
-- Company    : 
-- Created    : 2015-07-22
-- Last update: 2015-08-11
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

use work.wb_stream_pkg.all;


entity wb_stream_source is
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
    src_i : in  t_wbs_source_in  := cc_dummy_src_in;
    src_o : out t_wbs_source_out := cc_dummy_snk_in;

    -- Decoded & buffered fabric
    adr_i    : in  std_logic_vector(g_adr_width-1 downto 0);
    -- dat_i    : in  std_logic_vector(g_dat_width-1 downto 0);
    dat_i    : in  std_logic_vector(g_dat_width-1 downto 0);
    tgd_i    : in  std_logic_vector(g_tgd_width-1 downto 0);
    dvalid_i : in  std_logic;
    busy_o   : out std_logic
    );

end wb_stream_source;

architecture behavior of wb_stream_source is

  -- Internal signals
  signal en_wr : std_logic := '0';

  -- Creating other input/output registers
  signal r_src_adr_o : std_logic_vector(g_adr_width-1 downto 0);
  --signal r_src_dat_o : std_logic_vector(g_dat_width-1 downto 0);
  signal r_src_dat_o : std_logic_vector(g_dat_width-1 downto 0);
  signal r_src_tgd_o : std_logic_vector(g_tgd_width-1 downto 0);
  signal r_src_cyc_o : std_logic := '0';
  signal r_src_stb_o : std_logic := '0';

  signal r_busy_o : std_logic := '0';

  signal r_mid_adr : std_logic_vector(g_adr_width-1 downto 0);
  --signal r_mid_dat : std_logic_vector(g_dat_width-1 downto 0);
  signal r_mid_dat : std_logic_vector(g_dat_width-1 downto 0);
  signal r_mid_tgd : std_logic_vector(g_tgd_width-1 downto 0);
  
begin

  -- Combinatinal logic

  en_wr <= (dvalid_i and not(src_i.stall));

  clock_process : process (clk_i) is
  begin  -- process clock_process

    if rising_edge(clk_i) then
      if rst_i = '1' then
        -- Reset registers;

        r_src_adr_o <= (others => '0');
        r_src_dat_o <= (others => '0');
        r_src_tgd_o <= (others => '0');
        r_src_cyc_o <= '0';
        r_src_stb_o <= '0';

        r_busy_o <= '0';

        r_mid_adr <= (others => '0');
        r_mid_dat <= (others => '0');

        r_mid_tgd <= (others => '0');

      -- Writing outputs  
      elsif (ce_i = '1') then
        r_busy_o <= src_i.stall;

        if (en_wr = '1') then
          if (r_busy_o = '1') then      -- recovering from "busy"
            r_src_adr_o                         <= r_mid_adr;
            r_src_dat_o(g_dat_width-1 downto 0) <= r_mid_dat(g_dat_width-1 downto 0);
            r_src_tgd_o                         <= r_mid_tgd;
          else                          -- normal operation
            r_src_adr_o                         <= adr_i;
            r_src_dat_o(g_dat_width-1 downto 0) <= dat_i(g_dat_width-1 downto 0);
            r_src_tgd_o                         <= tgd_i;
          end if;
        end if;

        -- Storing temporarly inputs
        if (r_busy_o = '0' and src_i.stall = '1') then
          r_mid_adr                         <= adr_i;
          r_mid_dat(g_dat_width-1 downto 0) <= dat_i(g_dat_width-1 downto 0);
          r_mid_tgd                         <= tgd_i;
        end if;

        -- assert cycle/strobe data
        if (src_i.stall = '0') then
          r_src_cyc_o <= en_wr;
          r_src_stb_o <= en_wr;
        end if;
      end if;
    end if;

  end process clock_process;


  -- --purpose: Process that allows source and core to run with different "ce"
  -- --type   : sequential
  -- --inputs : 
  -- --outputs: r_src_o_cyc
  -- --cyc_logic : process (clk_i, rst_i) is
  --begin   process dvalid_logic
  --  if rising_edge(clk_i) then
  --    if rst_i = '1' then                asynchronous reset (active high)
  --      r_src_cyc_o <= '0';
  --    elsif (ce_i = '1') and (busy_i = '0') then   assert valid/invalid data

  --      r_src_cyc_o <= en_wr;             normal operation

  --    elsif (ce_core_i = '1') and (busy_i = '0') then   consume data
  --      r_src_cyc_o <= '0';
  --    r_mid      <= '0';            -- data in middle registers was used
  --    end if;
  --  end if;
  --end process dvalid_logic;

  -- Connecting outputs
  src_o.adr(g_adr_width-1 downto 0) <= r_src_adr_o(g_adr_width-1 downto 0);
  src_o.dat(g_dat_width-1 downto 0) <= r_src_dat_o(g_dat_width-1 downto 0);
  src_o.tgd(g_tgd_width-1 downto 0) <= r_src_tgd_o(g_tgd_width-1 downto 0);
  src_o.cyc                         <= r_src_cyc_o;
  src_o.stb                         <= r_src_stb_o;

  busy_o <= r_busy_o;

end behavior;
