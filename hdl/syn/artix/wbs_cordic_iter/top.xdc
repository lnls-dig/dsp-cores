#create_clock -period 2.000 -name clk_i -waveform {0.000 1.000} [get_ports clk_i]
create_clock -period 2.500 -name clk_i -waveform {0.000 1.250} [get_ports clk_i]

#set enCells [all_fanout -endpoints_only -only_cells -from [get_pins * -hierarchical -filter {NAME =~ cmp_wbs_cordic_iter/cord*}]]

#set enCells [all_fanout -endpoints_only -only_cells -from [get_pins * -hierarchical -regexp cmp_wbs_cordic_iter/cord*]]

set enCells [get_cells [all_fanout -endpoints_only -only_cells -from [get_pins * -hierarchical -filter {NAME =~ cmp_wbs_cordic_iter/cord*}]] -filter {NAME =~ cmp_wbs_cordic_iter/cord*}]

set_multicycle_path 5 -setup -from $enCells -quiet
set_multicycle_path 4 -hold -from  $enCells -quiet

#set enCells [get_cells -of_objects [get_pins -leaf -of_objects [get_nets ce_o]]]
#set enCells [all_fanout -flat -only_cells -endpoints_only [get_nets ce_o]]
#set_multicycle_path -from $enCells -to $enCells -setup 5
#set_multicycle_path -from $enCells -to $enCells -hold 4

#set_multicycle_path -from [all_fanout -from [] -flat -endpoints_only] -to [] -setup 5

# CE multicycle set = 1
#set_multicycle_path 1 -setup -from clk_i to ce_i 
#set_multicycle_path 1 -hold -from clk_i to ce_i

# Protocol

set_property IOSTANDARD LVCMOS18 [get_ports clk_i]
set_property IOSTANDARD LVCMOS18 [get_ports rst_i]

set_property IOSTANDARD LVCMOS18 [get_ports {src_o[tgd]}]
set_property IOSTANDARD LVCMOS18 [get_ports {src_o[adr]}]
set_property IOSTANDARD LVCMOS18 [get_ports {src_o[dat]}]
set_property IOSTANDARD LVCMOS18 [get_ports {src_i[stall]}]
set_property IOSTANDARD LVCMOS18 [get_ports {src_i[ack]}]
set_property IOSTANDARD LVCMOS18 [get_ports {src_o[cyc]}]
set_property IOSTANDARD LVCMOS18 [get_ports {src_o[stb]}]

set_property IOSTANDARD LVCMOS18 [get_ports {snk_i[tgd]}]
set_property IOSTANDARD LVCMOS18 [get_ports {snk_i[adr]}]
set_property IOSTANDARD LVCMOS18 [get_ports {snk_i[dat]}]
set_property IOSTANDARD LVCMOS18 [get_ports {snk_i[cyc]}]
set_property IOSTANDARD LVCMOS18 [get_ports {snk_i[stb]}]
set_property IOSTANDARD LVCMOS18 [get_ports {snk_o[stall]}]
set_property IOSTANDARD LVCMOS18 [get_ports {snk_o[ack]}]

# Physical Ports

set_property PACKAGE_PIN V4  [get_ports clk_i]
set_property PACKAGE_PIN AN2 [get_ports rst_i]

set_property PACKAGE_PIN AJ4 [get_ports {src_i[stall]}]
set_property PACKAGE_PIN AJ5 [get_ports {src_i[ack]}]
set_property PACKAGE_PIN AJ6 [get_ports {src_o[cyc]}]
set_property PACKAGE_PIN AJ8 [get_ports {src_o[stb]}] 

set_property PACKAGE_PIN AJ9 [get_ports {snk_i[cyc]}]
set_property PACKAGE_PIN AJ10 [get_ports {snk_i[stb]}]
set_property PACKAGE_PIN AJ11 [get_ports {snk_o[stall]}]
set_property PACKAGE_PIN AK1 [get_ports {snk_o[ack]}]

set_property PACKAGE_PIN AK2 [get_ports {src_o[tgd][0]}]
set_property PACKAGE_PIN AK3 [get_ports {src_o[tgd][1]}]
set_property PACKAGE_PIN AK5 [get_ports {src_o[tgd][2]}]
set_property PACKAGE_PIN AK6 [get_ports {src_o[tgd][3]}]

set_property PACKAGE_PIN AK7 [get_ports {src_o[adr][0]}]
set_property PACKAGE_PIN AK8 [get_ports {src_o[adr][1]}]
set_property PACKAGE_PIN AK11 [get_ports {src_o[adr][2]}]
set_property PACKAGE_PIN AL2 [get_ports {src_o[adr][3]}]

set_property PACKAGE_PIN AL4 [get_ports {src_o[dat][0]}]
set_property PACKAGE_PIN AL5 [get_ports {src_o[dat][1]}]
set_property PACKAGE_PIN AL7 [get_ports {src_o[dat][2]}]
set_property PACKAGE_PIN AL8 [get_ports {src_o[dat][3]}]

set_property PACKAGE_PIN AL9 [get_ports {snk_i[tgd][0]}]
set_property PACKAGE_PIN AL10 [get_ports {snk_i[tgd][1]}]
set_property PACKAGE_PIN AM1 [get_ports {snk_i[tgd][2]}]
set_property PACKAGE_PIN AM2 [get_ports {snk_i[tgd][3]}]

set_property PACKAGE_PIN AM4 [get_ports {snk_i[adr][0]}]
set_property PACKAGE_PIN AM5 [get_ports {snk_i[adr][1]}]
set_property PACKAGE_PIN AM6 [get_ports {snk_i[adr][2]}]
set_property PACKAGE_PIN AM7 [get_ports {snk_i[adr][3]}]

set_property PACKAGE_PIN AM9 [get_ports {snk_i[dat][0]}]
set_property PACKAGE_PIN AM10 [get_ports {snk_i[dat][1]}]
set_property PACKAGE_PIN AM11 [get_ports {snk_i[dat][2]}]
set_property PACKAGE_PIN AN1 [get_ports {snk_i[dat][3]}]
