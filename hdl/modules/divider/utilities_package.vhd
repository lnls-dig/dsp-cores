library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package utilities is

    function find_msb (signal arg: in std_logic_vector; signal sign: in std_logic) return std_logic_vector;
    function log2(arg : natural) return natural;
    
    component data_generator is
    generic
    (
        G_DATA_WIDTH  : natural range 2 to 48 := 25
    );
    port
    (
        i_clk           : in std_logic;
        i_rst           : in std_logic;
        i_data_init     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);
        i_data_step     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);
        i_niterations   : in std_logic_vector(9 downto 0);
        o_data          : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
        o_trg           : out std_logic
    );
    end component;

end utilities;

package body utilities is

    function find_msb (signal arg: in std_logic_vector; signal sign: in std_logic) return std_logic_vector is
        variable index: natural := arg'left;
        
    begin
        while true loop
            if arg(index) = not(sign) then
                exit;
            elsif index = 0 then
                exit;
            end if;
            index := index - 1;
        end loop;

        return std_logic_vector(to_unsigned(index,log2(arg'length)+1));
    end find_msb;


    function log2(arg : natural) return natural is
        variable result : natural ;
        variable index : natural := 0;
        
    begin
        while true loop
            if 2**index >= arg then
                result := index;
                exit ;
            end if ;
            index := index + 1;
        end loop ;
      
        return index;    
    end function;

end utilities;


----------------------------------------------------------------------------------------------
-- data_generator
----------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
    
entity data_generator is
generic
(
    G_DATA_WIDTH  : natural range 2 to 48
);
port
(
    i_clk           : in std_logic;
    i_rst           : in std_logic;
    i_data_init     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);
    i_data_step     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);
    i_niterations   : in std_logic_vector(9 downto 0);
    o_data          : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
    o_trg           : out std_logic
);
end data_generator;

architecture rtl of data_generator is

    signal uv_iterations_count      : unsigned(9 downto 0);
    signal uv_data_count            : signed(G_DATA_WIDTH-1 downto 0);
    
begin
    prc_counter: process(i_rst, i_clk)
    begin
        if i_rst = '1' then
            uv_iterations_count <= unsigned(i_niterations);
            uv_data_count <= signed(i_data_init);
        elsif rising_edge(i_clk) then
            if uv_iterations_count = 0 then
                o_trg <= '1';
                uv_data_count <= uv_data_count + signed(i_data_step);
                uv_iterations_count <= unsigned(i_niterations);
            else
                o_trg <= '0';
                uv_iterations_count <= uv_iterations_count - 1;
            end if;
        end if;
    end process;
    
    o_data <= std_logic_vector(uv_data_count);
end rtl;