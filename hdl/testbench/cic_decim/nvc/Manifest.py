action = "simulation"
sim_tool = "nvc"
top_module = "cic_decim_tb"

modules = {"local" : ["../"]}

try:
 use_cic_decim_vhdl, M, N, TEST_DATA_NAME
except:
  use_cic_decim_vhdl = False
  TEST_DATA_NAME = "default_test_data.txt"
  M, N = 2, 2

generics = f"-g g_ORDER={N} -g g_COMB_DLY={M} -g g_TEST_DATA_NAME={TEST_DATA_NAME}"

nvc_opt = "--std=2008"
nvc_analysis_opt = "--relaxed"
nvc_elab_opt = f"--no-collapse {generics}"

sim_post_cmd = f"nvc -r --dump-arrays --exit-severity=error {top_module} --wave={top_module}.fst --format=fst"
