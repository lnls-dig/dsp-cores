files = [ "dsp_cores_pkg.vhd" ];

modules = { "local" : [
            "position_calc",
            "wb_position_calc",
            "wb_bpm_swap",
            "sw_windowing",
            "multiplier",
            "pipeline",
            "ce_synch",
            "cic",
            "cordic",
            "cordic_iter",
            "divider",
            "fixed_dds",
            "mixer",
            "downconv",
            "delta_sigma",
            "pipeline",
            "input_gen",
            "strobe_gen",
            "clock_driver",
            "machine",
            "rp_math_pack",
            "part_delta_sigma"
         ] };
