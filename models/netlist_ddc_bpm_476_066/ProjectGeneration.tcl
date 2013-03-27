#
# Created by System Generator     Wed Mar 27 10:23:22 2013
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {HDL Netlist}
    set Project {ddc_bpm_476_066_sim_1mdb_cw}
    set Family {Virtex6}
    set Device {xc6vlx240t}
    set Package {ff1156}
    set Speed {-1}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {112.583175675676}
    set NewXSTParser {1}
    set ProjectFiles {
        {{ddc_bpm_476_066_sim_1mdb_cw.vhd} -view All}
        {{ddc_bpm_476_066_sim_1mdb.vhd} -view All}
        {{ddc_bpm_476_066_sim_1mdb_cw.ucf}}
        {{fr_cmplr_v6_2_cb3666f40622a730.mif}}
        {{fr_cmplr_v6_3_8dca82a218dd87c6.mif}}
        {{D:\Sysgen_projects\ddc_bpm_476_066\models\ddc_bpm_476_066_sim_1mdb.mdl}}
    }
    set TopLevelModule {ddc_bpm_476_066_sim_1mdb_cw}
    set SynthesisConstraintsFile {ddc_bpm_476_066_sim_1mdb_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
