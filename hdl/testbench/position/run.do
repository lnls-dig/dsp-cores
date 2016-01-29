vcom position_tb.vhd
vsim -l output.log -t 1ps -L unisim work.position_tb -voptargs="+acc"
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
add wave sim:/position_tb/*
do wave.do
-- do wave_compl.do
radix -hexadecimal
-- run 250us
-- run 100us
run -all
wave zoomfull
radix -hexadecimal
