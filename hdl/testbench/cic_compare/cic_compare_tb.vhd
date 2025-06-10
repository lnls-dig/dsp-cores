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

  ----------------------------Constants Declaration----------------------------
  constant c_clk_freq   : natural   := 100e3; -- Clk Freq
  constant c_order      : natural   := 2; -- AKA N
  constant c_comb_dly   : natural   := 2; -- AKA M
  constant c_DATA_WIDTH : integer   := 16;
  ------------------------------Signal Declaration------------------------------
  signal clk                 	    : std_logic := '0';
  signal rst                   	  : std_logic := '0';
  signal s_dec_rate               : natural   := 1; -- Decimation rate
  signal s_dec_counter        	  : natural   := 0;
  signal s_sine, s_sine_freq   	  : real      := 0.0;
  signal s_timestamp        	    : real   := 0.0;
  signal s_en_i, s_act_i          : std_logic := '0';
  signal s_strobe           	    : std_logic := '0';
  signal s_data_i           	    : std_logic_vector(c_DATA_WIDTH-1 downto 0);
  signal s_data_v_o, s_data_vhd_o : std_logic_vector(c_DATA_WIDTH-1 downto 0);
  signal s_val_v_o, s_val_vhd_o   : std_logic := '0';
  ---------------------------------Test Records---------------------------------
  type t_cic_rec is record
    enable    : std_logic;
    act       : std_logic;
    sine_freq : real;
  end record t_cic_rec;

  type t_cic_arr is array (natural range <>) of t_cic_rec;
  constant c_cic_arr  : t_cic_arr :=
                      ( 0 =>  ( enable    => '0',
                                act       => '0',
                                sine_freq => 10.0),
                        1 =>  ( enable    => '1',
                                act       => '0',
                                sine_freq => 10.0),
                        2 =>  ( enable    => '0',
                                act       => '1',
                                sine_freq => 10.0),
                        3 =>  ( enable    => '1',
                                act       => '1',
                                sine_freq => 10.0),
                        4 =>  ( enable    => '1',
                                act       => '1',
                                sine_freq => 100.0),
                        5 =>  ( enable    => '1',
                                act       => '1',
                                sine_freq => 1.0e3),
                        6 =>  ( enable    => '1',
                                act       => '1',
                                sine_freq => 5.0e3)
                      );
begin
  ----- Clock generation ------
  f_gen_clk(c_clk_freq, clk);

  ------ Test Process ------
  s_data_i <= std_logic_vector(to_signed(integer(s_sine), s_data_i'length));

  p_reset: process
  begin
    rst <= '1';
    f_wait_cycles(clk,5);
    rst <= '0';
    f_wait_cycles(clk,5);
    for i in 0 to c_cic_arr'length-1 loop
      s_en_i      <= c_cic_arr(i).enable;
      s_act_i     <= c_cic_arr(i).act;
      s_sine_freq <= c_cic_arr(i).sine_freq;
      for j in 0 to 11 loop
        s_dec_rate <= 2**j;
        f_wait_cycles(clk, 1);
        f_wait_cycles(clk, 500*s_dec_rate);
      end loop;
    end loop;
    report "Success!";
    std.env.finish;
  end process;

  p_assertion: process
  begin
    f_wait_cycles(clk,5);
    assert s_data_v_o = s_data_vhd_o
        report "Error in output value"
      severity failure;
    assert s_val_v_o = s_val_vhd_o
        report "Error in valid value"
      severity failure;
  end process;

  -- Strobe
  p_strb_clk: process(clk)
  begin
    if rising_edge(clk) then
      if s_dec_counter >= s_dec_rate-1 then
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
        s_timestamp <= 0.0;
      else
        s_timestamp <= s_timestamp + 1.0;
      end if;
    end if;
  end process;

  -- Sine generation
  p_sine: process(clk)
  begin
    if rising_edge(clk) then
      s_sine <= (2.0**(c_DATA_WIDTH-1) - 1.0) *
                sin(2.0 * math_pi * s_sine_freq * s_timestamp/real(c_clk_freq));
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
      MAXRATE          => 2048,
      BITGROWTH        => 24,
      ROUND_CONVERGENT => 0
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => s_en_i,
      data_i    => s_data_i,
      data_o    => s_data_v_o,
      act_i     => s_act_i,
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
      MAXRATE          => 2048,
      BITGROWTH        => 24,
      ROUND_CONVERGENT => 0
      )
    port map (
      clk_i     => clk,
      rst_i     => rst,
      en_i      => s_en_i,
      data_i    => s_data_i,
      data_o    => s_data_vhd_o,
      act_i     => s_act_i,
      act_out_i => s_strobe,
      val_o     => s_val_vhd_o
      );

end tb;
