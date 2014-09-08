target = "xilinx"
action = "synthesis"

syn_device = "xc6vlx240t"
syn_grade = "-1"
syn_package = "ff1156"
syn_top = "bpm_dsp_example"
syn_project = "bpm_dsp_example.xise"

modules = { "local" : [ "../../../top/ml605/bpm_dsp_example" ] };
