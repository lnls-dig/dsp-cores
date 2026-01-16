-------------------------------------------------------------------------------
-- Title      : Strobe generator
-- Project    :
-------------------------------------------------------------------------------
-- File       : decimation_strober.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2016-05-05
-- Last update:
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Generates one strobe every ratio_i times valid_i is asserted
-------------------------------------------------------------------------------
-- Copyright (c) 2016
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-05-05  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity decimation_strober is

  generic (
    -- Maximum rate
    g_maxrate   : natural := 2048;

    -- Dummy generic. Kept for compatibility.
    g_bus_width : natural := 11
    );
  port (
    -- Clock
    clk_i    : in  std_logic;

    -- Reset
    rst_i    : in  std_logic;

    -- Clock enable (for clock gating purposes)
    ce_i     : in  std_logic;

    -- Valid
    -- If ce_i = '1', ratio_i cycles of valid_i = '1' produces a pulse in strobe
    valid_i  : in  std_logic;

    -- Ratio
    ratio_i  : in  std_logic_vector(integer(ceil(log2(real(g_maxrate))))-1 downto 0);

    -- Strobe
    strobe_o : out std_logic
  );

end entity decimation_strober;

architecture beh of decimation_strober is

  constant c_bus_width : natural := integer(ceil(log2(real(g_maxrate))));
  signal count        : unsigned(ratio_i'range) := to_unsigned(0, ratio_i'length);
  signal strobe       : std_logic := '0';
  signal count_all    : std_logic := '0';

begin

  p_counting : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        count <= to_unsigned(0, count'length);
        count_all <= '0';
      else
        if ce_i = '1' then
          if valid_i = '1' then
            count <= count + 1;
            count_all <= '0';

            if count = unsigned(ratio_i)-1 then
              count <= to_unsigned(0, count'length);
              count_all <= '1';
            end if;
          -- count_all must be asserted for 1 CE cycle only
          else
            count_all <= '0';
          end if; -- valid_i
        end if;  -- ce
      end if;  -- reset
    end if;  -- rising_edge
  end process;

  strobe_o <= count_all;

end architecture beh;
