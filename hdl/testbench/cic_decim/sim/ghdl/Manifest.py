action = "simulation"
sim_tool = "ghdl"
top_module = "cic_decim_tb2"

modules = {"local" : ["../"]}

use_cic_decim_vhdl = True

ghdl_opt = "--std=08"

sim_post_cmd = "ghdl -r --std=08 %s --wave=%s.ghw --assert-level=error" % (top_module, top_module)
