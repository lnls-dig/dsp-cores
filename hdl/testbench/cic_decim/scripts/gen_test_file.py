import numpy as np
from src.cic import *
import os
import argparse

# parser for catch inputs
parser = argparse.ArgumentParser(description="Generate input file for the CIC testbench")

parser.add_argument("--N", type=int, default=1, help="CIC order")
parser.add_argument("--M", type=int, default=1, help="CIC comb delay")
args = parser.parse_args()

BASE_DIR =  os.path.dirname(os.path.abspath(__file__))
OUT_PATH = os.path.join(BASE_DIR, '..', 'test_data.txt')

# Clear the input file
with open(OUT_PATH, "w") as f:
  pass

# CIC constant parameters
M = args.N
D = args.M

# Decimation rates to test
R_list = [1, 2, 4, 8]

# Frequencies to test (oscillations per len(n))
F_list = 2**(np.arange(10))

for R in R_list:
  CIC = CICFilt(M = M, D = D, R = R)
  n = np.arange(0,2**10)

  k = np.array([])
  for freq in F_list: # generate argument
    k = np.concatenate((k, 2*np.pi*n*freq/len(n)))

  # input signal
  yin_vhdl = (np.cos(k)*(2**10-1)).astype(int)

  # simulated output signal
  yout = CIC(yin_vhdl, method='vhdl')[0]

  # Adds one delay to match core output
  yout_zp = np.hstack((np.zeros(1),yout))

  # build data for writing file
  data = np.column_stack((yin_vhdl, yout_zp[:yin_vhdl.size]))

  with open(OUT_PATH, "a") as f:
    f.write(f"# {R}\n")
    np.savetxt(f, data, fmt="%d %d")
