onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider bench
add wave -noupdate /cic_bench/clock
add wave -noupdate /cic_bench/reset
add wave -noupdate /cic_bench/ce
add wave -noupdate /cic_bench/ce_out
add wave -noupdate /cic_bench/sw_out
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
add wave -noupdate -divider cic_dyn
add wave -noupdate /cic_bench/uut/g_bus_width
add wave -noupdate /cic_bench/uut/g_delay
add wave -noupdate /cic_bench/uut/g_tag_width
add wave -noupdate /cic_bench/uut/g_input_width
add wave -noupdate /cic_bench/uut/g_max_rate
add wave -noupdate /cic_bench/uut/g_output_width
add wave -noupdate /cic_bench/uut/g_round_convergent
add wave -noupdate /cic_bench/uut/g_stages
add wave -noupdate /cic_bench/uut/g_with_ce_synch
add wave -noupdate /cic_bench/uut/ratio_i
add wave -noupdate /cic_bench/uut/clock_i
add wave -noupdate /cic_bench/uut/reset_i
add wave -noupdate /cic_bench/uut/ce_i
add wave -noupdate /cic_bench/uut/ce_out_i
add wave -noupdate /cic_bench/uut/data_i
add wave -noupdate /cic_bench/uut/valid_i
add wave -noupdate /cic_bench/uut/data_tag_en_i
add wave -noupdate /cic_bench/uut/data_tag_i
add wave -noupdate /cic_bench/uut/data_o
add wave -noupdate /cic_bench/uut/valid_o
add wave -noupdate /cic_bench/uut/data_tag_d0
add wave -noupdate /cic_bench/uut/data_tag_d1
add wave -noupdate /cic_bench/uut/data_d0
add wave -noupdate /cic_bench/uut/data_out
add wave -noupdate /cic_bench/uut/decimation_strobe
add wave -noupdate /cic_bench/uut/fsm_current_state
add wave -noupdate /cic_bench/uut/reset_int
add wave -noupdate /cic_bench/uut/reset_modules
add wave -noupdate /cic_bench/uut/synch_int
add wave -noupdate /cic_bench/uut/valid_d0
add wave -noupdate /cic_bench/uut/valid_out
add wave -noupdate -divider decim_strobe
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/ce_i
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/clock_i
add wave -noupdate -radix unsigned /cic_bench/uut/cmp_decimation_strober/count
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/count_all
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/g_bus_width
add wave -noupdate -radix unsigned /cic_bench/uut/cmp_decimation_strober/g_maxrate
add wave -noupdate -radix unsigned /cic_bench/uut/cmp_decimation_strober/ratio_i
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/reset_i
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/strobe
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/strobe_o
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/valid_i
add wave -noupdate -divider cic
add wave -noupdate /cic_bench/uut/cmp_cic_decim/BITGROWTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAIN_WIDTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAOUT_EXTRA_BITS
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAOUT_FULL_WIDTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/DATAOUT_WIDTH
add wave -noupdate /cic_bench/uut/cmp_cic_decim/M
add wave -noupdate /cic_bench/uut/cmp_cic_decim/MAXRATE
add wave -noupdate /cic_bench/uut/cmp_cic_decim/N
add wave -noupdate /cic_bench/uut/cmp_cic_decim/ROUND_CONVERGENT
add wave -noupdate /cic_bench/uut/cmp_cic_decim/clk_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/rst_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/en_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_out_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_o
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_o
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_int
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_samp
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_comb
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_int
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_out
add wave -noupdate /cic_bench/uut/cmp_cic_decim/data_out_reg
add wave -noupdate /cic_bench/uut/cmp_cic_decim/datain_extended
add wave -noupdate /cic_bench/uut/cmp_cic_decim/diffdelay
add wave -noupdate /cic_bench/uut/cmp_cic_decim/i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/integrator
add wave -noupdate /cic_bench/uut/cmp_cic_decim/j
add wave -noupdate /cic_bench/uut/cmp_cic_decim/pipe
add wave -noupdate /cic_bench/uut/cmp_cic_decim/sampler
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_int
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_out
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_out_reg
add wave -noupdate -divider ce_synch
add wave -noupdate /cic_bench/uut/ce_i
add wave -noupdate /cic_bench/uut/ce_out_i
add wave -noupdate /cic_bench/uut/clock_i
add wave -noupdate /cic_bench/uut/data_i
add wave -noupdate /cic_bench/uut/data_o
add wave -noupdate /cic_bench/uut/data_out
add wave -noupdate /cic_bench/uut/decimation_strobe
add wave -noupdate /cic_bench/uut/g_bus_width
add wave -noupdate /cic_bench/uut/g_delay
add wave -noupdate /cic_bench/uut/g_input_width
add wave -noupdate /cic_bench/uut/g_max_rate
add wave -noupdate /cic_bench/uut/g_output_width
add wave -noupdate /cic_bench/uut/g_round_convergent
add wave -noupdate /cic_bench/uut/g_stages
add wave -noupdate /cic_bench/uut/g_with_ce_synch
add wave -noupdate /cic_bench/uut/ratio_i
add wave -noupdate /cic_bench/uut/reset_i
add wave -noupdate /cic_bench/uut/valid_i
add wave -noupdate /cic_bench/uut/valid_o
add wave -noupdate /cic_bench/uut/valid_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2686178 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 213
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
WaveRestoreZoom {0 ps} {248471422 ps}
