files = [  "cic_dyn.vhd", "log2.v", "decimation_strober.vhd", "cic_dual.vhd"  ]

if use_cic_decim_vhdl:
    files.append("cic_decim.vhd")
else:
    files.append("cic_decim.v")
