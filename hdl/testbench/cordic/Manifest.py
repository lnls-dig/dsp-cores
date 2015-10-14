action = "simulation"
sim_tool = "modelsim"
top_module = "cordic_bench"
vcom_opt = "-2008"

target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../../", "../../modules/cordic/", "../../ip_cores/general-cores/"]}

files = ["cordic_bench.vhd"]

machine_pkg = "uvx_130M"
