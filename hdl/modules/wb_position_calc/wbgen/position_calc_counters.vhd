library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity position_calc_counters is
  generic (
    g_ctnr_size                             : natural := 16
  )
  port (
    clk_i                                   : std_logic; -- clock period = 4.44116091946435 ns (225.16635135135124 Mhz)
    rst_n                                   : std_logic;

    -- Clock enables for various rates
    tbt_ce_i                                : std_logic;
    fofb_ce_i                               : std_logic;
    monit_cic_ce_i                          : std_logic;
    monit_cfir_ce_i                         : std_logic;
    monit_pfir_ce_i                         : std_logic;
    monit_01_ce_i                           : std_logic;

    tbt_decim_q_ch01_incorrect_i            : std_logic;
    tbt_decim_q_ch23_incorrect_i            : std_logic;

    fofb_decim_q_01_missing_i               : std_logic;
    fofb_decim_q_01_missing_i               : std_logic;

    monit_cic_unexpected_i                  : std_logic;
    monit_cfir_incorrect_i                  : std_logic;
    monit_pfir_incorrect_i                  : std_logic;

    monit_pos_1_incorrect_i                 : std_logic;

    tbt_incorrect_ctnr_ch01_o               : std_logic_vector(16 downto 0);
    tbt_incorrect_ctnr_ch23_o               : std_logic_vector(16 downto 0);

    fofb_incorrect_ctnr_ch01_o              : std_logic_vector(16 downto 0);
    fofb_incorrect_ctnr_ch23_o              : std_logic_vector(16 downto 0);

    monit_cic_incorrect_ctnr_o              : std_logic_vector(16 downto 0);
    monit_cfir_incorrect_ctnr_o             : std_logic_vector(16 downto 0);
    monit_pfir_incorrect_ctnr_o             : std_logic_vector(16 downto 0);

    monit_01_incorrect_ctnr_o               : std_logic_vector(16 downto 0)
  );
end position_calc_counters;

architecture syn of position_calc_counters is

  signal tbt_incorrect_ctnr_ch01_int         : unsigned(g_ctnr_size-1 downto 0);
  signal tbt_incorrect_ctnr_ch23_int         : unsigned(g_ctnr_size-1 downto 0);

  signal fofb_incorrect_ctnr_ch01_int        : unsigned(g_ctnr_size-1 downto 0);
  signal fofb_incorrect_ctnr_ch23_int        : unsigned(g_ctnr_size-1 downto 0);

  signal monit_cic_incorrect_ctnr_int        : unsigned(g_cntr_size-1 downto 0);
  signal monit_cfir_incorrect_ctnr_int       : unsigned(g_cntr_size-1 downto 0);
  signal monit_pfir_incorrect_ctnr_int       : unsigned(g_cntr_size-1 downto 0);
  signal monit_01_incorrect_ctnr_int         : unsigned(g_cntr_size-1 downto 0);

begin

  p_tbt_incorrect_ctnr : process(clk_i)
  begin
    if rising_edge(clk_i) then
      if rst_n = '0' then
        tbt_incorrect_ctnr_ch01_int <= 0;
        tbt_incorrect_ctnr_ch23_int <= 0;
      elsif tbt_ce_i = '1' then
        if tbt_decim_q_ch01_incorrect_i = '1' then
          tbt_incorrect_ctnr_ch01_int <= tbt_incorrect_ctnr_ch01_int + 1;
        end if;

        if tbt_decim_q_ch23_incorrect_i = '1' then
          tbt_incorrect_ctnr_ch23_int <= tbt_incorrect_ctnr_ch23_int + 1;
        end if;
      end if;
    end if;
  end;

  tbt_incorrect_ctnr_ch01_o <= std_logic_vector(tbt_incorrect_ctnr_ch01_int,
                                                  g_ctnr_size);

end position_calc_counters;
