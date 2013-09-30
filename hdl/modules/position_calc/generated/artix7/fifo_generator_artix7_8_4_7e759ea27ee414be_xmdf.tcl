# The package naming convention is <core_name>_xmdf
package provide fifo_generator_artix7_8_4_7e759ea27ee414be_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::fifo_generator_artix7_8_4_7e759ea27ee414be_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::fifo_generator_artix7_8_4_7e759ea27ee414be_xmdf::xmdfInit { instance } {
# Variable containing name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name fifo_generator_artix7_8_4_7e759ea27ee414be
}
# ::fifo_generator_artix7_8_4_7e759ea27ee414be_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::fifo_generator_artix7_8_4_7e759ea27ee414be_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/example_design/fifo_generator_artix7_8_4_7e759ea27ee414be_top.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/example_design/fifo_generator_artix7_8_4_7e759ea27ee414be_top.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/example_design/fifo_generator_artix7_8_4_7e759ea27ee414be_top.xdc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/example_design/fifo_generator_artix7_8_4_7e759ea27ee414be_top_wrapper.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/implement.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/implement.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/planAhead_rdn.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/planAhead_rdn.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/planAhead_rdn.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/xst.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/implement/xst.scr
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_dgen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_dverif.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_pctrl.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_pkg.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_rng.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_synth.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/fg_tb_top.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/functional/simulate_isim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/functional/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/functional/simulate_ncsim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/functional/wave_isim.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/functional/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/functional/wave_ncsim.sv
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/timing/simulate_isim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/timing/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/timing/simulate_ncsim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/timing/wave_isim.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/timing/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be/simulation/timing/wave_ncsim.sv
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_artix7_8_4_7e759ea27ee414be_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_ug175.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path fifo_generator_v8_4_readme.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type text
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module fifo_generator_artix7_8_4_7e759ea27ee414be
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams
