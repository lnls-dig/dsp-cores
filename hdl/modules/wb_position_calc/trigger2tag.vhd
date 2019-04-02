------------------------------------------------------------------------------
-- Title      : Trigger to Tag generator
------------------------------------------------------------------------------
-- Author     : Lucas Maziero Russo
-- Company    : CNPEM LNLS-DIG
-- Created    : 2019-04-01
-- Platform   : FPGA-generic
-------------------------------------------------------------------------------
-- Description: Generates a tag given a trigger
-------------------------------------------------------------------------------
-- Copyright (c) 2019 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2019-03-01  1.0      lucas.russo        Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.dsp_cores_pkg.all;

entity trigger2tag is
generic (
  g_delay_width                            : natural := 9;
  g_tag_size                               : natural := 1
);
port (
  fs_clk_i                                 : in std_logic;
  fs_rst_n_i                               : in std_logic;

  -- Pulse programmable delay
  pulse_dly_i                              : in std_logic_vector(g_delay_width-1 downto 0);
  -- Pulse input
  pulse_i                                  : in std_logic;

  -- Output counter
  tag_o                                    : out std_logic
);
end trigger2tag;

architecture rtl of trigger2tag is

  signal square                            : std_logic;
  signal tag_dly                           : std_logic;
  signal tag_out                           : std_logic;

  attribute shreg_extract                  : string;
  attribute shreg_extract of tag_out       : signal is "no";

  attribute keep                           : string;
  attribute keep of tag_out                : signal is "true";

  component gc_shiftreg
  generic (
    g_size                                 : integer
  );
  port (
    clk_i                                  : in  std_logic;
    en_i                                   : in  std_logic;
    d_i                                    : in  std_logic;
    q_o                                    : out std_logic;
    a_i                                    : in  std_logic_vector
  );
  end component;

  component pulse2square
  port
  (
    clk_i                                  : in std_logic;
    rst_n_i                                : in std_logic;

    -- Pulse input
    pulse_i                                : in std_logic;
    -- Clear square
    clr_i                                  : in std_logic;
    -- square output
    square_o                               : out std_logic
  );
  end component;

begin

  cmp_tbt_tag_generate : pulse2square
  port map
  (
    clk_i                                   => fs_clk_i,
    rst_n_i                                 => fs_rst_n_i,

    -- Pulse input
    pulse_i                                 => pulse_i,
    -- Clear square
    clr_i                                   => '0',
    -- square output
    square_o                                => square
  );

  cmp_gc_shiftreg: gc_shiftreg
  generic map (
    g_size                                  =>  2**g_delay_width
  )
  port map (
    clk_i                                   =>  fs_clk_i,
    en_i                                    =>  '1',
    d_i                                     =>  square,
    q_o                                     =>  tag_dly,
    a_i                                     =>  pulse_dly_i
  );

  -- Additional ff for timing
  p_output_reg : process(fs_clk_i)
  begin
    if rising_edge(fs_clk_i) then
      if fs_rst_n_i = '0' then
        tag_out <= '0';
      else
        tag_out <= tag_dly;
      end if;
    end if;
  end process;

  tag_o <= tag_out;

end rtl;
