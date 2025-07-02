action = "simulation"
sim_tool = "modelsim"
top_module = "cordic_bench"
vcom_opt = "-2008"

target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../../../", "../../../modules/cordic/", "../../../ip_cores/general-cores/","../../../sim/test_pkg/"]}

files = ["cordic_core_tb.vhd"]

machine_pkg = "uvx_130M"
