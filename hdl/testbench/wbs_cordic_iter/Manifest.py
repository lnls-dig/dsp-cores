action = "simulation"
target = "xilinx"
vcom_opt = "-2008"

syn_device = "xc7a200t"
sim_tool = "modelsim"
top_module = "wbs_cordic_iter_tb"

modules = {"local" : ["../../"]}#, "../../ip_cores/general-cores/"]}

files = ["wbs_cordic_iter_tb.vhd"]

machine_pkg = "uvx_130M"
