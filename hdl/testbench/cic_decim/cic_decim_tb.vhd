library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library std;
use std.textio.all;

library work;
use work.dsp_cores_pkg.all;

entity cic_decim_tb is
end cic_decim_tb;

architecture tb of cic_decim_tb is
  -----------------------Procedure Declaration----------------------------------
  -- Clock Generation
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

  -----------------------Constants Declaration----------------------------------
  constant c_clk_freq       : natural := 100e3; -- Clk Freq
  constant c_order          : natural := 1; -- AKA N
  constant c_comb_dly       : natural := 1; -- AKA M
  constant c_DATA_IN_WIDTH  : integer := 16;
  constant c_BITGROWTH      : integer := 16;
  constant c_DATA_OUT_WIDTH : integer := c_DATA_IN_WIDTH + c_BITGROWTH;
  -----------------------Signal Declaration----------------------------------
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
begin
  ------ Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  -- Decimated clock
  p_strb: process(clk)
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
  p_error: process(clk)
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
  p_assert:process(clk)
  begin
    if rising_edge(clk) then
      if s_val_o = '1' then
        assert to_integer(s_error) = (0)
          report "Output differs from expected on Dec. Rate " & integer'image(s_dec_rate)
        severity failure;
      end if;
    end if;
  end process;

  --------- Writing on file ---------
  p_test : process
    file fd_input     : text;
    file fd_output    : text;
    variable v_ok     : boolean;
    variable v_char   : character;
    variable v_line   : line;
    variable v_wline  : line;
    variable v_data   : integer;
    variable v_testn  : integer;
  begin
    rst <= '1';
    f_wait_cycles(clk, 5);
    rst <= '0';
    f_wait_cycles(clk, 5);

    file_open(fd_input, "../input.txt", read_mode);
    file_open(fd_output, "../output.txt", write_mode);

    -- Loop for reading the input file
    while not endfile(fd_input) loop
      readline(fd_input, v_line);
      -- If the first character is a '#', then is a comment line with the
      -- configurations
      if  v_line.all(1) = '#' then
        -- #
        read(v_line, v_char, v_ok);
        assert v_ok
        report "Read '#' failed for line: " & v_line.all
        severity failure;

        -- Decimation
        read(v_line, v_data, v_ok);
        assert v_ok
        report "Read 'Ki' failed for line: " & v_line.all
        severity failure;
        s_dec_rate <= v_data;

        rst <= '1';
        s_data_i <= (others => '0');
        f_wait_cycles(clk, 1);
        rst <= '0';
        f_wait_cycles(clk, 1);
      -- If the first character is not '#', then it is a line with the
      -- reference and expected control data
      else
        -- Input
        read(v_line, v_data, v_ok);
        assert v_ok
        report "Read 'Input' failed for line: " & v_line.all
        severity failure;
        s_data_i <= std_logic_vector(to_signed(v_data, s_data_i'length));

        -- Output
        read(v_line, v_data, v_ok);
        assert v_ok
        report "Read 'Output' failed for line: " & v_line.all
        severity failure;
        s_data_o_exp <= std_logic_vector(to_signed(v_data, s_data_o_exp'length));

        ---- Write Output File

        -- Input
        v_data := to_integer(signed(s_data_i));
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
        f_wait_cycles(clk, 1);
      end if;
    end loop;
    file_close(fd_input);
    file_close(fd_output);

    std.env.finish;
  end process;

    ---- Entity declaration ------
  UUT: entity work.cic_decim
    generic map (
      DATAIN_WIDTH     => c_DATA_IN_WIDTH,
      DATAOUT_WIDTH    => c_DATA_OUT_WIDTH,
      M                => c_comb_dly,
      N                => c_order,
      MAXRATE          => 2048,
      BITGROWTH        => c_BITGROWTH,
      ROUND_CONVERGENT => 0
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => '1',
      data_i    => s_data_i,
      data_o    => s_data_o,
      act_i     => '1',
      act_out_i => s_strobe,
      val_o     => s_val_o
      );
end tb;