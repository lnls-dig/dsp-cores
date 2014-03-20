
define_attribute {clk} syn_maxfan {1000000}
define_attribute {n:default_clock_driver.xlclockdriver_1000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_1250000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1250000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_200000000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_200000000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_20000000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_20000000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2500000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2500000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2500.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2500.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_50000000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_50000000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5000000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5000000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_500.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_500.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_70.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_70.ce_vec*} max_fanout {"REDUCE"}

define_scope_collection ce_1000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1000_sg_x32} ]}
define_scope_collection ce_1250000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1250000_sg_x3} ]}
define_scope_collection ce_200000000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_200000000_sg_x7} ]}
define_scope_collection ce_20000000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_20000000_sg_x25} ]}
define_scope_collection ce_2000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2000_sg_x32} ]}
define_scope_collection ce_2500000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2500000_sg_x4} ]}
define_scope_collection ce_2500_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2500_sg_x3} ]}
define_scope_collection ce_2_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2_sg_x38} ]}
define_scope_collection ce_35_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_35_sg_x22} ]}
define_scope_collection ce_50000000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_50000000_sg_x5} ]}
define_scope_collection ce_5000000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5000000_sg_x12} ]}
define_scope_collection ce_5000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5000_sg_x10} ]}
define_scope_collection ce_500_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_500_sg_x3} ]}
define_scope_collection ce_70_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_70_sg_x31} ]}

define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70

# Group-to-group constraints
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1250000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_200000000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_20000000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 35
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_50000000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_500_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_1000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_1250000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_200000000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_20000000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2500000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_50000000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_5000000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_500_cc71cef7_group} 70

