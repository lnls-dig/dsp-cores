vsim -l output.log -t 1ps -L unisim work.wb_stream_wrapper_tb -voptargs="+acc"
add wave sim:/wb_stream_wrapper_tb/*
add wave sim:/wb_stream_wrapper_tb/DUT/*
assertion action -cond fail -exec exit
onbreak quit
-- run -all
run 6 us
log -r /*
config wave -signalnamewidth 1
wave zoomfull
radix -hexadecimal
quit -sim
