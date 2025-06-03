-------------------------------------------------------------------------------
-- Title      : CIC decimator testbench
-------------------------------------------------------------------------------
-- Author     : Augusto Fraga Giachero
-- Company    : CNPEM LNLS-GIE
-- Platform   : Simulation
-- Standard   : VHDL 2008
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2023-01-23 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2023-01-23  1.0      augusto.fraga         Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library work;
use work.dsp_cores_pkg.all;

entity cic_decim_tb is
  generic (
    g_ORDER           : natural := 2;   -- AKA N
    g_COMB_DLY        : natural := 2;   -- AKA M
    g_TEST_DATA_NAME  : string  := "default_test_data.txt";
    g_OUT_NAME        : string  := "output.txt" -- Used for VHDL and Verilog
                                                -- output comparison
  );
end cic_decim_tb;

architecture tb of cic_decim_tb is

  component cic_decim
    generic (
      DATAIN_WIDTH     : integer := 16;
      DATAOUT_WIDTH    : integer := 16;
      M                : integer := 2;
      N                : integer := 5;
      MAXRATE          : integer := 64;
      BITGROWTH        : integer := 35;
      ROUND_CONVERGENT : integer := 0
    );
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      en_i      : in  std_logic;
      data_i    : in  std_logic_vector(DATAIN_WIDTH-1 downto 0);
      data_o    : out std_logic_vector(DATAOUT_WIDTH-1 downto 0);
      act_i     : in  std_logic;
      act_out_i : in  std_logic;
      val_o     : out std_logic
      );
  end component;

  --------- Procedure Declaration ---------
  -- Clock generation
  procedure f_gen_clk(constant freq : in    natural;
                      signal   clk  : inout std_logic) is
  begin
    loop
      wait for (0.5 / real(freq)) * 1 sec;
      clk <= not clk;
    end loop;
  end procedure f_gen_clk;

  -- Wait procedure
  procedure f_wait_cycles(signal   clk    : in std_logic;
                          constant cycles : natural) is
  begin
    for i in 1 to cycles loop
      wait until rising_edge(clk);
    end loop;
  end procedure f_wait_cycles;

  -- Reset
  procedure f_reset(signal rst : out std_logic;
                    signal clk : in std_logic) is
  begin
    rst <= '1';
    f_wait_cycles(clk, 1);
    rst <= '0';
    f_wait_cycles(clk, 1);
  end procedure f_reset;

  --------- Constants Declaration ---------
  constant c_clk_freq       : natural := 100e3;
  constant c_DATA_IN_WIDTH  : integer := 16;
  constant c_BITGROWTH      : integer := 16;
  constant c_DATA_OUT_WIDTH : integer := c_DATA_IN_WIDTH + c_BITGROWTH;

  --------- Signal Declaration ---------
  signal clk            : std_logic := '0';
  signal rst            : std_logic := '0';
  signal s_dec_counter  : natural   := 0;
  signal s_dec_rate     : natural   := 1;
  signal s_strobe       : std_logic := '0';
  signal s_data_i       : std_logic_vector (c_DATA_IN_WIDTH - 1 downto 0)
                            := (others => '0');
  signal s_data_o       : std_logic_vector (c_DATA_OUT_WIDTH - 1 downto 0);
  signal s_data_o_exp   : std_logic_vector (s_data_o'range) := (others => '0');
  signal s_error        : signed (s_data_o'range) := (others => '0');
  signal s_val_o        : std_logic := '0';

  --------- Procedure for writing on CIC ---------
  type t_cic_decim_iface is record
    en_i        : std_logic;
    valid_i     : std_logic;
    data_i      : std_logic_vector(c_DATA_IN_WIDTH-1 downto 0);
  end record;

  signal cic_decim_iface : t_cic_decim_iface := (
    en_i    => '0',
    valid_i => '0',
    data_i  => (others => '0')
    );

  -- Write on CIC
  procedure f_cic_decim_write(signal cic_if : inout t_cic_decim_iface;
                              data          : in std_logic_vector;
                              signal clks   : in std_logic) is
  begin
    cic_if.en_i <= '1';
    cic_if.data_i <= std_logic_vector(data);
    cic_if.valid_i <= '1';
    f_wait_cycles(clks, 1);
    cic_if.valid_i <= '0';
    f_wait_cycles(clks, 0);
  end procedure;

begin
  ------ Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  -- Decimated clock
  p_strb : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        s_strobe <= '0';
        s_dec_counter <= 0;
      else
        if s_dec_counter = s_dec_rate-1 then
          s_strobe <= '1';
          s_dec_counter <= 0;
        else
          s_dec_counter <= s_dec_counter + 1;
          s_strobe <= '0';
        end if;
      end if;
    end if;
  end process;

  ------ Testing Procedures ------
  -- Error calculation
  p_error : process(clk)
  begin
    if rising_edge(clk) then
        if rst = '1' then
          s_error <= (others => '0');
        elsif s_val_o = '1' then
          s_error <= signed(s_data_o_exp) - signed(s_data_o);
      end if;
    end if;
  end process;

  -- Assertion
  p_assert : process(clk)
  begin
    if rising_edge(clk) then
      if s_val_o = '1' then
        assert abs(to_integer(s_error)) < (2)
          report "Output differs from expected on" &
          " Dec. Rate " & integer'image(s_dec_rate) &
          " Comb Delay " & integer'image(g_COMB_DLY) &
          " Order " & integer'image(g_ORDER)
        severity failure;
      end if;
    end if;
  end process;

  --------- Reading input file ---------
  p_read_file : process
    file fd_test_data     : text;
    file fd_output        : text;
    variable v_ok         : boolean;
    variable v_char       : character;
    variable v_line       : line;
    variable v_wline      : line;
    variable v_data       : integer;
    variable v_testn      : integer;
    variable v_data_i     : std_logic_vector (c_DATA_IN_WIDTH - 1 downto 0);
    variable v_data_o_ast : std_logic_vector (c_DATA_OUT_WIDTH - 1 downto 0);
  begin
    f_reset(rst, clk);

    file_open(fd_test_data, "../" & g_TEST_DATA_NAME, read_mode);
    file_open(fd_output, "../" & g_OUT_NAME, write_mode);

    -- Loop for reading the input file
    while not endfile(fd_test_data) loop
      readline(fd_test_data, v_line);
      -- If the first character is a '#', then is a comment line with the
      -- configurations
      if  v_line.all(1) = '#' then
        -- #
        read(v_line, v_char, v_ok);
        assert v_ok
        report "Read '#' failed for line: " & v_line.all
        severity failure;

        -- Decimation Rate
        read(v_line, v_data, v_ok);
        assert v_ok
        report "Read 'Decimation Rate' failed for line: " & v_line.all
        severity failure;
        s_dec_rate <= v_data;

        f_reset(rst, clk);
      -- If the first character is not '#', then it is a line with the
      -- reference and expected control data
      else
        ---- Read Input File
        -- Input
        read(v_line, v_data, v_ok);
        assert v_ok
        report "Read 'Input' failed for line: " & v_line.all
        severity failure;
        v_data_i := std_logic_vector(to_signed(v_data, v_data_i'length));

        -- Output
        read(v_line, v_data, v_ok);
        assert v_ok
        report "Read 'Output' failed for line: " & v_line.all
        severity failure;
        s_data_o_exp <= std_logic_vector(to_signed(v_data, s_data_o_exp'length));

        ---- Write Output File
        -- Input
        v_data := to_integer(signed(cic_decim_iface.data_i));
        write(v_wline, v_data);
        write(v_wline, string'(";"));

        -- Output
        v_data := to_integer(signed(s_data_o));
        write(v_wline, v_data);
        write(v_wline, string'(";"));

        -- Valid
        v_data := 1 when (s_val_o = '1') else 0;
        write(v_wline, v_data);

        writeline(fd_output, v_wline);

        -- Write data on CIC
        f_cic_decim_write(cic_decim_iface, v_data_i, clk);
      end if;
    end loop;
    file_close(fd_test_data);
    file_close(fd_output);
    report "Success!";
    std.env.finish;
  end process p_read_file;

  --------- Entity declaration ---------
  UUT: cic_decim
    generic map (
      DATAIN_WIDTH     => c_DATA_IN_WIDTH,
      DATAOUT_WIDTH    => c_DATA_OUT_WIDTH,
      M                => g_COMB_DLY,
      N                => g_ORDER,
      MAXRATE          => 2048,
      BITGROWTH        => c_BITGROWTH,
      ROUND_CONVERGENT => 0
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => cic_decim_iface.en_i,
      data_i    => cic_decim_iface.data_i,
      data_o    => s_data_o,
      act_i     => cic_decim_iface.valid_i,
      act_out_i => s_strobe,
      val_o     => s_val_o
      );
end tb;
