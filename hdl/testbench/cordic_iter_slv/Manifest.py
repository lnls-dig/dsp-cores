action = "simulation"
sim_tool = "modelsim"
vcom_opt = "-2008"
machine_pkg = "uvx_130M"

top_module = "cordic_slv_tb"

target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../../../"]}

files = ["cordic_slv_tb.vhd"]
