----------------------------------------------------------------------------------
-- Engineer:       Matthias Werner
-- Create Date:    23:53:29 06/26/2014
-- Module Name:    cordic - Behavioral
-- Target Devices: tried for Virtex-5 and Virtex-6, other devices should be possible
----------------------------------------------------------------------------------
-- Description:

-- Conversion from rectangular to polar coordinates using CORDIC algorithm

-- GENERAL:
-- This is a serial algorithm designed to achieve low latency even at moderate clk frequencies.
-- Depending on the clk frequency, more than one iteration per clk can be executed,
-- controlled by the ITER_PER_CLK parameter. As it is a serial algorithm, a new input
-- value is allowed only every ..... clk cycles.
-- The algorithm will not allow to do all iterations in one clk cycle; even at very low clk
-- frequencies at least two clk cycles must be selected: NUM_ITER / ITER_PER_CLK must be > 1.
-- The "Cordic Factor" (0.607252935008881...) is not yet applied; this has to be done in an extra
-- step for the result "s_x_o" if necessary.

-- PRECISION:
-- The maximum precision for X, Y and phase is about 48 bits, limited by the precision
-- of the arctan tables which are generated using the double precision math library.
-- As the built-in arctan function offers only very limited precision, an extra arctan
-- function (not generally usable because of the limited argument range) was designed
-- using a Taylor series.
-- For a result to be precise to the last digit, the internal precision should be higher
-- than the output port bit width: for example XY_CALC_WID should be about X_OUT_WID + LOG2(NUM_ITER) + 1,
-- and PH_CALC_WID should be about PH_OUT_WID + LOG2(NUM_ITER) + 1.
-- Also the number of iterations NUM_ITER must be set appropriately: every iteration
-- will increase the precision of the phase output by about 1 bit and the precision of the
-- X output by about 2 bits. NUM_ITER can be rounded up to be an integer multiple of
-- ITER_PER_CLK.
-- Rounding can be selected by the parameter ROUNDING. The rounded value is not registered
-- again to save one clock cycle.

-- INPUT REGISTER:
-- An input register can be selected by USE_INREG = True, this adds an extra clk cycle.

-- OUTPUT REGISTER:
-- If ROUNDING = False, the result is registered.
-- If ROUNDING = True, an additional "add" operation behind the "raw" result register
-- executes the rounding, but no additional output register is implemented.
-- So the number of clk cycles appears the same with / without rounding.

-- CLOCK FREQUENCY:
-- This algorithm is not optimized for fastest clock speed with 1 iteration per clk cycle;
-- for this case, the Xilinx CORDIC IP-Core is faster.
-- For moderate clk frequencies (e.g. 180 MHz at 18 bit I/O width), 2 iterations per clk
-- cycle are possible; at 110 MHz even 4 iterations per clk can be achieved.


-- RECIPE:
-- Select input and output bit width XY_IN_WID, X_OUT_WID and PH_OUT_WID.
-- Select USE_INREG and ROUNDING.
-- Start with a "reasonable" NUM_ITER, then do the following two steps iteratively:
--    Set XY_CALC_WID = X_OUT_WID + LOG2(NUM_ITER) + 1,  PH_CALC_WID = PH_OUT_WID + LOG2(NUM_ITER) + 1.
--    Set NUM_ITER = maximum (PH_CALC_WID, X_OUT_WID/2 + 3).
-- Try which maximum ITER_PER_CLK is possible with the given clk frequency;
--    round up NUM_ITER to be an integer multiple of ITER_PER_CLK;
--    make sure that NUM_ITER > ITER_PER_CLK.
-- If desired, do a fine tuning of XY_CALC_WID, PH_CALC_WID, NUM_ITER to
--    achieve the desired precision with the least number of clk cycles and / or
--    with the least FPGA resources; use the simulator to check the precision.

-- HINT:
-- For implementation (also for clock speed check), set parameters in file cordic.vhd;
-- for simulation, set parameters in your testbench

-------------------------------------------------------------------------------
--                                              C O P Y R I G H T    N O T E :
-------------------------------------------------------------------------------
-- This file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This code is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License.
-- If not, see <http://www.gnu.org/licenses/>.
-- Copyright (c) 2015 Matthias Werner
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;
use IEEE.NUMERIC_STD.all;

