target = "xilinx"
action = "synthesis"

syn_device = "xc7a200t"
syn_grade = "-1"
syn_package = "ffg1156"
syn_top = "wbs_cordic_iter_top"
syn_project = "wbs_cordic_iter_top"
syn_tool = "vivado"

machine_pkg = "uvx_130M"

modules = {"local" : ["../../../top/artix/wbs_cordic_iter/"]}
