action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "downconv_bench"

modules = {"local" : ["../../","../../sim/test_pkg/","../../sim/test_pkg/"]}

files = ["downconv_bench.vhd"]
