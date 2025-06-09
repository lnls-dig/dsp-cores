-------------------------------------------------------------------------------
-- Title      : CIC decimator with dynamically-adjustable decimator
-------------------------------------------------------------------------------
-- Author     : Augusto Fraga Giachero <augusto.fraga@lnls.br>
-- Company    : CNPEM LNLS-GIE
-- Platform   : Generic
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: CIC decimator with dinamically adjustable decimation rate
--
-- The CIC has a valid signal (act) pipeline that signals when the data is
-- filling integrator and comb pipelines. When the decimation strobe
-- comes (act_out_i), the data in the last integrator register is sampled
-- to the comb stage. However, to allow the decimation strobe to happen in
-- a different clock period from the valid input signal, the valid signal
-- in the last register is marked as invalid during the decimation. The
-- sampling only happens when this register is valid, avoiding data corruption
-- from occasional spurious decimation strobes.
--
-- Design based on Daniel Tavare's verilog implementation
-------------------------------------------------------------------------------
-- Copyright (c) 2023 CNPEM
-- Licensed under GNU Lesser General Public License (LGPL) v3.0
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                Description
-- 2023-01-20  1.0      augusto.fraga         Created
-- 2025-05-06  1.0      david.daminelli       Fixes in translation
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cic_decim is
  generic (
    DATAIN_WIDTH     : integer := 16;
    DATAOUT_WIDTH    : integer := 16;
    M                : integer := 2;  -- Comb Delay
    N                : integer := 5;  -- Filter Order
    MAXRATE          : integer := 64; -- This is not used anywhere
    BITGROWTH        : integer := 35; -- Internal bit extension
    ROUND_CONVERGENT : integer := 0
  );
  port (
    clk_i     : in  std_logic;  -- Clock
    rst_i     : in  std_logic;  -- Reset
    en_i      : in  std_logic;  -- Enable Input
    data_i    : in  std_logic_vector(DATAIN_WIDTH-1 downto 0); -- Input Data
    data_o    : out std_logic_vector(DATAOUT_WIDTH-1 downto 0);-- Output Data
    act_i     : in  std_logic;  -- Input that enables the acting
    act_out_i : in  std_logic;  -- Strobe to allow the decimation.
    val_o     : out std_logic   -- Valid output flag
    );
end entity;

