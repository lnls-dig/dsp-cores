------------------------------------------------------------------------------
-- Title      : CDC FIFO for Position data
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2013-09-23
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: CDC FIFO for generic data. Suitable for CDC position data
-------------------------------------------------------------------------------
-- Copyright (c) 2012 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-09-23  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
-- Genrams
use work.genram_pkg.all;
use work.dsp_cores_pkg.all;

entity position_calc_cdc_fifo is
generic
(
  g_data_width                              : natural;
  g_size                                    : natural
);
port
(
  clk_wr_i                                  : in std_logic;
  data_i                                    : in std_logic_vector(g_data_width-1 downto 0);
  valid_i                                   : in std_logic;

  clk_rd_i                                  : in std_logic;
  data_o                                    : out std_logic_vector(g_data_width-1 downto 0);
  valid_o                                   : out std_logic
);
end position_calc_cdc_fifo;

architecture rtl of position_calc_cdc_fifo is

  constant c_guard_size                     : integer := 2;
  constant c_almost_empty_thres             : integer := c_guard_size;
  constant c_almost_full_thres              : integer := g_size - c_guard_size;

  signal fifo_cdc_rd                        : std_logic;
  signal fifo_cdc_empty                     : std_logic;
  signal fifo_cdc_valid                     : std_logic;

begin

  --cmp_position_calc_cdc_fifo : generic_async_fifo
  cmp_position_calc_cdc_fifo : inferred_async_fifo
  generic map(
    g_data_width                          => g_data_width,
    g_size                                => g_size,
    g_almost_empty_threshold              => c_almost_empty_thres,
    g_almost_full_threshold               => c_almost_full_thres
  )
  port map(
    rst_n_i                               => '1',

    -- write port
    clk_wr_i                              => clk_wr_i,
    d_i                                   => data_i,
    we_i                                  => valid_i, -- and valid
    wr_full_o                             => open,

    -- read port
    clk_rd_i                              => clk_rd_i,
    q_o                                   => data_o,
    rd_i                                  => fifo_cdc_rd,
    rd_empty_o                            => fifo_cdc_empty
  );

  fifo_cdc_rd <= '1' when fifo_cdc_empty = '0' else '0';

  p_gen_cdc_valid: process (clk_rd_i)
  begin
    if rising_edge (clk_rd_i) then
      fifo_cdc_valid <= fifo_cdc_rd;

      if fifo_cdc_empty = '1' then
        fifo_cdc_valid <= '0';
      end if;
    end if;
  end process;

  valid_o <= fifo_cdc_valid;

end rtl;
