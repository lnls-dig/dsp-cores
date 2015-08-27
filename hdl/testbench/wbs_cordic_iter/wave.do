onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /wbs_cordic_iter_tb/wbs_ready
add wave -noupdate /wbs_cordic_iter_tb/snk_adr
add wave -noupdate /wbs_cordic_iter_tb/snk_tgd
add wave -noupdate /wbs_cordic_iter_tb/x
add wave -noupdate /wbs_cordic_iter_tb/y
add wave -noupdate /wbs_cordic_iter_tb/mag
add wave -noupdate /wbs_cordic_iter_tb/phase
add wave -noupdate /wbs_cordic_iter_tb/src_adr
add wave -noupdate /wbs_cordic_iter_tb/src_tgd
add wave -noupdate /wbs_cordic_iter_tb/end_of_file
add wave -noupdate /wbs_cordic_iter_tb/clk
add wave -noupdate /wbs_cordic_iter_tb/rst
add wave -noupdate /wbs_cordic_iter_tb/ce
add wave -noupdate /wbs_cordic_iter_tb/snk_i
add wave -noupdate /wbs_cordic_iter_tb/snk_o
add wave -noupdate /wbs_cordic_iter_tb/src_i
add wave -noupdate -expand /wbs_cordic_iter_tb/src_o
add wave -noupdate /wbs_cordic_iter_tb/valid_out_procedure
add wave -noupdate /wbs_cordic_iter_tb/valid_out
add wave -noupdate /wbs_cordic_iter_tb/valid_new
add wave -noupdate /wbs_cordic_iter_tb/ce_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1450000 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {435534 ps} {1664466 ps}
