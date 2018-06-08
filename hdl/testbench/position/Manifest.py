action = "simulation"
sim_tool = "modelsim"
vcom_opt = "-2008"
top_module = "position_tb"
sim_top = "cic_bench"

target = "xilinx"
syn_device = "xc7a200t"

machine_pkg = "sirius_sr_250M"

modules = {"local" : ["../../",
                        "../../ip_cores/general-cores/","../../sim/test_pkg/"]}

files = ["position_tb.vhd", "blk_mem_gen_v8_2.vhd"]
