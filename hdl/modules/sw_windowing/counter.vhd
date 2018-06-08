-------------------------------------------------------------------------------
-- Title      : Window position index counter
-- Project    :
-------------------------------------------------------------------------------
-- File       : counter.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-01-31
-- Last update: 2015-10-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Up/Down for symmetrical window LUT
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-01-31  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity counter is

  generic (
    g_mem_size : natural := 601;
    g_bus_size : natural := 15
    --g_switch_delay : natural := 2
    );
  port (
    clk_i     : in  std_logic;          -- input clock
    ce_i      : in  std_logic;          -- clock enable
    rst_n_i : in  std_logic;          -- reset
    switch_delay_i : in std_logic_vector(15 downto 0);
    switch_en_i : in std_logic;
    switch_o  : out std_logic;
    index_o   : out std_logic_vector(g_bus_size-1 downto 0));  -- Memory address to current
                                                             -- window data

end entity counter;

architecture behavioural of counter is

  -- This is the address of the last sample in a vector with half
  -- the size of the window
  constant last_address : natural := g_mem_size-1;
  signal switch_state   : std_logic := '0';
  signal switch_delay_slice : std_logic_vector(g_bus_size-1 downto 0);

begin  -- architecture behavioural

  counting : process(clk_i)
    variable going_up : boolean := true;
    --variable count    : natural := 0;   -- internal counter
    variable count    : unsigned(g_bus_size-1 downto 0) :=
        to_unsigned(0, g_bus_size);   -- internal counter
  begin
    if rising_edge(clk_i) then
      if rst_n_i = '0' then
        count        := (others => '0');
        going_up     := true;
        switch_state <= '0';
      else
	if ce_i = '1' then
	  if switch_en_i = '0' then
            count        := (others => '0');
            going_up     := true;
            switch_state <= '0';
	  else

            if going_up then
              count := count + 1;

              if count = last_address then
                going_up := false;
              end if;  --count = last_address

              -- toggle switch clock. FIXME: switch_delay_slice
              -- cannot be greater than last_address, otherwise
              -- we will not switch properly
              if count = last_address - unsigned(switch_delay_slice) then
                switch_state <= not switch_state;
              end if;

            else
              --counting down
              count := count - 1;
              if count = to_unsigned(0, g_bus_size) then
                going_up := true;
              end if;  -- count = 0

              --switch N samples before reaches zero
              --if count = g_switch_delay then
              if count = unsigned(switch_delay_slice) then
                switch_state <= not switch_state;
              end if;  -- count = switch_state
            end if;  -- going up

            index_o  <= std_logic_vector(count);
            switch_o <= switch_state;

	  end if; -- switch_en_i
        end if; -- ce
      end if;  -- reset
    end if;  -- rising edge
  end process counting;

  switch_delay_slice <= switch_delay_i(g_bus_size-1 downto 0);

end architecture behavioural;
