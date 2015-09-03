onerror {resume}
quietly set dataset_list [list sim vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate vsim:/cic_bench/clock
add wave -noupdate vsim:/cic_bench/reset_n
add wave -noupdate vsim:/cic_bench/ce
add wave -noupdate vsim:/cic_bench/data_in
add wave -noupdate vsim:/cic_bench/data_out
add wave -noupdate vsim:/cic_bench/cic_valid
add wave -noupdate vsim:/cic_bench/endoffile
add wave -noupdate sim:/cic_bench/clock
add wave -noupdate sim:/cic_bench/reset_n
add wave -noupdate sim:/cic_bench/ce
add wave -noupdate sim:/cic_bench/data_in
add wave -noupdate sim:/cic_bench/data_out
add wave -noupdate sim:/cic_bench/cic_valid
add wave -noupdate sim:/cic_bench/endoffile
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {529 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {5500 ps}
