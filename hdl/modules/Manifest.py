files = [ "dsp_cores_pkg.vhd" ];

modules = { "local" : [
			"position_calc",
            		"wb_position_calc",
			"wb_un_cross",
                        "sw_windowing",
			"multiplier",
			"pipeline",
			"cic",
			"cordic",
			"divider",
			"fixed_dds",
			"mixer",
			"downconv",
			"delta_sigma",
			"pipeline",
			"input_gen",
                        "clock_driver"
         ] };
