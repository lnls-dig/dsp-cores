proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  open_checkpoint wbs_cordic_iter_top_routed.dcp
  set_property webtalk.parent_dir /home/vitor.ferreira/Clones/dsp-cores/hdl/syn/artix/wbs_cordic_iter/wbs_cordic_iter_top.cache/wt [current_project]
  write_bitstream -force wbs_cordic_iter_top.bit 
  if { [file exists /home/vitor.ferreira/Clones/dsp-cores/hdl/syn/artix/wbs_cordic_iter/wbs_cordic_iter_top.runs/synth_1/wbs_cordic_iter_top.hwdef] } {
    catch { write_sysdef -hwdef /home/vitor.ferreira/Clones/dsp-cores/hdl/syn/artix/wbs_cordic_iter/wbs_cordic_iter_top.runs/synth_1/wbs_cordic_iter_top.hwdef -bitfile wbs_cordic_iter_top.bit -meminfo wbs_cordic_iter_top.mmi -file wbs_cordic_iter_top.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