architecture cic_decim_arch of cic_decim is
  constant c_dataout_full_width : natural := DATAIN_WIDTH + BITGROWTH;
  constant c_dataout_extra_bits : integer := c_dataout_full_width - DATAOUT_WIDTH;
  type t_signed_array is array (natural range <>) of signed(c_dataout_full_width-1 downto 0);
  type t_signed_matrix is array (natural range <>) of t_signed_array(M-1 downto 0);

  function f_replicate(x : std_logic; len : natural)
    return std_logic_vector
  is
    variable v_ret : std_logic_vector(len-1 downto 0) := (others => x);
  begin
    return v_ret;
  end f_replicate;

  -- round using "convergent rounding" method
  function f_convergent_round(x : std_logic_vector; x_new_msb : natural)
    return std_logic_vector
  is
    constant x_old_msb : natural := x'left;
    constant x_extra_msb : natural := x_old_msb - x_new_msb - 1;
    variable v_x_conv : std_logic_vector(x_new_msb downto 0);
  begin
    -- if it's midscale (tie), converge to even integers
    if (unsigned(x(x_extra_msb downto 0)) =
        unsigned('1' & f_replicate('0', x_extra_msb))) then
      v_x_conv := std_logic_vector(unsigned(x(x_old_msb downto x_extra_msb+1)) +
                                   unsigned'("" & x(x_extra_msb+1)));
    -- otherwise, round to nearest integer
    else
      v_x_conv := std_logic_vector(unsigned(x(x_old_msb downto x_extra_msb+1)) +
                                   unsigned'("" & x(x_extra_msb)));
    end if;

    -- overflow, saturate
    if v_x_conv(v_x_conv'left) /= x(x_old_msb) then
      return x(x_old_msb) & f_replicate(not x(x_old_msb), x_new_msb);
    end if;

    return v_x_conv;
  end f_convergent_round;

  signal integrator : t_signed_array(N-1 downto 0);
  signal pipe       : t_signed_array(N-1 downto 0);
  signal diff_delay : t_signed_matrix(N-1 downto 0); -- This is a NxM matrix
  signal act_integ  : std_logic_vector(N-1 downto 0);
  signal act_comb   : std_logic_vector(N-1 downto 0);
  signal sampler    : signed(c_dataout_full_width-1 downto 0);
  signal act_samp   : std_logic;
  signal val_int    : std_logic;
begin
  process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_i = '1' then
        diff_delay <= (others => (others => (others => '0')));
        integrator <= (others => (others => '0'));
        pipe       <= (others => (others => '0'));
        act_integ  <= (others => '0');
        act_comb   <= (others => '0');
        sampler    <= (others => '0');
        data_o     <= (others => '0');
        act_samp   <= '0';
        val_int    <= '0';
        val_o      <= '0';
      elsif en_i = '1' then -- if rst_i = '1' then

        -- Integrator sections
        if act_i = '1' then
          integrator(0) <= integrator(0) + resize(signed(data_i), c_dataout_full_width);
          act_integ(0)  <= '1';
          for i in 1 to N-1 loop
            integrator(i) <= integrator(i) + integrator(i-1);
            act_integ(i)  <= act_integ(i-1);
          end loop;
        else --  if act_i = '1'
          -- Clear the act_integ flag only when the COMB section acknowledges it
          if act_out_i = '1' then
            act_integ(N-1) <= '0';
          end if; -- if act_out_i = '1'
        end if; --  if act_i = '1'

        -- Comb sections
        if act_out_i = '1' and act_integ(N-1) = '1' then
          sampler  <= integrator(N-1);
          act_samp <= '1';
          diff_delay(0)(0) <= sampler;

          for j in 1 to M-1 loop
            diff_delay(0)(j) <= diff_delay(0)(j-1);
          end loop;

          pipe(0) <= sampler - diff_delay(0)(M-1);
          act_comb(0) <= act_samp;

          for i in 1 to N-1 loop
            diff_delay(i)(0) <= pipe(i-1);
            for j in 1 to M-1 loop
              diff_delay(i)(j) <= diff_delay(i)(j-1);
            end loop;
            pipe(i) <= pipe(i-1) - diff_delay(i)(M-1);
            act_comb(i) <= act_comb(i-1);
          end loop;

          if N = 1 then
            val_int <= act_samp;
          else -- if N = 1
            val_int <= act_comb(N-2);
          end if; -- if N = 1

        else -- if act_out_i = '1' and act_integ(N-1) = '1'
          val_int <= '0';
        end if; -- if act_out_i = '1' and act_integ(N-1) = '1'

        val_o <= val_int;

        -- Output section
        if c_dataout_extra_bits = 0 then
          data_o <= std_logic_vector(pipe(N-1));
        elsif c_dataout_extra_bits > 0 then -- if c_dataout_extra_bits = 0
          if ROUND_CONVERGENT = 1 then
            -- Convergent round
            data_o <= f_convergent_round(std_logic_vector(pipe(N-1)), DATAOUT_WIDTH);
          else -- if ROUND_CONVERGENT = 1
            -- Truncate least significant bits
            data_o <= std_logic_vector(pipe(N-1)(c_dataout_full_width-1 downto c_dataout_extra_bits));
          end if; -- if ROUND_CONVERGENT = 1
        else -- if c_dataout_extra_bits = 0
          -- Sign-extend bits as selected data output width > computed data output
          -- width
          data_o <= std_logic_vector(resize(pipe(N-1), DATAOUT_WIDTH));
        end if; -- if c_dataout_extra_bits = 0
      end if; -- if rst_i = '1'
    end if; -- if rising_edge(clk_i)
  end process;
end architecture;
