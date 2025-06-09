library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.dsp_cores_pkg.all;

entity cic_compare_tb is
end entity cic_compare_tb;

architecture tb of cic_compare_tb is
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
  constant c_clk_freq   : natural   := 100e3; -- Clk Freq
  constant c_dec_rate   : natural   := 128;
  constant c_order      : natural   := 2; -- AKA N
  constant c_comb_dly   : natural   := 4; -- AKA M
  constant c_cic_gain   : integer   := (c_dec_rate*c_comb_dly)**c_order;
  constant c_DATA_WIDTH : integer   := 16;
  constant c_high	: std_logic := '1'; -- Need for input high on the verilog module
  -----------------------Signal Declaration----------------------------------
  signal clk                 	  : std_logic := '0';
  signal clk_dec              	  : std_logic := '0';
  signal rst                   	  : std_logic := '0';
  signal s_dec_counter        	  : natural   := 0;
  signal s_sine,s_sine_freq   	  : real      := 0.0;
  signal s_timestamp        	  : integer   := 0;
  signal s_strobe           	  : std_logic := '0';
  signal s_data_i           	  : std_logic_vector(c_DATA_WIDTH-1 downto 0);
  signal s_data_v_o, s_data_vhd_o : std_logic_vector(c_DATA_WIDTH-1 downto 0);
  signal s_val_v_o,s_val_vhd_o    : std_logic := '0';
begin
------ Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  ------ Test Process ------
  s_data_i <= std_logic_vector(to_signed(integer(s_sine), s_data_i'length));

  p_reset:process
  begin
    rst <= '1';
    f_wait_cycles(clk,5);
    rst <= '0';
    s_sine_freq <= 10.0;
    f_wait_cycles(clk,5000);
    s_sine_freq <= 100.0;
    f_wait_cycles(clk,5000);
    s_sine_freq <= 500.0;
    f_wait_cycles(clk,5000);
    s_sine_freq <= 1000.0;
    f_wait_cycles(clk,5000);
    std.env.finish;
  end process;

  p_assertion: process
  begin
    f_wait_cycles(clk,5);  
    assert s_data_v_o = s_data_vhd_o
        report "Error in value"
      severity failure;
  end process;

  -- Decimated clock
  p_dec_clk: process(clk)
  begin
    if rising_edge(clk) then
      if s_dec_counter = c_dec_rate-1 then
        s_strobe <= '1';
        s_dec_counter <= 0;
      else
        s_dec_counter <= s_dec_counter + 1;
        s_strobe <= '0';
      end if;
    end if;
  end process;

  -- Time stamp
  p_timestamp: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        s_timestamp <= 0;
      else
        s_timestamp <= s_timestamp + 1;
      end if;
    end if;
  end process;

  -- Sine generation
  p_sine: process(clk)
  begin
    if rising_edge(clk) then
      s_sine <= (2.0**(c_DATA_WIDTH-1) - 1.0) *
                sin(2.0 * math_pi * s_sine_freq * real(s_timestamp)/real(c_clk_freq));
    end if;
  end process;

  ---- Entity declaration ------
  -- Verilog
  UUT: entity work.cic_dec
    generic map (
      DATAIN_WIDTH     => c_DATA_WIDTH,
      DATAOUT_WIDTH    => c_DATA_WIDTH,
      M                => c_comb_dly,
      N                => c_order,
      MAXRATE          => 64,
      BITGROWTH        => integer(log2(real(c_cic_gain))),
      ROUND_CONVERGENT => 0
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => c_high,
      data_i    => s_data_i,
      data_o    => s_data_v_o,
      act_i     => c_high,
      act_out_i => s_strobe,
      val_o     => s_val_v_o
      );

  -- VHDL
  UUT2: entity work.cic_decim
    generic map (
      DATAIN_WIDTH     => c_DATA_WIDTH,
      DATAOUT_WIDTH    => c_DATA_WIDTH,
      M                => c_comb_dly,
      N                => c_order,
      MAXRATE          => 64,
      BITGROWTH        => integer(log2(real(c_cic_gain))),
      ROUND_CONVERGENT => 0
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => '1',
      data_i    => s_data_i,
      data_o    => s_data_vhd_o,
      act_i     => '1',
      act_out_i => s_strobe,
      val_o     => s_val_vhd_o
      );

end tb;
