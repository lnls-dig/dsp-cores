library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.arith_generic.all;
use work.utilities.all;

entity div_tb is
end div_tb;

architecture behavioral of div_tb is

  constant C_DATAIN_WIDTH : integer := 32;
  constant C_PRECISION    : natural := 29;  -- Quotient width = 32

  constant c_ce_period : natural := 2;

  --Inputs
  signal clk : std_logic                                   := '0';
  signal rst : std_logic                                   := '0';
  signal ce  : std_logic                                   := '0';
  signal trg : std_logic                                   := '0';
  signal n   : std_logic_vector(C_DATAIN_WIDTH-1 downto 0) := (others => '0');
  signal d   : std_logic_vector(C_DATAIN_WIDTH-1 downto 0) := (others => '0');

  --Outputs
  signal q   : std_logic_vector(C_PRECISION downto 0);
  signal r   : std_logic_vector(C_DATAIN_WIDTH-1 downto 0) := (others => '0');
  signal rdy : std_logic;
  signal err : std_logic;

  -- Clock period definitions
  constant clk_period : time := 10 ns;

  constant TAB : character := ht;

  file test_out_data : text open write_mode is "output.dat";
  
begin
  uut_div_fixedpoint : div_fixedpoint
    generic map
    (
      G_DATAIN_WIDTH => C_DATAIN_WIDTH,
      G_PRECISION    => C_PRECISION
      )
    port map
    (
      clk_i => clk,
      rst_i => rst,
      ce_i  => ce,
      n_i   => n,
      d_i   => d,
      q_o   => q,
      r_o   => r,
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

  ce_gen : process(clk)
    variable ce_count : natural := 0;
  begin
    
    if rising_edge(clk) then
      ce_count := ce_count + 1;

      if ce_count = c_ce_period then
        ce       <= '1';
        ce_count := 0;
      else
        ce <= '0';
      end if;
    end if;
    
  end process;

  -- Stimulus process
  stim_proc : process
    variable outline : line;
    variable i       : integer;

  begin
    
    --rst <= '1';
    --wait for clk_period*10.5*c_ce_period;
    --rst <= '0';
    --wait for clk_period*10*c_ce_period;

    for i in 0 to 5740 loop

      n <= std_logic_vector(to_signed((i*i)/2, C_DATAIN_WIDTH));
      d <= std_logic_vector(to_signed(32947600, C_DATAIN_WIDTH));

      wait for clk_period*1;

      write(outline, to_integer(signed(n)));
      write(outline, TAB);
      write(outline, to_integer(signed(d)));

      trg <= '1';
      wait for clk_period*c_ce_period;
      trg <= '0';
      wait for clk_period*31*c_ce_period;

      write(outline, TAB);
      write(outline, to_integer(signed(q)));
      write(outline, TAB);
      write(outline, to_integer(signed(r)));

      wait for clk_period*1*c_ce_period;

      writeline(test_out_data, outline);  -- write row to output file

    end loop;
    assert (false) report "Test finished." severity failure;
    wait;
  end process;

end;
