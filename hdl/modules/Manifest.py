files = [ "dsp_cores_pkg.vhd" ];

modules = { "local" : [
            "position_calc",
            "wb_position_calc",
            "wb_bpm_swap",
            "multiplier",
            "pipeline",
            "ce_synch",
            "counters_gen",
            "cic",
            "cordic",
            "cordic_iter",
            "divider",
            "mixer",
            "delta_sigma",
            "pipeline",
            "strobe_gen",
            "clock_driver",
            "rp_math_pack",
            "part_delta_sigma",
         ] };
