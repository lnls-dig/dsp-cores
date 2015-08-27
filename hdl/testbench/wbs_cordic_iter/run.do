vsim -l output.log -t 1ps -L unisim work.wbs_cordic_iter_tb -voptargs="+acc"
add wave sim:/wbs_cordic_iter_tb/*
add wave sim:/wbs_cordic_iter_tb/DUT/wrapper/*
add wave sim:/wbs_cordic_iter_tb/DUT/wrapper/source/*
assertion action -cond fail -exec exit
onbreak quit
run -all
do wave.do
log -r /*
-- run 12 us
-- config wave -signalnamewidth 1
-- wave zoomfull
-- radix -hexadecimal
