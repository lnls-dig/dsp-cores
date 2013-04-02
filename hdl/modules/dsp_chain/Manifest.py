files = ["dsp_cores_pkg.vhd"];

if (target == "xilinx" and syn_device[0:4].upper()=="XC6V"): # Virtex6 Only. Should be the whole part number...
	modules = { "local" : ["generated"] };
