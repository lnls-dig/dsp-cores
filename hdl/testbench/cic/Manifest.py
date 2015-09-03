action = "simulation"
sim_tool = "modelsim"
top_module = "cic_bench"
vcom_opt = "-2008"

target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../../", "../../modules/cic/"]}

files = ["cic_bench.vhd"]

machine_pkg = "uvx_130M"
