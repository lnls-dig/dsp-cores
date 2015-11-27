action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "gen_test"

modules = {"local" : ["../../", "../../top/ml605/bpm_dsp_example/","../../sim/test_pkg/"]}

files = ["gen_test.vhd"]
