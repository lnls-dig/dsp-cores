onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mixer_bench/adc_data
-- log //cmp_signal_gen/*