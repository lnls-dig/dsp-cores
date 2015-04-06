-------------------------------------------------------------------------------
-- Title      : Position calc testbench
-- Project    :
-------------------------------------------------------------------------------
-- File       : position_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-28
-- Last update: 2015-04-02
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

library work;
use work.dsp_cores_pkg.all;

entity position_tb is
end entity position_tb;

architecture test of position_tb is

  constant c_input_freq : real := 122.804e6*2.0;  -- double the ADC freq
  constant clock_period : time := 1.0 sec / (2.0 * c_input_freq);

  constant c_input_width  : natural := 16;
  constant c_mixed_width  : natural := 32;
  constant c_output_width : natural := 32;
  constant c_k_width      : natural := 24;

  constant c_ksum : std_logic_vector(c_k_width-1 downto 0) :=
    std_logic_vector(to_signed(1, c_k_width));
  constant c_kx : std_logic_vector(c_k_width-1 downto 0) :=
    std_logic_vector(to_signed(1e6, c_k_width));
  constant c_ky : std_logic_vector(c_k_width-1 downto 0) :=
    std_logic_vector(to_signed(1e6, c_k_width));


  signal clock     : std_logic := '0';
  signal ce_adc    : std_logic;
  signal ce_tbt    : std_logic;
  signal ce_fofb   : std_logic;
  signal adc_data  : std_logic_vector(c_input_width-1 downto 0);
  signal endoffile : bit       := '0';
  signal reset     : std_logic := '1';
  signal clr       : std_logic := '0';

  signal a, b, c, d : std_logic_vector(c_input_width-1 downto 0);

  -- Debug signals
  signal mix_ch0_i, mix_ch0_q : std_logic_vector(c_mixed_width-1 downto 0);

-- tbt debug
  signal tbt_ch0_i, tbt_ch0_q : std_logic_vector(c_output_width-1 downto 0);

  signal x_tbt_out, y_tbt_out, q_tbt_out, sum_tbt_out :
    std_logic_vector(c_output_width-1 downto 0);

  signal a_tbt_out, b_tbt_out, c_tbt_out, d_tbt_out :
    std_logic_vector(c_output_width-1 downto 0);

