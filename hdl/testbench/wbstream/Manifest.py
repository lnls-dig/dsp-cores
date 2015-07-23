action = "simulation"
target = "xilinx"
syn_device = "xc6vlx240t"
sim_tool = "modelsim"
top_module = "wb_stream_sink_tb"

modules = {"local" : ["../../", "../../modules/wbstream/"]}

files = ["wb_stream_sink_tb.vhd"]
