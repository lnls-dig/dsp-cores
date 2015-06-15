vcom position_tb.vhd

-- vcom  -work blk_mem_gen_v8_2 -93 "../../platform/artix7/blk_mem_gen/sim/sin_lut_uvx_35_148.vhd"
-- vcom  -incr  -work blk_mem_gen_v8_2  "../../platform/artix7/blk_mem_gen/blk_mem_gen_v8_2/simulation/blk_mem_gen_v8_2.vhd"

-- make -f Makefile
-- output log file to file "output.log", set siulation resolution to "fs"
vsim -l output.log -t 1ps -L unisim work.position_tb -voptargs="+acc"
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
-- do wave_compl.do
radix -hexadecimal
-- run 250us
-- run 100us
run -all
wave zoomfull
radix -hexadecimal
