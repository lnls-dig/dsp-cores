action = "simulation"
target = "xilinx"
vcom_opt = "-2008"
syn_device = "xc7a200t"
sim_tool = "modelsim"
top_module = "mixer_bench"

modules = {"local" : ["../../", "../../ip_cores/general-cores/"]}

files = ["mixer_bench.vhd", "blk_mem_gen_v8_2.vhd"]

machine_pkg = "uvx_130M"