entity cordic is
  generic (XY_CALC_WID  : positive := 32;  -- Number of bits for internal X and Y calculation
           XY_IN_WID    : positive := 26;  -- Number of bits for X an Y input ports
           X_OUT_WID    : positive := 26;  -- Number of bits for X output port
           PH_CALC_WID  : positive := 30;  -- Number of bits for internal phase calculation
           PH_OUT_WID   : positive := 24;  -- Number of bits for phase output
           NUM_ITER     : positive := 24;  -- Must be divisible by ITER_PER_CLK; NUM_ITER/ITER_PER_CLK > 1
           ITER_PER_CLK : positive := 4;  -- Iterations per clk cycle; NUM_ITER must be an integer multiple of
                                          -- ... ITER_PER_CLK
           USE_INREG    : boolean  := true;  -- Use input register if True
           USE_CE       : boolean  := true;  -- Use clock enable input port "ce" if True
           ROUNDING     : boolean  := true);  -- Round results (without extra register)
  port (clk        : in  std_logic;     -- Clock
        ce         : in  std_logic;     -- Clock enable
        b_start_in : in  std_logic;     -- s_x_in and s_y_in valid - 1 clk long
        s_x_in     : in  signed (XY_IN_WID-1 downto 0);  -- X input - must be valid when b_start_in = '1'
        s_y_in     : in  signed (XY_IN_WID-1 downto 0);  -- Y input - must be valid when b_start_in = '1'
        s_x_o      : out signed (X_OUT_WID-1 downto 0);  -- X result; registered if ROUNDING = False, ...
        -- ... Cordic Factor is not yet applied.
        s_ph_o     : out signed (PH_OUT_WID-1 downto 0);  -- Phase result; registered if ROUNDING = False
        b_rdy_o    : out std_logic;     -- Result valid
        b_busy_o   : out std_logic := '0');  -- Busy states (does not accept new data)
end cordic;

