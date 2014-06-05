-------------------------------------------------------------------------------
-- Title      : Position calc testbench
-- Project    : 
-------------------------------------------------------------------------------
-- File       : position_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-05-28
-- Last update: 2014-06-03
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testes the position calc module
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-05-28  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity position_tb is
end entity position_tb;

architecture test of position_tb is

  constant c_input_freq : real := 120.0e6;
  constant clock_period : time := 1.0 sec / (2.0 * c_input_freq);

  constant c_input_width  : natural := 16;
  constant c_mixed_width  : natural := 24;
  constant c_output_width : natural := 32;

  constant c_ksum : std_logic_vector(c_mixed_width-1 downto 0) :=
    std_logic_vector(to_signed(1, c_mixed_width));
  constant c_kx : std_logic_vector(c_mixed_width-1 downto 0) :=
    std_logic_vector(to_signed(8500000, c_mixed_width));
  constant c_ky : std_logic_vector(c_mixed_width-1 downto 0) :=
    std_logic_vector(to_signed(8500000, c_mixed_width));


  signal clock     : std_logic := '0';
  signal ce_adc    : std_logic;
  signal ce_fofb   : std_logic;
  signal adc_data  : std_logic_vector(c_input_width-1 downto 0);
  signal endoffile : bit       := '0';
  signal reset     : std_logic := '1';
  signal clr       : std_logic := '0';

  signal a, b, c, d : std_logic_vector(c_input_width-1 downto 0);

  -- Debug signals
  signal mix_ch0_i, mix_ch0_q   : std_logic_vector(c_mixed_width-1 downto 0);
  signal fofb_ch0_i, fofb_ch0_q : std_logic_vector(c_output_width-1 downto 0);

  signal x_fofb_out, y_fofb_out, q_fofb_out, sum_fofb_out :
    std_logic_vector(c_output_width-1 downto 0);

  component position_nosysgen is
    port (
      adc_ch0_i          : in  std_logic_vector(15 downto 0);
      adc_ch1_i          : in  std_logic_vector(15 downto 0);
      adc_ch2_i          : in  std_logic_vector(15 downto 0);
      adc_ch3_i          : in  std_logic_vector(15 downto 0);
      clk                : in  std_logic;
      clr                : in  std_logic;
      ksum_i             : in  std_logic_vector(23 downto 0);
      kx_i               : in  std_logic_vector(23 downto 0);
      ky_i               : in  std_logic_vector(23 downto 0);
      mix_ch0_i_o        : out std_logic_vector(23 downto 0);
      mix_ch0_q_o        : out std_logic_vector(23 downto 0);
      mix_ch1_i_o        : out std_logic_vector(23 downto 0);
      mix_ch1_q_o        : out std_logic_vector(23 downto 0);
      mix_ch2_i_o        : out std_logic_vector(23 downto 0);
      mix_ch2_q_o        : out std_logic_vector(23 downto 0);
      mix_ch3_i_o        : out std_logic_vector(23 downto 0);
      mix_ch3_q_o        : out std_logic_vector(23 downto 0);
      tbt_decim_ch0_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch0_q_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch1_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch1_q_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch2_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch2_q_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch3_i_o  : out std_logic_vector(31 downto 0);
      tbt_decim_ch3_q_o  : out std_logic_vector(31 downto 0);
      tbt_amp_ch0_o      : out std_logic_vector(31 downto 0);
      tbt_amp_ch1_o      : out std_logic_vector(31 downto 0);
      tbt_amp_ch2_o      : out std_logic_vector(31 downto 0);
      tbt_amp_ch3_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch0_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch1_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch2_o      : out std_logic_vector(31 downto 0);
      tbt_pha_ch3_o      : out std_logic_vector(31 downto 0);
      fofb_decim_ch0_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch0_q_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch1_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch1_q_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch2_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch2_q_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch3_i_o : out std_logic_vector(31 downto 0);
      fofb_decim_ch3_q_o : out std_logic_vector(31 downto 0);
      fofb_amp_ch0_o     : out std_logic_vector(31 downto 0);
      fofb_amp_ch1_o     : out std_logic_vector(31 downto 0);
      fofb_amp_ch2_o     : out std_logic_vector(31 downto 0);
      fofb_amp_ch3_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch0_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch1_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch2_o     : out std_logic_vector(31 downto 0);
      fofb_pha_ch3_o     : out std_logic_vector(31 downto 0);
      monit_amp_ch0_o    : out std_logic_vector(31 downto 0);
      monit_amp_ch1_o    : out std_logic_vector(31 downto 0);
      monit_amp_ch2_o    : out std_logic_vector(31 downto 0);
      monit_amp_ch3_o    : out std_logic_vector(31 downto 0);
      x_tbt_o            : out std_logic_vector(31 downto 0);
      x_tbt_valid_o      : out std_logic;
      y_tbt_o            : out std_logic_vector(31 downto 0);
      y_tbt_valid_o      : out std_logic;
      q_tbt_o            : out std_logic_vector(31 downto 0);
      q_tbt_valid_o      : out std_logic;
      sum_tbt_o          : out std_logic_vector(31 downto 0);
      sum_tbt_valid_o    : out std_logic;
      x_fofb_o           : out std_logic_vector(31 downto 0);
      x_fofb_valid_o     : out std_logic;
      y_fofb_o           : out std_logic_vector(31 downto 0);
      y_fofb_valid_o     : out std_logic;
      q_fofb_o           : out std_logic_vector(31 downto 0);
      q_fofb_valid_o     : out std_logic;
      sum_fofb_o         : out std_logic_vector(31 downto 0);
      sum_fofb_valid_o   : out std_logic;
      x_monit_o          : out std_logic_vector(31 downto 0);
      x_monit_valid_o    : out std_logic;
      y_monit_o          : out std_logic_vector(31 downto 0);
      y_monit_valid_o    : out std_logic;
      q_monit_o          : out std_logic_vector(31 downto 0);
      q_monit_valid_o    : out std_logic;
      sum_monit_o        : out std_logic_vector(31 downto 0);
      sum_monit_valid_o  : out std_logic;
      clk_ce_1_o         : out std_logic;
      clk_ce_2_o         : out std_logic;
      clk_ce_tbt_o       : out std_logic;
      clk_ce_monit_o     : out std_logic;
      clk_ce_fofb_o      : out std_logic);
  end component position_nosysgen;
  
