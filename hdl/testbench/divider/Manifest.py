action = "simulation"
sim_tool = "modelsim"
top_module = "div_tb"
vcom_opt = "-2008"

target = "xilinx"
syn_device = "xc7a200t"


machine_pkg = "uvx_130M" # uvx_130M sirius_130M


modules = {"local" : ["../../", 
                        "../../ip_cores/general-cores/", "../../sim/test_pkg/"]}
files = ["div_tb.vhd"]
