files = ["position_calc.vhd"];

if (target == "xilinx" and syn_device[0:4].upper()=="XC6V"): # Virtex6
    modules = { "local" : ["generated/virtex6"] };
    print("[dsp-cores] Using FPGA family: " + syn_device)
elif (target == "xilinx" and syn_device[0:4].upper()=="XC7A"): # Artix7
    modules = { "local" : ["generated/artix7"] };
    print("[dsp-cores] Using FPGA family: " + syn_device)
else
    print("[dsp-cores] Unsupported FPGA family: " + syn_device)
