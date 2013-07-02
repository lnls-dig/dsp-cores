
define_attribute {clk} syn_maxfan {1000000}
define_attribute {n:default_clock_driver.xlclockdriver_1112.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1112.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_1390000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1390000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_22240000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_22240000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2224.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2224.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2780000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2780000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5560000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5560000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_556.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_556.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_70.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_70.ce_vec*} max_fanout {"REDUCE"}

define_scope_collection ce_1112_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1112_sg_x30} ]}
define_scope_collection ce_1390000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1390000_sg_x3} ]}
define_scope_collection ce_22240000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_22240000_sg_x16} ]}
define_scope_collection ce_2224_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2224_sg_x26} ]}
define_scope_collection ce_2780000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2780000_sg_x4} ]}
define_scope_collection ce_2_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2_sg_x44} ]}
define_scope_collection ce_35_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_35_sg_x20} ]}
define_scope_collection ce_5000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5000_sg_x13} ]}
define_scope_collection ce_5560000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5560000_sg_x8} ]}
define_scope_collection ce_556_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_556_sg_x3} ]}
define_scope_collection ce_70_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_70_sg_x25} ]}

define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70

# Group-to-group constraints
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_1112_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_1390000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_22240000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_2224_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_2780000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 2
define_multicycle_path -from {$ce_2_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 35
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_5000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 100
define_multicycle_path -from {$ce_5560000_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 100
define_multicycle_path -from {$ce_556_cc71cef7_group} \
  -to {$ce_70_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_1112_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_1390000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_22240000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2224_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2780000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_2_cc71cef7_group} 2
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_5000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_5560000_cc71cef7_group} 70
define_multicycle_path -from {$ce_70_cc71cef7_group} \
  -to {$ce_556_cc71cef7_group} 70

