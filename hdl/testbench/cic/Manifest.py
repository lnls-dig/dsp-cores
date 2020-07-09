action = "simulation"
sim_tool = "modelsim"
top_module = "cic_bench"
vcom_opt = "-2008"
sim_top = "cic_bench"

target = "xilinx"
syn_device = "xc7a200t"

modules = {"local" : ["../../", "../../modules/cic/","../../ip_cores/general-cores/","../../sim/test_pkg/", "wb_bpm_swap"]}

files = ["cic_bench.vhd"]

machine_pkg = "sirius_sr_250M"
