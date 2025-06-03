action = "simulation"
target = "xilinx"
syn_device = "xc7a200t"
sim_tool = "ghdl"
top_module = "cic_decim_tb"

modules = {"local" : ["../"]}

use_cic_decim_vhdl = True

ghdl_opt = "--std=08"

try:
  M, N, TEST_DATA_NAME
except:
  TEST_DATA_NAME = "default_test_data.txt"
  M, N = 2, 2

generics = f"-gg_ORDER={N} -gg_COMB_DLY={M} -gg_TEST_DATA_NAME={TEST_DATA_NAME}"

sim_post_cmd = f"ghdl -r --std=08 cic_decim_tb --wave=cic_decim_tb.ghw --assert-level=error {generics}"