begin

  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period;
    clock <= '1';
    wait for clock_period;
  end process;

  rst_gen : process(clock)
    variable clock_count : natural := 4;
  begin
    if rising_edge(clock) then

      if clock_count /= 0 then
        clock_count := clock_count - 1;
      else
        reset <= '0';
      end if;
    end if;
  end process;



  adc_read : process(clock)
    file adc_file                   : text open read_mode is "simple_in.samples";
    variable cur_line               : line;
    variable a_in, b_in, c_in, d_in : real;
  begin
    if rising_edge(clock) then

      if ce_adc = '1' then
        if not endfile(adc_file) then
          
          readline(adc_file, cur_line);
          read(cur_line, a_in);
          a <= std_logic_vector(to_signed(integer(a_in*real(2**(c_input_width-1))), c_input_width));
          read(cur_line, b_in);
          b <= std_logic_vector(to_signed(integer(b_in*real(2**(c_input_width-1))), c_input_width));
          read(cur_line, c_in);
          c <= std_logic_vector(to_signed(integer(c_in*real(2**(c_input_width-1))), c_input_width));
          read(cur_line, d_in);
          d <= std_logic_vector(to_signed(integer(d_in*real(2**(c_input_width-1))), c_input_width));
          
        else
          endoffile <= '1';
        end if;
      end if;
    end if;
  end process adc_read;

  uut : position_nosysgen
    port map (
      adc_ch0_i          => a,
      adc_ch1_i          => b,
      adc_ch2_i          => c,
      adc_ch3_i          => d,
      clk                => clock,
      clr                => reset,
      ksum_i             => c_ksum,
      kx_i               => c_kx,
      ky_i               => c_ky,
      mix_ch0_i_o        => mix_ch0_i,
      mix_ch0_q_o        => mix_ch0_q,
      mix_ch1_i_o        => open,
      mix_ch1_q_o        => open,
      mix_ch2_i_o        => open,
      mix_ch2_q_o        => open,
      mix_ch3_i_o        => open,
      mix_ch3_q_o        => open,
      tbt_decim_ch0_i_o  => open,
      tbt_decim_ch0_q_o  => open,
      tbt_decim_ch1_i_o  => open,
      tbt_decim_ch1_q_o  => open,
      tbt_decim_ch2_i_o  => open,
      tbt_decim_ch2_q_o  => open,
      tbt_decim_ch3_i_o  => open,
      tbt_decim_ch3_q_o  => open,
      tbt_amp_ch0_o      => open,
      tbt_amp_ch1_o      => open,
      tbt_amp_ch2_o      => open,
      tbt_amp_ch3_o      => open,
      tbt_pha_ch0_o      => open,
      tbt_pha_ch1_o      => open,
      tbt_pha_ch2_o      => open,
      tbt_pha_ch3_o      => open,
      fofb_decim_ch0_i_o => fofb_ch0_i,
      fofb_decim_ch0_q_o => fofb_ch0_q,
      fofb_decim_ch1_i_o => open,
      fofb_decim_ch1_q_o => open,
      fofb_decim_ch2_i_o => open,
      fofb_decim_ch2_q_o => open,
      fofb_decim_ch3_i_o => open,
      fofb_decim_ch3_q_o => open,
      fofb_amp_ch0_o     => open,
      fofb_amp_ch1_o     => open,
      fofb_amp_ch2_o     => open,
      fofb_amp_ch3_o     => open,
      fofb_pha_ch0_o     => open,
      fofb_pha_ch1_o     => open,
      fofb_pha_ch2_o     => open,
      fofb_pha_ch3_o     => open,
      monit_amp_ch0_o    => open,
      monit_amp_ch1_o    => open,
      monit_amp_ch2_o    => open,
      monit_amp_ch3_o    => open,
      x_tbt_o            => open,
      x_tbt_valid_o      => open,
      y_tbt_o            => open,
      y_tbt_valid_o      => open,
      q_tbt_o            => open,
      q_tbt_valid_o      => open,
      sum_tbt_o          => open,
      sum_tbt_valid_o    => open,
      x_fofb_o           => x_fofb_out,
      x_fofb_valid_o     => open,
      y_fofb_o           => y_fofb_out,
      y_fofb_valid_o     => open,
      q_fofb_o           => q_fofb_out,
      q_fofb_valid_o     => open,
      sum_fofb_o         => sum_fofb_out,
      sum_fofb_valid_o   => open,
      x_monit_o          => open,
      x_monit_valid_o    => open,
      y_monit_o          => open,
      y_monit_valid_o    => open,
      q_monit_o          => open,
      q_monit_valid_o    => open,
      sum_monit_o        => open,
      sum_monit_valid_o  => open,
      clk_ce_1_o         => open,
      clk_ce_2_o         => ce_adc,
      clk_ce_tbt_o       => open,
      clk_ce_monit_o     => open,
      clk_ce_fofb_o      => ce_fofb);




  
  signal_write : process(clock)
    file mixed_file         : text open write_mode is "mixed_out.samples";
    file fofb_file          : text open write_mode is "fofb_out.samples";
    file output_file        : text open write_mode is "position_out.samples";
    variable cur_line       : line;
    variable x, y, q, sum   : integer;
    variable mix_i, mix_q   : integer;
    variable fofb_i, fofb_q : integer;

  begin
    if rising_edge(clock) then
      if ce_fofb = '1' then
        if(endoffile = '0') then
          x := to_integer(unsigned(x_fofb_out));
          write(cur_line, x);

          write(cur_line, string'(" "));

          y := to_integer(signed(y_fofb_out));
          write(cur_line, y);

          write(cur_line, string'(" "));

          q := to_integer(signed(q_fofb_out));
          write(cur_line, q);

          write(cur_line, string'(" "));

          sum := to_integer(signed(sum_fofb_out));
          write(cur_line, sum);

          writeline(output_file, cur_line);

          --FOFB
          fofb_i := to_integer(signed(fofb_ch0_i));
          write(cur_line, fofb_i);

          write(cur_line, string'(" "));

          fofb_q := to_integer(signed(fofb_ch0_q));
          write(cur_line, fofb_q);

          writeline(fofb_file, cur_line);
          
        else
          assert (false) report "Input file finished." severity failure;
        end if;
      end if;
      if ce_adc = '1' then
        -- Write mixed data
        mix_i := to_integer(unsigned(mix_ch0_i));
        write(cur_line, mix_i);

        write(cur_line, string'(" "));

        mix_q := to_integer(unsigned(mix_ch0_q));
        write(cur_line, mix_q);

        writeline(mixed_file, cur_line);
      end if;
    end if;
  end process signal_write;

  
end architecture test;





