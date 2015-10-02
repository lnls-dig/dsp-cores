#!/bin/bash

wbgen2 -V wb_pos_calc_regs.vhd -H record -p wb_pos_calc_regs_pkg.vhd -K ../../../sim/regs/wb_pos_calc_regs.vh -s defines -C pos_calc_regs.h -f html -D doc/pos_calc_regs_wb.html wb_pos_calc_regs.wb
