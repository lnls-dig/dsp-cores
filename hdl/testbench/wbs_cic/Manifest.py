action = "simulation"
sim_tool = "modelsim"
top_module = "wbs_cic_dual"
machine_pkg = "uvx_130M"
target = "xilinx"
vcom_opt = "-2008"
syn_device = "xc7a200t"

modules = {"local" : ["../../"]}#, "../../ip_cores/general-cores/"]}

files = ["wbs_cic_dual_tb.vhd"]

machine_pkg = "uvx_130M"
