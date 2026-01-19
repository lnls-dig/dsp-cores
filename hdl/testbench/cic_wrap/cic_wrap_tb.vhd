-------------------------------------------------------------------------------
-- Title      : CIC wrapper testbench
-- Project    :
-------------------------------------------------------------------------------
-- File       : cic_wrap.vhd
-- Author     : David Daminelli  <david.daminelli@lnls.br>
-- Company    : CNPEM - LNLS
-- Created    : 2026-01-19
-- Last update: 2026-01-19
-- Platform   :
-- Standard   : VHDL'08
-------------------------------------------------------------------------------
-- Description: Testbench for the CIC wrapper core.
-------------------------------------------------------------------------------
-- Copyright (c) 2026
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author            Description
-- 2026-01-19  1.0      david.daminelli   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

entity cic_wrap_tb is
  generic (
    g_ORDER           : natural := 2;   -- AKA N
    g_COMB_DLY        : natural := 2;   -- AKA M
    g_TEST_DATA_NAME  : string  := "default_test_data.txt";
    g_OUT_NAME        : string  := "output.txt" -- Used for VHDL and Verilog
                                                -- output comparison
  );
end entity cic_wrap_tb;

architecture tb of cic_wrap_tb is

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

  --------- Constants declaration ---------
  constant c_clk_freq       : natural := 100e3;
  constant c_DATA_IN_WIDTH  : integer := 16;
  -- Maximum rate defined on gen_test_file.py
  constant c_MAXRATE        : integer := 8;
  constant c_cic_gain       : integer := (c_MAXRATE*g_COMB_DLY)**g_ORDER;
  constant c_BITGROWTH      : integer := integer(ceil(log2(real(c_cic_gain))));
  constant c_DATA_OUT_WIDTH : integer := c_DATA_IN_WIDTH + c_BITGROWTH;

  --------- Signal declaration ---------
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

  ------ Testing procedures ------
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

  --------- Entity instantiation ---------
  UUT : entity work.cic_wrap
    generic map (
      g_DATAIN_WIDTH     => c_DATA_IN_WIDTH,    -- Input data width
      g_DATAOUT_WIDTH    => c_DATA_OUT_WIDTH,   -- Output data width
      g_M                => g_COMB_DLY,         -- Comb delay
      g_N                => g_ORDER,            -- Filter order
      g_MAXRATE          => c_MAXRATE,          -- Maximum decimation rate
      g_ROUND_CONVERGENT => 0                   -- No round convergent method
    )
    port map (
      clk_i     =>  clk,                        -- Clock
      rst_i     =>  rst,                        -- Reset
      ce_i      =>  cic_decim_iface.en_i,       -- Enable input
      data_i    =>  cic_decim_iface.data_i,     -- Input data
      data_o    =>  s_data_o,                   -- Output data
      valid_i   =>  cic_decim_iface.valid_i,    -- Valid input
      val_o     =>  s_val_o,                    -- Valid output
      ratio_i   =>  s_dec_rate                  -- Ratio
      );
end architecture tb;