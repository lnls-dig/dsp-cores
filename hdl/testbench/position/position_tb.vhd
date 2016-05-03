-------------------------------------------------------------------------------
-- Title      : Position calc testbench
-- Project    :
-------------------------------------------------------------------------------
-- File       : position_tb.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    :
-- Created    : 2014-05-28
-- Last update: 2015-11-25
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
use work.machine_pkg;

entity position_tb is
end entity position_tb;

architecture test of position_tb is

  constant c_input_freq : real := 2.0*machine_pkg.c_pos_calc_adc_freq;  -- double the ADC freq
  constant clock_period : time := 1.0 sec / (c_input_freq);

  constant c_input_width  : natural := machine_pkg.c_pos_calc_input_width;
  constant c_mixed_width  : natural := machine_pkg.c_pos_calc_mixed_width;
  constant c_output_width : natural := machine_pkg.c_pos_calc_fofb_decim_width;
  constant c_k_width      : natural := machine_pkg.c_pos_calc_k_width;

  --width for IQ output
  constant c_IQ_width : natural := machine_pkg.c_pos_calc_mixed_width;

  constant c_adc_ratio : natural := machine_pkg.c_pos_calc_adc_ratio;

  -- mixer
  constant c_dds_width  : natural := machine_pkg.c_pos_calc_dds_width;
  constant c_dds_points : natural := machine_pkg.c_pos_calc_dds_points;
  constant c_sin_file   : string  := machine_pkg.c_pos_calc_sin_file;
  constant c_cos_file   : string  := machine_pkg.c_pos_calc_cos_file;

  -- CIC setup
  constant c_tbt_cic_delay   : natural := machine_pkg.c_pos_calc_tbt_cic_delay;
  constant c_tbt_cic_stages  : natural := machine_pkg.c_pos_calc_tbt_cic_stages;
  constant c_tbt_ratio       : natural := machine_pkg.c_pos_calc_tbt_ratio;
  constant c_tbt_decim_width : natural := machine_pkg.c_pos_calc_tbt_decim_width;

  constant c_fofb_cic_delay   : natural := machine_pkg.c_pos_calc_fofb_cic_delay;
  constant c_fofb_cic_stages  : natural := machine_pkg.c_pos_calc_fofb_cic_stages;
  constant c_fofb_ratio       : natural := machine_pkg.c_pos_calc_fofb_ratio;  -- ratio between adc and fofb rates
  constant c_fofb_decim_width : natural := machine_pkg.c_pos_calc_fofb_decim_width;

  constant c_monit1_cic_delay  : natural := 1;
  constant c_monit1_cic_stages : natural := 1;
  constant c_monit1_ratio      : natural := natural(floor(sqrt(real(machine_pkg.c_pos_calc_monit1_ratio))));  --ratio between fofb and monit 1
  constant c_monit1_cic_ratio  : positive := machine_pkg.c_pos_calc_monit1_cic_ratio;

  constant c_monit2_cic_delay  : natural := 1;
  constant c_monit2_cic_stages : natural := 1;
  constant c_monit2_ratio      : natural := natural(floor(sqrt(real(machine_pkg.c_pos_calc_monit2_ratio))));  -- ratio between monit 1 and 2
  constant c_monit2_cic_ratio  : positive := machine_pkg.c_pos_calc_monit2_cic_ratio;

  constant c_ksum : std_logic_vector(23 downto 0) :=
    std_logic_vector(to_unsigned(1e8, 24));

  constant c_kx : std_logic_vector(23 downto 0) :=
    std_logic_vector(to_unsigned(1e8, 24));

  constant c_ky : std_logic_vector(23 downto 0) :=
    std_logic_vector(to_unsigned(1e8, 24));


  signal clock     : std_logic := '0';
  signal ce_adc    : std_logic;
  signal ce_tbt    : std_logic;
  signal ce_fofb   : std_logic;
  signal adc_data  : std_logic_vector(c_input_width-1 downto 0);
  signal endoffile : bit       := '0';
  signal reset     : std_logic := '1';
  signal rst       : std_logic := '0';

  signal a, b, c, d : std_logic_vector(c_input_width-1 downto 0);

  -- Debug signals
  signal mix_ch0_i, mix_ch0_q : std_logic_vector(c_mixed_width-1 downto 0);

