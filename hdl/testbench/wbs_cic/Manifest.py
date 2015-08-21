action = "simulation"
sim_tool = "modelsim"
top_module = "cic_bench"

target = "xilinx"
syn_device = "xc6vlx240t"

modules = {"local" : ["../../", "../../modules/cic/"]}

files = ["cic_bench.vhd"]
