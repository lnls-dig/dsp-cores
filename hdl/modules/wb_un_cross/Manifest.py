files = [  "wb_bpm_swap.vhd",
           "xwb_bpm_swap.vhd",
           "wbgen/xbpm_swap_regs_pkg.vhd",
           "wbgen/wb_bpm_swap_regs.vhd"
        ]

modules = { "local" : ["cross_uncross_core"] }

# Select between synthesis or simulation components
#if (action == "synthesis" ):
#    if(target == "xilinx" and syn_device[0:4].upper()=="XC6V"):
#        modules = {"local" : [ "syn" ]}
#    else:
#        print "WARNING: Device not supported for synthesis using the bpm_swap core!"
#elif (action == "simulation"):
#    if (target == "xilinx"):
#        modules = {"local" : [ "sim"]}
#    else:
#        print "WARNING: Device not supported for simulation using the bpm_swap core!"