-- tbt debug
  signal tbt_ch0_i, tbt_ch0_q : std_logic_vector(c_output_width-1 downto 0);

  signal tbt_pos_x_out, tbt_pos_y_out, tbt_pos_q_out, tbt_pos_sum_out :
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


  component position_calc is
    generic (
      g_input_width              : natural;
      g_mixed_width              : natural;
      g_adc_ratio                : natural;
      g_dds_width                : natural;
      g_dds_points               : natural;
      g_sin_file                 : string;
      g_cos_file                 : string;
      g_tbt_cic_delay            : natural;
      g_tbt_cic_stages           : natural;
      g_tbt_ratio                : natural;
      g_tbt_decim_width          : natural;
      g_fofb_cic_delay           : natural;
      g_fofb_cic_stages          : natural;
      g_fofb_ratio               : natural;
      g_fofb_decim_width         : natural;
      g_monit1_cic_delay         : natural;
      g_monit1_cic_stages        : natural;
      g_monit1_ratio             : natural;
      g_monit1_cic_ratio         : positive;
      g_monit2_cic_delay         : natural;
      g_monit2_cic_stages        : natural;
      g_monit2_ratio             : natural;
      g_monit2_cic_ratio         : positive;
      g_monit_decim_width        : natural;
      g_tbt_cordic_stages        : positive;
      g_tbt_cordic_iter_per_clk  : positive;
      g_tbt_cordic_ratio         : positive;
      g_fofb_cordic_stages       : positive;
      g_fofb_cordic_iter_per_clk : positive;
      g_fofb_cordic_ratio        : positive;
      g_k_width                  : natural;
      g_IQ_width                 : natural);
    port (
      adc_ch0_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch1_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch2_i          : in  std_logic_vector(g_input_width-1 downto 0);
      adc_ch3_i          : in  std_logic_vector(g_input_width-1 downto 0);
      clk_i              : in  std_logic;
      rst_i              : in  std_logic;
      ksum_i             : in  std_logic_vector(g_k_width-1 downto 0);
      kx_i               : in  std_logic_vector(g_k_width-1 downto 0);
      ky_i               : in  std_logic_vector(g_k_width-1 downto 0);
      mix_ch0_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch0_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch1_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch1_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch2_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch2_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch3_i_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_ch3_q_o        : out std_logic_vector(g_IQ_width-1 downto 0);
      mix_valid_o        : out std_logic;
      mix_ce_o           : out std_logic;
      tbt_decim_ch0_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch0_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch1_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch1_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch2_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch2_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch3_i_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_ch3_q_o  : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_decim_valid_o  : out std_logic;
      tbt_decim_ce_o     : out std_logic;
      tbt_amp_ch0_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch1_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch2_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_ch3_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_amp_valid_o    : out std_logic;
      tbt_amp_ce_o       : out std_logic;
      tbt_pha_ch0_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch1_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch2_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_ch3_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pha_valid_o    : out std_logic;
      tbt_pha_ce_o       : out std_logic;
      fofb_decim_ch0_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch0_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch1_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch1_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch2_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch2_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch3_i_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_ch3_q_o : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_decim_valid_o : out std_logic;
      fofb_decim_ce_o    : out std_logic;
      fofb_amp_ch0_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch1_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch2_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_ch3_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_amp_valid_o   : out std_logic;
      fofb_amp_ce_o      : out std_logic;
      fofb_pha_ch0_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch1_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch2_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_ch3_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pha_valid_o   : out std_logic;
      fofb_pha_ce_o      : out std_logic;
      monit_amp_ch0_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_ch1_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_ch2_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_ch3_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_amp_valid_o  : out std_logic;
      monit_amp_ce_o     : out std_logic;
      tbt_pos_x_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_y_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_q_o        : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_sum_o      : out std_logic_vector(g_tbt_decim_width-1 downto 0);
      tbt_pos_valid_o    : out std_logic;
      tbt_pos_ce_o       : out std_logic;
      fofb_pos_x_o       : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_y_o       : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_q_o       : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_sum_o     : out std_logic_vector(g_fofb_decim_width-1 downto 0);
      fofb_pos_valid_o   : out std_logic;
      fofb_pos_ce_o      : out std_logic;
      monit_pos_x_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_y_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_q_o      : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_sum_o    : out std_logic_vector(g_monit_decim_width-1 downto 0);
      monit_pos_valid_o  : out std_logic;
      monit_pos_ce_o     : out std_logic);
  end component position_calc;

