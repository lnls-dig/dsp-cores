-------------------------------------------------------------------------------
-- Title      : Useful functions for testbenches
-- Project    :
-------------------------------------------------------------------------------
-- File       : test_pkg.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2015-05-07
-- Last update: 2015-11-30
-- Last update: 2015-07-15
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This package contains useful functions and procedures for
-- testbenches: clock, reset and ce generators, data reader and writer from
-- files, etc...>
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
-- Date        Version  Author  Description
-- 2015-05-07  1.0      aylons  Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

package test_pkg is

-- generate basic clock signals : clock and clock enable
  procedure p_clk_gen(signal clk      : out std_ulogic;
                      constant c_FREQ :     real);

  procedure p_ce_gen(signal clk        : in  std_ulogic;
                     signal ce         : out std_ulogic;
                     signal rst        : in  std_ulogic;
                     constant c_CYCLES :     positive);

  procedure p_rst_gen(signal clk        : in  std_ulogic;
                      signal rst        : out std_ulogic;
                      constant c_CYCLES :     positive);

  procedure p_pwm_gen(signal clk           : in  std_ulogic;
                      signal rst           : in  std_ulogic;
                      signal pwm           : out std_ulogic;
                      constant c_on_CYCLE  :     positive;
                      constant c_off_CYCLE :     positive);

-- Read and write integer data from/to TSV, easily read/written by Octave:
  type array_signed is array(natural range <>) of signed;

  procedure p_read_tsv_file_signed (
    constant c_INPUT_FILE_NAME  :     string;
    constant c_SAMPLES_PER_LINE :     positive;
    constant c_OUTPUT_WIDTH     :     positive;
    signal clk                  : in  std_ulogic;
    signal rst                  : in  std_ulogic;
    signal ce                   : in  std_ulogic;
    signal req                  : in  std_ulogic;
    signal sample               : out array_signed;
    signal valid                : out std_ulogic;
    signal end_of_file          : out std_ulogic);

  procedure p_write_tsv_file_signed (
    constant c_OUTPUT_FILE_NAME :    string;
    constant c_SAMPLES_PER_LINE :    positive;
    constant c_OUTPUT_WIDTH     :    positive;
    signal clk                  : in std_ulogic;
    signal rst                  : in std_ulogic;
    signal ce                   : in std_ulogic;
    signal sample               : in array_signed;
    signal valid                : in std_ulogic;
    signal end_of_file          : in std_ulogic);

end test_pkg;

package body test_pkg is

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- procedure: clk_gen
  -- Generates clock signal, given any frequency.
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  procedure p_clk_gen(
    signal clk      : out std_ulogic;
    constant c_FREQ :     real) is

    constant c_PERIOD    : time := 1 sec / c_FREQ;          -- Full period
    constant c_HIGH_TIME : time := c_PERIOD / 2;            -- High time
    constant c_LOW_TIME  : time := c_PERIOD - c_HIGH_TIME;  -- Low time; always >= HIGH_TIME
  begin
                                        -- Check the arguments
    assert (c_HIGH_TIME /= 0 fs) report "clk: High time is zero; time resolution to large for frequency" severity failure;
                                        -- Generate a clock cycle
    loop
      clk <= '1';
      wait for c_HIGH_TIME;
      clk <= '0';
      wait for c_LOW_TIME;
    end loop;
  end procedure;
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- procedure: p_rst_gen
  -- Keeps reset up until c_CYCLES clock cycles
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  procedure p_rst_gen (
    signal clk        : in  std_ulogic;
    signal rst        : out std_ulogic;
    constant c_CYCLES :     positive) is

    variable v_cycle_count : natural := c_CYCLES;
  begin  -- procedure p_rst_gen

    loop

      wait until rising_edge(clk);

      if v_cycle_count = 0 then
        rst <= '0';
      else
        v_cycle_count := v_cycle_count -1;
      end if;

    end loop;

  end procedure p_rst_gen;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- procedure: ce_gen
  -- Generates one clock enable signals every c_CYCLES number of clock periods.
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  procedure p_ce_gen (
    signal clk        : in  std_ulogic;
    signal ce         : out std_ulogic;
    signal rst        : in  std_ulogic;
    constant c_CYCLES :     positive) is

    variable ce_count : natural := c_CYCLES;
  begin  -- procedure p_ce_gen

    loop  -- generate one ce every ce_CYCLES clocks

      wait until rising_edge(clk) and rst = '0';
      ce_count := ce_count - 1;

      if ce_count = 0 then
        ce       <= '1';
        ce_count := c_CYCLES;
      else
        ce <= '0';
      end if;

    end loop;

  end procedure p_ce_gen;

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- procedure: pwm_gen
  -- Generates a clock dependent PWM signal with configurable ON and OFF cycles.
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------

  procedure p_pwm_gen(
    signal clk           : in  std_ulogic;
    signal rst           : in  std_ulogic;
    signal pwm           : out std_ulogic;
    constant c_on_CYCLE  :     positive;
    constant c_off_CYCLE :     positive) is

    variable on_count  : natural := c_on_CYCLE;
    variable off_count : natural := c_off_CYCLE;

  begin  -- procedure p_ce_gen

    loop  -- generate one ce every ce_CYCLES clocks

      wait until rising_edge(clk) and rst = '0';

      if on_count > 0 then
        on_count := on_count-1;
        pwm      <= '1';
      elsif off_count > 1 then
        off_count := off_count-1;
        pwm       <= '0';
      else
        on_count  := c_on_CYCLE;
        off_count := c_off_CYCLE;
        pwm       <= '0';
      end if;
    end loop;

  end procedure;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- procedure: p_read_tsv_file_signed
