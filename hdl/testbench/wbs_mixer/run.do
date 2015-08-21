vsim -l output.log -t 1ps -L unisim work.wbs_mixer_tb -voptargs="+acc"
add wave sim:/wbs_mixer_tb/*
assertion action -cond fail -exec exit
onbreak quit
run -all
-- run 12 us
-- config wave -signalnamewidth 1
-- wave zoomfull
-- radix -hexadecimal
