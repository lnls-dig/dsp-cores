onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /conditioner_bench/adc_data
log //uut/*
log //uut/cmp_lut/*
log //*