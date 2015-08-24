vsim -l output.log -t 1ps -L unisim work.wb_stream_source_tb -voptargs="+acc"
add wave sim:/wb_stream_source_tb/*
add wave sim:/wb_stream_source_tb/DUT/r_mid_tgd
add wave sim:/wb_stream_source_tb/DUT/busy_o
add wave sim:/wb_stream_source_tb/DUT/update_out
assertion action -cond fail -exec exit
onbreak quit
-- run -all
run 2.5 us
config wave -signalnamewidth 1
wave zoomfull
radix -hexadecimal
