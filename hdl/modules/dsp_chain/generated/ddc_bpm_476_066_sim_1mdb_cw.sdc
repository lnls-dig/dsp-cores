
define_attribute {clk} syn_maxfan {1000000}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_35.ce_vec*} max_fanout {"REDUCE"}

define_scope_collection ce_35_c311a51a_group \
  {find -seq * -in [ expand -hier -from {n:ce_35_sg_x13} ]}

define_multicycle_path -from {$ce_35_c311a51a_group} \
  -to {$ce_35_c311a51a_group} 35

