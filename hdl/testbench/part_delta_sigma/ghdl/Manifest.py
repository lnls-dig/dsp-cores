action = "simulation"
sim_tool = "ghdl"
top_module = "part_delta_sigma_tb"
target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../"]}

ghdl_opt = "--std=08 -frelaxed -fsynopsys"

sim_post_cmd = "ghdl -r --std=08 %s --wave=%s.ghw --assert-level=error" % (top_module, top_module)
