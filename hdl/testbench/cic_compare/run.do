vcom cic_compare_tb.vhd
-- make -f Makefile
-- output log file to file "output.log", set simulation resolution to "fs"
vsim -l output.log -voptargs="+acc" -t fs +notimingchecks -L unisim work.cic_compare_tb

set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
run 100000ms
radix -hexadecimal
wave zoomfull
radix -hexadecimal
