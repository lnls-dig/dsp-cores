action = "simulation"
target = "xilinx"
syn_device = "xc7a200t"
sim_tool = "modelsim"
top_module = "delta_sigma_tb"

machine_pkg = "uvx_130M"

modules = {"local" : ["../../"]}

files = ["delta_sigma_tb.vhd"]
