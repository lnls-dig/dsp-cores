
define_attribute {clk} syn_maxfan {1000000}
define_attribute {n:default_clock_driver.xlclockdriver_10000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_10000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_1120.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1120.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_1400000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1400000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_224000000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_224000000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_22400000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_22400000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2240.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2240.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2500.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2500.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2800000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2800000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_44800000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_44800000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_4480.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_4480.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_56000000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_56000000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5600000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5600000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_560.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_560.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_70.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_70.ce_vec*} max_fanout {"REDUCE"}

define_scope_collection ce_10000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_10000_sg_x2} ]}
define_scope_collection ce_1120_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1120_sg_x32} ]}
define_scope_collection ce_1400000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1400000_sg_x3} ]}
define_scope_collection ce_224000000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_224000000_sg_x7} ]}
define_scope_collection ce_22400000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_22400000_sg_x28} ]}
define_scope_collection ce_2240_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2240_sg_x28} ]}
define_scope_collection ce_2500_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2500_sg_x3} ]}
define_scope_collection ce_2800000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2800000_sg_x4} ]}
define_scope_collection ce_2_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2_sg_x38} ]}
define_scope_collection ce_35_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_35_sg_x22} ]}
define_scope_collection ce_44800000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_44800000_sg_x2} ]}
define_scope_collection ce_4480_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_4480_sg_x9} ]}
define_scope_collection ce_5000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5000_sg_x9} ]}
define_scope_collection ce_56000000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_56000000_sg_x5} ]}
define_scope_collection ce_5600000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5600000_sg_x12} ]}
define_scope_collection ce_560_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_560_sg_x3} ]}
define_scope_collection ce_70_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_70_sg_x27} ]}

define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70

# Group-to-group constraints
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_10000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_1120_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_1400000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_224000000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_22400000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_2240_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_2500_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_2800000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 35
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_44800000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_4480_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_56000000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 100
define_multicycle_path -from {$ce_5600000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 100
define_multicycle_path -from {$ce_560_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_10000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_1120_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_1400000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_224000000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_22400000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2240_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2500_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2800000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_44800000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_4480_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_56000000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_5600000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_560_cc71cef7_group} 70