--fofb debug
  signal fofb_ch0_i, fofb_ch0_q : std_logic_vector(c_output_width-1 downto 0);

  signal x_fofb_out, y_fofb_out, q_fofb_out, sum_fofb_out :
    std_logic_vector(c_output_width-1 downto 0);

  signal a_fofb_out, b_fofb_out, c_fofb_out, d_fofb_out :
    std_logic_vector(c_output_width-1 downto 0);


  --function for writing 4 signals to file

  procedure p_out_file(file out_file :    text;
                       a_i           : in signed;
                       b_i           : in signed;
                       c_i           : in signed;
                       d_i           : in signed) is

    variable a, b, c, d : integer;
    variable cur_line   : line;
  begin

    a := to_integer(a_i);
    write(cur_line, a);

    write(cur_line, string'(" "));

    b := to_integer(b_i);
    write(cur_line, b);

    write(cur_line, string'(" "));

    c := to_integer(c_i);
    write(cur_line, c);

    write(cur_line, string'(" "));

    d := to_integer(d_i);
    write(cur_line, d);

    write(cur_line, string'(" "));

    writeline(out_file, cur_line);

  end procedure p_out_file;


  component position_nosysgen is
    port (
      adc_ch0_i : in std_logic_vector(15 downto 0);
      adc_ch1_i : in std_logic_vector(15 downto 0);
      adc_ch2_i : in std_logic_vector(15 downto 0);
      adc_ch3_i : in std_logic_vector(15 downto 0);

      clk : in std_logic;
      clr : in std_logic;

      del_sig_div_fofb_thres_i  : in std_logic_vector(25 downto 0);
      del_sig_div_monit_thres_i : in std_logic_vector(25 downto 0);
      del_sig_div_tbt_thres_i   : in std_logic_vector(25 downto 0);

      ksum_i : in std_logic_vector(23 downto 0);
      kx_i   : in std_logic_vector(23 downto 0);
      ky_i   : in std_logic_vector(23 downto 0);

      dds_config_valid_ch0_i : in std_logic;
      dds_config_valid_ch1_i : in std_logic;
      dds_config_valid_ch2_i : in std_logic;
      dds_config_valid_ch3_i : in std_logic;
      dds_pinc_ch0_i         : in std_logic_vector(29 downto 0);
      dds_pinc_ch1_i         : in std_logic_vector(29 downto 0);
      dds_pinc_ch2_i         : in std_logic_vector(29 downto 0);
      dds_pinc_ch3_i         : in std_logic_vector(29 downto 0);
      dds_poff_ch0_i         : in std_logic_vector(29 downto 0);
      dds_poff_ch1_i         : in std_logic_vector(29 downto 0);
      dds_poff_ch2_i         : in std_logic_vector(29 downto 0);
      dds_poff_ch3_i         : in std_logic_vector(29 downto 0);

      adc_ch0_dbg_data_o : out std_logic_vector(15 downto 0);
      adc_ch1_dbg_data_o : out std_logic_vector(15 downto 0);
      adc_ch2_dbg_data_o : out std_logic_vector(15 downto 0);
      adc_ch3_dbg_data_o : out std_logic_vector(15 downto 0);

      bpf_ch0_o : out std_logic_vector(31 downto 0);
      bpf_ch1_o : out std_logic_vector(31 downto 0);
      bpf_ch2_o : out std_logic_vector(31 downto 0);
      bpf_ch3_o : out std_logic_vector(31 downto 0);

      mix_ch0_i_o : out std_logic_vector(31 downto 0);
      mix_ch0_q_o : out std_logic_vector(31 downto 0);
      mix_ch1_i_o : out std_logic_vector(31 downto 0);
      mix_ch1_q_o : out std_logic_vector(31 downto 0);
      mix_ch2_i_o : out std_logic_vector(31 downto 0);
      mix_ch2_q_o : out std_logic_vector(31 downto 0);
      mix_ch3_i_o : out std_logic_vector(31 downto 0);
      mix_ch3_q_o : out std_logic_vector(31 downto 0);

      tbt_decim_ch0_i_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch0_q_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch1_i_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch1_q_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch2_i_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch2_q_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch3_i_o : out std_logic_vector(31 downto 0);
      tbt_decim_ch3_q_o : out std_logic_vector(31 downto 0);
      tbt_amp_ch0_o     : out std_logic_vector(31 downto 0);
      tbt_amp_ch1_o     : out std_logic_vector(31 downto 0);
      tbt_amp_ch2_o     : out std_logic_vector(31 downto 0);
      tbt_amp_ch3_o     : out std_logic_vector(31 downto 0);
      tbt_pha_ch0_o     : out std_logic_vector(31 downto 0);
      tbt_pha_ch1_o     : out std_logic_vector(31 downto 0);
      tbt_pha_ch2_o     : out std_logic_vector(31 downto 0);
      tbt_pha_ch3_o     : out std_logic_vector(31 downto 0);

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

      monit_amp_ch0_o : out std_logic_vector(31 downto 0);
      monit_amp_ch1_o : out std_logic_vector(31 downto 0);
      monit_amp_ch2_o : out std_logic_vector(31 downto 0);
      monit_amp_ch3_o : out std_logic_vector(31 downto 0);

      x_tbt_o         : out std_logic_vector(31 downto 0);
      x_tbt_valid_o   : out std_logic;
      y_tbt_o         : out std_logic_vector(31 downto 0);
      y_tbt_valid_o   : out std_logic;
      q_tbt_o         : out std_logic_vector(31 downto 0);
      q_tbt_valid_o   : out std_logic;
      sum_tbt_o       : out std_logic_vector(31 downto 0);
      sum_tbt_valid_o : out std_logic;

      x_fofb_o         : out std_logic_vector(31 downto 0);
      x_fofb_valid_o   : out std_logic;
      y_fofb_o         : out std_logic_vector(31 downto 0);
      y_fofb_valid_o   : out std_logic;
      q_fofb_o         : out std_logic_vector(31 downto 0);
      q_fofb_valid_o   : out std_logic;
      sum_fofb_o       : out std_logic_vector(31 downto 0);
      sum_fofb_valid_o : out std_logic;

      x_monit_o         : out std_logic_vector(31 downto 0);
      x_monit_valid_o   : out std_logic;
      y_monit_o         : out std_logic_vector(31 downto 0);
      y_monit_valid_o   : out std_logic;
      q_monit_o         : out std_logic_vector(31 downto 0);
      q_monit_valid_o   : out std_logic;
      sum_monit_o       : out std_logic_vector(31 downto 0);
      sum_monit_valid_o : out std_logic;

      clk_ce_1_o     : out std_logic;
      clk_ce_2_o     : out std_logic;
      clk_ce_tbt_o   : out std_logic;
      clk_ce_monit_o : out std_logic;
      clk_ce_fofb_o  : out std_logic);
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

      if clock_count > 0 then
        clock_count := clock_count - 1;
      else
        reset <= '0';
      end if;
    end if;
  end process;

  adc_read : process(clock)
    file adc_file                   : text open read_mode is "position_in.samples";
    variable cur_line               : line;
    variable a_in, b_in, c_in, d_in : integer;
    variable count                  : integer := 0;
  begin
    if rising_edge(clock) then

      if ce_adc = '1' then
        if not endfile(adc_file) then

          readline(adc_file, cur_line);

          read(cur_line, a_in);
          a <= std_logic_vector(to_signed(a_in, c_input_width));

          read(cur_line, b_in);
          b <= std_logic_vector(to_signed(b_in, c_input_width));

          read(cur_line, c_in);
          c <= std_logic_vector(to_signed(c_in, c_input_width));

          read(cur_line, d_in);
          d <= std_logic_vector(to_signed(d_in, c_input_width));

        else
          endoffile <= '1';

          a <= (others => '0');
          b <= (others => '0');
          c <= (others => '0');
          d <= (others => '0');
          
        end if;
      end if;
    end if;
  end process adc_read;

  uut : position_nosysgen
    port map (
      adc_ch0_i => a,
      adc_ch1_i => b,
      adc_ch2_i => c,
      adc_ch3_i => d,

      clk => clock,
      clr => reset,

      del_sig_div_fofb_thres_i  => (others => '0'),
      del_sig_div_monit_thres_i => (others => '0'),
      del_sig_div_tbt_thres_i   => (others => '0'),

      ksum_i => c_ksum,
      kx_i   => c_kx,
      ky_i   => c_ky,

      dds_config_valid_ch0_i => '0',
      dds_config_valid_ch1_i => '0',
      dds_config_valid_ch2_i => '0',
      dds_config_valid_ch3_i => '0',
      dds_pinc_ch0_i         => (others => '0'),
      dds_pinc_ch1_i         => (others => '0'),
      dds_pinc_ch2_i         => (others => '0'),
      dds_pinc_ch3_i         => (others => '0'),
      dds_poff_ch0_i         => (others => '0'),
      dds_poff_ch1_i         => (others => '0'),
      dds_poff_ch2_i         => (others => '0'),
      dds_poff_ch3_i         => (others => '0'),

      adc_ch0_dbg_data_o => open,
      adc_ch1_dbg_data_o => open,
      adc_ch2_dbg_data_o => open,
      adc_ch3_dbg_data_o => open,

      bpf_ch0_o => open,
      bpf_ch1_o => open,
      bpf_ch2_o => open,
      bpf_ch3_o => open,

      mix_ch0_i_o        => mix_ch0_i,
      mix_ch0_q_o        => mix_ch0_q,
      mix_ch1_i_o        => open,
      mix_ch1_q_o        => open,
      mix_ch2_i_o        => open,
      mix_ch2_q_o        => open,
      mix_ch3_i_o        => open,
      mix_ch3_q_o        => open,
      tbt_decim_ch0_i_o  => tbt_ch0_i,
      tbt_decim_ch0_q_o  => tbt_ch0_q,
      tbt_decim_ch1_i_o  => open,
      tbt_decim_ch1_q_o  => open,
      tbt_decim_ch2_i_o  => open,
      tbt_decim_ch2_q_o  => open,
      tbt_decim_ch3_i_o  => open,
      tbt_decim_ch3_q_o  => open,
      tbt_amp_ch0_o      => a_tbt_out,
      tbt_amp_ch1_o      => b_tbt_out,
      tbt_amp_ch2_o      => c_tbt_out,
      tbt_amp_ch3_o      => d_tbt_out,
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
      fofb_amp_ch0_o     => a_fofb_out,
      fofb_amp_ch1_o     => b_fofb_out,
      fofb_amp_ch2_o     => c_fofb_out,
      fofb_amp_ch3_o     => d_fofb_out,
      fofb_pha_ch0_o     => open,
      fofb_pha_ch1_o     => open,
      fofb_pha_ch2_o     => open,
      fofb_pha_ch3_o     => open,
      monit_amp_ch0_o    => open,
      monit_amp_ch1_o    => open,
      monit_amp_ch2_o    => open,
      monit_amp_ch3_o    => open,
      x_tbt_o            => x_tbt_out,
      x_tbt_valid_o      => open,
      y_tbt_o            => y_tbt_out,
      y_tbt_valid_o      => open,
      q_tbt_o            => q_tbt_out,
      q_tbt_valid_o      => open,
      sum_tbt_o          => sum_tbt_out,
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
      clk_ce_tbt_o       => ce_tbt,
      clk_ce_monit_o     => open,
      clk_ce_fofb_o      => ce_fofb);


  signal_write : process(clock)
    file mixed_file         : text open write_mode is "mixed_out.samples";
    file tbt_file           : text open write_mode is "tbt_out.samples";
    file tbt_position_file  : text open write_mode is "tbt_position_out.samples";
    file tbt_amp_file       : text open write_mode is "tbt_amp_out.samples";
    file fofb_file          : text open write_mode is "fofb_out.samples";
    file fofb_position_file : text open write_mode is "position_out.samples";
    file fofb_amp_file      : text open write_mode is "fofb_amp_out.samples";

    variable cur_line       : line;
    variable x, y, q, sum   : integer;
    variable mix_i, mix_q   : signed(c_mixed_width-1 downto 0);
    variable fofb_i, fofb_q : integer;

  begin
    if rising_edge(clock) then

      -- fofb
      if ce_fofb = '1' then
        if(endoffile = '0') then


          p_out_file(fofb_position_file,
                     signed(x_fofb_out),
                     signed(y_fofb_out),
                     signed(q_fofb_out),
                     signed(sum_fofb_out));

          p_out_file(fofb_file,
                     signed(fofb_ch0_i),
                     signed(fofb_ch0_q),
                     (c_mixed_width-1 downto 0 => '0'),
                     (c_mixed_width-1 downto 0 => '0'));

          
          p_out_file(fofb_amp_file,
                     signed(a_fofb_out),
                     signed(b_fofb_out),
                     signed(c_fofb_out),
                     signed(d_fofb_out));

        else
          assert (false) report "Input file finished." severity failure;
        end if;
      end if;

      -- undecimated mixed
      if ce_adc = '1' then

        p_out_file(mixed_file, signed(mix_ch0_i), signed(mix_ch0_q),
                   (c_mixed_width-1 downto 0 => '0'),
                   (c_mixed_width-1 downto 0 => '0'));

      end if;

      -- turn by turn
      if ce_tbt = '1' then

        p_out_file(tbt_file, signed(tbt_ch0_i), signed(tbt_ch0_q),
                   (c_mixed_width-1 downto 0 => '0'),
                   (c_mixed_width-1 downto 0 => '0'));

        p_out_file(tbt_amp_file, signed(a_tbt_out), signed(b_tbt_out),
                   signed(c_tbt_out), signed(d_tbt_out));

        
        p_out_file(tbt_position_file, signed(x_tbt_out), signed(y_tbt_out),
                   (c_mixed_width-1 downto 0 => '0'),
                   (c_mixed_width-1 downto 0 => '0'));

      end if;
    end if;
    
  end process signal_write;

end architecture test;

