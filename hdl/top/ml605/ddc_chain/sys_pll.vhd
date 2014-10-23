
--  MMCM_BASE  : In order to incorporate this function into the design,
--    VHDL     : the following instance declaration needs to be placed
--  instance   : in the body of the design code.  The instance name
-- declaration : (MMCM_BASE_inst) and/or the port declarations after the
--    code     : "=>" declaration maybe changed to properly reference and
--             : connect this function to the design.  All inputs and outputs
--             : must be connected.

--   Library   : In addition to adding the instance declaration, a use
-- declaration : statement for the UNISIM.vcomponents library needs to be
--     for     : added before the entity declaration.  This library
--   Xilinx    : contains the component declarations for all Xilinx
-- primitives  : primitives and points to the models that will be used
--             : for simulation.

--  Copy the following two statements and paste them before the
--  Entity declaration, unless they already exist.

library UNISIM;
use UNISIM.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

entity sys_pll is
generic(
  -- 200 MHz input clock
  g_divclk_divide                           : integer := 4;
  g_clkin_period                            : real := 5.000;
  g_clkbout_mult_f                          : real := 13.000;
        
  -- 100 MHz output clock             
  g_clk0_divide_f                           : real := 2.0;
  -- 200 MHz output clock                 
  g_clk1_divide                             : integer := 5
);      
port(     
  rst_i                                     : in std_logic := '0';
  clk_i                                     : in std_logic := '0';
  clk0_o                                    : out std_logic;
  clk1_o                                    : out std_logic;
  locked_o                                  : out std_logic 
);
end sys_pll;

architecture syn of sys_pll is

  signal s_mmcm_fbin                        : std_logic;
  signal s_mmcm_fbout                       : std_logic;
              
  signal s_clk0                             : std_logic;
  signal s_clk1                             : std_logic;
begin

  -- MMCM_BASE: Base Mixed Mode Clock Manager
  --            Virtex-6
  -- Xilinx HDL Language Template, version 13.4
  
  -- Clock PLL
  cmp_mmcm : MMCM_ADV
  generic map(
    BANDWIDTH                               => "OPTIMIZED",
    CLKOUT4_CASCADE                         => FALSE,
    CLOCK_HOLD                              => FALSE,
    COMPENSATION                            => "ZHOLD",
    STARTUP_WAIT                            => FALSE,
    DIVCLK_DIVIDE                           => g_divclk_divide,
    CLKFBOUT_MULT_F                         => g_clkbout_mult_f,
    CLKFBOUT_PHASE                          => 0.000,
    CLKFBOUT_USE_FINE_PS                    => FALSE,
    CLKOUT0_DIVIDE_F                        => g_clk0_divide_f,
    CLKOUT0_PHASE                           => 0.000,
    CLKOUT0_DUTY_CYCLE                      => 0.500,
    CLKOUT0_USE_FINE_PS                     => FALSE,
    CLKOUT1_DIVIDE                          => g_clk1_divide,
    CLKOUT1_PHASE                           => 0.000,
    CLKOUT1_DUTY_CYCLE                      => 0.500,
    CLKOUT1_USE_FINE_PS                     => FALSE,
    
    CLKIN1_PERIOD                           => g_clkin_period,
    REF_JITTER1                             => 0.010,
    -- Not used. Just to bypass Xilinx errors
    -- Just input g_clkin_period input clock period
    CLKIN2_PERIOD                           => g_clkin_period,
    REF_JITTER2                             => 0.010
  )
  port map(
    -- Output clocks
    CLKFBOUT                                => s_mmcm_fbout,
    CLKFBOUTB                               => open,
    CLKOUT0                                 => s_clk0,
    CLKOUT0B                                => open,
    CLKOUT1                                 => s_clk1,
    CLKOUT1B                                => open,
    CLKOUT2                                 => open,
    CLKOUT2B                                => open,
    CLKOUT3                                 => open,
    CLKOUT3B                                => open,
    CLKOUT4                                 => open,
    CLKOUT5                                 => open,
    CLKOUT6                                 => open,
    -- Input clock control
    CLKFBIN                                 => s_mmcm_fbin,
    CLKIN1                                  => clk_i,
    CLKIN2                                  => '0',
    -- Tied to always select the primary input clock
    CLKINSEL                                => '1',
    -- Ports for dynamic reconfiguration
    DADDR                                   => (others => '0'),
    DCLK                                    => '0',
    DEN                                     => '0',
    DI                                      => (others => '0'),
    DO                                      => open,
    DRDY                                    => open,
    DWE                                     => '0',
    -- Ports for dynamic phase shift
    PSCLK                                   => '0',
    PSEN                                    => '0',
    PSINCDEC                                => '0',
    PSDONE                                  => open,
    -- Other control and status signals
    LOCKED                                  => locked_o,
    CLKINSTOPPED                            => open,
    CLKFBSTOPPED                            => open,
    PWRDWN                                  => '0',
    RST                                     => rst_i
  );

    -- Global clock buffers for "cmp_mmcm" instance
    cmp_clkf_bufg : BUFG
    port map(
        O                                   => s_mmcm_fbin,
        I                                   => s_mmcm_fbout
    );
        
    cmp_clkout0_buf : BUFG
    port map(
        O                                   => clk0_o,
        I                                   => s_clk0
    );
    
    cmp_clkout1_buf : BUFG
    port map(
        O                                   => clk1_o,
        I                                   => s_clk1
    );

end syn;
                
