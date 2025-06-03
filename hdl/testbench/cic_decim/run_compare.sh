#!/bin/bash
set -e
set -o pipefail

for M in 1 2 4; do
  for N in 1 2 4; do
    for use_cic_decim_vhdl in "True" "False"; do

      if [ "$use_cic_decim_vhdl" = "True" ]; then
        echo "*** Testing VHDL ***"
        OUT_NAME="vhd_output.txt"
      else
        echo "*** Testing Verilog ***"
        OUT_NAME="v_output.txt"
      fi

      echo "M $M | N $N"
      echo ""

      python3 scripts/gen_test_file.py --M "$M" --N "$N"

      (cd nvc && hdlmake -p "M, N = $M, $N; use_cic_decim_vhdl=$use_cic_decim_vhdl; TEST_DATA_NAME='test_data.txt'; OUT_NAME='$OUT_NAME'")
      (cd nvc && make clean)
      (cd nvc && make)

      echo ""

    done

    if ! diff -q vhd_output.txt v_output.txt > /dev/null; then
      echo "M $M | N $N resulted in different outputs!"
      exit 1
    fi

  done
done
