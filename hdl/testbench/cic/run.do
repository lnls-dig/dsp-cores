vcom cic_bench.vhd
-- make -f Makefile
-- output log file to file "output.log", set simulation resolution to "fs"
vsim -l output.log -t 1ps -L unisim work.cic_bench -voptargs="+acc"
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
radix -hexadecimal
run -all
wave zoomfull
radix -hexadecimal
