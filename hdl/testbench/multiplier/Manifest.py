action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "multiplier_bench"

modules = {"local" : ["../../", "../../modules/multiplier/","../../sim/test_pkg/"]}

files = ["multiplier_bench.vhd"]
