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
    clock_i  : in  std_logic;
    reset_i  : in  std_logic;
    ce_i     : in  std_logic;
    valid_i  : in  std_logic;
    ratio_i  : in  std_logic_vector(g_bus_width-1 downto 0);
    strobe_o : out std_logic
    );

end entity decimation_strober;

-------------------------------------------------------------------------------

architecture str of decimation_strober is

    signal zeroed : std_logic := '0';

begin  -- architecture str

  counting : process(clock_i)
    variable count : natural := 0;
  begin
    if rising_edge(clock_i) then
      if reset_i = '1' then
        count := to_integer(unsigned(ratio_i))-1;
      else
        if ce_i = '1' then
          zeroed <= '0';
          if count = 0 then
            count  := to_integer(unsigned(ratio_i))-1;
            zeroed <= '1';
          elsif valid_i = '1' then
            count  := count - 1;
            zeroed <= '0';
          end if;  --count = 0
        end if;  -- ce
      end if;  -- reset
    end if;  -- rising_edge
  end process;

  strobe_o <= zeroed;

end architecture str;

-------------------------------------------------------------------------------
