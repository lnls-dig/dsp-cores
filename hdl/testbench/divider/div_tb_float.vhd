library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.arith_dsp48e.all;
use work.utilities.all;

entity div_tb is
end div_tb;

architecture behavioral of div_tb is

  constant C_DATAIN_WIDTH : integer := 27;

  --Inputs
  signal clk : std_logic                                   := '0';
  signal rst : std_logic                                   := '0';
  signal trg : std_logic                                   := '0';
  signal n   : std_logic_vector(C_DATAIN_WIDTH-1 downto 0) := (others => '0');
  signal d   : std_logic_vector(C_DATAIN_WIDTH-1 downto 0) := (others => '0');

  --Outputs
  signal q   : std_logic_vector(31 downto 0);
  signal rdy : std_logic;
  signal err : std_logic;

  -- Clock period definitions
  constant clk_period : time := 10 ns;

  constant TAB : character := ht;

  file test_out_data : text open write_mode is "./output.dat";
  
begin
  uut_ieee754_single : div_ieee754_single
    generic map
    (
      G_DATA_WIDTH => C_DATAIN_WIDTH
      )
    port map
    (
      clk_i => clk,
      rst_i => rst,
      n_i   => n,
      d_i   => d,
      q_o   => q,
      trg_i => trg,
      rdy_o => rdy,
      err_o => err
      );

  -- Clock process definitions
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  -- Stimulus process
  stim_proc : process
    variable outline : line;
    variable i       : integer;

  begin
    
    rst <= '1';
    wait for clk_period*10.5;
    rst <= '0';
    wait for clk_period*10;

    for i in 0 to 5740 loop

      n <= std_logic_vector(to_signed((i*i)/10, C_DATAIN_WIDTH));
      d <= std_logic_vector(to_signed(32947600, C_DATAIN_WIDTH));

      wait for clk_period*1;

      write(outline, to_integer(signed(n)));
      write(outline, TAB);
      write(outline, to_integer(signed(d)));

      trg <= '1';
      wait for clk_period;
      trg <= '0';
      wait for clk_period*31;

      write(outline, TAB);
      write(outline, to_integer(unsigned(q(30 downto 23))));
      write(outline, TAB);

      if q(31) = '1' then
        write(outline, string'("-"));
      end if;

      write(outline, to_integer(unsigned(q(22 downto 0))));

      wait for clk_period*1;

      writeline(test_out_data, outline);  -- write row to output file

    end loop;
    assert (false) report "Test finished." severity failure;
    wait;
  end process;

end;
