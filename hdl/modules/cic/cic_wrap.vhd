library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

entity cic_wrap is

  generic (
    g_DATAIN_WIDTH    : natural := 16;    -- Input data width
    g_DATAOUT_WIDTH   : natural := 16;    -- Output data width
    g_M               : natural := 2;     -- Comb Delay
    g_N               : natural := 5;     -- Filter Order
    g_MAXRATE         : natural := 2048;  -- Maximun decimation rate.
    --g_BUS_WIDTH       : integer := 11;    -- ceil(log2(g_MAXRATE))
    --g_BITGROWTH       : integer := 35;    -- (dummy) Internal bit extension
                                          -- kept for backward compatibility
    g_ROUND_CONVERGENT: integer := 0      -- Enables round convergent method
  );
  port (
    clk_i     : in  std_logic;  -- Clock
    rst_i     : in  std_logic;  -- Reset
    ce_i      : in  std_logic;  -- Enable Input
    data_i    : in  std_logic_vector(DATAIN_WIDTH-1 downto 0); -- Input Data
    data_o    : out std_logic_vector(DATAOUT_WIDTH-1 downto 0);-- Output Data
    valid_i   : in  std_logic;  -- Valid Input
    val_o     : out std_logic   -- Valid output
    ratio_i   : in  std_logic_vector(integer(ceil(log2(real(g_MAXRATE))))-1 downto 0);
  );

end entity cic_wrap;

architecture arch of cic_wrap is
begin

  U1: entity work.cic_decim
    generic map (
      DATAIN_WIDTH     => g_DATAIN_WIDTH,
      DATAOUT_WIDTH    => g_DATAOUT_WIDTH,
      M                => g_M,
      N                => g_N,
      MAXRATE          => g_MAXRATE,
      BITGROWTH        => g_BITGROWTH,
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

  U2: entity work.decimation_strober is
    generic map (
      g_maxrate   => g_MAXRATE,
      g_bus_width => g_BUS_WIDTH
    )
    port map (
      clk_i    => clk_i,
      rst_i    => rst_i,
      ce_i     => ce_i,
      valid_i  => valid_i,
      ratio_i  => ratio_i,
      strobe_o => s_strobe
    );

end architecture arch;