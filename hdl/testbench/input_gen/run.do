vcom input_gen_tb.vhd
-- make -f Makefile
-- output log file to file "output.log", set siulation resolution to "ps"
vsim -l output.log -t 1ps -L unisim work.input_gen_tb -voptargs="+acc"
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
do wave.do
-- do wave_compl.do
radix -hexadecimal
-- run 250us
-- end of run determined at VHDL code (end of file)
run -all 
wave zoomfull
radix -hexadecimal
