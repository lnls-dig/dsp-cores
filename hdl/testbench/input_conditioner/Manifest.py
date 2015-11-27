action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "conditioner_bench"

modules = {"local" : ["../../", "../../top/ml605/ddc_chain/","../../sim/test_pkg/"]}

files = ["conditioner_bench.vhd"]
