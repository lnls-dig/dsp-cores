onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cic_compare_tb/clk
add wave -noupdate /cic_compare_tb/rst
add wave -noupdate /cic_compare_tb/s_strobe
add wave -noupdate -format Analog-Step -height 84 -max 10086.0 /cic_compare_tb/s_data_i
add wave -noupdate -format Analog-Step -height 84 -max 80.0 /cic_compare_tb/s_data_v_o
add wave -noupdate -format Analog-Step -height 84 -max 9949.0 /cic_compare_tb/s_data_vhd_o
add wave -noupdate /cic_compare_tb/s_val_v_o
add wave -noupdate /cic_compare_tb/s_val_vhd_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3086644295302 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {0 fs} {5297250 ns}