begin

  clk_gen : process
  begin
    clock <= '0';
    wait for clock_period/2.0;
    clock <= '1';
    wait for clock_period/2.0;
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
        if not(endfile(adc_file)) then

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

  uut : position_calc
    generic map(
      g_input_width             => c_input_width,
      g_mixed_width             => c_mixed_width,
      g_adc_ratio               => c_adc_ratio,
      g_dds_width               => c_dds_width,
      g_dds_points              => c_dds_points,
      g_sin_file                => "../../../dsp-cores/hdl/modules/position_calc/dds_sin.nif",
      g_cos_file                => "../../../dsp-cores/hdl/modules/position_calc/dds_cos.nif",
      g_tbt_cic_delay           => c_tbt_cic_delay,
      g_tbt_cic_stages          => c_tbt_cic_stages,
      g_tbt_ratio               => c_tbt_ratio,
      g_tbt_decim_width         => c_tbt_decim_width,
      g_fofb_cic_delay          => c_fofb_cic_delay,
      g_fofb_cic_stages         => c_fofb_cic_stages,
      g_fofb_ratio              => c_fofb_ratio,
      g_fofb_decim_width        => c_fofb_decim_width,
      g_monit1_cic_delay        => c_monit1_cic_delay,
      g_monit1_cic_stages       => c_monit1_cic_stages,
      g_monit1_ratio            => c_monit1_ratio,
      g_monit1_cic_ratio        => c_monit1_cic_ratio,
      g_monit2_cic_delay        => c_monit2_cic_delay,
      g_monit2_cic_stages       => c_monit2_cic_stages,
      g_monit2_ratio            => c_monit2_ratio,
      g_monit2_cic_ratio        => c_monit2_cic_ratio,
      g_monit_decim_width       => 32,
      g_tbt_cordic_stages       => 12,
      g_tbt_cordic_iter_per_clk => 3,
      g_tbt_cordic_ratio        => 4,

      g_fofb_cordic_stages       => 15,
      g_fofb_cordic_iter_per_clk => 3,
      g_fofb_cordic_ratio        => 4,
      g_k_width                  => c_k_width,
      g_IQ_width                 => c_IQ_width
      )
    port map (
      adc_ch0_i => a,
      adc_ch1_i => b,
      adc_ch2_i => c,
      adc_ch3_i => d,

      clk_i => clock,
      rst_i => reset,

      ksum_i => c_ksum,
      kx_i   => c_kx,
      ky_i   => c_ky,

      mix_ch0_i_o        => mix_ch0_i,
      mix_ch0_q_o        => mix_ch0_q,
      mix_ch1_i_o        => open,
      mix_ch1_q_o        => open,
      mix_ch2_i_o        => open,
      mix_ch2_q_o        => open,
      mix_ch3_i_o        => open,
      mix_ch3_q_o        => open,
      mix_valid_o        => open,
      mix_ce_o           => ce_adc,
      tbt_decim_ch0_i_o  => tbt_ch0_i,
      tbt_decim_ch0_q_o  => tbt_ch0_q,
      tbt_decim_ch1_i_o  => open,
      tbt_decim_ch1_q_o  => open,
      tbt_decim_ch2_i_o  => open,
      tbt_decim_ch2_q_o  => open,
      tbt_decim_ch3_i_o  => open,
      tbt_decim_ch3_q_o  => open,
      tbt_decim_valid_o  => open,
      tbt_decim_ce_o     => open,
      tbt_amp_ch0_o      => a_tbt_out,
      tbt_amp_ch1_o      => b_tbt_out,
      tbt_amp_ch2_o      => c_tbt_out,
      tbt_amp_ch3_o      => d_tbt_out,
      tbt_pha_ch0_o      => open,
      tbt_pha_ch1_o      => open,
      tbt_pha_ch2_o      => open,
      tbt_pha_ch3_o      => open,
      tbt_pha_valid_o    => open,
      tbt_pha_ce_o       => ce_tbt,
      fofb_decim_ch0_i_o => fofb_ch0_i,
      fofb_decim_ch0_q_o => fofb_ch0_q,
      fofb_decim_ch1_i_o => open,
      fofb_decim_ch1_q_o => open,
      fofb_decim_ch2_i_o => open,
      fofb_decim_ch2_q_o => open,
      fofb_decim_ch3_i_o => open,
      fofb_decim_ch3_q_o => open,
      fofb_decim_valid_o => open,
      fofb_decim_ce_o    => ce_fofb,
      fofb_amp_ch0_o     => a_fofb_out,
      fofb_amp_ch1_o     => b_fofb_out,
      fofb_amp_ch2_o     => c_fofb_out,
      fofb_amp_ch3_o     => d_fofb_out,
      fofb_pha_ch0_o     => open,
      fofb_pha_ch1_o     => open,
      fofb_pha_ch2_o     => open,
      fofb_pha_ch3_o     => open,
      fofb_pha_valid_o   => open,
      fofb_pha_ce_o      => open,
      monit_amp_ch0_o    => open,
      monit_amp_ch1_o    => open,
      monit_amp_ch2_o    => open,
      monit_amp_ch3_o    => open,
      monit_amp_valid_o  => open,
      monit_amp_ce_o     => open,

      tbt_pos_x_o     => tbt_pos_x_out,
      tbt_pos_y_o     => tbt_pos_y_out,
      tbt_pos_q_o     => tbt_pos_q_out,
      tbt_pos_sum_o   => tbt_pos_sum_out,
      tbt_pos_valid_o => open,
      tbt_pos_ce_o    => open,

      fofb_pos_x_o     => x_fofb_out,
      fofb_pos_y_o     => y_fofb_out,
      fofb_pos_q_o     => q_fofb_out,
      fofb_pos_sum_o   => sum_fofb_out,
      fofb_pos_valid_o => open,
      fofb_pos_ce_o    => open,

      monit_pos_x_o     => open,
      monit_pos_y_o     => open,
      monit_pos_q_o     => open,
      monit_pos_sum_o   => open,
      monit_pos_valid_o => open,
      monit_pos_ce_o    => open);


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


        p_out_file(tbt_position_file, signed(tbt_pos_x_out), signed(tbt_pos_y_out),
                   (c_mixed_width-1 downto 0 => '0'),
                   (c_mixed_width-1 downto 0 => '0'));

      end if;
    end if;

  end process signal_write;

end architecture test;
