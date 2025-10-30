action = "simulation"
target = "xilinx"
syn_device = "xc7a200t"
sim_tool = "ghdl"
top_module = "cic_decim_tb"

modules = {"local" : ["../"]}

use_cic_decim_vhdl = True

ghdl_opt = "--std=08"

sim_post_cmd = "ghdl -r --std=08 cic_decim_tb --wave=cic_decim_tb.ghw --assert-level=error"
