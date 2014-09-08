def __dirs():
	dirs = ["modules",  "./ip_cores/general-cores", "./ip_cores/concordic/"]

	if (target == "xilinx" and syn_device[0:4].upper()=="XC6V"):
		dirs.extend(["platform/virtex6"]);
	#elif (target == "xilinx" and syn_device[0:4].upper()=="XC7K"):
	#	dirs.extend(["platform/kintex7/ip_cores"]);
	elif (target == "xilinx" and syn_device[0:4].upper()=="XC7A"):
		dirs.extend(["platform/artix7"]);
	#else: #add paltform here and generate the corresponding ip cores
	return dirs

modules = {
    "local" : __dirs()
           }
