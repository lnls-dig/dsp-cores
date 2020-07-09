library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

package swap_pkg is

  -------------------------------------------------------------------------------
  -- Types
  -------------------------------------------------------------------------------

  subtype t_swap_mode is std_logic_vector(1 downto 0);
  constant c_swmode_rffe_swap       : t_swap_mode := "00";
  constant c_swmode_static_direct   : t_swap_mode := "01";
  constant c_swmode_static_inverted : t_swap_mode := "10";
  constant c_swmode_swap_deswap     : t_swap_mode := "11";

end swap_pkg;

package body swap_pkg is

end swap_pkg;
