VERILOG = iverilog$(ICARUS_SUFFIX) -Wall
VVP = vvp$(ICARUS_SUFFIX) -n

# In principle you can use Matlab instead of Octave.
# The script itself is verified as Matlab-compatible, but
# I don't know how to run Matlab from this Makefile.
OCTAVE = octave -q

%_tb: %_tb.v
	$(VERILOG) ${VFLAGS_$@} -o $@ $(filter %.v, $^)

all: cordic0_test cordic1_test cordic2_test cordic3_test

cordicg.vh: cordicgx.m cordicg_conf.m
	$(OCTAVE) $< > $@

cordicg_tb: cordicg.v cordicg.vh

cordic0.dat: cordicg_tb
	$(VVP) $< +op=0 > $@

cordic1.dat: cordicg_tb
	$(VVP) $< +op=1 > $@

cordic2.dat: cordicg_tb
	$(VVP) $< +rmix=1 > $@

cordic3.dat: cordicg_tb
	$(VVP) $< +op=3 > $@

cordic0_test: cordic_test.awk cordic0.dat
	@echo
	@echo "Check of x,y,theta->x,y"
	gawk -f $^

cordic1_test: cordic_test.awk cordic1.dat
	@echo
	@echo "Check of x,y,theta->r,theta"
	gawk -f $^

cordic2_test: cordic2_test.awk cordic2.dat
	@echo
	@echo "Check of downconversion bias"
	gawk -f $^

cordic3_test: cordic_test.awk cordic3.dat
	@echo
	@echo "Check of slave mode"
	gawk -f $^

clean:
	rm -f cordicg.vh cordicg_tb cordic?.dat
