action = "simulation"
sim_tool = "modelsim"
top_module = "wbs_mixer"
machine_pkg = "uvx_130M"
target = "xilinx"
vcom_opt = "-2008"
syn_device = "xc7a200t"


modules = {"local" : ["../../", "../../modules/mixer/"]}

files = ["wbs_mixer_tb.vhd"]

