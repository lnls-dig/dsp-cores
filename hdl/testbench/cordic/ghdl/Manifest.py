action = "simulation"
target = "xilinx"
syn_device = "xc7a200t"
sim_tool = "ghdl"
top_module = "cordic_tb"

modules = {"local" : ["../"]}

use_cic_decim_vhdl = True

ghdl_opt = "--std=08"

sim_post_cmd = f"ghdl -r {ghdl_opt} {top_module} --wave={top_module}.ghw --assert-level=error"
