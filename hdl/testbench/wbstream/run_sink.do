vsim -l output.log -t 1ps -L unisim work.wb_stream_sink_tb -voptargs="+acc"
add wave sim:/wb_stream_sink_tb/*
assertion action -cond fail -exec exit
onbreak quit
run -all
run 1.5 us