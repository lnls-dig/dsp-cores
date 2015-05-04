target = "xilinx"
action = "synthesis"

syn_device = "xc6vlx240t"
syn_grade = "-1"
syn_package = "ff1156"
syn_top = "ddc_chain"
syn_project = "ddc_chain.xise"

machine_pkg = "uvx"

modules = { "local" : [ "../../../top/ml605/ddc_chain" ] };
