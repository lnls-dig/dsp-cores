-------------------------------------------------------------------------------
-- Title      : CIC testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File	      : cic_bench.vhd
-- Author     : aylons	<aylons@LNLS190>
-- Company    : 
-- Created    : 2014-03-10
-- Last update: 2014-03-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testbench for generic CIC filter
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date	       Version	Author	Description
-- 2014-03-10  1.0	aylons	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

-------------------------------------------------------------------------------

entity cic_bench is
end entity cic_bench;


architecture str of cic_bench is

  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------
  constant c_input_freq	     : real    := 1.1742939e08;
  constant c_clock_period    : time    := 1.0 sec /(2.0*c_input_freq);
  constant c_cycles_to_reset : natural := 4;

  signal clock	 : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal ce	 : std_logic := '1';

  constant c_input_width     : natural := 24;
  constant c_output_width    : natural := 32;
  constant c_diff_delay	     : natural := 4;
  constant c_stages	     : natural := 1;
  constant c_decimation_rate : natural := 1000;
  constant c_bus_width	     : natural := natural(ceil(log2(real(c_decimation_rate))));

  signal data_in   : std_logic_vector(c_input_width-1 downto 0) := (others => '0');
  signal data_out  : std_logic_vector(c_output_width-1 downto 0);
  signal cic_valid : std_logic;
  signal endoffile : std_logic := '0';

  component cic_dyn is
    generic (
      g_input_width  : natural;
      g_output_width : natural;
      g_stages	     : natural;
      g_delay	     : natural;
      g_max_rate     : natural;
      g_bus_width    : natural);
    port (
      clock_i	: in  std_logic;
      reset_n_i : in  std_logic;
      ce_i	: in  std_logic;
      data_i	: in  std_logic_vector(g_input_width-1 downto 0);
      ratio_i	: in  std_logic_vector(natural(ceil(log2(real(g_max_rate))))-1 downto 0);
      data_o	: out std_logic_vector(g_output_width-1 downto 0);
      valid_o	: out std_logic);
  end component cic_dyn;

begin  -- architecture str


  clk_gen : process
  begin
    clock <= '0';
    wait for c_clock_period;
    clock <= '1';
    wait for c_clock_period;
  end process;


  rst_gen : process(clock)
    variable clock_count : natural := c_cycles_to_reset;
  begin
    if rising_edge(clock) and clock_count /= 0 then
      clock_count := clock_count - 1;

      if clock_count = 0 then
	reset_n <= '1';
      end if;

    end if;
  end process;


  input_read : process(clock)
    file data_file    : text open read_mode is "samples.dat";
    variable cur_line : line;
    variable datain   : real;
  begin
    if rising_edge(clock) and reset_n = '1' then
      if not endfile(data_file) then
	readline(data_file, cur_line);
	read(cur_line, datain);
	data_in <= std_logic_vector(to_signed(integer(datain*real(2**c_input_width-1)), c_input_width));
      else
	endoffile <= '1';
      end if;
    end if;
  end process input_read;


  uut : cic_dyn
    generic map (
      g_input_width  => c_input_width,
      g_output_width => c_output_width,
      g_stages	     => c_stages,
      g_delay	     => c_diff_delay,
      g_max_rate     => c_decimation_rate,
      g_bus_width    => c_bus_width)
    port map (
      clock_i	=> clock,
      reset_n_i => reset_n,
      ce_i	=> ce,
      data_i	=> data_in,
      ratio_i	=> std_logic_vector(to_unsigned(c_decimation_rate, c_bus_width)),
      data_o	=> data_out,
      valid_o	=> cic_valid);

  output_write : process(cic_valid)
    file ouput_file   : text open write_mode is "cic_out.dat";
    variable cur_line : line;
    variable data     : integer;
  begin

    if rising_edge(cic_valid) then
      if(endoffile = '0') then
	data := to_integer(signed(data_out));

	write(cur_line, data);
	writeline(ouput_file, cur_line);
      else
	assert (false) report "Input file finished." severity failure;
      end if;
    end if;
  end process output_write;


end architecture str;

-------------------------------------------------------------------------------