architecture Behavioral of cordic is

  -- Parameters and constants derived from Generics
  constant NUM_LOOPS       : positive                                     := NUM_ITER / ITER_PER_CLK;
  constant TRAIL_ZEROES_XY : signed(XY_CALC_WID - XY_IN_WID - 3 downto 0) := (others => '0');
  constant TRAIL_ZEROES_PH : signed (PH_CALC_WID-2 downto 0)              := (others => '0');

  -- ===================================================================
  -- Calculate address width of phase table: CEIL(Log2(NUM_ITER/ITER_PER_CLK)
  -- ===================================================================
  function ceil_log2(arg : positive) return natural is
    variable i_result_v : natural;
    variable arg_m1_v   : natural;      -- arg-1 as variable
  begin
    i_result_v := 0;
    arg_m1_v   := arg-1;
    for i in 1 to 31 loop
      if arg_m1_v /= 0 then
        i_result_v := i;
      end if;
      arg_m1_v := arg_m1_v / 2;
    end loop;
    return i_result_v;
  end function;
  -- Address width of phase table
  constant TAB_AD_WID : positive := ceil_log2(NUM_ITER/ITER_PER_CLK);
  -- ===================================================================

  -- Signals
  signal i_ix             : integer range -1 to NUM_LOOPS   := NUM_LOOPS-1;
  signal s_x_reg          : signed (XY_IN_WID-1 downto 0)   := (others => '0');  -- Input register X
  signal s_y_reg          : signed (XY_IN_WID-1 downto 0)   := (others => '0');  -- Input register Y
  signal s_x_toCordic     : signed (XY_CALC_WID-1 downto 0) := (others => '0');
  signal s_y_toCordic     : signed (XY_CALC_WID-1 downto 0) := (others => '0');
  signal s_ph_toCordic    : signed (PH_CALC_WID-1 downto 0) := (others => '0');
  signal s_x_fromCordic   : signed (XY_CALC_WID-1 downto 0);
  signal s_y_fromCordic   : signed (XY_CALC_WID-1 downto 0);
  signal s_ph_fromCordic  : signed (PH_CALC_WID-1 downto 0);
  signal s_x_unrounded    : signed (XY_CALC_WID-1 downto 0);  -- Result x, not (yet) rounded
  signal s_ph_unrounded   : signed (PH_CALC_WID-1 downto 0);  -- Result phase, not (yet) rounded
  signal b_start_dly      : std_logic                       := '0';  -- b_start_in delayed 1 clk
  signal y_last_state_dly : boolean                         := false;  -- Used to enable output registers


  -------------------------------------------------------------
  -- Function: Calculate CORDIC factor and assign to a constant
  -------------------------------------------------------------
  function calc_cordic_factor return real is
    variable f_result : real;
  begin
    f_result := 1.0;
    for i in 0 to NUM_LOOPS*ITER_PER_CLK-1 loop
      f_result := f_result / sqrt(1.0 + 2.0**(-2*i));  -- 2**(int), not 2**(real) -> more precise!
    end loop;
    return f_result;
  end function calc_cordic_factor;
  -- CORDIC factor
  constant f_cordic_factor : real := calc_cordic_factor;
  ---------------------------------------------------

begin

  -------------------
  -- Check parameters
  -------------------
  assert (XY_CALC_WID >= 3) and (XY_CALC_WID <= 56)
    report "XY_CALC_WID must be within 3 .. 56"
    severity failure;

  assert (ROUNDING and (XY_CALC_WID > X_OUT_WID)) or (not ROUNDING and (XY_CALC_WID >= X_OUT_WID))
    report "Required: XY_CALC_WID > X_OUT_WID if ROUNDING, XY_CALC_WID >= X_OUT_WID if NOT ROUNDING"
    severity failure;

  assert (XY_CALC_WID >= XY_IN_WID + 2)
    report "Required: XY_CALC_WID >= XY_IN_WID + 2"
    severity failure;

  assert (PH_CALC_WID >= 2) and (PH_CALC_WID <= 56)
    report "PH_CALC_WID must be within 2 .. 56"
    severity failure;

  assert (ROUNDING and (PH_CALC_WID > PH_OUT_WID)) or (not ROUNDING and (PH_CALC_WID >= PH_OUT_WID))
    report "Required: PH_CALC_WID > PH_OUT_WID if ROUNDING, PH_CALC_WID >= PH_OUT_WID if NOT ROUNDING"
    severity failure;

  assert (NUM_ITER mod ITER_PER_CLK = 0)
    report "NUM_ITER must be an integer multiple of ITER_PER_CLK"
    severity failure;

  assert (NUM_ITER / ITER_PER_CLK > 1)
    report "Required: NUM_ITER / ITER_PER_CLK > 1"
    severity failure;


  --------------
  -- clk process
  --------------

  proc_clk : process(clk)
    -- Values directly from input ports or from input registers
    variable s_x_v          : signed (XY_IN_WID-1 downto 0);
    variable s_y_v          : signed (XY_IN_WID-1 downto 0);
    -- Values with range reduced to quadrant 1 or 4
    variable s_x_red_v      : signed (XY_IN_WID-1 downto 0);  -- @ MSB is always '0' here -> always unsigned
    variable s_y_red_v      : signed (XY_IN_WID-1 downto 0);
    -- Other variables
    variable b_ph_msb_v     : std_logic;
    variable b_new_iter_v   : std_logic;
    variable y_last_state_v : boolean;
    variable v_busy         : boolean := false;  -- marks if core is busy
  begin

    if rising_edge(clk) then

      if ((ce = '1') or not USE_CE) then  -- With clock enable if USE_CE is True

        -- Delayed start signal
        b_start_dly <= b_start_in;

        -- Decide if new value for iteration loop from inputs, not from last iteration
        if USE_INREG then
          b_new_iter_v := b_start_dly;
        else
          b_new_iter_v := b_start_in;
        end if;

        -- Index counter
        if b_new_iter_v = '1' then
          i_ix <= 0;
        elsif i_ix < NUM_LOOPS-1 then
          i_ix <= i_ix + 1;
        end if;

        -- Input registers
        s_x_reg <= s_x_in;
        s_y_reg <= s_y_in;

        -- Use input registers or not
        if USE_INREG then
          s_x_v := s_x_reg;
          s_y_v := s_y_reg;
        else
          s_x_v := s_x_in;
          s_y_v := s_y_in;
        end if;

        -- Range reduction to right plane (+/- PI/2)
        if s_x_v(s_x_v'high) = '1' then
          s_x_red_v  := - s_x_v;
          s_y_red_v  := - s_y_v;
          b_ph_msb_v := '1';            -- MSB of phase
        else
          s_x_red_v  := s_x_v;
          s_y_red_v  := s_y_v;
          b_ph_msb_v := '0';
        end if;

        -- Control CORDIC iterations
        if b_new_iter_v = '1' then
          -- Input to CORDIC from input port
          s_x_toCordic  <= resize(s_x_red_v, s_x_red_v'length+2) & TRAIL_ZEROES_XY;
          s_y_toCordic  <= resize(s_y_red_v, s_x_red_v'length+2) & TRAIL_ZEROES_XY;
          s_ph_toCordic <= b_ph_msb_v & TRAIL_ZEROES_PH;
        else
          -- Input to CORDIC from last CORDIC output
          s_x_toCordic  <= s_x_fromCordic;
          s_y_toCordic  <= s_y_fromCordic;
          s_ph_toCordic <= s_ph_fromCordic;
        end if;

        -- Prepare enable for output registers
        y_last_state_v   := (i_ix = NUM_LOOPS-1);
        y_last_state_dly <= y_last_state_v;

        -- Results to register, ready flag
        if y_last_state_v and not y_last_state_dly then
          s_x_unrounded  <= s_x_fromCordic;
          s_ph_unrounded <= s_ph_fromCordic;
          b_rdy_o        <= '1';
        else
          b_rdy_o <= '0';
        end if;

        -- Mark busy between receiving b_start and reaching last state
        if b_start_in = '1' or b_new_iter_v = '1' then
          v_busy := true;
        elsif y_last_state_v and v_busy then
          v_busy := false;
        end if;

        -- cannot directly convert from boolean to std_logic
        if v_busy = true then
          b_busy_o <= '1';
        else
          b_busy_o <= '0';
        end if;

      end if;

    end if;

  end process;


  -------------------------------------------------------------------------
  -- Cut off protection digits and round if desired (without extra register
  -------------------------------------------------------------------------

  -- ROUNDING = True: Cut off protection digits and round
  gen_round : if ROUNDING generate
  begin
    s_x_o <= s_x_unrounded(XY_CALC_WID-1 downto XY_CALC_WID - X_OUT_WID)  -- @ result is unsigned
             + ('0' & s_x_unrounded(XY_CALC_WID - X_OUT_WID -1));
    s_ph_o <= s_ph_unrounded(PH_CALC_WID-1 downto PH_CALC_WID - PH_OUT_WID)
              + ('0' & s_ph_unrounded(PH_CALC_WID - PH_OUT_WID -1));
  end generate;

  -- ROUNDING = False: Cut off protection digits but no round
  gen_no_round : if not ROUNDING generate
  begin
    s_x_o  <= s_x_unrounded(XY_CALC_WID-1 downto XY_CALC_WID - X_OUT_WID);
    s_ph_o <= s_ph_unrounded(PH_CALC_WID-1 downto PH_CALC_WID - PH_OUT_WID);
  end generate;


  ---------------------------------
  -- Iterations for one clock cycle
  ---------------------------------

  BLK_ITER : block
    -- Signals to connect the iteration stages
    type t_arr_xy is array(0 to ITER_PER_CLK) of signed(XY_CALC_WID-1 downto 0);
    type t_arr_ph is array(0 to ITER_PER_CLK) of signed(PH_CALC_WID-1 downto 0);
    signal s_x_i         : t_arr_xy;
    signal s_y_i         : t_arr_xy;
    signal s_ph_i        : t_arr_ph;
    signal u_loop_ix_raw : unsigned (TAB_AD_WID downto 0);
    signal u_loop_ix     : unsigned (TAB_AD_WID-1 downto 0);
  begin
    -- Loop index (convert to unsigned in two steps to avoid truncate warning when ...
    --      i_ix = 2**TAB_AD_WID after the last iteration)
    u_loop_ix_raw <= to_unsigned(i_ix, TAB_AD_WID+1);
    u_loop_ix     <= u_loop_ix_raw(TAB_AD_WID-1 downto 0);

    -- Input to first stage
    s_x_i(0)  <= s_x_toCordic;
    s_y_i(0)  <= s_y_toCordic;
    s_ph_i(0) <= s_ph_toCordic;

    -- Sequence of iterations in a single clk cycle
    gen_iter : for i in 0 to ITER_PER_CLK-1 generate
      -- CORDIC iteration
      cordic_iter : entity work.cordic_iter
        generic map(
          XY_WID       => XY_CALC_WID,
          PH_WID       => PH_CALC_WID,
          NUM_LOOPS    => NUM_LOOPS,
          TAB_AD_WID   => TAB_AD_WID,
          ITER_PER_CLK => ITER_PER_CLK,
          TAB_OFFS     => i
          )
        port map(
          s_x_in       => s_x_i(i),
          s_y_in       => s_y_i(i),
          u_loop_ix_in => u_loop_ix,
          s_ph_in      => s_ph_i(i),
          s_x_o        => s_x_i(i+1),
          s_y_o        => s_y_i(i+1),
          s_ph_o       => s_ph_i(i+1)
          );
    end generate;

    -- Output from last stage
    s_x_fromCordic  <= s_x_i(ITER_PER_CLK);
    s_y_fromCordic  <= s_y_i(ITER_PER_CLK);
    s_ph_fromCordic <= s_ph_i(ITER_PER_CLK);

  end block BLK_ITER;

end architecture Behavioral;
