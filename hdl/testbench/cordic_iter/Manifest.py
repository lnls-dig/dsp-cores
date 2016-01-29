action = "simulation"
sim_tool = "modelsim"
vcom_opt = "-2008"
machine_pkg = "uvx_130M"

top_module = "cordic_tb2"



target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../../../","../../ip_cores/general-cores/","../../sim/test_pkg/"]}

files = ["cordic_tb2.vhd"]
