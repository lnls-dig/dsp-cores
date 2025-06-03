#!/bin/bash
set -e

for M in 1 2 4; do
  for N in 1 2 4; do
    python3 scripts/gen_test_file.py --M "$M" --N "$N"

    (cd ghdl && hdlmake -p "M, N = $M, $N; TEST_DATA_NAME = 'test_data.txt'")
    (cd ghdl && make clean)
    (cd ghdl && make)

    echo ""
  done
done
