action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "input_gen_tb"

modules = {"local" : ["../../","../../sim/test_pkg/","../../sim/test_pkg/"]}

files = ["input_gen_tb.vhd"]
