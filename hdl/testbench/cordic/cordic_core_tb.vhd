library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;

entity cordic_core_tb is
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
  constant c_INPUT_WIDTH    : natural := 16;
  constant c_clk_freq       : natural := 100e3;
  constant c_cordic_gain    : real := 1.647;

  -- Component Generics
  constant c_stages     : natural := 2**5;
  constant c_bit_growth : natural := natural(ceil(log2(real(c_stages))));
  constant c_mode       : string  := "rect_to_polar";

  -----------------------Signal Declaration----------------------------------
  signal clk          : std_logic := '0';
  signal rst          : std_logic := '0';
  signal s_timestamp  : integer   := 0;

  -- Component ports
  signal s_x_in, s_y_in : integer := 0;
  signal s_z_in         : signed(c_INPUT_WIDTH-1 downto 0) := (c_INPUT_WIDTH-1 downto 0 => '0');
  signal s_ce           : std_logic := '1';
  signal s_valid_in     : std_logic := '0';
  signal s_x_out        : signed(c_INPUT_WIDTH-1 downto 0) := (others => '0');
  signal s_y_out        : signed(c_INPUT_WIDTH-1 downto 0) := (others => '0');
  signal s_z_out        : signed(c_INPUT_WIDTH-1 downto 0) := (others => '0');
  signal s_valid_out    : std_logic;

  -- Test Signals
  signal s_abs      : real := 0.0;
  signal s_phs      : real := 0.0;
end cordic_core_tb;

architecture tb of cordic_core_tb is
begin
  ------ Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  p_iq_loop: process
  begin
    rst <= '1';
    f_wait_cycles(clk, 5);
    rst <= '0';
    for i in 0 to c_INPUT_WIDTH-2 loop
      s_x_in <= 2**i;
      for j in 0 to c_INPUT_WIDTH-2 loop
        s_y_in <= 2**j;
        s_valid_in <= '1';
        f_wait_cycles(clk, 1);
        -- idk why this 4.0 appears
        s_abs <= SQRT( real(s_x_in**2) + real(s_y_in**2) )*c_cordic_gain/4.0;
        s_phs <= ARCTAN(real(s_y_in)/real(s_x_in))/math_pi * 180.0;
        s_valid_in <= '0';
        f_wait_cycles(clk, 1);
        f_wait_cycles(clk, c_stages);
      end loop;
    end loop;
    report "Success!";
    std.env.finish;
  end process;

  p_assertion: process(clk)
    variable v_phs, v_amp : real := 0.0;
  begin
    if rising_edge(clk) then
      if s_valid_out = '1' then
        -- Amp assertion
        v_amp := real(to_integer(s_x_out));
        assert abs(v_amp-s_abs) < 2.0
          report "Amp failed! Expected " & to_string(s_abs)
                  & " got " & to_string(v_amp) &
                  " diff " & to_string(abs(v_amp-s_abs))
        severity failure;
        --Phs assertion
        v_phs := real(to_integer(s_z_out))/(2.0**(c_INPUT_WIDTH-1)-1.0) * 180.0;
        assert abs(v_phs - s_phs) < 2.0
          report "Phs failed! Expected " & to_string(s_phs)
                  & " got " & to_string(v_phs)
        severity failure;
      end if;
    end if;
  end process;

  ---- Entity instantiation ------
  DUT : entity work.cordic_core
  generic map (
    g_stages     => c_stages,
    g_bit_growth => c_bit_growth,
    g_mode       => c_mode)
  port map (
    x_i     => to_signed(s_x_in, c_INPUT_WIDTH),
    y_i     => to_signed(s_y_in, c_INPUT_WIDTH),
    z_i     => s_z_in,
    clk_i   => clk,
    ce_i    => s_ce,
    rst_i   => rst,
    valid_i => s_valid_in,
    x_o     => s_x_out,
    y_o     => s_y_out,
    z_o     => s_z_out,
    valid_o => s_valid_out);
end tb;