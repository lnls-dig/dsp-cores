
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'HDL_PATH' => 'F:/Xlinx_Projects/dsp-cores-devel/models',
    'Impl_file' => 'ISE Defaults',
    'Impl_file_sgadvanced' => '',
    'Synth_file' => 'XST Defaults',
    'Synth_file_sgadvanced' => '',
    'TEMP' => 'C:/TEMP',
    'TMP' => 'C:/TEMP',
    'Temp' => 'C:/TEMP',
    'Tmp' => 'C:/TEMP',
    'base_system_period_hardware' => 4.441160919464348,
    'base_system_period_simulink' => 4.441160919464348E-9,
    'block_icon_display' => 'Default',
    'block_type' => 'sysgen',
    'block_version' => '',
    'ce_clr' => 1.0,
    'clock_domain' => 'default',
    'clock_loc' => '',
    'clock_wrapper' => 'Clock Enables',
    'clock_wrapper_sgadvanced' => '',
    'compilation' => 'HDL Netlist',
    'compilation_lut' => {
      'keys' => [
        'HDL Netlist',
        '<New compilation target>',
        'ML605 (JTAG)',
        'Bitstream',
        'Timing and Power Analysis',
      ],
      'values' => [
        'target1',
        'target2',
        'target3',
        'target4',
        'target5',
      ],
    },
    'compilation_target' => 'HDL Netlist',
    'core_generation' => 1.0,
    'core_generation_sgadvanced' => '',
    'core_is_deployed' => 0.0,
    'coregen_core_generation_tmpdir' => 'C:/TEMP/sysgentmp-Lerwys/cg_wk/c9825e8defc5feca3',
    'coregen_part_family' => 'artix7',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'ddc_bpm_476_066',
    'design_full_path' => 'F:\\Xlinx_Projects\\dsp-cores-devel\\models\\ddc_bpm_476_066.mdl',
    'device' => 'xc7a200t-1ffg1156',
    'device_speed' => '-1',
    'directory' => 'F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7',
    'dsp_cache_root_path' => 'C:/TEMP/sysgentmp-Lerwys',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/perl_results.v', },
      ],
    ],
    'fxdptinstalled' => 1.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 7093.00390625,
    'generating_subsystem_handle' => 7093.00390625,
    'generation_directory' => './netlist_ddc_bpm_476_066_artix7',
    'has_advanced_control' => '0',
    'hdlDir' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'vhdl',
    'hdl_path' => 'F:/Xlinx_Projects/dsp-cores-devel/models',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '13.4i',
    'master_sysgen_token_handle' => 7094.00341796875,
    'matlab' => 'F:/MATLAB/R2011a',
    'matlab_fixedpoint' => 1.0,
    'mdlHandle' => 7093.00390625,
    'mdlPath' => 'F:/Xlinx_Projects/dsp-cores-devel/models/ddc_bpm_476_066.mdl',
    'modelDiagnostics' => [
      {
        'count' => 3619.0,
        'isMask' => 0.0,
        'type' => 'ddc_bpm_476_066 Total blocks',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Clock',
      },
      {
        'count' => 32.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'DataTypeConversion',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 125.0,
        'isMask' => 0.0,
        'type' => 'Display',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Fcn',
      },
      {
        'count' => 159.0,
        'isMask' => 0.0,
        'type' => 'From',
      },
      {
        'count' => 8.0,
        'isMask' => 0.0,
        'type' => 'Gain',
      },
      {
        'count' => 141.0,
        'isMask' => 0.0,
        'type' => 'Goto',
      },
      {
        'count' => 607.0,
        'isMask' => 0.0,
        'type' => 'Inport',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Lookup',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Math',
      },
      {
        'count' => 495.0,
        'isMask' => 0.0,
        'type' => 'Outport',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'Product',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Quantizer',
      },
      {
        'count' => 1486.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Saturate',
      },
      {
        'count' => 35.0,
        'isMask' => 0.0,
        'type' => 'Scope',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'SignalConversion',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'Sin',
      },
      {
        'count' => 329.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 6.0,
        'isMask' => 0.0,
        'type' => 'Sum',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'Switch',
      },
      {
        'count' => 151.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'ToWorkspace',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'UniformRandomNumber',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'ZeroOrderHold',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Manual Switch',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Repeating table',
      },
      {
        'count' => 30.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Adder/Subtracter Block',
      },
      {
        'count' => 66.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Arithmetic Relational Operator Block',
      },
      {
        'count' => 39.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Assert Block',
      },
      {
        'count' => 20.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bit Slice Extractor Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx BitBasher Block',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bitwise Expression Evaluator Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Concatenator Block',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Multiplexer Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx CIC Compiler 3.0 Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx CORDIC 5.0 Block',
      },
      {
        'count' => 11.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Clock Enable Probe Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Complex Multiplier 5.0  Block',
      },
      {
        'count' => 79.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Counter Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx DDS Compiler 5.0 Block',
      },
      {
        'count' => 59.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Delay Block',
      },
      {
        'count' => 9.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Divider Generator 4.0 Block',
      },
      {
        'count' => 102.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Down Sampler Block',
      },
      {
        'count' => 6.0,
        'isMask' => 1.0,
        'type' => 'Xilinx FIR Compiler 6.3 Block',
      },
      {
        'count' => 22.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 270.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 48.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Inverter Block',
      },
      {
        'count' => 97.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Logical Block Block',
      },
      {
        'count' => 16.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Multiplier Block',
      },
      {
        'count' => 281.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Register Block',
      },
      {
        'count' => 125.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Sample Time Block Block',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Shared Memory Based From FIFO Block',
      },
      {
        'count' => 12.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Shared Memory Based To FIFO Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
      {
        'count' => 23.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Converter Block',
      },
      {
        'count' => 81.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Reinterpreter Block',
      },
      {
        'count' => 20.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Up Sampler Block',
      },
      {
        'count' => 7.0,
        'isMask' => 1.0,
        'type' => 'Xilinx WaveScope Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'F:/Xlinx_Projects/dsp-cores-devel/models/ddc_bpm_476_066.mdl',
    'myxilinx' => 'F:/Xilinx/13.4/ISE_DS/ISE',
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '450332',
    'package' => 'ffg1156',
    'part' => 'xc7a200t',
    'partFamily' => 'artix7',
    'port_data_types_enabled' => 1.0,
    'preserve_hierarchy' => 0.0,
    'proj_type' => 'Project Navigator',
    'proj_type_sgadvanced' => '',
    'provideGlobalCEClr' => 1.0,
    'run_coregen' => 'off',
    'run_coregen_sgadvanced' => '',
    'sample_time_colors_enabled' => 1.0,
    'sampletimecolors' => 1.0,
    'sg_blockgui_xml' => '',
    'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
    'sg_list_contents' => '',
    'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
    'sg_version' => '',
    'sggui_pos' => '-1,-1,-1,-1',
    'simulation_island_subsystem_handle' => 7093.00390625,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => 4.441160919464348E-9,
    'speed' => '-1',
    'synth_file' => 'XST Defaults*',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'vhdl',
    'synthesis_tool' => 'XST',
    'synthesis_tool_sgadvanced' => '',
    'sysclk_period' => 4.441160919464348,
    'sysgen' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'sysgenTokenSettings' => {
      'Impl_file' => 'ISE Defaults',
      'Impl_file_sgadvanced' => '',
      'Synth_file' => 'XST Defaults',
      'Synth_file_sgadvanced' => '',
      'base_system_period_hardware' => 4.441160919464348,
      'base_system_period_simulink' => 4.441160919464348E-9,
      'block_icon_display' => 'Default',
      'block_type' => 'sysgen',
      'block_version' => '',
      'ce_clr' => 1.0,
      'clock_loc' => '',
      'clock_wrapper' => 'Clock Enables',
      'clock_wrapper_sgadvanced' => '',
      'compilation' => 'HDL Netlist',
      'compilation_lut' => {
        'keys' => [
          'HDL Netlist',
          '<New compilation target>',
          'ML605 (JTAG)',
          'Bitstream',
          'Timing and Power Analysis',
        ],
        'values' => [
          'target1',
          'target2',
          'target3',
          'target4',
          'target5',
        ],
      },
      'core_generation' => 1.0,
      'core_generation_sgadvanced' => '',
      'coregen_part_family' => 'artix7',
      'create_interface_document' => 'off',
      'dbl_ovrd' => -1.0,
      'dbl_ovrd_sgadvanced' => '',
      'dcm_input_clock_period' => 10.0,
      'deprecated_control' => 'off',
      'deprecated_control_sgadvanced' => '',
      'directory' => './netlist_ddc_bpm_476_066_artix7',
      'eval_field' => '0',
      'has_advanced_control' => '0',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 7094.00341796875,
      'package' => 'ffg1156',
      'part' => 'xc7a200t',
      'preserve_hierarchy' => 0.0,
      'proj_type' => 'Project Navigator',
      'proj_type_sgadvanced' => '',
      'run_coregen' => 'off',
      'run_coregen_sgadvanced' => '',
      'sg_blockgui_xml' => '',
      'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
      'sg_list_contents' => '',
      'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
      'sggui_pos' => '-1,-1,-1,-1',
      'simulation_island_subsystem_handle' => 7093.00390625,
      'simulink_period' => 4.441160919464348E-9,
      'speed' => '-1',
      'synth_file' => 'XST Defaults*',
      'synthesis_language' => 'vhdl',
      'synthesis_tool' => 'XST',
      'synthesis_tool_sgadvanced' => '',
      'sysclk_period' => 4.441160919464348,
      'testbench' => 0,
      'testbench_sgadvanced' => '',
      'trim_vbits' => 1.0,
      'trim_vbits_sgadvanced' => '',
      'xilinx_device' => 'xc7a200t-1ffg1156',
      'xilinxfamily' => 'artix7',
    },
    'sysgen_Root' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 4.441160919464348,
    'tempdir' => 'C:/TEMP',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen',
    'trim_vbits' => 1.0,
    'trim_vbits_sgadvanced' => '',
    'use_ce_syn_keep' => 1,
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'usertemp' => 'C:/TEMP/sysgentmp-Lerwys',
    'using71Netlister' => 1,
    'verilog_files' => [
      'conv_pkg.v',
      'synth_reg.v',
      'synth_reg_w_init.v',
      'convert_type.v',
    ],
    'version' => '',
    'vhdl_files' => [
      'conv_pkg.vhd',
      'synth_reg.vhd',
      'synth_reg_w_init.vhd',
    ],
    'vsimtime' => '2200275.000000 ns',
    'xilinx' => 'F:/Xilinx/13.4/ISE_DS/ISE',
    'xilinx_device' => 'xc7a200t-1ffg1156',
    'xilinx_family' => 'artix7',
    'xilinx_package' => 'ffg1156',
    'xilinx_part' => 'xc7a200t',
    'xilinxdevice' => 'xc7a200t-1ffg1156',
    'xilinxfamily' => 'artix7',
    'xilinxpart' => 'xc7a200t',
  };
  push(@$results, &Sg::setAttributes($instrs));
  use SgDeliverFile;
  $instrs = {
    'collaborationName' => 'conv_pkg.vhd',
    'sourceFile' => 'hdl/conv_pkg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg.vhd',
    'sourceFile' => 'hdl/synth_reg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg_w_init.vhd',
    'sourceFile' => 'hdl/synth_reg_w_init.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlpersistentdff.ngc',
    'sourceFile' => 'hdl/xlpersistentdff.ngc',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlclockenablegenerator.vhd',
    'sourceFile' => 'hdl/xlclockenablegenerator.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT FIR_Compiler artix7 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET bestprecision = true',
    'CSET channel_sequence = Basic',
    'CSET clock_frequency = 300',
    'CSET coefficient_buffer_type = Automatic',
    'CSET coefficient_file = no_coe_file_loaded',
    'CSET coefficient_fractional_bits = 17',
    'CSET coefficient_reload = false',
    'CSET coefficient_sets = 1',
    'CSET coefficient_sign = Signed',
    'CSET coefficient_structure = Inferred',
    'CSET coefficient_width = 16',
    'CSET coefficientsource = Vector',
    'CSET coefficientvector = -0.00031280517578125,-0.00461578369140625,-0.00075531005859375,0.01094818115234375,0.00547027587890625,-0.01494598388671875,-0.01053619384765625,0.010101318359375,0.00511932373046875,0.00281524658203125,0.02346038818359375,-0.01081085205078125,-0.07684326171875,-0.00476837158203125,0.13726043701171875,0.05204010009765625,-0.17452239990234375,-0.1165008544921875,0.16648101806640625,0.16648101806640625,-0.1165008544921875,-0.17452239990234375,0.05204010009765625,0.13726043701171875,-0.00476837158203125,-0.07684326171875,-0.01081085205078125,0.02346038818359375,0.00281524658203125,0.00511932373046875,0.010101318359375,-0.01053619384765625,-0.01494598388671875,0.00547027587890625,0.01094818115234375,-0.00075531005859375,-0.00461578369140625,-0.00031280517578125',
    'CSET columnconfig = 10',
    'CSET data_buffer_type = Automatic',
    'CSET data_fractional_bits = 15',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Signed',
    'CSET data_tuser_width = 1',
    'CSET data_width = 16',
    'CSET decimation_rate = 1',
    'CSET displayreloadorder = false',
    'CSET filter_architecture = Systolic_Multiply_Accumulate',
    'CSET filter_selection = 1',
    'CSET filter_type = Single_Rate',
    'CSET gen_mif_files = false',
    'CSET gen_mif_from_coe = false',
    'CSET gen_mif_from_spec = false',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 2',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET input_buffer_type = Automatic',
    'CSET inter_column_pipe_length = 4',
    'CSET interpolation_rate = 1',
    'CSET m_data_has_tready = false',
    'CSET m_data_has_tuser = Not_Required',
    'CSET multi_column_support = Automatic',
    'CSET num_reload_slots = 1',
    'CSET number_channels = 1',
    'CSET number_paths = 4',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Convergent_Rounding_to_Even',
    'CSET output_width = 24',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET pattern_list = P4-0,P4-1,P4-2,P4-3,P4-4',
    'CSET preference_for_other_storage = Automatic',
    'CSET quantization = Quantize_Only',
    'CSET rate_change_type = Integer',
    'CSET ratespecification = Hardware_Oversampling_Rate',
    'CSET reload_file = no_coe_file_loaded',
    'CSET reset_data_vector = true',
    'CSET s_config_method = Single',
    'CSET s_config_sync_mode = On_Vector',
    'CSET s_data_has_fifo = false',
    'CSET s_data_has_tuser = Not_Required',
    'CSET sample_frequency = 0.00100000000',
    'CSET sampleperiod = 2',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_09a75cbfcaf75117',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '08b7ed50100dcc86284adb938720584b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_09a75cbfcaf75117
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(95 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(63 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(95 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_path3_ps_net: std_logic_vector(23 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_path2_ps_net: std_logic_vector(23 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_path1_ps_net: std_logic_vector(23 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_path0_ps_net: std_logic_vector(23 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_path3_ps_net <= m_axis_data_tdata_net(95 downto 72);
  m_axis_data_tdata_path2_ps_net <= m_axis_data_tdata_net(71 downto 48);
  m_axis_data_tdata_path1_ps_net <= m_axis_data_tdata_net(47 downto 24);
  m_axis_data_tdata_path0_ps_net <= m_axis_data_tdata_net(23 downto 0);
  s_axis_data_tdata_net(63 downto 48) <= s_axis_data_tdata_path3;
  s_axis_data_tdata_net(47 downto 32) <= s_axis_data_tdata_path2;
  s_axis_data_tdata_net(31 downto 16) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata_path0;
  m_axis_data_tdata_path3_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 24,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path3_ps_net,
        ce => ce_2,
        clr => \'0\',
        clk => clk_2, 
        o => m_axis_data_tdata_path3
    );
  m_axis_data_tdata_path2_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 24,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path2_ps_net,
        ce => ce_2,
        clr => \'0\',
        clk => clk_2, 
        o => m_axis_data_tdata_path2
    );
  m_axis_data_tdata_path1_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 24,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path1_ps_net,
        ce => ce_2,
        clr => \'0\',
        clk => clk_2, 
        o => m_axis_data_tdata_path1
    );
  m_axis_data_tdata_path0_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 24,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path0_ps_net,
        ce => ce_2,
        clr => \'0\',
        clk => clk_2, 
        o => m_axis_data_tdata_path0
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_2,
        clr => \'0\',
        clk => clk_2, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_2, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_09a75cbfcaf75117_instance : fr_cmplr_v6_3_09a75cbfcaf75117
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_2
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_2:in std_logic;
    ce_logic_2:in std_logic;
    clk:in std_logic;
    clk_2:in std_logic;
    clk_logic_2:in std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(23 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(23 downto 0);
    m_axis_data_tdata_path2:out std_logic_vector(23 downto 0);
    m_axis_data_tdata_path3:out std_logic_vector(23 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path2:in std_logic_vector(15 downto 0);
    s_axis_data_tdata_path3:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_ed7fbc5dd68a2263c8275e5828ed18eb',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f21629d68a66dddab3efba7c5d508ca4',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bf19524b08a31dce16c130ab8b77a158',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((24 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((24 - 1) downto 0);
    output_port : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_b62f4240f0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ac2774ec43d972ca2db19512f7ae0e55',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlceprobe.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b51335fdf4b86da9652af9b87f525979',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((24 - 1) downto 0);
  signal d1_1_27: std_logic_vector((24 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((24 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((24 - 1) downto 0);
    d1 : in std_logic_vector((24 - 1) downto 0);
    y : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_a2121d82da',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '949acdf11bf68675b655928f7eecdc62',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'af24922a26b20e718f854e0bfba6bb45',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal rst_1_40: boolean;
  signal en_1_45: boolean;
  signal count_reg_20_23: unsigned((1 - 1) downto 0) := "0";
  signal count_reg_20_23_rst: std_logic;
  signal count_reg_20_23_en: std_logic;
  signal bool_44_4: boolean;
  signal rst_limit_join_44_1: boolean;
  signal count_reg_join_44_1: unsigned((2 - 1) downto 0);
  signal count_reg_join_44_1_en: std_logic;
  signal count_reg_join_44_1_rst: std_logic;
begin
  rst_1_40 <= ((rst) = "1");
  en_1_45 <= ((en) = "1");
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (count_reg_20_23_rst = \'1\')) then
        count_reg_20_23 <= "0";
      elsif ((ce = \'1\') and (count_reg_20_23_en = \'1\')) then 
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("1");
      end if;
    end if;
  end process proc_count_reg_20_23;
  bool_44_4 <= rst_1_40 or false;
  proc_if_44_1: process (bool_44_4, count_reg_20_23, en_1_45)
  is
  begin
    if bool_44_4 then
      count_reg_join_44_1_rst <= \'1\';
    elsif en_1_45 then
      count_reg_join_44_1_rst <= \'0\';
    else 
      count_reg_join_44_1_rst <= \'0\';
    end if;
    if en_1_45 then
      count_reg_join_44_1_en <= \'1\';
    else 
      count_reg_join_44_1_en <= \'0\';
    end if;
    if bool_44_4 then
      rst_limit_join_44_1 <= false;
    elsif en_1_45 then
      rst_limit_join_44_1 <= false;
    else 
      rst_limit_join_44_1 <= false;
    end if;
  end process proc_if_44_1;
  count_reg_20_23_rst <= count_reg_join_44_1_rst;
  count_reg_20_23_en <= count_reg_join_44_1_en;
  op <= unsigned_to_std_logic_vector(count_reg_20_23);
end',
      'crippled_entity' => 'is
  port (
    rst : in std_logic_vector((1 - 1) downto 0);
    en : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'counter_41314d726b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b09ceab87935dceee2d929b8cf2b358e',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '26c90b101ce1ca8b2f28c242a8215ef7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_963ed6358a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '13366d021ddc9f5413827bc05cb9e24f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_6293007044',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT DDS_Compiler artix7 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET amplitude_mode = Unit_Circle',
    'CSET channels = 1',
    'CSET data_has_tlast = Not_Required',
    'CSET dds_clock_rate = 112.58317567568',
    'CSET dsp48_use = Minimal',
    'CSET explicit_period = true',
    'CSET frequency_resolution = 0.40000000000',
    'CSET gui_behaviour = Sysgen',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET has_phase_out = false',
    'CSET has_tready = true',
    'CSET latency = 16',
    'CSET latency_configuration = Auto',
    'CSET m_data_has_tuser = Not_Required',
    'CSET m_phase_has_tuser = Not_Required',
    'CSET memory_type = Auto',
    'CSET negative_cosine = false',
    'CSET negative_sine = true',
    'CSET noise_shaping = Taylor_Series_Corrected',
    'CSET optimization_goal = Auto',
    'CSET output_frequency1 = 0',
    'CSET output_frequency10 = 0',
    'CSET output_frequency11 = 0',
    'CSET output_frequency12 = 0',
    'CSET output_frequency13 = 0',
    'CSET output_frequency14 = 0',
    'CSET output_frequency15 = 0',
    'CSET output_frequency16 = 0',
    'CSET output_frequency2 = 0',
    'CSET output_frequency3 = 0',
    'CSET output_frequency4 = 0',
    'CSET output_frequency5 = 0',
    'CSET output_frequency6 = 0',
    'CSET output_frequency7 = 0',
    'CSET output_frequency8 = 0',
    'CSET output_frequency9 = 0',
    'CSET output_selection = Sine_and_Cosine',
    'CSET output_width = 24',
    'CSET parameter_entry = Hardware_Parameters',
    'CSET partspresent = Phase_Generator_and_SIN_COS_LUT',
    'CSET period = 2',
    'CSET phase_increment = Programmable',
    'CSET phase_offset = Programmable',
    'CSET phase_offset_angles1 = 0',
    'CSET phase_offset_angles10 = 0',
    'CSET phase_offset_angles11 = 0',
    'CSET phase_offset_angles12 = 0',
    'CSET phase_offset_angles13 = 0',
    'CSET phase_offset_angles14 = 0',
    'CSET phase_offset_angles15 = 0',
    'CSET phase_offset_angles16 = 0',
    'CSET phase_offset_angles2 = 0',
    'CSET phase_offset_angles3 = 0',
    'CSET phase_offset_angles4 = 0',
    'CSET phase_offset_angles5 = 0',
    'CSET phase_offset_angles6 = 0',
    'CSET phase_offset_angles7 = 0',
    'CSET phase_offset_angles8 = 0',
    'CSET phase_offset_angles9 = 0',
    'CSET phase_width = 30',
    'CSET pinc1 = 1110101000001110101000001110',
    'CSET pinc10 = 0',
    'CSET pinc11 = 0',
    'CSET pinc12 = 0',
    'CSET pinc13 = 0',
    'CSET pinc14 = 0',
    'CSET pinc15 = 0',
    'CSET pinc16 = 0',
    'CSET pinc2 = 0',
    'CSET pinc3 = 0',
    'CSET pinc4 = 0',
    'CSET pinc5 = 0',
    'CSET pinc6 = 0',
    'CSET pinc7 = 0',
    'CSET pinc8 = 0',
    'CSET pinc9 = 0',
    'CSET poff1 = 0',
    'CSET poff10 = 0',
    'CSET poff11 = 0',
    'CSET poff12 = 0',
    'CSET poff13 = 0',
    'CSET poff14 = 0',
    'CSET poff15 = 0',
    'CSET poff16 = 0',
    'CSET poff2 = 0',
    'CSET poff3 = 0',
    'CSET poff4 = 0',
    'CSET poff5 = 0',
    'CSET poff6 = 0',
    'CSET poff7 = 0',
    'CSET poff8 = 0',
    'CSET poff9 = 0',
    'CSET por_mode = false',
    'CSET s_config_sync_mode = On_Vector',
    'CSET s_phase_has_tuser = Not_Required',
    'CSET s_phase_tuser_width = 1',
    'CSET spurious_free_dynamic_range = 36',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = dds_cmplr_v5_0_3e2bf2bcd5952d6d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9101107942593c29a25a7c8f6b20e112',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component dds_cmplr_v5_0_3e2bf2bcd5952d6d
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(47 downto 0);
      m_axis_data_tready:in std_logic;
      m_axis_data_tvalid:out std_logic;
      s_axis_config_tdata:in std_logic_vector(63 downto 0);
      s_axis_config_tready:out std_logic;
      s_axis_config_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
signal s_axis_config_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_sine <= m_axis_data_tdata_net(47 downto 24);
  m_axis_data_tdata_cosine <= m_axis_data_tdata_net(23 downto 0);
  s_axis_config_tdata_net(61 downto 32) <= s_axis_config_tdata_poff;
  s_axis_config_tdata_net(29 downto 0) <= s_axis_config_tdata_pinc;
  dds_cmplr_v5_0_3e2bf2bcd5952d6d_instance : dds_cmplr_v5_0_3e2bf2bcd5952d6d
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tready=>m_axis_data_tready,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_config_tdata=>s_axis_config_tdata_net,
      s_axis_config_tready=>s_axis_config_tready,
      s_axis_config_tvalid=>s_axis_config_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_cosine:out std_logic_vector(23 downto 0);
    m_axis_data_tdata_sine:out std_logic_vector(23 downto 0);
    m_axis_data_tready:in std_logic;
    m_axis_data_tvalid:out std_logic;
    s_axis_config_tdata_pinc:in std_logic_vector(29 downto 0);
    s_axis_config_tdata_poff:in std_logic_vector(29 downto 0);
    s_axis_config_tready:out std_logic;
    s_axis_config_tvalid:in std_logic
  );
end',
      'entity_name' => 'xldds_compiler_5fd31b0c03a5bfabdbc137637289a6d0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '255150602730d4f9df4801c088691cae',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd6613d53754b62706c77c9076d87a876',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((1 - 1) downto 0);
  signal b_1_34: unsigned((1 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_a892e1bf40',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6b150eb41a9b1eeff217b3b5b634ee29',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT CORDIC artix7 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET aclken = true',
    'CSET architectural_configuration = Parallel',
    'CSET aresetn = false',
    'CSET cartesian_has_tlast = false',
    'CSET cartesian_has_tuser = true',
    'CSET cartesian_tuser_width = 1',
    'CSET coarse_rotation = true',
    'CSET compensation_scaling = LUT_based',
    'CSET data_format = SignedFraction',
    'CSET flow_control = NonBlocking',
    'CSET functional_selection = Translate',
    'CSET input_width = 25',
    'CSET iterations = 0',
    'CSET optimize_goal = Resources',
    'CSET out_tlast_behv = Null',
    'CSET out_tready = false',
    'CSET output_width = 24',
    'CSET phase_format = Radians',
    'CSET phase_has_tlast = false',
    'CSET phase_has_tuser = false',
    'CSET phase_tuser_width = 1',
    'CSET pipelining_mode = Maximum',
    'CSET precision = 0',
    'CSET round_mode = Nearest_Even',
    'CSET component_name = crdc_v5_0_195fd6ad9c516e66',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e94ee241bc01497e6360e5d0ccd07c58',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component crdc_v5_0_195fd6ad9c516e66
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(47 downto 0);
      m_axis_dout_tuser:out std_logic_vector(0 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_cartesian_tdata:in std_logic_vector(63 downto 0);
      s_axis_cartesian_tuser:in std_logic_vector(0 downto 0);
      s_axis_cartesian_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
signal m_axis_dout_tuser_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal s_axis_cartesian_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal s_axis_cartesian_tuser_net: std_logic_vector(0 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_phase <= m_axis_dout_tdata_net(47 downto 24);
  m_axis_dout_tdata_real <= m_axis_dout_tdata_net(23 downto 0);
  m_axis_dout_tuser_cartesian_tuser <= m_axis_dout_tuser_net(0 downto 0);
  s_axis_cartesian_tdata_net(56 downto 32) <= s_axis_cartesian_tdata_imag;
  s_axis_cartesian_tdata_net(24 downto 0) <= s_axis_cartesian_tdata_real;
  s_axis_cartesian_tuser_net(0 downto 0) <= s_axis_cartesian_tuser_user;
  crdc_v5_0_195fd6ad9c516e66_instance : crdc_v5_0_195fd6ad9c516e66
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tuser=>m_axis_dout_tuser_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_cartesian_tdata=>s_axis_cartesian_tdata_net,
      s_axis_cartesian_tuser=>s_axis_cartesian_tuser_net,
      s_axis_cartesian_tvalid=>s_axis_cartesian_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_dout_tdata_phase:out std_logic_vector(23 downto 0);
    m_axis_dout_tdata_real:out std_logic_vector(23 downto 0);
    m_axis_dout_tuser_cartesian_tuser:out std_logic_vector(0 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_cartesian_tdata_imag:in std_logic_vector(24 downto 0);
    s_axis_cartesian_tdata_real:in std_logic_vector(24 downto 0);
    s_axis_cartesian_tuser_user:in std_logic_vector(0 downto 0);
    s_axis_cartesian_tvalid:in std_logic
  );
end',
      'entity_name' => 'xlcordic_caf78c0f3353e8f9a473fda6dcc7d8e3',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b1f28e27a4355d53a3f062231f639022',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6b792f435372e466c617f507f31459f6',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((25 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((25 - 1) downto 0);
    output_port : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_31a4235b32',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2e081f73c0a10053518b19c569530db8',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'af58f20acc6f61f8195682314dca3787',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c38bf76e8eb944d935c2e3184d24a64a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((80 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((80 - 1) downto 0);
    output_port : out std_logic_vector((80 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_d00df1b782',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1c15e43b2cb0e2493cbb9c38d1c14235',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_cda50df78a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a1efe95bca40646618ac11b73ab26a68',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6df3f26819c1199198075550e34ea901',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((1 - 1) downto 0);
  signal b_1_34: unsigned((2 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal cast_12_12: unsigned((2 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  cast_12_12 <= u2u_cast(a_1_31, 0, 2, 0);
  result_12_3_rel <= cast_12_12 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((2 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_d29d27b7b3',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT CIC_Compiler artix7 Xilinx,_Inc. 3.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET clock_frequency = 200',
    'CSET differential_delay = 2',
    'CSET filter_type = Decimation',
    'CSET fixed_or_initial_rate = 1112',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 556',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET has_dout_tready = false',
    'CSET input_data_width = 24',
    'CSET input_sample_frequency = 0.00100000000',
    'CSET maximum_rate = 1112',
    'CSET minimum_rate = 1112',
    'CSET number_of_channels = 2',
    'CSET number_of_stages = 5',
    'CSET output_data_width = 80',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET quantization = Full_Precision',
    'CSET ratespecification = Maximum_Possible',
    'CSET response_magnitude = Normalized',
    'CSET sample_rate_changes = Fixed',
    'CSET sampleperiod = 1',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET use_streaming_interface = true',
    'CSET use_xtreme_dsp_slice = true',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = cc_cmplr_v3_0_7cfbd2fe6fb4132e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '5525b393c9396507afc02f4cda6a42de',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cc_cmplr_v3_0_7cfbd2fe6fb4132e
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_tlast_missing:out std_logic;
      event_tlast_unexpected:out std_logic;
      m_axis_data_tdata:out std_logic_vector(79 downto 0);
      m_axis_data_tlast:out std_logic;
      m_axis_data_tuser:out std_logic_vector(15 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(23 downto 0);
      s_axis_data_tlast:in std_logic;
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(79 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net: std_logic_vector(79 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_captured: std_logic_vector(79 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_or_captured_net: std_logic_vector(79 downto 0) := (others=>\'0\');
signal m_axis_data_tlast_ps_net: std_logic := \'0\';
signal m_axis_data_tlast_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tlast_ps_net_or_captured_net: std_logic := \'0\';
signal m_axis_data_tuser_net: std_logic_vector(15 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_sync_ps_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_sync_ps_net_captured: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_sync_ps_net_or_captured_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_out_ps_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_out_ps_net_captured: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_out_ps_net_or_captured_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(23 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_data_ps_net <= m_axis_data_tdata_net(79 downto 0);
  m_axis_data_tuser_chan_sync_ps_net <= m_axis_data_tuser_net(8 downto 8);
  m_axis_data_tuser_chan_out_ps_net <= m_axis_data_tuser_net(0 downto 0);
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata_data;
  m_axis_data_tdata_data_ps_net_or_captured_net <= m_axis_data_tdata_data_ps_net or m_axis_data_tdata_data_ps_net_captured;
m_axis_data_tdata_data_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 80,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net_or_captured_net,
        ce => ce_1112,
        clr => \'0\',
        clk => clk_1112, 
        o => m_axis_data_tdata_data
    );
m_axis_data_tdata_data_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 80,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1112, 
        o => m_axis_data_tdata_data_ps_net_captured
    );
  m_axis_data_tlast_ps_net_or_captured_net <= m_axis_data_tlast_ps_net or m_axis_data_tlast_ps_net_captured;
m_axis_data_tlast_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tlast_ps_net_or_captured_net,
        ce => ce_1112,
        clr => \'0\',
        clk => clk_1112, 
        o(0) => m_axis_data_tlast
    );
m_axis_data_tlast_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tlast_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1112, 
        o(0) => m_axis_data_tlast_ps_net_captured
    );
  m_axis_data_tuser_chan_sync_ps_net_or_captured_net <= m_axis_data_tuser_chan_sync_ps_net or m_axis_data_tuser_chan_sync_ps_net_captured;
m_axis_data_tuser_chan_sync_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_sync_ps_net_or_captured_net,
        ce => ce_1112,
        clr => \'0\',
        clk => clk_1112, 
        o => m_axis_data_tuser_chan_sync
    );
m_axis_data_tuser_chan_sync_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_sync_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1112, 
        o => m_axis_data_tuser_chan_sync_ps_net_captured
    );
  m_axis_data_tuser_chan_out_ps_net_or_captured_net <= m_axis_data_tuser_chan_out_ps_net or m_axis_data_tuser_chan_out_ps_net_captured;
m_axis_data_tuser_chan_out_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_out_ps_net_or_captured_net,
        ce => ce_1112,
        clr => \'0\',
        clk => clk_1112, 
        o => m_axis_data_tuser_chan_out
    );
m_axis_data_tuser_chan_out_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_out_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1112, 
        o => m_axis_data_tuser_chan_out_ps_net_captured
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_1112,
        clr => \'0\',
        clk => clk_1112, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1112, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  cc_cmplr_v3_0_7cfbd2fe6fb4132e_instance : cc_cmplr_v3_0_7cfbd2fe6fb4132e
    port map(
      aclk=>clk,
      aclken=>ce,
      event_tlast_missing=>event_tlast_missing,
      event_tlast_unexpected=>event_tlast_unexpected,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tlast=>m_axis_data_tlast_ps_net,
      m_axis_data_tuser=>m_axis_data_tuser_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tlast=>s_axis_data_tlast,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_1
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_1112:in std_logic;
    ce_logic_1:in std_logic;
    clk:in std_logic;
    clk_1112:in std_logic;
    clk_logic_1:in std_logic;
    event_tlast_missing:out std_logic;
    event_tlast_unexpected:out std_logic;
    m_axis_data_tdata_data:out std_logic_vector(79 downto 0);
    m_axis_data_tlast:out std_logic;
    m_axis_data_tuser_chan_out:out std_logic_vector(0 downto 0);
    m_axis_data_tuser_chan_sync:out std_logic_vector(0 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_data:in std_logic_vector(23 downto 0);
    s_axis_data_tlast:in std_logic;
    s_axis_data_tready:out std_logic
  );
end',
      'entity_name' => 'xlcic_compiler_4ae205b8324fa32217cd9c91e7327a30',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9412f88e0627d2d077a93972d39808c4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((26 - 1) downto 0);
  signal output_port_5_5_force: signed((26 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((26 - 1) downto 0);
    output_port : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_9934b94a22',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'be2ebd48b3d77a9f0ea6b72676a2c023',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0372fead4b677c51e7b5236b18084283',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier artix7 Xilinx,_Inc. 11.2',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_LUTs',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 49',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 8',
    'CSET portatype = Signed',
    'CSET portawidth = 25',
    'CSET portbtype = Signed',
    'CSET portbwidth = 25',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = true',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = mult_11_2_d7c7fef7b12f2f23',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '6e598950f91db14a03fea4f301813690',
    'sourceFile' => 'hdl/xlmult.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'mult_11_2_d7c7fef7b12f2f23',
      'entity_name.0' => 'xlmult',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a2f0a633f6c18d9b13c1c08a0d6dcf09',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier artix7 Xilinx,_Inc. 11.2',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_LUTs',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 49',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 8',
    'CSET portatype = Signed',
    'CSET portawidth = 25',
    'CSET portbtype = Signed',
    'CSET portbwidth = 25',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = true',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = mult_11_2_d7c7fef7b12f2f23',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c314290c454ed1a97141449ee3d1e887',
    'sourceFile' => 'hdl/xlmult.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'mult_11_2_d7c7fef7b12f2f23',
      'entity_name.0' => 'xlmult',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier artix7 Xilinx,_Inc. 11.2',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_LUTs',
    'CSET multtype = Parallel_Multiplier',
    'CSET optgoal = Speed',
    'CSET outputwidthhigh = 49',
    'CSET outputwidthlow = 0',
    'CSET pipestages = 8',
    'CSET portatype = Signed',
    'CSET portawidth = 25',
    'CSET portbtype = Signed',
    'CSET portbwidth = 25',
    'CSET roundpoint = 0',
    'CSET sclrcepriority = CE_Overrides_SCLR',
    'CSET syncclear = true',
    'CSET use_custom_output_width = true',
    'CSET userounding = false',
    'CSET zerodetect = false',
    'CSET component_name = mult_11_2_d7c7fef7b12f2f23',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '78f29ba9035eee749d3c01377214b44b',
    'sourceFile' => 'hdl/xlmult.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)',
      'core_instance_text' => '        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b',
      'core_name0' => 'mult_11_2_d7c7fef7b12f2f23',
      'entity_name.0' => 'xlmult',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Complex_Multiplier artix7 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET aclken = true',
    'CSET aportwidth = 24',
    'CSET aresetn = false',
    'CSET atuserwidth = 1',
    'CSET bportwidth = 24',
    'CSET btuserwidth = 1',
    'CSET ctrltuserwidth = 1',
    'CSET flowcontrol = NonBlocking',
    'CSET hasatlast = false',
    'CSET hasatuser = false',
    'CSET hasbtlast = false',
    'CSET hasbtuser = true',
    'CSET hasctrltlast = false',
    'CSET hasctrltuser = false',
    'CSET latencyconfig = Automatic',
    'CSET minimumlatency = 34',
    'CSET multtype = Use_Mults',
    'CSET optimizegoal = Performance',
    'CSET outputwidth = 24',
    'CSET outtlastbehv = Null',
    'CSET roundmode = Truncate',
    'CSET component_name = cmpy_v5_0_ff6ec554c4e8f87c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2309dad29146cf1c0bd366890fcb835b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cmpy_v5_0_ff6ec554c4e8f87c
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(47 downto 0);
      m_axis_dout_tuser:out std_logic_vector(0 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_a_tdata:in std_logic_vector(47 downto 0);
      s_axis_a_tvalid:in std_logic;
      s_axis_b_tdata:in std_logic_vector(47 downto 0);
      s_axis_b_tuser:in std_logic_vector(0 downto 0);
      s_axis_b_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
signal s_axis_a_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
signal s_axis_b_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_imag <= m_axis_dout_tdata_net(47 downto 24);
  m_axis_dout_tdata_real <= m_axis_dout_tdata_net(23 downto 0);
  s_axis_a_tdata_net(47 downto 24) <= s_axis_a_tdata_imag;
  s_axis_a_tdata_net(23 downto 0) <= s_axis_a_tdata_real;
  s_axis_b_tdata_net(47 downto 24) <= s_axis_b_tdata_imag;
  s_axis_b_tdata_net(23 downto 0) <= s_axis_b_tdata_real;
  cmpy_v5_0_ff6ec554c4e8f87c_instance : cmpy_v5_0_ff6ec554c4e8f87c
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tuser=>m_axis_dout_tuser,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_a_tdata=>s_axis_a_tdata_net,
      s_axis_a_tvalid=>s_axis_a_tvalid,
      s_axis_b_tdata=>s_axis_b_tdata_net,
      s_axis_b_tuser=>s_axis_b_tuser,
      s_axis_b_tvalid=>s_axis_b_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_dout_tdata_imag:out std_logic_vector(23 downto 0);
    m_axis_dout_tdata_real:out std_logic_vector(23 downto 0);
    m_axis_dout_tuser:out std_logic_vector(0 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_a_tdata_imag:in std_logic_vector(23 downto 0);
    s_axis_a_tdata_real:in std_logic_vector(23 downto 0);
    s_axis_a_tvalid:in std_logic;
    s_axis_b_tdata_imag:in std_logic_vector(23 downto 0);
    s_axis_b_tdata_real:in std_logic_vector(23 downto 0);
    s_axis_b_tuser:in std_logic_vector(0 downto 0);
    s_axis_b_tvalid:in std_logic
  );
end',
      'entity_name' => 'xlcomplex_multiplier_343c01da84b847b55598dd3435cb8a1c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2bd66e79f87a6b0368169dfd996d2d4a',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7fd9f907230f07aa09e3f24dade6d949',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((24 - 1) downto 0);
begin
  d_1_22 <= d;
  q <= d_1_22;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((24 - 1) downto 0);
    q : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_961b43f67a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '674fa2b0397629c3810995891e54b9ac',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_f394f3309c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'da2ebf64688ef05f23d3f7773260765c',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '05d4da8be11e034e9bdd3050fac6a0e3',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cf35f5f3893bcf44961568854d83f2f9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((86 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((86 - 1) downto 0);
    output_port : out std_logic_vector((86 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_3cddc67241',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '382aade0283634c192974b5423ff6719',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "11";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_3a9a3daeb9',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '5257a0eb5f203098dd35d83136a607ea',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "01";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_a7e2bb9e12',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b1f0ae968b381ba6ab9669a6ba2c3226',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "10";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_e8ddc079e9',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ead54f93e9ef40b8a3807b86b1f36a2',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a02a466d6ba04f2ec015247031d5f038',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((2 - 1) downto 0);
  signal b_1_34: unsigned((2 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((2 - 1) downto 0);
    b : in std_logic_vector((2 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_367321bc0c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c8f98bb79f170788005c99336a32e95e',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3480f17249ff4f74810a1739cdd7c917',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '010ef84b6d2c87852a3b9ffe0919f96b',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9dcee7d53bd6f952a4d162e75d299b5c',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '14ae2ecde085fb3644490201c8985da9',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1b25931de39e18563a72c12a6653d093',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((2 - 1) downto 0);
  signal b_1_34: unsigned((2 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (4 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    false,
    false,
    false,
    false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  op_mem_32_22_back <= op_mem_32_22(3);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        for i in 3 downto 1 loop 
          op_mem_32_22(i) <= op_mem_32_22(i-1);
        end loop;
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  result_12_3_rel <= a_1_31 = b_1_34;
  op_mem_32_22_front_din <= result_12_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((2 - 1) downto 0);
    b : in std_logic_vector((2 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_83ca2c6a3c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT FIR_Compiler artix7 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET bestprecision = true',
    'CSET channel_sequence = Basic',
    'CSET clock_frequency = 300',
    'CSET coefficient_buffer_type = Automatic',
    'CSET coefficient_file = no_coe_file_loaded',
    'CSET coefficient_fractional_bits = 15',
    'CSET coefficient_reload = false',
    'CSET coefficient_sets = 1',
    'CSET coefficient_sign = Signed',
    'CSET coefficient_structure = Inferred',
    'CSET coefficient_width = 16',
    'CSET coefficientsource = Vector',
    'CSET coefficientvector = 0.00054931640625,0.001251220703125,-0.0003662109375,-0.004669189453125,-0.005218505859375,0.004852294921875,0.017425537109375,0.0101318359375,-0.022705078125,-0.044281005859375,-0.008087158203125,0.0682373046875,0.089019775390625,-0.015106201171875,-0.1661376953125,-0.173583984375,0.063385009765625,0.403045654296875,0.5640869140625,0.403045654296875,0.063385009765625,-0.173583984375,-0.1661376953125,-0.015106201171875,0.089019775390625,0.0682373046875,-0.008087158203125,-0.044281005859375,-0.022705078125,0.0101318359375,0.017425537109375,0.004852294921875,-0.005218505859375,-0.004669189453125,-0.0003662109375,0.001251220703125,0.00054931640625',
    'CSET columnconfig = 1',
    'CSET data_buffer_type = Automatic',
    'CSET data_fractional_bits = 22',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Signed',
    'CSET data_tuser_width = 1',
    'CSET data_width = 24',
    'CSET decimation_rate = 2',
    'CSET displayreloadorder = false',
    'CSET filter_architecture = Systolic_Multiply_Accumulate',
    'CSET filter_selection = 1',
    'CSET filter_type = Decimation',
    'CSET gen_mif_files = false',
    'CSET gen_mif_from_coe = false',
    'CSET gen_mif_from_spec = false',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 1390000',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET input_buffer_type = Automatic',
    'CSET inter_column_pipe_length = 4',
    'CSET interpolation_rate = 1',
    'CSET m_data_has_tready = false',
    'CSET m_data_has_tuser = Chan_ID_Field',
    'CSET multi_column_support = Automatic',
    'CSET num_reload_slots = 1',
    'CSET number_channels = 4',
    'CSET number_paths = 1',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Convergent_Rounding_to_Even',
    'CSET output_width = 25',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET pattern_list = P4-0,P4-1,P4-2,P4-3,P4-4',
    'CSET preference_for_other_storage = Automatic',
    'CSET quantization = Quantize_Only',
    'CSET rate_change_type = Integer',
    'CSET ratespecification = Hardware_Oversampling_Rate',
    'CSET reload_file = no_coe_file_loaded',
    'CSET reset_data_vector = true',
    'CSET s_config_method = Single',
    'CSET s_config_sync_mode = On_Vector',
    'CSET s_data_has_fifo = false',
    'CSET s_data_has_tuser = Chan_ID_Field',
    'CSET sample_frequency = 0.00100000000',
    'CSET sampleperiod = 1390000',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_cba840ea19a9ffac',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '470a8cb02df71a3c108e67399826a975',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_cba840ea19a9ffac
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_s_data_chanid_incorrect:out std_logic;
      m_axis_data_tdata:out std_logic_vector(31 downto 0);
      m_axis_data_tuser:out std_logic_vector(1 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(23 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tuser:in std_logic_vector(1 downto 0);
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_ps_net: std_logic_vector(24 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chanid_ps_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(23 downto 0) := (others=>\'0\');
signal s_axis_data_tuser_net: std_logic_vector(1 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_ps_net <= m_axis_data_tdata_net(24 downto 0);
  m_axis_data_tuser_chanid_ps_net <= m_axis_data_tuser_net(1 downto 0);
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata;
  s_axis_data_tuser_net(1 downto 0) <= s_axis_data_tuser_chanid;
  m_axis_data_tdata_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 25,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_ps_net,
        ce => ce_2780000,
        clr => \'0\',
        clk => clk_2780000, 
        o => m_axis_data_tdata
    );
  m_axis_data_tuser_chanid_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 2,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chanid_ps_net,
        ce => ce_2780000,
        clr => \'0\',
        clk => clk_2780000, 
        o => m_axis_data_tuser_chanid
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_2780000,
        clr => \'0\',
        clk => clk_2780000, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_2780000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_cba840ea19a9ffac_instance : fr_cmplr_v6_3_cba840ea19a9ffac
    port map(
      aclk=>clk,
      aclken=>ce,
      event_s_data_chanid_incorrect=>event_s_data_chanid_incorrect,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tuser=>m_axis_data_tuser_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tuser=>s_axis_data_tuser_net,
      s_axis_data_tvalid=>ce_logic_1390000
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_1390000:in std_logic;
    ce_2780000:in std_logic;
    ce_logic_1390000:in std_logic;
    clk:in std_logic;
    clk_1390000:in std_logic;
    clk_2780000:in std_logic;
    clk_logic_1390000:in std_logic;
    event_s_data_chanid_incorrect:out std_logic;
    m_axis_data_tdata:out std_logic_vector(24 downto 0);
    m_axis_data_tuser_chanid:out std_logic_vector(1 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata:in std_logic_vector(23 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tuser_chanid:in std_logic_vector(1 downto 0);
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_ca2472758733f7423c181b713eb681ac',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT CIC_Compiler artix7 Xilinx,_Inc. 3.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET clock_frequency = 200',
    'CSET differential_delay = 2',
    'CSET filter_type = Decimation',
    'CSET fixed_or_initial_rate = 2500',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 556',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET has_dout_tready = false',
    'CSET input_data_width = 24',
    'CSET input_sample_frequency = 0.00100000000',
    'CSET maximum_rate = 2500',
    'CSET minimum_rate = 2500',
    'CSET number_of_channels = 4',
    'CSET number_of_stages = 5',
    'CSET output_data_width = 86',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET quantization = Full_Precision',
    'CSET ratespecification = Hardware_Oversampling_Rate',
    'CSET response_magnitude = Normalized',
    'CSET sample_rate_changes = Fixed',
    'CSET sampleperiod = 1',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET use_streaming_interface = true',
    'CSET use_xtreme_dsp_slice = true',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = cc_cmplr_v3_0_d2f9793114117bd1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'db9df7f42a2383230973703fdfbfbf03',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cc_cmplr_v3_0_d2f9793114117bd1
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_tlast_missing:out std_logic;
      event_tlast_unexpected:out std_logic;
      m_axis_data_tdata:out std_logic_vector(87 downto 0);
      m_axis_data_tlast:out std_logic;
      m_axis_data_tuser:out std_logic_vector(15 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(23 downto 0);
      s_axis_data_tlast:in std_logic;
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(87 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net: std_logic_vector(85 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_captured: std_logic_vector(85 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_or_captured_net: std_logic_vector(85 downto 0) := (others=>\'0\');
signal m_axis_data_tlast_ps_net: std_logic := \'0\';
signal m_axis_data_tlast_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tlast_ps_net_or_captured_net: std_logic := \'0\';
signal m_axis_data_tuser_net: std_logic_vector(15 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_sync_ps_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_sync_ps_net_captured: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_sync_ps_net_or_captured_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_out_ps_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_out_ps_net_captured: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chan_out_ps_net_or_captured_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(23 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_data_ps_net <= m_axis_data_tdata_net(85 downto 0);
  m_axis_data_tuser_chan_sync_ps_net <= m_axis_data_tuser_net(8 downto 8);
  m_axis_data_tuser_chan_out_ps_net <= m_axis_data_tuser_net(1 downto 0);
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata_data;
  m_axis_data_tdata_data_ps_net_or_captured_net <= m_axis_data_tdata_data_ps_net or m_axis_data_tdata_data_ps_net_captured;
m_axis_data_tdata_data_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 86,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net_or_captured_net,
        ce => ce_1390000,
        clr => \'0\',
        clk => clk_1390000, 
        o => m_axis_data_tdata_data
    );
m_axis_data_tdata_data_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 86,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1390000, 
        o => m_axis_data_tdata_data_ps_net_captured
    );
  m_axis_data_tlast_ps_net_or_captured_net <= m_axis_data_tlast_ps_net or m_axis_data_tlast_ps_net_captured;
m_axis_data_tlast_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tlast_ps_net_or_captured_net,
        ce => ce_1390000,
        clr => \'0\',
        clk => clk_1390000, 
        o(0) => m_axis_data_tlast
    );
m_axis_data_tlast_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tlast_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1390000, 
        o(0) => m_axis_data_tlast_ps_net_captured
    );
  m_axis_data_tuser_chan_sync_ps_net_or_captured_net <= m_axis_data_tuser_chan_sync_ps_net or m_axis_data_tuser_chan_sync_ps_net_captured;
m_axis_data_tuser_chan_sync_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_sync_ps_net_or_captured_net,
        ce => ce_1390000,
        clr => \'0\',
        clk => clk_1390000, 
        o => m_axis_data_tuser_chan_sync
    );
m_axis_data_tuser_chan_sync_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_sync_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1390000, 
        o => m_axis_data_tuser_chan_sync_ps_net_captured
    );
  m_axis_data_tuser_chan_out_ps_net_or_captured_net <= m_axis_data_tuser_chan_out_ps_net or m_axis_data_tuser_chan_out_ps_net_captured;
m_axis_data_tuser_chan_out_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 2,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_out_ps_net_or_captured_net,
        ce => ce_1390000,
        clr => \'0\',
        clk => clk_1390000, 
        o => m_axis_data_tuser_chan_out
    );
m_axis_data_tuser_chan_out_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 2,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chan_out_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1390000, 
        o => m_axis_data_tuser_chan_out_ps_net_captured
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_1390000,
        clr => \'0\',
        clk => clk_1390000, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1390000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  cc_cmplr_v3_0_d2f9793114117bd1_instance : cc_cmplr_v3_0_d2f9793114117bd1
    port map(
      aclk=>clk,
      aclken=>ce,
      event_tlast_missing=>event_tlast_missing,
      event_tlast_unexpected=>event_tlast_unexpected,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tlast=>m_axis_data_tlast_ps_net,
      m_axis_data_tuser=>m_axis_data_tuser_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tlast=>s_axis_data_tlast,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_556
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_1390000:in std_logic;
    ce_556:in std_logic;
    ce_logic_556:in std_logic;
    clk:in std_logic;
    clk_1390000:in std_logic;
    clk_556:in std_logic;
    clk_logic_556:in std_logic;
    event_tlast_missing:out std_logic;
    event_tlast_unexpected:out std_logic;
    m_axis_data_tdata_data:out std_logic_vector(85 downto 0);
    m_axis_data_tlast:out std_logic;
    m_axis_data_tuser_chan_out:out std_logic_vector(1 downto 0);
    m_axis_data_tuser_chan_sync:out std_logic_vector(0 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_data:in std_logic_vector(23 downto 0);
    s_axis_data_tlast:in std_logic;
    s_axis_data_tready:out std_logic
  );
end',
      'entity_name' => 'xlcic_compiler_5e7eb2437512ccef4e0858098d3c7363',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT FIR_Compiler artix7 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET bestprecision = true',
    'CSET channel_sequence = Basic',
    'CSET clock_frequency = 300',
    'CSET coefficient_buffer_type = Automatic',
    'CSET coefficient_file = no_coe_file_loaded',
    'CSET coefficient_fractional_bits = 15',
    'CSET coefficient_reload = false',
    'CSET coefficient_sets = 1',
    'CSET coefficient_sign = Signed',
    'CSET coefficient_structure = Inferred',
    'CSET coefficient_width = 16',
    'CSET coefficientsource = Vector',
    'CSET coefficientvector = -3.0517578125e-005,-0.00030517578125,0.000274658203125,0.000244140625,-0.000518798828125,-0.00018310546875,0.0008544921875,-3.0517578125e-005,-0.00128173828125,0.00048828125,0.001678466796875,-0.001251220703125,-0.00189208984375,0.002349853515625,0.00177001953125,-0.00372314453125,-0.00115966796875,0.005279541015625,-0.000213623046875,-0.006805419921875,0.002471923828125,0.0079345703125,-0.005706787109375,-0.00830078125,0.0098876953125,0.007415771484375,-0.01495361328125,-0.00469970703125,0.020599365234375,-0.000518798828125,-0.0264892578125,0.009246826171875,0.0322265625,-0.023162841796875,-0.037322998046875,0.04656982421875,0.04132080078125,-0.0953369140625,-0.04388427734375,0.31463623046875,0.544769287109375,0.31463623046875,-0.04388427734375,-0.0953369140625,0.04132080078125,0.04656982421875,-0.037322998046875,-0.023162841796875,0.0322265625,0.009246826171875,-0.0264892578125,-0.000518798828125,0.020599365234375,-0.00469970703125,-0.01495361328125,0.007415771484375,0.0098876953125,-0.00830078125,-0.005706787109375,0.0079345703125,0.002471923828125,-0.006805419921875,-0.000213623046875,0.005279541015625,-0.00115966796875,-0.00372314453125,0.00177001953125,0.002349853515625,-0.00189208984375,-0.001251220703125,0.001678466796875,0.00048828125,-0.00128173828125,-3.0517578125e-005,0.0008544921875,-0.00018310546875,-0.000518798828125,0.000244140625,0.000274658203125,-0.00030517578125,-3.0517578125e-005',
    'CSET columnconfig = 1',
    'CSET data_buffer_type = Automatic',
    'CSET data_fractional_bits = 22',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Signed',
    'CSET data_tuser_width = 1',
    'CSET data_width = 24',
    'CSET decimation_rate = 2',
    'CSET displayreloadorder = false',
    'CSET filter_architecture = Systolic_Multiply_Accumulate',
    'CSET filter_selection = 1',
    'CSET filter_type = Decimation',
    'CSET gen_mif_files = false',
    'CSET gen_mif_from_coe = false',
    'CSET gen_mif_from_spec = false',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 2780000',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET input_buffer_type = Automatic',
    'CSET inter_column_pipe_length = 4',
    'CSET interpolation_rate = 1',
    'CSET m_data_has_tready = false',
    'CSET m_data_has_tuser = Chan_ID_Field',
    'CSET multi_column_support = Automatic',
    'CSET num_reload_slots = 1',
    'CSET number_channels = 4',
    'CSET number_paths = 1',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Convergent_Rounding_to_Even',
    'CSET output_width = 25',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET pattern_list = P4-0,P4-1,P4-2,P4-3,P4-4',
    'CSET preference_for_other_storage = Automatic',
    'CSET quantization = Quantize_Only',
    'CSET rate_change_type = Integer',
    'CSET ratespecification = Hardware_Oversampling_Rate',
    'CSET reload_file = no_coe_file_loaded',
    'CSET reset_data_vector = true',
    'CSET s_config_method = Single',
    'CSET s_config_sync_mode = On_Vector',
    'CSET s_data_has_fifo = false',
    'CSET s_data_has_tuser = Chan_ID_Field',
    'CSET sample_frequency = 0.00100000000',
    'CSET sampleperiod = 2780000',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_9811624e3d492cbe',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd8ebea652b5ca28d318e541042f6151c',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_9811624e3d492cbe
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_s_data_chanid_incorrect:out std_logic;
      m_axis_data_tdata:out std_logic_vector(31 downto 0);
      m_axis_data_tuser:out std_logic_vector(1 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(23 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tuser:in std_logic_vector(1 downto 0);
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_ps_net: std_logic_vector(24 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chanid_ps_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(23 downto 0) := (others=>\'0\');
signal s_axis_data_tuser_net: std_logic_vector(1 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_ps_net <= m_axis_data_tdata_net(24 downto 0);
  m_axis_data_tuser_chanid_ps_net <= m_axis_data_tuser_net(1 downto 0);
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata;
  s_axis_data_tuser_net(1 downto 0) <= s_axis_data_tuser_chanid;
  m_axis_data_tdata_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 25,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_ps_net,
        ce => ce_5560000,
        clr => \'0\',
        clk => clk_5560000, 
        o => m_axis_data_tdata
    );
  m_axis_data_tuser_chanid_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 2,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chanid_ps_net,
        ce => ce_5560000,
        clr => \'0\',
        clk => clk_5560000, 
        o => m_axis_data_tuser_chanid
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_5560000,
        clr => \'0\',
        clk => clk_5560000, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_5560000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_9811624e3d492cbe_instance : fr_cmplr_v6_3_9811624e3d492cbe
    port map(
      aclk=>clk,
      aclken=>ce,
      event_s_data_chanid_incorrect=>event_s_data_chanid_incorrect,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tuser=>m_axis_data_tuser_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tuser=>s_axis_data_tuser_net,
      s_axis_data_tvalid=>ce_logic_2780000
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_2780000:in std_logic;
    ce_5560000:in std_logic;
    ce_logic_2780000:in std_logic;
    clk:in std_logic;
    clk_2780000:in std_logic;
    clk_5560000:in std_logic;
    clk_logic_2780000:in std_logic;
    event_s_data_chanid_incorrect:out std_logic;
    m_axis_data_tdata:out std_logic_vector(24 downto 0);
    m_axis_data_tuser_chanid:out std_logic_vector(1 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata:in std_logic_vector(23 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tuser_chanid:in std_logic_vector(1 downto 0);
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_74acb50727f17080870b312af1b4e28f',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2530f8df112851d515ce162394e0a81b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((24 - 1) downto 0);
  signal output_port_5_5_force: signed((24 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((24 - 1) downto 0);
    output_port : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_4bf1ad328a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cae55248a9814c83a0e6c052db3abe69',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT FIR_Compiler artix7 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET bestprecision = true',
    'CSET channel_sequence = Basic',
    'CSET clock_frequency = 300',
    'CSET coefficient_buffer_type = Automatic',
    'CSET coefficient_file = no_coe_file_loaded',
    'CSET coefficient_fractional_bits = 20',
    'CSET coefficient_reload = false',
    'CSET coefficient_sets = 1',
    'CSET coefficient_sign = Signed',
    'CSET coefficient_structure = Inferred',
    'CSET coefficient_width = 16',
    'CSET coefficientsource = Vector',
    'CSET coefficientvector = -3.1988110943394417e-005,-3.3475719576492712e-005,-3.4886771183855515e-005,-3.621070414216334e-005,-3.743697708194185e-005,-3.8555119768386824e-005,-3.955478512521695e-005,-4.0425802194467083e-005,-4.1158229815696158e-005,-4.174241080022946e-005,-4.2169026367986803e-005,-4.242915060808227e-005,-4.2514304718514581e-005,-4.2416510775288271e-005,-4.2128344777639388e-005,-4.1642988713075162e-005,-4.0954281384184997e-005,-4.0056767738567372e-005,-3.8945746443503031e-005,-3.761731544870059e-005,-3.6068415283022598e-005,-3.4296869835140932e-005,-3.2301424372818964e-005,-3.0081780562099977e-005,-2.7638628254693913e-005,-2.4973673820628803e-005,-2.208966481284946e-005,-1.8990410761153064e-005,-1.5680799904968972e-005,-1.2166811687276977e-005,-8.4555248461301097e-006,-4.5551209552590342e-006,-4.7488328118698434e-007,3.7748091587005414e-006,8.1824924349956977e-006,1.2735633521236487e-005,1.7420651144915523e-005,2.222294171446195e-005,2.7126910341461404e-005,3.2116006956321656e-005,3.7172767493938353e-005,4.2278860103955178e-005,4.7415136318037078e-005,5.256168708401835e-005,5.7697903554308441e-005,6.2802542493356985e-005,6.7853796146423285e-005,7.2829366389612745e-005,7.7706542959060014e-005,8.2462285535491611e-005,8.7073309438983346e-005,9.1516174668331024e-005,9.57673779991381e-005,9.9803447835582155e-005,0.0001036010414924788,0.00010713704456644724,0.00011038867203894144,0.00011333357073815432,0.00011594992277288356,0.00011821654953854949,0.00012011301588390512,0.00012161973401707972,0.00012271806672089832,0.00012339042944045983,0.00012362039080058987,0.00012339277110709202,0.00012269373838366327,0.00012151090149635083,0.00011983339991885698,0.00011765198969551832,0.00011495912516416881,0.00011174903600822863,0.00010801779921637539,0.0001037634055393304,9.8985820045858951e-005,9.368703639501176e-005,8.7871124458086672e-005,8.1544270942056135e-005,7.4714812686548824e-005,6.7393262328139486e-005,5.9592326049220678e-005,5.1326913154064235e-005,4.2614137241124473e-005,3.3473308768885327e-005,2.3925918842174404e-005,1.3995614076441588e-005,3.7081624298391571e-006,-6.9085900742169357e-006,-1.7824771777078783e-005,-2.9008546975639014e-005,-4.0426186646259702e-005,-5.2042148238018243e-005,-6.3819164434447402e-005,-7.5718340745921153e-005,-8.7699261757383972e-005,-9.9720105818582128e-005,-0.00011173776792668928,-0.00012370799051388657,-0.00013558550181576361,-0.00014732416146004087,-0.00015887711287948495,-0.00017019694211809386,-0.00018123584256580149,-0.00019194578512417846,-0.00020227869327419987,-0.00021218662248709033,-0.00022162194339074917,-0.00023053752807750103,-0.0002388869389139245,-0.00024662461919051535,-0.00025370608492800812,-0.00026008811713849742,-0.00026572895382303869,-0.00027058848097346108,-0.00027462842183468401,-0.00027781252367492661,-0.00028010674130505615,-0.00028147941658497518,-0.0002819014531542648,-0.00028134648562675737,-0.00027979104249385635,-0.00027721470198961826,-0.00027360024018187052,-0.00026893377056776672,-0.00026320487446928774,-0.00025640672154451932,-0.00024853617975351827,-0.00023959391414359523,-0.00022958447384798645,-0.00021851636672334972,-0.00020640212108627158,-0.00019325833404607078,-0.0001791057059708453,-0.00016396906066623275,-0.00014787735089072076,-0.00013086364887830108,-0.00011296512158830613,-9.4222990453129757e-005,-7.4682475447184377e-005,-5.4392723355141523e-005,-3.3406720172910468e-005,-1.1781187632403512e-005,1.0423536100967364e-005,3.3143631449778592e-005,5.6311947997057167e-005,7.9858170381324074e-005,0.00010370899922520135,0.0001277883467480253,0.00015201754665232213,0.00017631557781392127,0.00020059930124606882,0.00022478370974927329,0.0002487821896010334,0.00027250679358345676,0.00029586852459199888,0.00031877762901578663,0.00034114389902888966,0.00036287698288332994,0.00038388670224829977,0.00040408337559635465,0.00042337814659663736,0.00044168331643730101,0.00045891267896486855,0.00047498185749703781,0.00048980864213791781,0.0005033133264008171,0.0005154190419237785,0.00052605209004715305,0.0005351422690105756,0.00054262319551942693,0.00054843261942740125,0.0005525127302833001,0.00055481045449575232,0.00055527774188003903,0.00055387184036597109,0.00055055555766542771,0.00054529750872224037,0.00053807234779592195,0.00052886098406406843,0.00051765077966620045,0.00050443572915409584,0.00048921661936055709,0.00047200116874951322,0.00045280414536570158,0.00043164746256149205,0.00040856025174157418,0.00038357891143335905,0.00035674713206143474,0.00032811589587833942,0.00029774345158115631,0.000265695263223424,0.00023204393311468662,0.00019686909848529345,0.00016025730178150351,0.00012230183454544065,8.3102554925320991e-005,4.2765678954075851e-005,1.4035458276320618e-006,-4.086564249135074e-005,-8.3918106924146449e-005,-0.00012762480166594308,-0.00017185174870561792,-0.00021646039577192123,-0.00026130799690947382,-0.00030624801479636526,-0.00035113054382470679,-0.00039580275287737042,-0.00044010934664789967,-0.00048389304426719776,-0.00052699507391991049,-0.00056925568205611326,-0.00061051465573015555,-0.00065061185652832314,-0.00068938776448145066,-0.00072668403029699301,-0.00076234403418855116,-0.00079621344952904034,-0.0008281408095073058,-0.00085797807492700028,-0.00088558120125116675,-0.00091081070296654182,-0.00093353221331833201,-0.00095361703744903522,-0.00097094269696413021,-0.00098539346394335096,-0.00099686088241859525,-0.0010052442753487566,-0.0010104512351374968,-0.0010123980957629532,-0.0010110103846177373,-0.0010062232521940867,-0.00099798187779218182,-0.0009862418494797113,-0.00097096951658726496,-0.00095214231308746254,-0.00092974905027538954,-0.00090379017724396226,-0.00087427800772987732,-0.00084123691199404396,-0.00080470347249422119,-0.0007647266022068306,-0.00072136762455969768,-0.00067470031404690814,-0.00062481089671126368,-0.00057179800979844232,-0.00051577262000953293,-0.00045685789990491059,-0.00039518906214199056,-0.00033091315136182049,-0.00026418879367447841,-0.00019518590383028452,-0.00012408535030248899,-5.1078578647123559e-005,2.3632806353660099e-005,9.9837499117411748e-005,0.00017731499146806119,0.00025583610969492432,0.00033516358939626972,0.00041505268690202653,0.00049525182593451776,0.00057550327803298606,0.00065554387513745151,0.00073510575260063102,0.00081391712077368266,0.00089170306319305223,0.00096818635928171842,0.001043088329369544,0.0011161296997343692,0.0011870314852685062,0.0012555158872845067,0.0013213072038903725,0.0013841327502874623,0.0014437237862751208,0.0014998164481845617,0.0015521526824108557,0.001600481177666982,0.001644558293046992,0.0016841489789577735,0.0017190276879598375,0.001748979272547921,0.001773799866901761,0.0017932977496462285,0.001807294184678335,0.0018156242371466841,0.0018181375617060316,0.0018146991602167588,0.0018051901061150453,0.0017895082327456287,0.0017675687830236374,0.0017393050178762923,0.0017046687810081485,0.0016636310176356447,0.0016161822449466626,0.0015623329721597633,0.0015021140681841588,0.0014355770750157685,0.0013627944651463037,0.0012838598414107903,0.0011988880778540229,0.0011080154003576021,0.0010113994059360802,0.00090921901978279656,0.00080167438932277773,0.00068898671471101438,0.00057139801539929521,0.00044917083258231335,0.00032258786752439238,0.00019195155596058691,5.7583578959583475e-005,-8.0175689169248874e-005,-0.0002209677951475778,-0.00036441688220682262,-0.00051013042560858128,-0.00065770002684947316,-0.00080670226500329,-0.00095669960346635391,-0.0011072413501884623,-0.0012578646692921647,-0.0014080956418081538,-0.0015574503730849307,-0.0017054361442666393,-0.0018515526050755337,-0.0019952930049844278,-0.0021361454597212505,-0.0022735942499120688,-0.0024071211485417287,-0.0025362067737929699,-0.0026603319637155489,-0.0027789791690775718,-0.0028916338606616667,-0.0029977859471897717,-0.003096931199991802,-0.0031885726804763092,-0.0032722221664152522,-0.0033474015730203944,-0.003413644364766107,-0.003470496953902434,-0.0035175200816031475,-0.0035542901777068947,-0.0035804006950342503,-0.0035954634143013637,-0.0035991097156997309,-0.0035909918132733241,-0.0035707839482976129,-0.0035381835379500125,-0.0034929122756577721,-0.0034347171796180655,-0.0033633715861032328,-0.0032786760842950097,-0.0031804593895316414,-0.0030685791520025534,-0.0029429226980857907,-0.0028034077016930964,-0.002649982783166215,-0.0024826280334550479,-0.0023013554615033366,-0.0021062093629695545,-0.0018972666086201164,-0.0016746368509468464,-0.0014384626477818073,-0.001188919501908107,-0.00092621581589542607,-0.00065059276162259861,-0.00036232406418623811,-6.1715700133118799e-005,0.00025089448980545416,0.0005751372730580874,0.00091061258197579816,0.0012568901541113566,0.0016135102548747856,0.0019799844811870257,0.0023557966445194082,0.0027404037314753102,0.0031332369398437807,0.0035337027878328412,0.0039411842939738057,0.0043550422249778713,0.0047746164086229529,0.0051992271085530579,0.0056281764576849407,0.0060607499467376785,0.0064962179642317347,0.0069338373841437628,0.0073728531972545438,0.0078125001820882368,0.008252004611214829,0.0086905859885705473,0.0091274588133490146,0.0095618343659236403,0.0099929225111838674,0.010419933514602098,0.010842079866296131,0.011258578108313343,0.011668650660336673,0.012071527639002211,0.012466448666019096,0.012852664660299369,0.013229439609334391,0.013596052315098186,0.013951798109815287,0.014295990537000293,0.014627962993261525,0.014947070326456124,0.015252690385895242,0.015544225520419525,0.015821104020298623,0.016082781499055922,0.016328742211476104,0.016558500304221214,0.016771600995662213,0.016967621681717501,0.01714617296469248,0.017306899602317852,0.017449481374401658,0.017573633864731753,0.017679109156094931,0.017765696436516019,0.017833222515060945,0.017881552245793665,0.017910588858729332,0.017920274196877778,0.017910588858729332,0.017881552245793665,0.017833222515060945,0.017765696436516019,0.017679109156094931,0.017573633864731753,0.017449481374401658,0.017306899602317852,0.01714617296469248,0.016967621681717501,0.016771600995662213,0.016558500304221214,0.016328742211476104,0.016082781499055922,0.015821104020298623,0.015544225520419525,0.015252690385895242,0.014947070326456124,0.014627962993261525,0.014295990537000293,0.013951798109815287,0.013596052315098186,0.013229439609334391,0.012852664660299369,0.012466448666019096,0.012071527639002211,0.011668650660336673,0.011258578108313343,0.010842079866296131,0.010419933514602098,0.0099929225111838674,0.0095618343659236403,0.0091274588133490146,0.0086905859885705473,0.008252004611214829,0.0078125001820882368,0.0073728531972545438,0.0069338373841437628,0.0064962179642317347,0.0060607499467376785,0.0056281764576849407,0.0051992271085530579,0.0047746164086229529,0.0043550422249778713,0.0039411842939738057,0.0035337027878328412,0.0031332369398437807,0.0027404037314753102,0.0023557966445194082,0.0019799844811870257,0.0016135102548747856,0.0012568901541113566,0.00091061258197579816,0.0005751372730580874,0.00025089448980545416,-6.1715700133118799e-005,-0.00036232406418623811,-0.00065059276162259861,-0.00092621581589542607,-0.001188919501908107,-0.0014384626477818073,-0.0016746368509468464,-0.0018972666086201164,-0.0021062093629695545,-0.0023013554615033366,-0.0024826280334550479,-0.002649982783166215,-0.0028034077016930964,-0.0029429226980857907,-0.0030685791520025534,-0.0031804593895316414,-0.0032786760842950097,-0.0033633715861032328,-0.0034347171796180655,-0.0034929122756577721,-0.0035381835379500125,-0.0035707839482976129,-0.0035909918132733241,-0.0035991097156997309,-0.0035954634143013637,-0.0035804006950342503,-0.0035542901777068947,-0.0035175200816031475,-0.003470496953902434,-0.003413644364766107,-0.0033474015730203944,-0.0032722221664152522,-0.0031885726804763092,-0.003096931199991802,-0.0029977859471897717,-0.0028916338606616667,-0.0027789791690775718,-0.0026603319637155489,-0.0025362067737929699,-0.0024071211485417287,-0.0022735942499120688,-0.0021361454597212505,-0.0019952930049844278,-0.0018515526050755337,-0.0017054361442666393,-0.0015574503730849307,-0.0014080956418081538,-0.0012578646692921647,-0.0011072413501884623,-0.00095669960346635391,-0.00080670226500329,-0.00065770002684947316,-0.00051013042560858128,-0.00036441688220682262,-0.0002209677951475778,-8.0175689169248874e-005,5.7583578959583475e-005,0.00019195155596058691,0.00032258786752439238,0.00044917083258231335,0.00057139801539929521,0.00068898671471101438,0.00080167438932277773,0.00090921901978279656,0.0010113994059360802,0.0011080154003576021,0.0011988880778540229,0.0012838598414107903,0.0013627944651463037,0.0014355770750157685,0.0015021140681841588,0.0015623329721597633,0.0016161822449466626,0.0016636310176356447,0.0017046687810081485,0.0017393050178762923,0.0017675687830236374,0.0017895082327456287,0.0018051901061150453,0.0018146991602167588,0.0018181375617060316,0.0018156242371466841,0.001807294184678335,0.0017932977496462285,0.001773799866901761,0.001748979272547921,0.0017190276879598375,0.0016841489789577735,0.001644558293046992,0.001600481177666982,0.0015521526824108557,0.0014998164481845617,0.0014437237862751208,0.0013841327502874623,0.0013213072038903725,0.0012555158872845067,0.0011870314852685062,0.0011161296997343692,0.001043088329369544,0.00096818635928171842,0.00089170306319305223,0.00081391712077368266,0.00073510575260063102,0.00065554387513745151,0.00057550327803298606,0.00049525182593451776,0.00041505268690202653,0.00033516358939626972,0.00025583610969492432,0.00017731499146806119,9.9837499117411748e-005,2.3632806353660099e-005,-5.1078578647123559e-005,-0.00012408535030248899,-0.00019518590383028452,-0.00026418879367447841,-0.00033091315136182049,-0.00039518906214199056,-0.00045685789990491059,-0.00051577262000953293,-0.00057179800979844232,-0.00062481089671126368,-0.00067470031404690814,-0.00072136762455969768,-0.0007647266022068306,-0.00080470347249422119,-0.00084123691199404396,-0.00087427800772987732,-0.00090379017724396226,-0.00092974905027538954,-0.00095214231308746254,-0.00097096951658726496,-0.0009862418494797113,-0.00099798187779218182,-0.0010062232521940867,-0.0010110103846177373,-0.0010123980957629532,-0.0010104512351374968,-0.0010052442753487566,-0.00099686088241859525,-0.00098539346394335096,-0.00097094269696413021,-0.00095361703744903522,-0.00093353221331833201,-0.00091081070296654182,-0.00088558120125116675,-0.00085797807492700028,-0.0008281408095073058,-0.00079621344952904034,-0.00076234403418855116,-0.00072668403029699301,-0.00068938776448145066,-0.00065061185652832314,-0.00061051465573015555,-0.00056925568205611326,-0.00052699507391991049,-0.00048389304426719776,-0.00044010934664789967,-0.00039580275287737042,-0.00035113054382470679,-0.00030624801479636526,-0.00026130799690947382,-0.00021646039577192123,-0.00017185174870561792,-0.00012762480166594308,-8.3918106924146449e-005,-4.086564249135074e-005,1.4035458276320618e-006,4.2765678954075851e-005,8.3102554925320991e-005,0.00012230183454544065,0.00016025730178150351,0.00019686909848529345,0.00023204393311468662,0.000265695263223424,0.00029774345158115631,0.00032811589587833942,0.00035674713206143474,0.00038357891143335905,0.00040856025174157418,0.00043164746256149205,0.00045280414536570158,0.00047200116874951322,0.00048921661936055709,0.00050443572915409584,0.00051765077966620045,0.00052886098406406843,0.00053807234779592195,0.00054529750872224037,0.00055055555766542771,0.00055387184036597109,0.00055527774188003903,0.00055481045449575232,0.0005525127302833001,0.00054843261942740125,0.00054262319551942693,0.0005351422690105756,0.00052605209004715305,0.0005154190419237785,0.0005033133264008171,0.00048980864213791781,0.00047498185749703781,0.00045891267896486855,0.00044168331643730101,0.00042337814659663736,0.00040408337559635465,0.00038388670224829977,0.00036287698288332994,0.00034114389902888966,0.00031877762901578663,0.00029586852459199888,0.00027250679358345676,0.0002487821896010334,0.00022478370974927329,0.00020059930124606882,0.00017631557781392127,0.00015201754665232213,0.0001277883467480253,0.00010370899922520135,7.9858170381324074e-005,5.6311947997057167e-005,3.3143631449778592e-005,1.0423536100967364e-005,-1.1781187632403512e-005,-3.3406720172910468e-005,-5.4392723355141523e-005,-7.4682475447184377e-005,-9.4222990453129757e-005,-0.00011296512158830613,-0.00013086364887830108,-0.00014787735089072076,-0.00016396906066623275,-0.0001791057059708453,-0.00019325833404607078,-0.00020640212108627158,-0.00021851636672334972,-0.00022958447384798645,-0.00023959391414359523,-0.00024853617975351827,-0.00025640672154451932,-0.00026320487446928774,-0.00026893377056776672,-0.00027360024018187052,-0.00027721470198961826,-0.00027979104249385635,-0.00028134648562675737,-0.0002819014531542648,-0.00028147941658497518,-0.00028010674130505615,-0.00027781252367492661,-0.00027462842183468401,-0.00027058848097346108,-0.00026572895382303869,-0.00026008811713849742,-0.00025370608492800812,-0.00024662461919051535,-0.0002388869389139245,-0.00023053752807750103,-0.00022162194339074917,-0.00021218662248709033,-0.00020227869327419987,-0.00019194578512417846,-0.00018123584256580149,-0.00017019694211809386,-0.00015887711287948495,-0.00014732416146004087,-0.00013558550181576361,-0.00012370799051388657,-0.00011173776792668928,-9.9720105818582128e-005,-8.7699261757383972e-005,-7.5718340745921153e-005,-6.3819164434447402e-005,-5.2042148238018243e-005,-4.0426186646259702e-005,-2.9008546975639014e-005,-1.7824771777078783e-005,-6.9085900742169357e-006,3.7081624298391571e-006,1.3995614076441588e-005,2.3925918842174404e-005,3.3473308768885327e-005,4.2614137241124473e-005,5.1326913154064235e-005,5.9592326049220678e-005,6.7393262328139486e-005,7.4714812686548824e-005,8.1544270942056135e-005,8.7871124458086672e-005,9.368703639501176e-005,9.8985820045858951e-005,0.0001037634055393304,0.00010801779921637539,0.00011174903600822863,0.00011495912516416881,0.00011765198969551832,0.00011983339991885698,0.00012151090149635083,0.00012269373838366327,0.00012339277110709202,0.00012362039080058987,0.00012339042944045983,0.00012271806672089832,0.00012161973401707972,0.00012011301588390512,0.00011821654953854949,0.00011594992277288356,0.00011333357073815432,0.00011038867203894144,0.00010713704456644724,0.0001036010414924788,9.9803447835582155e-005,9.57673779991381e-005,9.1516174668331024e-005,8.7073309438983346e-005,8.2462285535491611e-005,7.7706542959060014e-005,7.2829366389612745e-005,6.7853796146423285e-005,6.2802542493356985e-005,5.7697903554308441e-005,5.256168708401835e-005,4.7415136318037078e-005,4.2278860103955178e-005,3.7172767493938353e-005,3.2116006956321656e-005,2.7126910341461404e-005,2.222294171446195e-005,1.7420651144915523e-005,1.2735633521236487e-005,8.1824924349956977e-006,3.7748091587005414e-006,-4.7488328118698434e-007,-4.5551209552590342e-006,-8.4555248461301097e-006,-1.2166811687276977e-005,-1.5680799904968972e-005,-1.8990410761153064e-005,-2.208966481284946e-005,-2.4973673820628803e-005,-2.7638628254693913e-005,-3.0081780562099977e-005,-3.2301424372818964e-005,-3.4296869835140932e-005,-3.6068415283022598e-005,-3.761731544870059e-005,-3.8945746443503031e-005,-4.0056767738567372e-005,-4.0954281384184997e-005,-4.1642988713075162e-005,-4.2128344777639388e-005,-4.2416510775288271e-005,-4.2514304718514581e-005,-4.242915060808227e-005,-4.2169026367986803e-005,-4.174241080022946e-005,-4.1158229815696158e-005,-4.0425802194467083e-005,-3.955478512521695e-005,-3.8555119768386824e-005,-3.743697708194185e-005,-3.621070414216334e-005,-3.4886771183855515e-005,-3.3475719576492712e-005,-3.1988110943394417e-005',
    'CSET columnconfig = 13',
    'CSET data_buffer_type = Automatic',
    'CSET data_fractional_bits = 22',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Signed',
    'CSET data_tuser_width = 1',
    'CSET data_width = 24',
    'CSET decimation_rate = 35',
    'CSET displayreloadorder = false',
    'CSET filter_architecture = Systolic_Multiply_Accumulate',
    'CSET filter_selection = 1',
    'CSET filter_type = Decimation',
    'CSET gen_mif_files = false',
    'CSET gen_mif_from_coe = false',
    'CSET gen_mif_from_spec = false',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 2780000',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET input_buffer_type = Automatic',
    'CSET inter_column_pipe_length = 4',
    'CSET interpolation_rate = 1',
    'CSET m_data_has_tready = false',
    'CSET m_data_has_tuser = Chan_ID_Field',
    'CSET multi_column_support = Automatic',
    'CSET num_reload_slots = 1',
    'CSET number_channels = 2',
    'CSET number_paths = 2',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Convergent_Rounding_to_Even',
    'CSET output_width = 25',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET pattern_list = P4-0,P4-1,P4-2,P4-3,P4-4',
    'CSET preference_for_other_storage = Automatic',
    'CSET quantization = Quantize_Only',
    'CSET rate_change_type = Integer',
    'CSET ratespecification = Maximum_Possible',
    'CSET reload_file = no_coe_file_loaded',
    'CSET reset_data_vector = true',
    'CSET s_config_method = Single',
    'CSET s_config_sync_mode = On_Vector',
    'CSET s_data_has_fifo = false',
    'CSET s_data_has_tuser = Chan_ID_Field',
    'CSET sample_frequency = 0.00100000000',
    'CSET sampleperiod = 1',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_29ba59dac02ae212',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '579d4c4ee2bcf4480a3390bd5af51ff3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_29ba59dac02ae212
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_s_data_chanid_incorrect:out std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tuser:out std_logic_vector(0 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(47 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tuser:in std_logic_vector(0 downto 0);
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_path1_ps_net: std_logic_vector(24 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_path0_ps_net: std_logic_vector(24 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chanid_ps_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
signal s_axis_data_tuser_net: std_logic_vector(0 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_path1_ps_net <= m_axis_data_tdata_net(56 downto 32);
  m_axis_data_tdata_path0_ps_net <= m_axis_data_tdata_net(24 downto 0);
  m_axis_data_tuser_chanid_ps_net <= m_axis_data_tuser_net(0 downto 0);
  s_axis_data_tdata_net(47 downto 24) <= s_axis_data_tdata_path1;
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata_path0;
  s_axis_data_tuser_net(0 downto 0) <= s_axis_data_tuser_chanid;
  m_axis_data_tdata_path1_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 25,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path1_ps_net,
        ce => ce_35,
        clr => \'0\',
        clk => clk_35, 
        o => m_axis_data_tdata_path1
    );
  m_axis_data_tdata_path0_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 25,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_path0_ps_net,
        ce => ce_35,
        clr => \'0\',
        clk => clk_35, 
        o => m_axis_data_tdata_path0
    );
  m_axis_data_tuser_chanid_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chanid_ps_net,
        ce => ce_35,
        clr => \'0\',
        clk => clk_35, 
        o => m_axis_data_tuser_chanid
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_35,
        clr => \'0\',
        clk => clk_35, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_35, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_29ba59dac02ae212_instance : fr_cmplr_v6_3_29ba59dac02ae212
    port map(
      aclk=>clk,
      aclken=>ce,
      event_s_data_chanid_incorrect=>event_s_data_chanid_incorrect,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tuser=>m_axis_data_tuser_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tuser=>s_axis_data_tuser_net,
      s_axis_data_tvalid=>ce_logic_1
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_35:in std_logic;
    ce_logic_1:in std_logic;
    clk:in std_logic;
    clk_35:in std_logic;
    clk_logic_1:in std_logic;
    event_s_data_chanid_incorrect:out std_logic;
    m_axis_data_tdata_path0:out std_logic_vector(24 downto 0);
    m_axis_data_tdata_path1:out std_logic_vector(24 downto 0);
    m_axis_data_tuser_chanid:out std_logic_vector(0 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_path0:in std_logic_vector(23 downto 0);
    s_axis_data_tdata_path1:in std_logic_vector(23 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tuser_chanid:in std_logic_vector(0 downto 0);
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_eff8f83acdb6b46b0b16de4cb208c31c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '281b1b6fe3f76d242fafa5e5d59d2620',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4f20f31a7eaca15fbd2e4eedeca8a50a',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bf5eb78e468802fb5a2357f890bd2095',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((24 - 1) downto 0);
  signal d1_1_27: std_logic_vector((24 - 1) downto 0);
  signal d2_1_30: std_logic_vector((24 - 1) downto 0);
  signal d3_1_33: std_logic_vector((24 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((24 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((24 - 1) downto 0);
    d1 : in std_logic_vector((24 - 1) downto 0);
    d2 : in std_logic_vector((24 - 1) downto 0);
    d3 : in std_logic_vector((24 - 1) downto 0);
    y : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_f062741975',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Binary_Counter artix7 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET ainit_value = 0',
    'CSET ce = true',
    'CSET count_mode = UP',
    'CSET fb_latency = 0',
    'CSET final_count_value = 1',
    'CSET implementation = Fabric',
    'CSET increment_value = 1',
    'CSET latency = 1',
    'CSET load = false',
    'CSET output_width = 2',
    'CSET restrict_count = false',
    'CSET sclr = false',
    'CSET sinit = true',
    'CSET sinit_value = 0',
    'CSET sset = false',
    'CSET sync_ce_priority = Sync_Overrides_CE',
    'CSET sync_threshold_output = false',
    'CSET syncctrlpriority = Reset_Overrides_Set',
    'CSET component_name = cntr_11_0_eb46eda57512a5a4',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bc4c03c9f8c2a7a14a96746b50e89163',
    'sourceFile' => 'hdl/xlcounter_free.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)',
      'core_instance_text' => '        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net',
      'core_name0' => 'cntr_11_0_eb46eda57512a5a4',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e200efb3d1d92f35dce552e7851bc94e',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '94d0cbfa64917ce57f97a43af5c34e8c',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '81cd374f0c28eda0781ada62eb5ff131',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '59a5d7c407fddc7ecfc411cc5e433953',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'be58265dbaf6362c566e0b2e528f9f85',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlceprobe.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e5a06979eaadac9468c48260479eb829',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((26 - 1) downto 0);
  signal d1_1_27: std_logic_vector((26 - 1) downto 0);
  signal d2_1_30: std_logic_vector((26 - 1) downto 0);
  signal d3_1_33: std_logic_vector((26 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((26 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((26 - 1) downto 0);
    d1 : in std_logic_vector((26 - 1) downto 0);
    d2 : in std_logic_vector((26 - 1) downto 0);
    d3 : in std_logic_vector((26 - 1) downto 0);
    y : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_187c900130',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c8d4a7d6b2b19a4b39e8846886948fb9',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b32a0080f8f47e0be7ec44c6ad81b20b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_22_20_push_front_pop_back_en = \'1\')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_push_front_pop_back_en <= \'0\';
  op <= boolean_to_vector(internal_ip_12_1_bitnot);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'inverter_e5b38cca3b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '298203483c3de52896eed04fd75246a4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_80f90b97d0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '79cfaf8c15ce6d93b744ee6a4a4e8394',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_aacf6e1b0e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cab6fdd12e8661b1295269035351e385',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlpassthrough.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '88bcad9d036c47f11f30d24a972eb694',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlpassthrough.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6bcddfd4603c1e694c27a4df8bf5e81c',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'df22e0c6a77c6a5c7ea37bf2a1a29f2a',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f8069ad3abec573c37ce32863156b128',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f524a2c1cd45e01647715636a761ffeb',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7176345de9034496a0eb853714de9da3',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '5ad5dcfd35501881161914d968c1e768',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2c4a4abf808a2318617513817b74c7d7',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '99294b4642e58229309b91a24a0ad3eb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_24: boolean;
  signal b_1_27: boolean;
  signal c_1_30: boolean;
  signal bit_6_36: boolean;
  signal fulldout_6_2_bit: boolean;
begin
  a_1_24 <= ((a) = "1");
  b_1_27 <= ((b) = "1");
  c_1_30 <= ((c) = "1");
  bit_6_36 <= ((boolean_to_vector(b_1_27) and boolean_to_vector(a_1_24)) = "1");
  fulldout_6_2_bit <= ((boolean_to_vector(c_1_30) and boolean_to_vector(bit_6_36)) = "1");
  dout <= boolean_to_vector(fulldout_6_2_bit);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    c : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'expr_375d7bbece',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Divider_Generator artix7 Xilinx,_Inc. 4.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET aclken = true',
    'CSET algorithm_type = Radix2',
    'CSET aresetn = false',
    'CSET clocks_per_division = 8',
    'CSET divide_by_zero_detect = false',
    'CSET dividend_and_quotient_width = 26',
    'CSET dividend_has_tlast = false',
    'CSET dividend_has_tuser = false',
    'CSET dividend_tuser_width = 1',
    'CSET divisor_has_tlast = false',
    'CSET divisor_has_tuser = false',
    'CSET divisor_tuser_width = 1',
    'CSET divisor_width = 26',
    'CSET flowcontrol = NonBlocking',
    'CSET fractional_width = 25',
    'CSET latency = 56',
    'CSET latency_configuration = Automatic',
    'CSET operand_sign = Signed',
    'CSET optimizegoal = Performance',
    'CSET outtlastbehv = Null',
    'CSET outtready = false',
    'CSET remainder_type = Fractional',
    'CSET component_name = dv_gn_v4_0_dc31160d1288a80d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2f08fda796baf7d4ba35c293213eafeb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component dv_gn_v4_0_dc31160d1288a80d
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(55 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_dividend_tdata:in std_logic_vector(31 downto 0);
      s_axis_dividend_tready:out std_logic;
      s_axis_dividend_tvalid:in std_logic;
      s_axis_divisor_tdata:in std_logic_vector(31 downto 0);
      s_axis_divisor_tready:out std_logic;
      s_axis_divisor_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(55 downto 0) := (others=>\'0\');
signal s_axis_dividend_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal s_axis_divisor_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_quotient <= m_axis_dout_tdata_net(50 downto 25);
  m_axis_dout_tdata_fractional <= m_axis_dout_tdata_net(24 downto 0);
  s_axis_dividend_tdata_net(25 downto 0) <= s_axis_dividend_tdata_dividend;
  s_axis_divisor_tdata_net(25 downto 0) <= s_axis_divisor_tdata_divisor;
  dv_gn_v4_0_dc31160d1288a80d_instance : dv_gn_v4_0_dc31160d1288a80d
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_dividend_tdata=>s_axis_dividend_tdata_net,
      s_axis_dividend_tready=>s_axis_dividend_tready,
      s_axis_dividend_tvalid=>s_axis_dividend_tvalid,
      s_axis_divisor_tdata=>s_axis_divisor_tdata_net,
      s_axis_divisor_tready=>s_axis_divisor_tready,
      s_axis_divisor_tvalid=>s_axis_divisor_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_dout_tdata_fractional:out std_logic_vector(24 downto 0);
    m_axis_dout_tdata_quotient:out std_logic_vector(25 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_dividend_tdata_dividend:in std_logic_vector(25 downto 0);
    s_axis_dividend_tready:out std_logic;
    s_axis_dividend_tvalid:in std_logic;
    s_axis_divisor_tdata_divisor:in std_logic_vector(25 downto 0);
    s_axis_divisor_tready:out std_logic;
    s_axis_divisor_tvalid:in std_logic
  );
end',
      'entity_name' => 'xldivider_generator_47dc3a44bd8d9df86e42dac34ee6a9fc',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ac967577b3149d1abb03f10239c790ae',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((26 - 1) downto 0);
  signal b_1_34: signed((26 - 1) downto 0);
  type array_type_op_mem_32_22 is array (0 to (1 - 1)) of boolean;
  signal op_mem_32_22: array_type_op_mem_32_22 := (
    0 => false);
  signal op_mem_32_22_front_din: boolean;
  signal op_mem_32_22_back: boolean;
  signal op_mem_32_22_push_front_pop_back_en: std_logic;
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  op_mem_32_22_back <= op_mem_32_22(0);
  proc_op_mem_32_22: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_32_22_push_front_pop_back_en = \'1\')) then
        op_mem_32_22(0) <= op_mem_32_22_front_din;
      end if;
    end if;
  end process proc_op_mem_32_22;
  result_18_3_rel <= a_1_31 > b_1_34;
  op_mem_32_22_front_din <= result_18_3_rel;
  op_mem_32_22_push_front_pop_back_en <= \'1\';
  op <= boolean_to_vector(op_mem_32_22_back);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((26 - 1) downto 0);
    b : in std_logic_vector((26 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_416cfcae1e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT Adder_Subtracter artix7 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET AINIT_Value = 0',
    'CSET A_Type = Signed',
    'CSET A_Width = 25',
    'CSET Add_Mode = Add',
    'CSET B_Constant = false',
    'CSET B_Type = Signed',
    'CSET B_Value = 0',
    'CSET B_Width = 25',
    'CSET Borrow_Sense = Active_Low',
    'CSET Bypass = false',
    'CSET Bypass_CE_Priority = Bypass_Overrides_CE',
    'CSET Bypass_Sense = Active_Low',
    'CSET CE = false',
    'CSET C_In = false',
    'CSET C_Out = false',
    'CSET Implementation = Fabric',
    'CSET Latency = 0',
    'CSET Out_Width = 25',
    'CSET SCLR = false',
    'CSET SINIT = false',
    'CSET SINIT_Value = 0',
    'CSET SSET = false',
    'CSET Sync_CE_Priority = Sync_Overrides_CE',
    'CSET Sync_Ctrl_Priority = Reset_Overrides_Set',
    'CSET component_name = addsb_11_0_293aa5f110d040c2',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '26258d9781248e38418286f109f5b76d',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(25 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(25 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_293aa5f110d040c2',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c191e556650d926edc8ba8ed1fa2460b',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlceprobe.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter artix7 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET AINIT_Value = 0',
    'CSET A_Type = Signed',
    'CSET A_Width = 26',
    'CSET Add_Mode = Subtract',
    'CSET B_Constant = false',
    'CSET B_Type = Signed',
    'CSET B_Value = 0',
    'CSET B_Width = 26',
    'CSET Borrow_Sense = Active_Low',
    'CSET Bypass = false',
    'CSET Bypass_CE_Priority = Bypass_Overrides_CE',
    'CSET Bypass_Sense = Active_Low',
    'CSET CE = false',
    'CSET C_In = false',
    'CSET C_Out = false',
    'CSET Implementation = Fabric',
    'CSET Latency = 0',
    'CSET Out_Width = 26',
    'CSET SCLR = false',
    'CSET SINIT = false',
    'CSET SINIT_Value = 0',
    'CSET SSET = false',
    'CSET Sync_CE_Priority = Sync_Overrides_CE',
    'CSET Sync_Ctrl_Priority = Reset_Overrides_Set',
    'CSET component_name = addsb_11_0_44053abf11139d96',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ec0c0c7ae6bc37dfb5b4692923a3eef4',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(26 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(26 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_44053abf11139d96',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter artix7 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET AINIT_Value = 0',
    'CSET A_Type = Signed',
    'CSET A_Width = 26',
    'CSET Add_Mode = Add',
    'CSET B_Constant = false',
    'CSET B_Type = Signed',
    'CSET B_Value = 0',
    'CSET B_Width = 26',
    'CSET Borrow_Sense = Active_Low',
    'CSET Bypass = false',
    'CSET Bypass_CE_Priority = Bypass_Overrides_CE',
    'CSET Bypass_Sense = Active_Low',
    'CSET CE = false',
    'CSET C_In = false',
    'CSET C_Out = false',
    'CSET Implementation = Fabric',
    'CSET Latency = 0',
    'CSET Out_Width = 26',
    'CSET SCLR = false',
    'CSET SINIT = false',
    'CSET SINIT_Value = 0',
    'CSET SSET = false',
    'CSET Sync_CE_Priority = Sync_Overrides_CE',
    'CSET Sync_Ctrl_Priority = Reset_Overrides_Set',
    'CSET component_name = addsb_11_0_3537d66a2361cd1e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bcefbcda3889b42337c1987b2bfb2ca6',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(26 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(26 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_3537d66a2361cd1e',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '251578e38f1837876aafc54da0dfb78d',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((26 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((26 - 1) downto 0);
    output_port : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_040ef1b598',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1ab068c57a3f4c4b074efdfa0c9f59f5',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c43db657cc9cbb3f3d455dd1f4d255b2',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd4c654c32a1f2fb8138dfb4fb5e5e981',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7eef027f963ce80b62e707fc7eb0dc35',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cc728ebedd14732ff762169c3b8031fd',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6a5986a9b695d977b58b8d8ac8765b59',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'db1c7629e14e7babe8ec17f5c9441d58',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '35cf1c0a0d0c35a1a07427badc46114b',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b79f3f8d29c74a4a0aa8ec0c7f3472e8',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd6452d154b0099e0aeb7947ae23cdf4c',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2cec4bdba98aab37e277ec2692ad70e6',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c0db89af0d0311b8c11df797b0a83191',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Divider_Generator artix7 Xilinx,_Inc. 4.0',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET aclken = true',
    'CSET algorithm_type = Radix2',
    'CSET aresetn = false',
    'CSET clocks_per_division = 2',
    'CSET divide_by_zero_detect = false',
    'CSET dividend_and_quotient_width = 26',
    'CSET dividend_has_tlast = false',
    'CSET dividend_has_tuser = false',
    'CSET dividend_tuser_width = 1',
    'CSET divisor_has_tlast = false',
    'CSET divisor_has_tuser = false',
    'CSET divisor_tuser_width = 1',
    'CSET divisor_width = 26',
    'CSET flowcontrol = NonBlocking',
    'CSET fractional_width = 25',
    'CSET latency = 56',
    'CSET latency_configuration = Automatic',
    'CSET operand_sign = Signed',
    'CSET optimizegoal = Performance',
    'CSET outtlastbehv = Null',
    'CSET outtready = false',
    'CSET remainder_type = Fractional',
    'CSET component_name = dv_gn_v4_0_32544a1ca1c095fd',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '7840c30b83effc420146ff30b49fe4e2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component dv_gn_v4_0_32544a1ca1c095fd
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(55 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_dividend_tdata:in std_logic_vector(31 downto 0);
      s_axis_dividend_tready:out std_logic;
      s_axis_dividend_tvalid:in std_logic;
      s_axis_divisor_tdata:in std_logic_vector(31 downto 0);
      s_axis_divisor_tready:out std_logic;
      s_axis_divisor_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(55 downto 0) := (others=>\'0\');
signal s_axis_dividend_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal s_axis_divisor_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_quotient <= m_axis_dout_tdata_net(50 downto 25);
  m_axis_dout_tdata_fractional <= m_axis_dout_tdata_net(24 downto 0);
  s_axis_dividend_tdata_net(25 downto 0) <= s_axis_dividend_tdata_dividend;
  s_axis_divisor_tdata_net(25 downto 0) <= s_axis_divisor_tdata_divisor;
  dv_gn_v4_0_32544a1ca1c095fd_instance : dv_gn_v4_0_32544a1ca1c095fd
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_dividend_tdata=>s_axis_dividend_tdata_net,
      s_axis_dividend_tready=>s_axis_dividend_tready,
      s_axis_dividend_tvalid=>s_axis_dividend_tvalid,
      s_axis_divisor_tdata=>s_axis_divisor_tdata_net,
      s_axis_divisor_tready=>s_axis_divisor_tready,
      s_axis_divisor_tvalid=>s_axis_divisor_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_dout_tdata_fractional:out std_logic_vector(24 downto 0);
    m_axis_dout_tdata_quotient:out std_logic_vector(25 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_dividend_tdata_dividend:in std_logic_vector(25 downto 0);
    s_axis_dividend_tready:out std_logic;
    s_axis_dividend_tvalid:in std_logic;
    s_axis_divisor_tdata_divisor:in std_logic_vector(25 downto 0);
    s_axis_divisor_tready:out std_logic;
    s_axis_divisor_tvalid:in std_logic
  );
end',
      'entity_name' => 'xldivider_generator_a6926fa0e8e7962e5753c59b8f401dec',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2a5bc1d590fd8cfe3d167f425badf616',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((25 - 1) downto 0);
  signal output_port_5_5_force: unsigned((25 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((25 - 1) downto 0);
    output_port : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_c3c0e847be',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0f7932e1c0524c14082019b8c1857be1',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1441d0af67be50ebab95e9bc4ac2a97e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((25 - 1) downto 0);
  signal y_2_1_concat: unsigned((26 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((25 - 1) downto 0);
    y : out std_logic_vector((26 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_43e7f055fa',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '12d27a02cda9786477d78546fd1a1f46',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((25 - 1) downto 0);
  signal output_port_5_5_force: signed((25 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((25 - 1) downto 0);
    output_port : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_60ea556961',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9c259287caf3d5a1c8098e8b1c09a5ca',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal din_1_37: unsigned((26 - 1) downto 0);
  signal slice_5_31: unsigned((25 - 1) downto 0);
  signal fulldout_5_1_concat: unsigned((25 - 1) downto 0);
  signal slice_6_44: unsigned((1 - 1) downto 0);
  signal concat_6_35: unsigned((1 - 1) downto 0);
  signal fullvld_out_6_1_concat: unsigned((1 - 1) downto 0);
begin
  din_1_37 <= std_logic_vector_to_unsigned(din);
  slice_5_31 <= u2u_slice(din_1_37, 24, 0);
  fulldout_5_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_5_31));
  slice_6_44 <= u2u_slice(din_1_37, 25, 25);
  concat_6_35 <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(slice_6_44));
  fullvld_out_6_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(concat_6_35));
  dout <= unsigned_to_std_logic_vector(fulldout_5_1_concat);
  vld_out <= unsigned_to_std_logic_vector(fullvld_out_6_1_concat);
end',
      'crippled_entity' => 'is
  port (
    din : in std_logic_vector((26 - 1) downto 0);
    dout : out std_logic_vector((25 - 1) downto 0);
    vld_out : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'bitbasher_a756ba0096',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT FIR_Compiler artix7 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE artix7',
    '# VHDL',
    'CSET bestprecision = true',
    'CSET channel_sequence = Basic',
    'CSET clock_frequency = 300',
    'CSET coefficient_buffer_type = Automatic',
    'CSET coefficient_file = no_coe_file_loaded',
    'CSET coefficient_fractional_bits = 18',
    'CSET coefficient_reload = false',
    'CSET coefficient_sets = 1',
    'CSET coefficient_sign = Signed',
    'CSET coefficient_structure = Inferred',
    'CSET coefficient_width = 16',
    'CSET coefficientsource = Vector',
    'CSET coefficientvector = 0,-2.8150443134893359e-006,-6.6976238725875895e-006,-1.1304990269963141e-005,-1.604431497857136e-005,-2.0107668908504811e-005,-2.2551548723864894e-005,-2.2417655357545307e-005,-1.8884484009097e-005,-1.14324662712005e-005,0,1.4895245252218591e-005,3.2095008337577838e-005,4.9820225517987918e-005,6.5785115051100965e-005,7.7407541331296344e-005,8.2104253823912598e-005,7.7645572835330541e-005,6.2531307977269543e-005,3.6340120870154232e-005,0,-4.4070606517077606e-005,-9.1992441252299547e-005,-0.00013865131496628788,-0.00017812378842843907,-0.00020428055285240439,-0.00021151874988768109,-0.00019555021117162184,-0.00015415423350615754,-8.7794243989363754e-005,0,0.00010256790594364044,0.0002104267034647511,0.00031197016330681854,0.00039452834212887124,0.00044571081166024763,0.00045491047167882788,0.00041480885983109225,0.00032270247585875563,0.00018146749714553596,0,-0.00020698933341495155,-0.00041988547070270977,-0.00061576751176877582,-0.00077059530835929936,-0.000861802747915486,-0.00087104673941122625,-0.00078681293323371363,-0.0006065607616026848,-0.00033810693938500329,0,0.00037927350285030427,0.00076329437485913372,0.0011108373102628724,0.0013798905245745506,0.0015322143464772445,0.0015379856988276951,0.0013800177155234763,0.0010570380058579536,0.00058556108492878001,0,-0.00064917759672944637,-0.0012992459216626462,-0.0018807504058385085,-0.0023243371190692537,-0.0025682639904175543,-0.0025658408413689869,-0.0022919808744064647,-0.0017480656588507297,-0.00096443416645807867,0,0.0010612340945903454,0.0021166817264924782,0.0030542832592820018,0.0037634891815493277,0.0041471187476899117,0.0041329142567326201,0.00368353961134064,0.0028038268898484147,0.0015442609210198023,0,-0.0016948619659709831,-0.0033776154840431298,-0.0048711705413799714,-0.0060010788068776662,-0.0066138342553605893,-0.0065946878434032449,-0.0058831167309433404,-0.0044841751704463514,-0.0024742265994219981,0,0.0027295047669241785,0.005458067226404714,0.0079033579580103045,0.0097825581636990979,0.010840381318230943,0.010877006554497207,0.0097732642798801939,0.0075104897250429506,0.0041827862769845169,0,-0.0047195413599075689,-0.0095665889624341766,-0.014067960771227194,-0.017721179958304981,-0.020034200470068875,-0.020567066295356224,-0.018972020184954679,-0.015028546890858736,-0.0086701194720131738,0,0.010705715087948866,0.02300858789139747,0.036331525716839785,0.049994187915671576,0.063257609665124753,0.075374703493635523,0.085642735226220831,0.093453633434288683,0.098338106184078192,0.10000000000000001,0.098338106184078192,0.093453633434288683,0.085642735226220831,0.075374703493635523,0.063257609665124753,0.049994187915671576,0.036331525716839785,0.02300858789139747,0.010705715087948866,0,-0.0086701194720131738,-0.015028546890858736,-0.018972020184954679,-0.020567066295356224,-0.020034200470068875,-0.017721179958304981,-0.014067960771227194,-0.0095665889624341766,-0.0047195413599075689,0,0.0041827862769845169,0.0075104897250429506,0.0097732642798801939,0.010877006554497207,0.010840381318230943,0.0097825581636990979,0.0079033579580103045,0.005458067226404714,0.0027295047669241785,0,-0.0024742265994219981,-0.0044841751704463514,-0.0058831167309433404,-0.0065946878434032449,-0.0066138342553605893,-0.0060010788068776662,-0.0048711705413799714,-0.0033776154840431298,-0.0016948619659709831,0,0.0015442609210198023,0.0028038268898484147,0.00368353961134064,0.0041329142567326201,0.0041471187476899117,0.0037634891815493277,0.0030542832592820018,0.0021166817264924782,0.0010612340945903454,0,-0.00096443416645807867,-0.0017480656588507297,-0.0022919808744064647,-0.0025658408413689869,-0.0025682639904175543,-0.0023243371190692537,-0.0018807504058385085,-0.0012992459216626462,-0.00064917759672944637,0,0.00058556108492878001,0.0010570380058579536,0.0013800177155234763,0.0015379856988276951,0.0015322143464772445,0.0013798905245745506,0.0011108373102628724,0.00076329437485913372,0.00037927350285030427,0,-0.00033810693938500329,-0.0006065607616026848,-0.00078681293323371363,-0.00087104673941122625,-0.000861802747915486,-0.00077059530835929936,-0.00061576751176877582,-0.00041988547070270977,-0.00020698933341495155,0,0.00018146749714553596,0.00032270247585875563,0.00041480885983109225,0.00045491047167882788,0.00044571081166024763,0.00039452834212887124,0.00031197016330681854,0.0002104267034647511,0.00010256790594364044,0,-8.7794243989363754e-005,-0.00015415423350615754,-0.00019555021117162184,-0.00021151874988768109,-0.00020428055285240439,-0.00017812378842843907,-0.00013865131496628788,-9.1992441252299547e-005,-4.4070606517077606e-005,0,3.6340120870154232e-005,6.2531307977269543e-005,7.7645572835330541e-005,8.2104253823912598e-005,7.7407541331296344e-005,6.5785115051100965e-005,4.9820225517987918e-005,3.2095008337577838e-005,1.4895245252218591e-005,0,-1.14324662712005e-005,-1.8884484009097e-005,-2.2417655357545307e-005,-2.2551548723864894e-005,-2.0107668908504811e-005,-1.604431497857136e-005,-1.1304990269963141e-005,-6.6976238725875895e-006,-2.8150443134893359e-006',
    'CSET columnconfig = 1',
    'CSET data_buffer_type = Automatic',
    'CSET data_fractional_bits = 0',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Unsigned',
    'CSET data_tuser_width = 1',
    'CSET data_width = 25',
    'CSET decimation_rate = 10',
    'CSET displayreloadorder = false',
    'CSET filter_architecture = Systolic_Multiply_Accumulate',
    'CSET filter_selection = 1',
    'CSET filter_type = Decimation',
    'CSET gen_mif_files = false',
    'CSET gen_mif_from_coe = false',
    'CSET gen_mif_from_spec = false',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 5560000',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET input_buffer_type = Automatic',
    'CSET inter_column_pipe_length = 4',
    'CSET interpolation_rate = 1',
    'CSET m_data_has_tready = false',
    'CSET m_data_has_tuser = User_and_Chan_ID_Field',
    'CSET multi_column_support = Automatic',
    'CSET num_reload_slots = 1',
    'CSET number_channels = 4',
    'CSET number_paths = 1',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Convergent_Rounding_to_Even',
    'CSET output_width = 25',
    'CSET passband_max = 0.50000000000',
    'CSET passband_min = 0',
    'CSET pattern_list = P4-0,P4-1,P4-2,P4-3,P4-4',
    'CSET preference_for_other_storage = Automatic',
    'CSET quantization = Quantize_Only',
    'CSET rate_change_type = Integer',
    'CSET ratespecification = Hardware_Oversampling_Rate',
    'CSET reload_file = no_coe_file_loaded',
    'CSET reset_data_vector = true',
    'CSET s_config_method = Single',
    'CSET s_config_sync_mode = On_Vector',
    'CSET s_data_has_fifo = false',
    'CSET s_data_has_tuser = User_and_Chan_ID_Field',
    'CSET sample_frequency = 0.00100000000',
    'CSET sampleperiod = 5560000',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc7a200t',
    'SET package = ffg1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_2968d696880a82db',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '43b460209746116c5113c43de97979ca',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_2968d696880a82db
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_s_data_chanid_incorrect:out std_logic;
      m_axis_data_tdata:out std_logic_vector(31 downto 0);
      m_axis_data_tuser:out std_logic_vector(2 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tuser:in std_logic_vector(2 downto 0);
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_ps_net: std_logic_vector(24 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_net: std_logic_vector(2 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_user_ps_net: std_logic_vector(0 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chanid_ps_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal s_axis_data_tuser_net: std_logic_vector(2 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_ps_net <= m_axis_data_tdata_net(24 downto 0);
  m_axis_data_tuser_user_ps_net <= m_axis_data_tuser_net(2 downto 2);
  m_axis_data_tuser_chanid_ps_net <= m_axis_data_tuser_net(1 downto 0);
  s_axis_data_tdata_net(24 downto 0) <= s_axis_data_tdata;
  s_axis_data_tuser_net(2 downto 2) <= s_axis_data_tuser_user;
  s_axis_data_tuser_net(1 downto 0) <= s_axis_data_tuser_chanid;
  m_axis_data_tdata_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 25,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_ps_net,
        ce => ce_55600000,
        clr => \'0\',
        clk => clk_55600000, 
        o => m_axis_data_tdata
    );
  m_axis_data_tuser_user_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_user_ps_net,
        ce => ce_55600000,
        clr => \'0\',
        clk => clk_55600000, 
        o => m_axis_data_tuser_user
    );
  m_axis_data_tuser_chanid_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 2,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tuser_chanid_ps_net,
        ce => ce_55600000,
        clr => \'0\',
        clk => clk_55600000, 
        o => m_axis_data_tuser_chanid
    );
  m_axis_data_tvalid_ps_net_or_captured_net <= m_axis_data_tvalid_ps_net or m_axis_data_tvalid_ps_net_captured;
m_axis_data_tvalid_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => m_axis_data_tvalid_ps_net_or_captured_net,
        ce => ce_55600000,
        clr => \'0\',
        clk => clk_55600000, 
        o(0) => m_axis_data_tvalid
    );
m_axis_data_tvalid_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 1,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i(0) => \'1\',
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_55600000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_2968d696880a82db_instance : fr_cmplr_v6_3_2968d696880a82db
    port map(
      aclk=>clk,
      aclken=>ce,
      event_s_data_chanid_incorrect=>event_s_data_chanid_incorrect,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tuser=>m_axis_data_tuser_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tuser=>s_axis_data_tuser_net,
      s_axis_data_tvalid=>ce_logic_5560000
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_5560000:in std_logic;
    ce_55600000:in std_logic;
    ce_logic_5560000:in std_logic;
    clk:in std_logic;
    clk_5560000:in std_logic;
    clk_55600000:in std_logic;
    clk_logic_5560000:in std_logic;
    event_s_data_chanid_incorrect:out std_logic;
    m_axis_data_tdata:out std_logic_vector(24 downto 0);
    m_axis_data_tuser_chanid:out std_logic_vector(1 downto 0);
    m_axis_data_tuser_user:out std_logic_vector(0 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata:in std_logic_vector(24 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tuser_chanid:in std_logic_vector(1 downto 0);
    s_axis_data_tuser_user:in std_logic_vector(0 downto 0);
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_d817c32422e95ecbd6bcee71b158f1c3',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9d246fa49140c908b8ebceb4a9cfc177',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '20ea02f790fae0beab826b615c508adc',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4e4ce3872606f9b3df7d5ae169ef05d9',
    'sourceFile' => 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgGenerateCores::{'wrapup'};
  push(@$results, &SgGenerateCores::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'F:/Xilinx/13.4/ISE_DS/ISE/sysgen';
  open(RESULTS, '> F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/script_results7019246397743643353') || 
    croak 'couldn\'t open F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/script_results7019246397743643353';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/script_results7019246397743643353';
};

if ($@) {
  open(RESULTS, '> F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/script_results7019246397743643353') || 
    croak 'couldn\'t open F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/script_results7019246397743643353';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing F:/Xlinx_Projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_artix7/sysgen/script_results7019246397743643353';
  exit(1);
}

exit(0);
