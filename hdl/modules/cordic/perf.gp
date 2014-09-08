set ylabel 'bits error'
set xlabel 'CORDIC accumulator bit width'
set xrange [20:28]
set title 'CORDIC performance for 18 bit data and 20 stages'
set format y "%.1f"
set style data lp
plot \
 "perf.dat" using 3:4 title "P to R peak", \
 "perf.dat" using 3:5 title "P to R rms", \
 "perf.dat" using 3:6 title "R to P peak", \
 "perf.dat" using 3:7 title "R to P rms"
