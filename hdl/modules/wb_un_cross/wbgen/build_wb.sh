#!/bin/bash

wbgen2 -V wb_bpm_swap_regs.vhd -H record -p xbpm_swap_regs_pkg.vhd -K ../../../../sim/regs/xbpm_swap_regs.vh -s struct -C wb_bpm_swap.h -f html -D doc/xbpm_swap_regs_wb.html xbpm_swap.wb
