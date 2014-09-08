library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.arith_dsp48e.all;
use work.utilities.all;

entity divider_impl_test_top is
port
(
    CLK_SYS_125_INT_P   : in    std_logic;
    CLK_SYS_125_INT_N   : in    std_logic;
    SYS_FP_LED : out std_logic_vector(7 downto 0)  
);
end divider_impl_test_top;

architecture structural of divider_impl_test_top is
    
    ---------------------------------------------------------------------------
    -- ICON/VIO/ILA components
    ---------------------------------------------------------------------------
    component icon
    port
    (
        CONTROL0    : inout std_logic_vector(35 downto 0);
        CONTROL1    : inout std_logic_vector(35 downto 0)
    );
    end component;

    component vio
    port
    (
        CONTROL     : inout std_logic_vector(35 downto 0);
        CLK         : in std_logic;
        SYNC_IN     : in std_logic_vector(255 downto 0);
        SYNC_OUT    : out std_logic_vector(255 downto 0)
    );
    end component;

    component ila
    port
    (
        CONTROL     : inout std_logic_vector(35 downto 0);
        CLK         : in std_logic;
        DATA        : in std_logic_vector(80 downto 0);
        TRIG0       : in std_logic_vector(1 downto 0)
    );
    end component;
    
    ---------------------------------------------------------------------------
    -- VIO interface
    ---------------------------------------------------------------------------
    signal slv_icon_control0    : std_logic_vector(35 downto 0);
    signal slv_icon_control1    : std_logic_vector(35 downto 0);
    signal slv_vio_out          : std_logic_vector(255 downto 0);
        -----------------------------------------------------------------------
        -- VIO OUTPUT                      RANGE
        -----------------------------------------------------------------------
        -- Reset                                   0
        -- Numerator                   25 downto   1
        -- Denominator                 50 downto  26
        -- Trigger                                51
        -- Select numerator from VIO              52
        -- Numerator initialization    77 downto  53
        -- Numerator step             102 downto  78
        -- Number of iterations       112 downto 103
        
    signal slv_vio_in           : std_logic_vector(255 downto 0);
        -----------------------------------------------------------------------
        -- VIO INPUT                       RANGE
        -----------------------------------------------------------------------
    
    signal sl_clk               : std_logic;
    signal sl_rdy               : std_logic;
    signal sl_trg_divider       : std_logic;
    
    signal sl_select_n_vio      : std_logic;
    
    signal slv_q                : std_logic_vector(24 downto 0);
    signal slv_r                : std_logic_vector(24 downto 0);
    signal slv_shift            : std_logic_vector(5 downto 0);
    
    signal slv_n                : std_logic_vector(24 downto 0);
    signal slv_n_generated      : std_logic_vector(24 downto 0);

    signal slv_ila_trg          : std_logic_vector(1 downto 0);
    signal slv_data_ila         : std_logic_vector(80 downto 0);

signal led: std_logic;

begin

    ibufgds_inst: ibufgds
    port map
    (
        I  => CLK_SYS_125_INT_P,
        IB => CLK_SYS_125_INT_N,
        O  => sl_clk
    );
    
    div_inst: div_floatingpoint
    generic map
    (
        G_DATA_WIDTH => 25
    )
    port map
    (
        i_clk   => sl_clk,
        i_rst   => slv_vio_out(0),
        i_n     => slv_n,
        i_d     => slv_vio_out(50 downto 26),
        o_q     => slv_q,
        o_r     => slv_r,
        o_shift => slv_shift,
        i_trg   => sl_trg_divider,
        o_rdy   => sl_rdy,
        o_err   => open
    );

    icon_inst: icon
    port map
    (
        CONTROL0 => slv_icon_control0,
        CONTROL1 => slv_icon_control1
    );
    
    vio_inst: vio
    port map
    (
        CONTROL  => slv_icon_control0,
        CLK      => sl_clk,
        SYNC_IN  => slv_vio_in,
        SYNC_OUT => slv_vio_out
    );
     
    ila_inst: ila
    port map
    (
        CONTROL => slv_icon_control1,
        CLK     => sl_clk,
        DATA    => slv_data_ila,
        TRIG0   => slv_ila_trg
    );

    data_generator_inst: data_generator
    generic map
    (
        G_DATA_WIDTH => 25
    )
    port map
    (
        i_clk           => sl_clk,
        i_rst           => slv_vio_out(51),                 
        i_data_init     => slv_vio_out(77 downto 53),
        i_data_step     => slv_vio_out(102 downto 78),
        i_niterations   => slv_vio_out(112 downto 103),
        o_data          => slv_n_generated,
        o_trg           => sl_trg_divider
    );
    
    slv_ila_trg <= sl_rdy & slv_vio_out(51);

    slv_data_ila <= slv_q & slv_r & slv_shift & slv_n;

    sl_select_n_vio <= slv_vio_out(52);

    slv_n <= slv_vio_out(25 downto 1) when sl_select_n_vio = '1' else
             slv_n_generated;

    SYS_FP_LED(7 downto 0) <= (others=>'0');
    
end structural;