#exec make -f Makefile
vsim -l output.log -t 1ps -L unisim work.cordic_tb -voptargs="+acc"

add wave /cordic_tb/*
add wave /cordic_tb/uut/*

radix -decimal
assertion action -cond fail -exec exit
onbreak quit
run -all