action = "simulation"
sim_tool = "modelsim"
top_module = "cordic_bench"

target = "xilinx"
syn_device = "xc6vlx240t"

modules = {"local" : ["../../", "../../modules/cordic/", "../../ip_cores/general-cores/"]}

files = ["cordic_bench.vhd"]
