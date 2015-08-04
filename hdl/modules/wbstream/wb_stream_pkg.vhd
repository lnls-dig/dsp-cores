-------------------------------------------------------------------------------
-- Title      : Wishbone Stream package
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_pkg.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-08-12
-- Last update: 2015-08-04
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Definitions for components using wishbone stream packages.
-- Heavily based on wb_fabric_pkg.vhd from Tomasz Wlostowski. Originally
-- proposed by Lucas Maziero Russo <lucas.russo@lnls.br>.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-08-12  1.0      aylons  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package wb_stream_pkg is

  -- These widths are used for connecting blocks. The actual bus width for each
  -- connection will be determined by the actual interface components, in
  -- their generics.
  constant c_wbs_address_width : integer := 4;   --8
  constant c_wbs_data_width    : integer := 32;  --128
  constant c_wbs_tgd_width     : natural := 4;   -- 128

  subtype t_wbs_address is
    std_logic_vector(c_wbs_address_width-1 downto 0);

  subtype t_wbs_data is
    std_logic_vector(c_wbs_data_width-1 downto 0);

  subtype t_wbs_tgd is
    std_logic_vector(c_wbs_tgd_width-1 downto 0);

  type t_wbs_source_out is record
    adr : t_wbs_address;
    dat : t_wbs_data;
    tgd : t_wbs_tgd;
    cyc : std_logic;
    stb : std_logic;
  end record;

  subtype t_wbs_sink_in is t_wbs_source_out;

  type t_wbs_source_in is record
    ack   : std_logic;
    stall : std_logic;
  end record;

  subtype t_wbs_sink_out is t_wbs_source_in;

  constant cc_dummy_wbs_addr : std_logic_vector(c_wbs_address_width-1 downto 0):=
    (others => 'X');
  constant cc_dummy_wbs_dat : std_logic_vector(c_wbs_data_width-1 downto 0) :=
    (others => 'X');
  constant cc_dummy_wbs_tgd : std_logic_vector(c_wbs_tgd_width-1 downto 0):=
    (others => 'X');

  
  constant cc_dummy_src_in : t_wbs_source_in := ('0', '0');

  constant cc_dummy_snk_in : t_wbs_sink_in :=
    (cc_dummy_wbs_addr, cc_dummy_wbs_dat, cc_dummy_wbs_tgd, '0', '0');


  -- Components
  component wb_stream_source is
    port (
      clk_i   : in std_logic;
      rst_n_i : in std_logic;

      -- Wishbone Fabric Interface I/O
      src_i : in  t_wbs_source_in;
      src_o : out t_wbs_source_out;

      -- Decoded & buffered logic
      adr_i    : in  std_logic_vector(c_wbs_address_width-1 downto 0);
      dat_i    : in  std_logic_vector(c_wbs_data_width-1 downto 0);
      dvalid_i : in  std_logic;
      tgd_i    : in  std_logic_vector(c_wbs_tgd_width-1 downto 0);
      busy_o   : out std_logic
      );
  end component;

  component wb_stream_sink is
    generic(
      g_dat_width : natural := 32;
      g_adr_width : natural := 4;
      g_tgd_width : natural := 4
      );
    port (
      clk_i : in std_logic;
      rst_i : in std_logic;
      ce_i  : in std_logic;

      -- Wishbone Fabric Interface I/O
      snk_i : in  t_wbs_sink_in;
      snk_o : out t_wbs_sink_out;

      -- Decoded & buffered fabric
      addr_o    : out std_logic_vector(c_wbs_address_width-1 downto 0);
      data_o    : out std_logic_vector(c_wbs_data_width-1 downto 0);
      dvalid_o  : out std_logic;
      tgd_o     : out std_logic_vector(c_wbs_tgd_width-1 downto 0);
      busy_i    : in  std_logic;
      ce_core_i : in  std_logic
      );
  end component wb_stream_sink;


  component wb_stream_wrapper is
    generic (
      g_input_width   : natural;
      g_output_width  : natural;
      g_tgd_width     : natural;
      g_adr_width     : natural;
      g_input_buffer  : natural;
      g_output_buffer : natural;
      g_ce_core       : natural);
    port (
      clk_i     : in  std_logic;
      rst_i     : in  std_logic;
      ce_i      : in  std_logic;
      snk_i     : in  t_wbs_sink_in;
      snk_o     : out t_wbs_sink_out;
      src_i     : in  t_wbs_source_in;
      src_o     : out t_wbs_source_out;
      dat_o     : out std_logic_vector(g_input_width-1 downto 0);
      dat_i     : in  std_logic_vector(g_output_width-1 downto 0);
      busy_i    : in  std_logic;
      valid_o   : out std_logic;
      valid_i   : in  std_logic;
      ce_core_o : out std_logic);
  end component wb_stream_wrapper;
  
end wb_stream_pkg;

package body wb_stream_pkg is

end wb_stream_pkg;
