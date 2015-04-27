action = "simulation"
target = "xilinx"
sim_tool = "modelsim"
top_module = "ddc_bench"

syn_device = "xc6vlx240t"

modules = {"local" : ["../../", "../../top/ml605/ddc_chain/"]}

files = ["ddc_bench.vhd"]
