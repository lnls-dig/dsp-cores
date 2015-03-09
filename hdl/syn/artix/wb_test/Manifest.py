target = "xilinx"
action = "synthesis"

#syn_device = "xc7k325t" #KC705 evalboard
syn_device = "xc7a200t" #Creotech PCB
#syn_device = "xc6vlx240t" #ML605

#syn_package = "ffg900" #KC705 evalboard
syn_package = "ffg1156" #Creotech PCB
#syn_package = "ff1156" #ML605

syn_top = "wb_test"
syn_project = "wb_test.xise"
syn_grade = "-1"


modules = {"local" : ["../../../top/ml605/wb_test/"]}
