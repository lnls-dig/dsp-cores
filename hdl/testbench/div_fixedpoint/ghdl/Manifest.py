action = "simulation"
sim_tool = "ghdl"
top_module = "div_fixedpoint_tb"

target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../"]}

ghdl_opt = "--std=08 -fsynopsys -frelaxed"

sim_post_cmd = "ghdl -r --std=08 div_fixedpoint_tb --wave=div_fixedpoint_tb.ghw --assert-level=error"
