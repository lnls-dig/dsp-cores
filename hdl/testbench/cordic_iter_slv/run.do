vsim -l output.log -t 1ps -L unisim work.cordic_slv_tb -voptargs="+acc"
assertion action -cond fail -exec exit
onbreak quit
run -all