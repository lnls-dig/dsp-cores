vcom cic_bench.vhd
-- make -f Makefile
-- output log file to file "output.log", set simulation resolution to "fs"
vsim -l output.log -voptargs="+acc" -t fs +notimingchecks -L unisim work.cic_bench

set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
radix -hexadecimal
run 50us
wave zoomfull
radix -hexadecimal
