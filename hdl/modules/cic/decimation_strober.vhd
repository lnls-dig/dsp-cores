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
use ieee.math_real.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

library work;
use work.dsp_cores_pkg.all;

-------------------------------------------------------------------------------

entity decimation_strober is

  generic (
    g_maxrate   : natural := 2048;
    g_bus_width : natural := 11
    );

  port (
    clk_i    : in  std_logic;
    rst_i    : in  std_logic;
    ce_i     : in  std_logic;
    valid_i  : in  std_logic;
    ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
    strobe_o : out std_logic
    );

end entity decimation_strober;

-------------------------------------------------------------------------------

architecture str of decimation_strober is

  signal count        : unsigned(g_bus_width-1 downto 0) := to_unsigned(0, g_bus_width);
  signal strobe       : std_logic := '0';
  signal count_all    : std_logic := '0';
  signal count_finish : std_logic := '0';

begin  -- architecture str

  p_counting : process(clk_i  )
  begin
    if rising_edge(clk_i  ) then
      if rst_i   = '1' then
        count <= to_unsigned(0, count'length);
      else
        if ce_i = '1' then
          if count_finish = '1' then
            count <= to_unsigned(0, count'length);
          elsif valid_i = '1' then
            count <= count + 1;
          end if;  --count = 0
        end if;  -- ce
      end if;  -- reset
    end if;  -- rising_edge
  end process;

  count_finish <= '1' when count = to_integer(unsigned(ratio_i))-1 and
                  valid_i = '1' else '0';

  p_count_all : process(clk_i  )
  begin
    if rising_edge(clk_i  ) then
      if rst_i   = '1' then
        count_all <= '0';
      else
        if ce_i = '1' then
          if count_finish = '1' then
            count_all <= '1';
          else
            count_all <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

  strobe_o <= count_all;

end architecture str;

-------------------------------------------------------------------------------
