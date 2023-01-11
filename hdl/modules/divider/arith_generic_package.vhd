library ieee;
use ieee.std_logic_1164.all;

use work.utilities.all;

package arith_generic is
  ------------------------------------------------------------------------------------------
  -- Fixed-point divider
  ------------------------------------------------------------------------------------------
  --   Performs the operation "n_i" (numerator) divided by "d_i" (denominator), both
  --   containing "G_DATAIN_WIDTH" bits, and presents the result in "q_o" (quotient) and
  --   "r_o" (remainder) after "G_PRECISION"+2 clock cycles. "q_o" contains "G_PRECISION"+1
  --   bits (msb is the sign bit, 2's complement) and "r_o" contains the same number of bits
  --   as "n_i" and "d_i". Both division results (quotient and remainder) has the decimal
  --   point shifted "G_PRECISION" bits to the left in relation to the operands' (numerator
  --   and denominator) decimal points, which must be in the same position.
  --
  --   "trg" and "rdy" are one-clock-cycle controls to request new division calculation and
  --   indicate its completion, respectively.
  --
  --   "err_o" is asserted when a trigger comes before a division completion. A new trigger
  --   is only allowed after "G_PRECISION"+1 clock cycles after the valid trigger.
  --
  --   Known limitations:
  --      - The denominator must be greater than the numerator.
  ------------------------------------------------------------------------------------------
  component div_fixedpoint is
    generic
      (
        G_DATAIN_WIDTH : integer range 2 to 48;
        G_PRECISION    : integer range 1 to 47
        );
    port
      (
        clk_i : in  std_logic;
        rst_i : in  std_logic;
        ce_i  : in  std_logic;
        n_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
        d_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
        q_o   : out std_logic_vector(G_PRECISION downto 0);
        r_o   : out std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
        trg_i : in  std_logic;
        rdy_o : out std_logic;
        err_o : out std_logic
        );
  end component;

  ------------------------------------------------------------------------------------------
  -- Floating-point divider
  ------------------------------------------------------------------------------------------
  --   Performs the operation "n_i" (numerator) divided by "d_i" (denominator), both
  --   containing "G_DATA_WIDTH" bits, and presents the result in "q_o" (quotient) and
  --   "r_o" (remainder) after "G_DATA_WIDTH"+4 clock cycles. "q_o" and "r_o" contain the
  --   same number of bits as "n_i" and "d_i" (msb is the sign bit, 2's complement). The
  --   decimal point of "n_i" or the decimal point of "d_i" is shifted to the left before
  --   performing a fixed-point division. With the left shift, the "n_i" arithmetic msb is
  --   put one position below the "d_i" arithmetic msb. The shift amplitude is presented in
  --   the "shift_o" output.
  --
  --   The final division result (quotient and remainder) has the decimal point shifted by
  --   "G_DATA_WIDTH" - 1 + shift_o.
  --
  --   "trg" and "rdy" are one-clock-cycle flags to request new division calculation and
  --   indicate its completion, respectively.
  --
  --   "err_o" is asserted when a trigger comes before a division completion. A new trigger
  --   is only allowed after "G_DATA_WIDTH"+5 clock cycles after the valid trigger.
  --
  --   Known limitations:
  --      - The denominator must be positive.
  --      - It is not possible to trigger a new calculation during the clock cycle that data
  --          ready is asserted.
  --      - The position of the most significant bit of the numerator must not exceed
  --          "G_DATA_WIDTH"-3.
  ------------------------------------------------------------------------------------------
  component div_floatingpoint is
    generic
      (
        G_DATA_WIDTH : integer range 2 to 48
        );
    port
      (
        clk_i   : in  std_logic;
        rst_i   : in  std_logic;
        ce_i    : in  std_logic;
        n_i     : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
        d_i     : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
        q_o     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
        r_o     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
        shift_o : out std_logic_vector(log2(G_DATA_WIDTH) downto 0);
        trg_i   : in  std_logic;
        rdy_o   : out std_logic;
        err_o   : out std_logic
        );
  end component;

  ------------------------------------------------------------------------------------------
  --
  ------------------------------------------------------------------------------------------
  ------------------------------------------------------------------------------------------
  component div_ieee754_single is
    generic
      (
        G_DATA_WIDTH : integer range 2 to 48
        );
    port
      (
        clk_i : in  std_logic;
        rst_i : in  std_logic;
        ce_i  : in  std_logic;
        n_i   : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
        d_i   : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
        q_o   : out std_logic_vector(31 downto 0);
        trg_i : in  std_logic;
        rdy_o : out std_logic;
        err_o : out std_logic
        );
  end component;

end arith_generic;


----------------------------------------------------------------------------------------------
-- div_fixedpoint
----------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity div_fixedpoint is
  generic
    (
      G_DATAIN_WIDTH : integer range 2 to 48 := 48;
      G_PRECISION    : integer range 1 to 47 := 47
      );
  port
    (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
      n_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      d_i   : in  std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      q_o   : out std_logic_vector(G_PRECISION downto 0);
      r_o   : out std_logic_vector(G_DATAIN_WIDTH-1 downto 0);
      trg_i : in  std_logic;
      rdy_o : out std_logic;
      err_o : out std_logic
      );
end div_fixedpoint;

architecture rtl of div_fixedpoint is
  signal quo          : signed(G_PRECISION downto 0);
  signal num          : signed(G_DATAIN_WIDTH downto 0);
  signal den          : signed(G_DATAIN_WIDTH downto 0);
  type t_div_state is (IDLE, DIVIDING, SIGNAL_ADJ);
  signal div_state    : t_div_state;
  signal div_cnt      : integer range 0 to G_PRECISION;
  signal is_negative  : boolean;
begin

  process(clk_i)
    variable result_tmp : signed(G_DATAIN_WIDTH downto 0);
    begin
      if rst_i = '1' then
          quo <= (others => '0');
          div_cnt <= 0;
          rdy_o <= '0';
          err_o <= '0';
      elsif rising_edge(clk_i) and ce_i = '1' then

        case div_state is
          when IDLE =>
            rdy_o <= '0';
            err_o <= '0';
            -- New division requested
            if trg_i = '1' then
              -- Denominator should be different than 0, signal an error otherwise
              if signed(d_i) = 0 then
                err_o <= '1';
              else
                -- Check if d_i or n_i are negative, convert both to positive
                -- values
                if signed(d_i) < 0 then
                  den <= '0' & (signed(not(d_i)) + 1);
                else
                  den <= '0' & signed(d_i);
                end if;
                if signed(n_i) < 0 then
                  num <= '0' & (signed(not(n_i)) + 1);
                else
                  num <= '0' & signed(n_i);
                end if;
                -- Mark the is_negative flag
                is_negative <= d_i(d_i'high) /= n_i(n_i'high);
                -- Number of bits to compute minus one
                div_cnt <= G_PRECISION;
                div_state <= DIVIDING;
              end if;
            end if;

          when DIVIDING =>
            -- Subtract step
            result_tmp := num - den;

            -- Check if an underflow occurred, if true shift num to the left
            -- and mark the correspondent bit from the quotient as '0'.
            -- Otherwise mark the correspondent bit from the quotient as '1'
            -- and store the subtraction result shifted to the left in 'num'
            if result_tmp(result_tmp'high) = '1' then
              num <= shift_left(num, 1);
              quo(div_cnt) <= '0';
            else
              num <= shift_left(result_tmp, 1);
              quo(div_cnt) <= '1';
            end if;

            -- Check if all bits of the quotient were computed
            if div_cnt = 0 then
              div_state <= SIGNAL_ADJ;
            else
              div_cnt <= div_cnt - 1;
            end if;

          when SIGNAL_ADJ =>
            -- Adjust the result signal if dividing numbers of different signal
            if is_negative then
              q_o <= std_logic_vector(not(quo) + 1);
            else
              q_o <= std_logic_vector(quo);
            end if;
            r_o <= std_logic_vector(num(num'high-1 downto 0));
            rdy_o <= '1';
            div_state <= IDLE;

        end case;

        -- If a new division is requested when busy, signals an error
        if trg_i = '1' and div_state /= IDLE then
          err_o <= '1';
        end if;

      end if;
  end process;
end rtl;

----------------------------------------------------------------------------------------------
-- div_floatingpoint
----------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.arith_generic.all;
use work.utilities.all;

entity div_floatingpoint is
  generic
    (
      G_DATA_WIDTH : integer range 2 to 48 := 48
      );
  port
    (
      clk_i   : in  std_logic;
      rst_i   : in  std_logic;
      ce_i    : in  std_logic;
      n_i     : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
      d_i     : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
      q_o     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
      r_o     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
      shift_o : out std_logic_vector(log2(G_DATA_WIDTH) downto 0);
      trg_i   : in  std_logic;
      rdy_o   : out std_logic;
      err_o   : out std_logic
      );
end div_floatingpoint;

architecture rtl of div_floatingpoint is

  -- FSM states
  type state_type is (IDLE, CALCULATE_SHIFT, SHIFT, DIVIDE);
  signal state : state_type;

  -- Division initialization and operands hold
  signal slv_n_hold : std_logic_vector(G_DATA_WIDTH-1 downto 0) := (others => '0');
  signal slv_d_hold : std_logic_vector(G_DATA_WIDTH-1 downto 0) := (others => '0');

  -- Entity outputs (auxiliary signals)
  signal sl_rdy : std_logic;
  signal sl_err : std_logic;

  -- Start/stop divison signals
  signal sl_init : std_logic;

  -- Number of bits to shift for increasing division precision
  signal sv_shift : signed(log2(G_DATA_WIDTH) downto 0) := (others => '0');

begin

  div_fixedpoint_inst : div_fixedpoint
    generic map
    (
      G_DATAIN_WIDTH => G_DATA_WIDTH,
      G_PRECISION    => G_DATA_WIDTH-1
      )
    port map
    (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => slv_n_hold,
      d_i   => slv_d_hold,
      q_o   => q_o,
      r_o   => r_o,
      trg_i => sl_init,
      rdy_o => sl_rdy,
      err_o => open
      );

  -- Assigns internal signals to output
  shift_o <= std_logic_vector(sv_shift);
  err_o   <= sl_err;

  -- Only asserts ready output if fixed-point division has finished and there was no bad trigger.
  rdy_o <= sl_rdy and not(sl_err);


  -- Finite state-machine which sequences the operations: wait for trigger (idle), calculate shift, shift and divide.
  prc_fsm : process(rst_i, clk_i)
    variable v_sv_msb_n, v_sv_msb_d   : signed(log2(G_DATA_WIDTH) downto 0);
    variable v_sv_n_hold, v_sv_d_hold : signed(G_DATA_WIDTH-1 downto 0);
    variable v_i_shift                : integer range 0 to G_DATA_WIDTH-1;

  begin
    if rst_i = '1' then
      state   <= IDLE;
      sl_init <= '0';

    elsif rising_edge(clk_i) then
      if ce_i = '1' then
        case state is
          when IDLE =>
            if trg_i = '1' then
              state <= CALCULATE_SHIFT;
            end if;

            slv_n_hold <= n_i;
            slv_d_hold <= d_i;

          when CALCULATE_SHIFT =>
            state <= SHIFT;

            v_sv_msb_n := signed(find_msb(slv_n_hold, slv_n_hold(slv_n_hold'left)));
            v_sv_msb_d := signed(find_msb(slv_d_hold, slv_d_hold(slv_d_hold'left)));
            sv_shift   <= v_sv_msb_d - v_sv_msb_n - 1;
            sl_init    <= '0';

          when SHIFT =>
            state <= DIVIDE;

            v_i_shift := to_integer(abs(sv_shift));
            if sv_shift > 0 then
              v_sv_n_hold := signed(slv_n_hold);
              slv_n_hold  <= std_logic_vector(v_sv_n_hold sll v_i_shift);
            else
              v_sv_d_hold := signed(slv_d_hold);
              slv_d_hold  <= std_logic_vector(v_sv_d_hold sll v_i_shift);
            end if;
            sl_init <= '1';

          when DIVIDE =>
            if sl_rdy = '1' and trg_i = '1' then
              state <= CALCULATE_SHIFT;
            elsif sl_rdy = '1' then
              state <= IDLE;
            end if;

            sl_init <= '0';

          when others =>
            state <= IDLE;
        end case;
      end if;
    end if;
  end process;

  -- Asserts error when trigger comes before end of division.
  prc_error : process(rst_i, clk_i)
  begin
    if rst_i = '1' then
      sl_err <= '0';
    elsif rising_edge(clk_i) then
      if ce_i = '1' then
        if state = IDLE and trg_i = '1' then
          sl_err <= '0';
        elsif state = DIVIDE and trg_i = '1' and sl_rdy = '1' then
          sl_err <= '0';
        elsif trg_i = '1' then
          sl_err <= '1';
        end if;
      end if;
    end if;
  end process;

end rtl;



----------------------------------------------------------------------------------------------
-- div_ieee754_single
----------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.arith_generic.all;
use work.utilities.all;

entity div_ieee754_single is
  generic
    (
      G_DATA_WIDTH : integer range 2 to 48 := 48
      );
  port
    (
      clk_i : in  std_logic;
      rst_i : in  std_logic;
      ce_i  : in  std_logic;
      n_i   : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
      d_i   : in  std_logic_vector(G_DATA_WIDTH-1 downto 0);
      q_o   : out std_logic_vector(31 downto 0);
      trg_i : in  std_logic;
      rdy_o : out std_logic;
      err_o : out std_logic
      );
end div_ieee754_single;

architecture rtl of div_ieee754_single is

  -- FSM states
  type state_type is (IDLE, CHECK_SIGNAL, CALCULATE_SHIFT, SHIFT, CHECK_ADDITIONAL_SHIFT, DIVIDE);
  signal state : state_type := IDLE;

  -- Division initialization and operands hold
  signal slv_n_hold : std_logic_vector(G_DATA_WIDTH-1 downto 0) := (others => '0');
  signal slv_d_hold : std_logic_vector(G_DATA_WIDTH-1 downto 0) := (others => '0');

  -- Entity outputs (auxiliary signals)
  signal sl_rdy : std_logic;
  signal sl_err : std_logic;

  -- Start/stop divison signals
  signal sl_init : std_logic := '0';

  -- Sections of 32-bit single precision binary
  signal slv_signed_mantissa : std_logic_vector(24 downto 0);
  signal sv_exponent         : signed(7 downto 0);
  signal sl_result_signal    : std_logic;

  -- Number of bits to shift for increasing division precision
  signal sv_shift : signed(log2(G_DATA_WIDTH) downto 0) := (others => '0');

begin

  div_fixedpoint_inst : div_fixedpoint
    generic map
    (
      G_DATAIN_WIDTH => G_DATA_WIDTH,
      G_PRECISION    => 24
      )
    port map
    (
      clk_i => clk_i,
      rst_i => rst_i,
      ce_i  => ce_i,
      n_i   => slv_n_hold,
      d_i   => slv_d_hold,
      q_o   => slv_signed_mantissa,
      r_o   => open,
      trg_i => sl_init,
      rdy_o => sl_rdy,
      err_o => open
      );

  -- Assigns internal signals to output
  -- Note: additional shift for making 1 <= mantissa < 2 (instead of .5 <= mantissa < 1 result of integer division)
  -- The msb (always equals to 1 (positive number) or 0 (negative number)) is discarded since the IEEE 754 already considers it implicitly)
  q_o   <= sl_result_signal & std_logic_vector(sv_exponent) & slv_signed_mantissa(22 downto 0);
  err_o <= sl_err;

  -- Only asserts ready output if fixed-point division has finished and there was no bad trigger.
  rdy_o <= sl_rdy and not(sl_err);

  -- Finite state-machine which sequences the operations: wait for trigger (idle), calculate shift, shift and divide.
  prc_fsm : process(rst_i, clk_i)
    variable v_sv_msb_n, v_sv_msb_d   : signed(log2(G_DATA_WIDTH) downto 0);
    variable v_sv_n_hold, v_sv_d_hold : signed(G_DATA_WIDTH-1 downto 0);
    variable v_i_shift                : integer range 0 to G_DATA_WIDTH-1;

  begin
    if rst_i = '1' then
      state   <= IDLE;
      sl_init <= '0';

    elsif rising_edge(clk_i) then
      if ce_i = '1' then
        case state is
          when IDLE =>
            if trg_i = '1' then
              state            <= CALCULATE_SHIFT;
              sl_result_signal <= n_i(n_i'left);
              slv_n_hold       <= std_logic_vector(abs(signed(n_i)));
              slv_d_hold       <= d_i;
            end if;

          when CALCULATE_SHIFT =>
            state <= SHIFT;

            v_sv_msb_n := signed(find_msb(slv_n_hold, slv_n_hold(slv_n_hold'left)));
            v_sv_msb_d := signed(find_msb(slv_d_hold, slv_d_hold(slv_d_hold'left)));
            sv_shift   <= v_sv_msb_d - v_sv_msb_n;
            sl_init    <= '0';

          when SHIFT =>
            state <= CHECK_ADDITIONAL_SHIFT;

            v_i_shift := to_integer(abs(sv_shift));
            if sv_shift > 0 then
              v_sv_n_hold := signed(slv_n_hold);
              slv_n_hold  <= std_logic_vector(v_sv_n_hold sll v_i_shift);
            else
              v_sv_d_hold := signed(slv_d_hold);
              slv_d_hold  <= std_logic_vector(v_sv_d_hold sll v_i_shift);
            end if;
            sl_init <= '0';

          when CHECK_ADDITIONAL_SHIFT =>
            state <= DIVIDE;

            v_sv_n_hold := signed(slv_n_hold);
            v_sv_d_hold := signed(slv_d_hold);

            if (v_sv_n_hold > v_sv_d_hold) then
              v_sv_n_hold := signed(slv_n_hold);
              slv_n_hold  <= std_logic_vector(v_sv_n_hold srl 1);
              sv_shift    <= sv_shift - 1;
            end if;

            sl_init <= '1';

          when DIVIDE =>
            -- Add 127 offset to exponent and subtract 1 due to additional shift for making 1 <= mantissa < 2
            sv_exponent <= to_signed(126, 8) - resize(sv_shift, 8);

            if sl_rdy = '1' and trg_i = '1' then
              state <= CALCULATE_SHIFT;
            elsif sl_rdy = '1' then
              state <= IDLE;
            end if;

            sl_init <= '0';

          when others =>
            state <= IDLE;
        end case;
      end if;
    end if;
  end process;

  -- Asserts error when trigger comes before end of division.
  prc_error : process(rst_i, clk_i)
  begin
    if rst_i = '1' then
      sl_err <= '0';
    elsif rising_edge(clk_i) then
      if ce_i = '1' then
        if state = IDLE and trg_i = '1' then
          sl_err <= '0';
        elsif state = DIVIDE and trg_i = '1' and sl_rdy = '1' then
          sl_err <= '0';
        elsif trg_i = '1' then
          sl_err <= '1';
        end if;
      end if;
    end if;
  end process;

end rtl;
