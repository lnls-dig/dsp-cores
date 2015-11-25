vsim -l output.log -t 1ps -L unisim work.cordic_tb2 -voptargs="+acc"
assertion action -cond fail -exec exit
onbreak quit
run -all