action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "multiplier_bench"

modules = {"local" : ["../../", "../../modules/multiplier/"]}

files = ["multiplier_bench.vhd"]
