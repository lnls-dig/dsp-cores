action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "dds_bench"

modules = {"local" : ["../../", "../../modules/fixed_dds/","../../sim/test_pkg/"]}

files = ["dds_bench.vhd"]
