files = [ "dsp_cores_pkg.vhd" ];

modules = { "local" : [	"position_calc",
			"wb_position_calc",
			"wb_un_cross",
<<<<<<< HEAD
            "sw_windowing"
=======
			"multiplier",
<<<<<<< HEAD
			"cic"
>>>>>>> 7367d09... Generic CIC filter tested
=======
			"cic",
			"cordic"
>>>>>>> 1a181ba... Cordic module added, still lacks proper testing for polar to rect function.
                      ] };
