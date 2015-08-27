vsim -l output.log -t 1ps -L unisim work.wbs_mixer_tb -voptargs="+acc"
add wave sim:/wbs_mixer_tb/*
add wave sim:/wbs_mixer_tb/DUT/*
add wave sim:/wbs_mixer_tb/DUT/core/*
add wave sim:/wbs_mixer_tb/DUT/wrapper/*
assertion action -cond fail -exec exit
onbreak quit
run -all
--view wave
--do wave.do
log -r /*
-- run 12 us
-- config wave -signalnamewidth 1
-- wave zoomfull
-- radix -hexadecimal