-- Given a file name and clock, output signed vectors representing stimulus
-- in the file.
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
  procedure p_read_tsv_file_signed (
    constant c_INPUT_FILE_NAME  :     string;
    constant c_SAMPLES_PER_LINE :     positive;
    constant c_OUTPUT_WIDTH     :     positive;
    signal clk                  : in  std_ulogic;
    signal rst                  : in  std_ulogic;
    signal ce                   : in  std_ulogic;
    signal req                  : in  std_ulogic;
    signal sample               : out array_signed;
    signal valid                : out std_ulogic;
    signal end_of_file          : out std_ulogic) is

    file input_file   : text open read_mode is c_INPUT_FILE_NAME;
    variable cur_line : line;
    variable input    : integer;

  begin  -- procedure p_read_tsv_file_signed

    end_of_file <= '0';
    valid       <= '0';

    wait until rst = '0';

    loop
      wait until falling_edge(clk) and ce = '1';

      if endfile(input_file) then
        end_of_file <= '1';
      else

        if req = '1' then
          valid <= '1';
          readline(input_file, cur_line);

          for cur_sample in 0 to c_SAMPLES_PER_LINE-1 loop
            read(cur_line, input);
            sample(cur_sample) <= to_signed(input, c_OUTPUT_WIDTH);
          end loop;

        else
          valid <= '0';
        end if;

      end if;

    end loop;

  end procedure p_read_tsv_file_signed;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- procedure: p_write_tsv_file_signed
-- Given a file name and clock, write data from signed vectors to an output
-- file, until end_of_file is set.
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
  procedure p_write_tsv_file_signed (
    constant c_OUTPUT_FILE_NAME :    string;
    constant c_SAMPLES_PER_LINE :    positive;
    constant c_OUTPUT_WIDTH     :    positive;
    signal clk                  : in std_ulogic;
    signal rst                  : in std_ulogic;
    signal ce                   : in std_ulogic;
    signal sample               : in array_signed;
    signal valid                : in std_ulogic;
    signal end_of_file          : in std_ulogic) is


    file output_file  : text open write_mode is c_OUTPUT_FILE_NAME;
    variable cur_line : line;
    variable output   : integer;

  begin  -- procedure p_write_tsv_file_signed

    wait until rst = '0';

    loop

      wait until rising_edge(clk) and ce = '1';

      if valid = '1' then

        for cur_sample in 0 to c_SAMPLES_PER_LINE-1 loop
          output := to_integer(sample(cur_sample));
          write(cur_line, output);
          write(cur_line, ht);
        end loop;

        writeline(output_file, cur_line);

      end if;

      if end_of_file = '1' then
        assert(false) report "End of file signal received" severity failure;
      end if;

    end loop;

  end procedure p_write_tsv_file_signed;

end package body test_pkg;
