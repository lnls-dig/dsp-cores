onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cic_bench/clock
add wave -noupdate /cic_bench/reset
add wave -noupdate /cic_bench/ce
add wave -noupdate /cic_bench/data_in
add wave -noupdate /cic_bench/data_out
add wave -noupdate /cic_bench/cic_valid
add wave -noupdate /cic_bench/endoffile
add wave -noupdate /cic_bench/c_input_freq
add wave -noupdate /cic_bench/c_clock_period
add wave -noupdate /cic_bench/c_cycles_to_reset
add wave -noupdate /cic_bench/c_input_width
add wave -noupdate /cic_bench/c_output_width
add wave -noupdate /cic_bench/c_diff_delay
add wave -noupdate /cic_bench/c_stages
add wave -noupdate /cic_bench/c_decimation_rate
add wave -noupdate /cic_bench/c_bus_width
add wave -noupdate -divider cic
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAIN_WIDTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAOUT_WIDTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/M
add wave -noupdate /cic_bench/uut/cmp_cic_decim/N
add wave -noupdate /cic_bench/uut/cmp_cic_decim/MAXRATE
add wave -noupdate /cic_bench/uut/cmp_cic_decim/BITGROWTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/ROUND_CONVERGENT
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAOUT_FULL_WIDTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAOUT_EXTRA_BITS
add wave -noupdate /cic_bench/uut/cmp_cic_decim/clk_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/rst_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/en_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_o
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_out_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_o
add wave -noupdate /cic_bench/uut/cmp_cic_decim/datain_extended
add wave -noupdate /cic_bench/uut/cmp_cic_decim/integrator
add wave -noupdate /cic_bench/uut/cmp_cic_decim/diffdelay
add wave -noupdate /cic_bench/uut/cmp_cic_decim/pipe
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_out_full
add wave -noupdate /cic_bench/uut/cmp_cic_decim/sampler
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_reg0
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_int
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_samp
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_comb
add wave -noupdate /cic_bench/uut/cmp_cic_decim/i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {8350704553 ps} {8350705218 ps}
