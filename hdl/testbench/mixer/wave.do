onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mixer_bench/adc_data
add wave -noupdate /mixer_bench/endoffile
log //uut/*