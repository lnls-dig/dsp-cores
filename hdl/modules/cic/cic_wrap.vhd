library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity cic_wrap is

  generic (
    g_DATAIN_WIDTH    : natural := 16;    -- Input data width
    g_DATAOUT_WIDTH   : natural := 16;    -- Output data width
    g_M               : natural := 2;     -- Comb delay
    g_N               : natural := 5;     -- Filter order
    g_MAXRATE         : natural := 2048;  -- Maximum decimation rate
    g_ROUND_CONVERGENT: integer := 0      -- Enables round convergent method
  );
  port (
    clk_i     : in  std_logic;                                    -- Clock
    rst_i     : in  std_logic;                                    -- Reset
    ce_i      : in  std_logic;                                    -- Enable input
    data_i    : in  std_logic_vector(g_DATAIN_WIDTH-1 downto 0);  -- Input data
    data_o    : out std_logic_vector(g_DATAOUT_WIDTH-1 downto 0); -- Output data
    valid_i   : in  std_logic;                                    -- Valid input
    val_o     : out std_logic;                                    -- Valid output
    ratio_i   : in  natural                                       -- Ratio
  );

end entity cic_wrap;

architecture arch of cic_wrap is
    constant c_bus_width : natural := integer(ceil(log2(real(g_MAXRATE))));
    signal s_strobe : std_logic;
begin

  cmp_cic_decim : entity work.cic_decim
    generic map (
      DATAIN_WIDTH     => g_DATAIN_WIDTH,
      DATAOUT_WIDTH    => g_DATAOUT_WIDTH,
      M                => g_M,
      N                => g_N,
      MAXRATE          => g_MAXRATE,
      BITGROWTH        => open, -- Dummy
      ROUND_CONVERGENT => g_ROUND_CONVERGENT
    )
    port map (
      clk_i     => clk_i,
      rst_i     => rst_i,
      en_i      => ce_i,
      data_i    => data_i,
      data_o    => data_o,
      act_i     => valid_i,
      act_out_i => s_strobe,
      val_o     => val_o
    );

  cmp_decimation_strober : entity work.decimation_strober
    generic map (
      g_maxrate   => g_MAXRATE,
      g_bus_width => open -- Dummy
    )
    port map (
      clk_i    => clk_i,
      rst_i    => rst_i,
      ce_i     => ce_i,
      valid_i  => '1', -- Always valid, this ensures it passes the tb
      ratio_i  => std_logic_vector(to_unsigned(ratio_i, c_bus_width)),
      strobe_o => s_strobe
    );

end architecture arch;