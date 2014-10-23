-------------------------------------------------------------------------------
-- Title      : Pipeline
-- Project    : 
-------------------------------------------------------------------------------
-- File       : pipeline.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-06-10
-- Last update: 2014-06-18
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Pipeline with configurable width and depth
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-06-10  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity pipeline is
  generic (
    g_width : natural := 32;
    g_depth : natural := 2
    );

  port (
    data_i : in  std_logic_vector(g_width-1 downto 0);
    clk_i  : in  std_logic;
    ce_i   : in  std_logic;
    data_o : out std_logic_vector(g_width-1 downto 0)
    );

  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of pipeline : entity is "no";
  
end entity pipeline;

-------------------------------------------------------------------------------

architecture str of pipeline is
  type slv_array is array(g_depth-1 downto 0) of std_logic_vector(g_width-1 downto 0);
  signal pipe : slv_array;

begin  -- architecture str

  process(clk_i)
  begin

    if rising_edge(clk_i) then
      if ce_i = '1' then

        pipe(0) <= data_i;

        for n in 1 to g_depth-1 loop
          pipe(n) <= pipe(n-1);
        end loop;

      end if;  --ce_i
    end if;  --clk_i
    
  end process;

  data_o <= pipe(g_depth-1);

end architecture str;

-------------------------------------------------------------------------------
