onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider bench
add wave -noupdate /cic_bench/clock
add wave -noupdate /cic_bench/reset
add wave -noupdate /cic_bench/ce
add wave -noupdate /cic_bench/ce_out
add wave -noupdate /cic_bench/sw_out
add wave -noupdate /cic_bench/data_tag
add wave -noupdate /cic_bench/data_tag_en
add wave -noupdate /cic_bench/valid
add wave -noupdate /cic_bench/data_mask_beg_num_samples
add wave -noupdate /cic_bench/data_mask_end_num_samples
add wave -noupdate /cic_bench/data_mask_en
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
add wave -noupdate /cic_bench/c_data_mask_width
add wave -noupdate -divider cic_dyn
add wave -noupdate /cic_bench/uut/g_input_width
add wave -noupdate /cic_bench/uut/g_output_width
add wave -noupdate /cic_bench/uut/g_stages
add wave -noupdate /cic_bench/uut/g_delay
add wave -noupdate /cic_bench/uut/g_max_rate
add wave -noupdate /cic_bench/uut/g_tag_desync_cnt_width
add wave -noupdate /cic_bench/uut/g_bus_width
add wave -noupdate /cic_bench/uut/g_with_ce_synch
add wave -noupdate /cic_bench/uut/g_tag_width
add wave -noupdate /cic_bench/uut/g_data_mask_width
add wave -noupdate /cic_bench/uut/g_round_convergent
add wave -noupdate /cic_bench/uut/clk_i
add wave -noupdate /cic_bench/uut/rst_i
add wave -noupdate /cic_bench/uut/ce_i
add wave -noupdate /cic_bench/uut/ce_out_i
add wave -noupdate /cic_bench/uut/valid_i
add wave -noupdate /cic_bench/uut/data_i
add wave -noupdate /cic_bench/uut/data_tag_i
add wave -noupdate /cic_bench/uut/data_tag_en_i
add wave -noupdate /cic_bench/uut/data_tag_desync_cnt_rst_i
add wave -noupdate /cic_bench/uut/data_tag_desync_cnt_o
add wave -noupdate /cic_bench/uut/data_mask_num_samples_beg_i
add wave -noupdate /cic_bench/uut/data_mask_num_samples_end_i
add wave -noupdate /cic_bench/uut/data_mask_en_i
add wave -noupdate /cic_bench/uut/ratio_i
add wave -noupdate /cic_bench/uut/data_o
add wave -noupdate /cic_bench/uut/valid_o
add wave -noupdate /cic_bench/uut/data_tag_change
add wave -noupdate /cic_bench/uut/data_tag_change_d0
add wave -noupdate /cic_bench/uut/decimation_strobe
add wave -noupdate /cic_bench/uut/decimation_strobe_d0
add wave -noupdate /cic_bench/uut/data_out
add wave -noupdate /cic_bench/uut/valid_out
add wave -noupdate /cic_bench/uut/synch_int
add wave -noupdate /cic_bench/uut/desync_cnt
add wave -noupdate /cic_bench/uut/fsm_cic_sync_current_state
add wave -noupdate /cic_bench/uut/data_mask_en_d0
add wave -noupdate /cic_bench/uut/data_mask_beg_idx
add wave -noupdate /cic_bench/uut/data_mask_end_idx
add wave -noupdate /cic_bench/uut/data_mask_counter
add wave -noupdate /cic_bench/uut/valid_d0
add wave -noupdate /cic_bench/uut/data_d0
add wave -noupdate /cic_bench/uut/data_tag_input
add wave -noupdate /cic_bench/uut/data_tag_d0
add wave -noupdate /cic_bench/uut/data_tag_d1
add wave -noupdate /cic_bench/uut/rst_modules
add wave -noupdate /cic_bench/uut/rst_int
add wave -noupdate /cic_bench/uut/rst_n_int
add wave -noupdate -divider decim_strobe
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/ce_i
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/clk_i
add wave -noupdate -radix unsigned /cic_bench/uut/cmp_decimation_strober/count
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/count_all
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/g_bus_width
add wave -noupdate -radix unsigned /cic_bench/uut/cmp_decimation_strober/g_maxrate
add wave -noupdate -radix unsigned /cic_bench/uut/cmp_decimation_strober/ratio_i
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/rst_i
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/strobe
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/strobe_o
add wave -noupdate /cic_bench/uut/cmp_decimation_strober/valid_i
add wave -noupdate -divider swap_freqgen
add wave -noupdate /cic_bench/cmp_tag/g_delay_vec_width
add wave -noupdate /cic_bench/cmp_tag/g_swap_div_freq_vec_width
add wave -noupdate /cic_bench/cmp_tag/clk_i
add wave -noupdate /cic_bench/cmp_tag/rst_n_i
add wave -noupdate /cic_bench/cmp_tag/en_i
add wave -noupdate /cic_bench/cmp_tag/sync_trig_i
add wave -noupdate /cic_bench/cmp_tag/swap_o
add wave -noupdate /cic_bench/cmp_tag/deswap_o
add wave -noupdate /cic_bench/cmp_tag/swap_mode_i
add wave -noupdate /cic_bench/cmp_tag/swap_div_f_i
add wave -noupdate /cic_bench/cmp_tag/swap_div_f_cnt_en_i
add wave -noupdate -radix unsigned /cic_bench/cmp_tag/deswap_delay_i
add wave -noupdate -radix unsigned /cic_bench/cmp_tag/count
add wave -noupdate -radix unsigned /cic_bench/cmp_tag/cnst_swap_div_f_old
add wave -noupdate -radix unsigned /cic_bench/cmp_tag/cnst_swap_div_f
add wave -noupdate /cic_bench/cmp_tag/clk_swap
add wave -noupdate /cic_bench/cmp_tag/deswap
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
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/data_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_out_i
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_o
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/data_o
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_int
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_samp
add wave -noupdate /cic_bench/uut/cmp_cic_decim/act_comb
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/data_int
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/data_out
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/data_out_reg
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/datain_extended
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/diffdelay
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/i
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/integrator
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/j
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/pipe
add wave -noupdate -radix decimal /cic_bench/uut/cmp_cic_decim/sampler
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_int
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_out
add wave -noupdate /cic_bench/uut/cmp_cic_decim/val_out_reg
add wave -noupdate -divider ce_synch
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/g_data_width
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/clk_i
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/rst_i
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/ce_in_i
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/valid_i
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/data_i
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/ce_out_i
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/data_o
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/valid_o
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/data_int
add wave -noupdate /cic_bench/uut/gen_with_ce_sync/cmp_ce_synch/valid_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24345000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 208
configure wave -valuecolwidth 102
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
WaveRestoreZoom {23934843 ps} {24755157 ps}
