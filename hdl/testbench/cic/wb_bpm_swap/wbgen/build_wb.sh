#!/bin/bash

wbgen2 -V wb_bpm_swap_regs.vhd -H record -p wb_bpm_swap_regs_pkg.vhd -K ../../../sim/regs/wb_bpm_swap_regs.vh -s defines -C wb_bpm_swap_regs.h -f html -D doc/wb_bpm_swap_regs_wb.html wb_bpm_swap.wb
