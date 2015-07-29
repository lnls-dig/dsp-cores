-------------------------------------------------------------------------------
-- Title      : Wishbone Stream package
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wb_stream_pkg.vhd
-- Author     : aylons  <aylons@LNLS190>
-- Company    : 
-- Created    : 2014-08-12
-- Last update: 2015-07-28
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

-- library work;
-- use work.wishbone_pkg.all;


package wb_stream_pkg is

  -- These widths are used for connecting blocks. The actual bus width for each
  -- connection will be determined by the actual interface components, in
  -- their generics.
  constant c_wbs_address_width : integer := 4; --8
  constant c_wbs_data_width    : integer := 32; --128
  constant c_wbs_tgd_width     : natural := 4; -- 128

  subtype t_wbs_address is
    std_logic_vector(c_wbs_address_width-1 downto 0);

  subtype t_wbs_data is
    std_logic_vector(c_wbs_data_width-1 downto 0);

  subtype t_wbs_tgd is
    std_logic_vector(c_wbs_tgd_width-1 downto 0);

  --constant c_WBS_DATA : unsigned(c_wbs_address_width-1 downto 0) := to_unsigned(0, c_wbs_address_width);

--  constant c_WBS_OOB : unsigned(c_wbs_address_width-1 downto 0) := to_unsigned(1, c_wbs_address_width); 

  --constant c_WBS_STATUS : unsigned(c_wbs_address_width-1 downto 0) := to_unsigned(2, c_wbs_address_width);

  --constant c_WBS_USER : unsigned(c_wbs_address_width-1 downto 0) := to_unsigned(3, c_wbs_address_width);

  --constant c_TGD_ERROR_BIT : natural := 0;

  --constant c_WRF_OOB_TYPE_RX : std_logic_vector(3 downto 0) := "0000";
  --constant c_WRF_OOB_TYPE_TX : std_logic_vector(3 downto 0) := "0001";

  --type t_wbs_status_reg is record
  --  is_hp       : std_logic;
  --  has_smac    : std_logic;
  --  has_crc     : std_logic;
  --  error       : std_logic;
  --  tag_me      : std_logic;
  --  match_class : std_logic_vector(7 downto 0);
  --end record;

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

  --type t_wrf_oob is record
  --  valid: std_logic;
  --  oob_type : std_logic_vector(3 downto 0);
  --  ts_r     : std_logic_vector(27 downto 0);
  --  ts_f     : std_logic_vector(3 downto 0);
  --  frame_id : std_logic_vector(15 downto 0);
  --  port_id  : std_logic_vector(5 downto 0);
  --end record;

  --type t_wbs_source_in_array is array (natural range <>) of t_wbs_source_in;
  --type t_wbs_source_out_array is array (natural range <>) of t_wbs_source_out;

  --subtype t_wbs_sink_in_array is t_wbs_source_out_array;
  --subtype t_wbs_sink_out_array is t_wbs_source_in_array;

  -- function f_marshall_wbs_status (stat  : t_wbs_status_reg) return std_logic_vector;
  -- function f_unmarshall_wbs_status(stat : std_logic_vector) return t_wbs_status_reg;

  function f_packet_num_bits(packet_size : natural) return natural;

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
      adr_i   : in  std_logic_vector(c_wbs_address_width-1 downto 0);
      dat_i   : in  std_logic_vector(c_wbs_data_width-1 downto 0);
      dvalid_i : in  std_logic;
      tgd_i    : in  std_logic_vector(c_wbs_tgd_width-1 downto 0);
      --sof_i    : in  std_logic;
      --eof_i    : in  std_logic;
      --error_i  : in  std_logic;
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
      addr_o   : out std_logic_vector(c_wbs_address_width-1 downto 0);
      data_o   : out std_logic_vector(c_wbs_data_width-1 downto 0);
      dvalid_o : out std_logic;
      tgd_o    : out std_logic_vector(c_wbs_tgd_width-1 downto 0);
      --sof_o     : out std_logic;
      --eof_o     : out std_logic;
      --error_o   : out std_logic;
      --bytesel_o : out std_logic_vector((c_wbs_data_width/8)-1 downto 0);
      busy_i   : in  std_logic
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
      g_simultaneous  : natural);
    port (
      clk_i   : in  std_logic;
      rst_i   : in  std_logic;
      ce_i    : in  std_logic;
      snk_i   : in  t_wbs_sink_in;
      snk_o   : out t_wbs_sink_out;
      src_i   : in  t_wbs_source_in;
      src_o   : out t_wbs_source_out;
      --ce_o    : out std_logic;
      addr_o  : out std_logic_vector(c_wbs_address_width-1 downto 0);
      addr_i  : in  std_logic_vector(c_wbs_address_width-1 downto 0);
      data_o  : out std_logic_vector(g_input_width-1 downto 0);
      data_i  : in  std_logic_vector(g_output_width-1 downto 0);
      valid_o : out std_logic;
      valid_i : in  std_logic);
  --error_o : out std_logic;
  --error_i : in  std_logic);
  end component wb_stream_wrapper;
  
end wb_stream_pkg;

package body wb_stream_pkg is

  --function f_marshall_wbs_status(stat : t_wbs_status_reg)
  --  return std_logic_vector
  --is
  --  -- Wishbone bus data_width is at least 16 bits
  --  variable tmp : std_logic_vector(c_wbs_data_width-1 downto 0);
  --begin
  --  tmp(0)           := stat.is_hp;
  --  tmp(1)           := stat.error;
  --  tmp(2)           := stat.has_smac;
  --  tmp(3)           := stat.has_crc;
  --  tmp(15 downto 8) := stat.match_class;
  --  return tmp;
  --end;

  --function f_unmarshall_wbs_status(stat : std_logic_vector)
  --  return t_wbs_status_reg
  --is
  --  variable tmp : t_wbs_status_reg;
  --begin
  --  tmp.is_hp       := stat(0);
  --  tmp.error       := stat(1);
  --  tmp.has_smac    := stat(2);
  --  tmp.has_crc     := stat(3);
  --  tmp.match_class := stat(15 downto 8);
  --  return tmp;
  --end f_unmarshall_wbs_status;

  function f_packet_num_bits(packet_size : natural)
    return natural
  is
                                        -- Slightly different behaviour than the one located at wishbone_pkg.vhd
    function f_ceil_log2(x : natural) return natural is
    begin
      if x <= 2
      then return 1;
      else return f_ceil_log2((x+1)/2) +1;
      end if;
    end f_ceil_log2;

  begin
    return f_ceil_log2(packet_size);
  end f_packet_num_bits;

end wb_stream_pkg;
