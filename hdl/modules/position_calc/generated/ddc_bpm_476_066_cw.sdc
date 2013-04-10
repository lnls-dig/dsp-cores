
define_attribute {clk} syn_maxfan {1000000}
define_attribute {n:default_clock_driver.xlclockdriver_11130000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_11130000.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_1113.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_1113.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_2782500.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2782500.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} max_fanout {"REDUCE"}
define_attribute {n:default_clock_driver.xlclockdriver_5565000.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_5565000.ce_vec*} max_fanout {"REDUCE"}

define_scope_collection ce_11130000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_11130000_sg_x14} ]}
define_scope_collection ce_1113_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_1113_sg_x14} ]}
define_scope_collection ce_2782500_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_2782500_sg_x5} ]}
define_scope_collection ce_35_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_35_sg_x29} ]}
define_scope_collection ce_5565000_cc71cef7_group \
  {find -seq * -in [ expand -hier -from {n:ce_5565000_sg_x9} ]}

define_multicycle_path -from {$ce_11130000_cc71cef7_group} \
  -to {$ce_11130000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1113_cc71cef7_group} \
  -to {$ce_1113_cc71cef7_group} 100
define_multicycle_path -from {$ce_2782500_cc71cef7_group} \
  -to {$ce_2782500_cc71cef7_group} 100
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_5565000_cc71cef7_group} \
  -to {$ce_5565000_cc71cef7_group} 100

# Group-to-group constraints
define_multicycle_path -from {$ce_11130000_cc71cef7_group} \
  -to {$ce_1113_cc71cef7_group} 100
define_multicycle_path -from {$ce_11130000_cc71cef7_group} \
  -to {$ce_2782500_cc71cef7_group} 100
define_multicycle_path -from {$ce_11130000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_11130000_cc71cef7_group} \
  -to {$ce_5565000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1113_cc71cef7_group} \
  -to {$ce_11130000_cc71cef7_group} 100
define_multicycle_path -from {$ce_1113_cc71cef7_group} \
  -to {$ce_2782500_cc71cef7_group} 100
define_multicycle_path -from {$ce_1113_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_1113_cc71cef7_group} \
  -to {$ce_5565000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2782500_cc71cef7_group} \
  -to {$ce_11130000_cc71cef7_group} 100
define_multicycle_path -from {$ce_2782500_cc71cef7_group} \
  -to {$ce_1113_cc71cef7_group} 100
define_multicycle_path -from {$ce_2782500_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35
define_multicycle_path -from {$ce_2782500_cc71cef7_group} \
  -to {$ce_5565000_cc71cef7_group} 100
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_11130000_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_1113_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_2782500_cc71cef7_group} 35
define_multicycle_path -from {$ce_35_cc71cef7_group} \
  -to {$ce_5565000_cc71cef7_group} 35
define_multicycle_path -from {$ce_5565000_cc71cef7_group} \
  -to {$ce_11130000_cc71cef7_group} 100
define_multicycle_path -from {$ce_5565000_cc71cef7_group} \
  -to {$ce_1113_cc71cef7_group} 100
define_multicycle_path -from {$ce_5565000_cc71cef7_group} \
  -to {$ce_2782500_cc71cef7_group} 100
define_multicycle_path -from {$ce_5565000_cc71cef7_group} \
  -to {$ce_35_cc71cef7_group} 35

