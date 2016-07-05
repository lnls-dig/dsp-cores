-------------------------------------------------------------------------------
-- Title      : Clock Enable synchronizer for data/valid signals
-- Project    :
-------------------------------------------------------------------------------
-- File       : ce_synch.vhd
-- Author     : Lucas Russo  <lerwys@gmail.com>
-- Company    :
-- Created    : 2016-05-02
-- Last update: 2016-05-02
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Clock Enable synchronizer for data/valid signals. This modules basically,
--               synchronizes data/valid signals between two clock enable signals.
--               WARNING: This only works if the destination CE signal is slower
--                        than the source CE signal
-------------------------------------------------------------------------------
-- Copyright (c) 2016
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-05-02  1.0      lerwys  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ce_synch is
  generic (
    g_data_width : natural := 16
  );
  port (
    clk_i    : in  std_logic                                   := '0';
    rst_i    : in  std_logic                                   := '0';
    ce_in_i  : in  std_logic                                   := '0';
    valid_i  : in  std_logic                                   := '1';
    data_i   : in  std_logic_vector(g_data_width-1 downto 0)   := (others => '0');
    ce_out_i : in  std_logic                                   := '0';
    data_o   : out std_logic_vector(g_data_width-1 downto 0)   := (others => '0');
    valid_o  : out std_logic                                   := '0'
  );
end entity ce_synch;

architecture rtl of ce_synch is

  signal data_int   : std_logic_vector(g_data_width-1 downto 0)   := (others => '0');
  signal valid_int  : std_logic                                   := '0';

begin

  p_in : process (clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        data_int <= (others => '0');
        valid_int <= '0';
      else
        if ce_in_i = '1' then
--          if valid_i = '1' or ack_out = '1' then
          if valid_i = '1' or ce_out_i = '1' then
            data_int <= data_i;
            valid_int <= valid_i;
          end if;
--        elsif ack_out = '1' then
        elsif ce_out_i = '1' then
          data_int <= (others => '0');
          valid_int <= '0';
        end if;
      end if;
    end if;
  end process;

--  p_out : process (clk_i)
--  begin
--    if rising_edge(clk_i) then
--      if rst_i = '1' then
--        ack_out <= '0';
--      else
--        if ce_out_i = '1' then
--          ack_out <= '1';
--        else
--          ack_out <= '0';
--        end if;
--      end if;
--    end if;
--  end process;

  data_o <= data_int;
  valid_o <= valid_int;

end architecture rtl;
