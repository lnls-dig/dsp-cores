action = "simulation"
sim_tool = "modelsim"
top_module = "cic_compare_tb"
vcom_opt = "-2008"
sim_top = "cic_compare_tb"

target = "xilinx"
syn_device = "xc7a200t"

use_cic_decim_vhdl = True

modules = {"local" : ["../../", "../../modules/cic/","../../ip_cores/general-cores/","../../sim/test_pkg/", "../cic/wb_bpm_swap"]}

files = ["cic_compare_tb.vhd"]

machine_pkg = "sirius_sr_250M"
