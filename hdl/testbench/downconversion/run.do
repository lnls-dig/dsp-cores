vcom downconv_bench.vhd
-- make -f Makefile
-- output log file to file "output.log", set siulation resolution to "fs"
vsim -l output.log -t 1ps -L unisim work.downconv_bench -voptargs="+acc"
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
