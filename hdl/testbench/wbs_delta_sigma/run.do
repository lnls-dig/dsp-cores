vsim -l output.log -t 1ps -L unisim work.wbs_delta_sigma_tb -voptargs="+acc"
add wave sim:/wbs_delta_sigma_tb/*
add wave sim:/wbs_delta_sigma_tb/DUT/wrapper/*
add wave sim:/wbs_delta_sigma_tb/DUT/core/*
assertion action -cond fail -exec exit
onbreak quit
run -all
--run 8 us
--do wave.do
log -r /*
quit -sim
-- run 12 us
-- config wave -signalnamewidth 1
-- wave zoomfull
-- radix -hexadecimal
