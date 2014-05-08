
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'HDL_PATH' => 'D:/Sysgen_projects/dsp-cores-devel/models',
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
    'coregen_core_generation_tmpdir' => 'C:/TEMP/sysgentmp-lucas.russo/cg_wk/cdd47a418637e4fda',
    'coregen_part_family' => 'virtex6',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'ddc_bpm_476_066',
    'design_full_path' => 'D:\\Sysgen_projects\\dsp-cores-devel\\models\\ddc_bpm_476_066.mdl',
    'device' => 'xc6vlx240t-1ff1156',
    'device_speed' => '-1',
    'directory' => 'D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6',
    'dsp_cache_root_path' => 'C:/TEMP/sysgentmp-lucas.russo',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/perl_results.v', },
      ],
    ],
    'fxdptinstalled' => 1.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 2083.0008544921875,
    'generating_subsystem_handle' => 2083.0008544921875,
    'generation_directory' => './netlist_ddc_bpm_476_066_virtex6',
    'has_advanced_control' => '0',
    'hdlDir' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'vhdl',
    'hdl_path' => 'D:/Sysgen_projects/dsp-cores-devel/models',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '13.4i',
    'master_sysgen_token_handle' => 2084.928466796875,
    'matlab' => 'C:/Program Files/MATLAB/R2011b',
    'matlab_fixedpoint' => 1.0,
    'mdlHandle' => 2083.0008544921875,
    'mdlPath' => 'D:/Sysgen_projects/dsp-cores-devel/models/ddc_bpm_476_066.mdl',
    'modelDiagnostics' => [
      {
        'count' => 3351.0,
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
        'count' => 88.0,
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
        'count' => 140.0,
        'isMask' => 0.0,
        'type' => 'Goto',
      },
      {
        'count' => 535.0,
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
        'count' => 460.0,
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
        'count' => 1414.0,
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
        'count' => 293.0,
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
        'count' => 136.0,
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
        'count' => 55.0,
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
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Black Box Block',
      },
      {
        'count' => 9.0,
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
        'count' => 83.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Counter Block',
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
        'count' => 118.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Down Sampler Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx FIR Compiler 6.3 Block',
      },
      {
        'count' => 22.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 233.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 24.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Inverter Block',
      },
      {
        'count' => 72.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Logical Block Block',
      },
      {
        'count' => 16.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Multiplier Block',
      },
      {
        'count' => 264.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Register Block',
      },
      {
        'count' => 88.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Sample Time Block Block',
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
        'count' => 94.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Reinterpreter Block',
      },
      {
        'count' => 68.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Up Sampler Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx WaveScope Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'D:/Sysgen_projects/dsp-cores-devel/models/ddc_bpm_476_066.mdl',
    'myxilinx' => 'C:/Xilinx/13.4/ISE_DS/ISE',
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '450332',
    'package' => 'ff1156',
    'part' => 'xc6vlx240t',
    'partFamily' => 'virtex6',
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
    'simulation_island_subsystem_handle' => 2083.0008544921875,
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
    'sysgen' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen',
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
      'coregen_part_family' => 'virtex6',
      'create_interface_document' => 'off',
      'dbl_ovrd' => -1.0,
      'dbl_ovrd_sgadvanced' => '',
      'dcm_input_clock_period' => 10.0,
      'deprecated_control' => 'off',
      'deprecated_control_sgadvanced' => '',
      'directory' => './netlist_ddc_bpm_476_066_virtex6',
      'eval_field' => '0',
      'has_advanced_control' => '0',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 2084.928466796875,
      'package' => 'ff1156',
      'part' => 'xc6vlx240t',
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
      'simulation_island_subsystem_handle' => 2083.0008544921875,
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
      'xilinx_device' => 'xc6vlx240t-1ff1156',
      'xilinxfamily' => 'virtex6',
    },
    'sysgen_Root' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 4.441160919464348,
    'tempdir' => 'C:/TEMP',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen',
    'trim_vbits' => 1.0,
    'trim_vbits_sgadvanced' => '',
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'usertemp' => 'C:/TEMP/sysgentmp-lucas.russo',
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
    'xilinx' => 'C:/Xilinx/13.4/ISE_DS/ISE',
    'xilinx_device' => 'xc6vlx240t-1ff1156',
    'xilinx_family' => 'virtex6',
    'xilinx_package' => 'ff1156',
    'xilinx_part' => 'xc6vlx240t',
    'xilinxdevice' => 'xc6vlx240t-1ff1156',
    'xilinxfamily' => 'virtex6',
    'xilinxpart' => 'xc6vlx240t',
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
  $instrs = {
    'entity_declaration_hash' => '7814de5e249d1bafe0189ad8b0378538',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((8 - 1) downto 0);
  signal y_2_1_concat: unsigned((24 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((24 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_cd3162dc0d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6881e3e9fe47f0cbdc2e654a4e3326e1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_91ef1678ca',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f013ab77c4e010db58e314e4e22146f3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((16 - 1) downto 0);
  signal output_port_5_5_force: unsigned((16 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((16 - 1) downto 0);
    output_port : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_7025463ea8',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '40a1a945129e58bf0eb6a88f152f50ce',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((8 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((8 - 1) downto 0);
    output_port : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_f21e7f2ddf',
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
    'entity_declaration_hash' => '61af838f77519ac5b4f71eabcf6b86af',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlceprobe.vhd',
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
    'entity_declaration_hash' => '407c63d2892a17198077dad0595f6c8e',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dcd0587b419d479cffdccf7033047348',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
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
    'entity_declaration_hash' => '40a30dbd7b17e6c1877beeff44d1cd8a',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = { 'sourceFile' => 'D:/Sysgen_projects/dsp-cores-devel/models/blackboxes/lut_sweep.vhd', };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '1affc6f5d8ec8ceff4cdee5c62fbb855',
    'sourceFile' => 'D:/Sysgen_projects/dsp-cores-devel/models/blackboxes/fixed_dds.vhd',
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
  $instrs = {
    'entity_declaration_hash' => '97d1de979866be39b04d8dc5fb119bf5',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
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
    'entity_declaration_hash' => '345a4c0384276159ac94c12ab3c475e2',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de744ce40a094af3713ebd1a00744f23',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlpassthrough.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '318de55d4765969d57088b2e278af43a',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlpassthrough.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4d8e0cd9ae5f18e0fd363c3004f8b78b',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2eb19582157643617c25dbca1322be4a',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a6a40d361ac20dd61368551f5703424d',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
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
    'entity_declaration_hash' => '826453020f213d2fa2fcc71286facf7e',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7a64ac0297007e3d3e53569683f018ce',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2ce47aa346f274be44d3a07796b0aa58',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT CORDIC virtex6 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET aclken = true',
    'CSET architectural_configuration = Word_Serial',
    'CSET aresetn = false',
    'CSET cartesian_has_tlast = false',
    'CSET cartesian_has_tuser = true',
    'CSET cartesian_tuser_width = 1',
    'CSET coarse_rotation = true',
    'CSET compensation_scaling = Embedded_Multiplier',
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
    'CSET pipelining_mode = Optimal',
    'CSET precision = 0',
    'CSET round_mode = Nearest_Even',
    'CSET component_name = crdc_v5_0_951922a7ad5d425e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '9f91aeecb83a591ea5e5c3f05a261ceb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component crdc_v5_0_951922a7ad5d425e
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(47 downto 0);
      m_axis_dout_tuser:out std_logic_vector(0 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_cartesian_tdata:in std_logic_vector(63 downto 0);
      s_axis_cartesian_tready:out std_logic;
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
  crdc_v5_0_951922a7ad5d425e_instance : crdc_v5_0_951922a7ad5d425e
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tuser=>m_axis_dout_tuser_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_cartesian_tdata=>s_axis_cartesian_tdata_net,
      s_axis_cartesian_tready=>s_axis_cartesian_tready,
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
    s_axis_cartesian_tready:out std_logic;
    s_axis_cartesian_tuser_user:in std_logic_vector(0 downto 0);
    s_axis_cartesian_tvalid:in std_logic
  );
end',
      'entity_name' => 'xlcordic_1700ad0af26476326977e0830172a2c4',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8bca0a84e26ac56237b68888a8f87c3d',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
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
    'entity_declaration_hash' => '8a298820537a976692b99927b5de9c4b',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '263e5488cedc91b0703679b5442781d4',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ac46d099508f177ddfc2142cc27827cf',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((58 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((58 - 1) downto 0);
    output_port : out std_logic_vector((58 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_fa01b5fd95',
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
    'entity_declaration_hash' => '914fc9588ca9c720dd9a2ecbc50f6e25',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
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
    'SELECT CIC_Compiler virtex6 Xilinx,_Inc. 3.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET clock_frequency = 200',
    'CSET differential_delay = 2',
    'CSET filter_type = Decimation',
    'CSET fixed_or_initial_rate = 1120',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 560',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET has_dout_tready = false',
    'CSET input_data_width = 24',
    'CSET input_sample_frequency = 0.00100000000',
    'CSET maximum_rate = 1120',
    'CSET minimum_rate = 1120',
    'CSET number_of_channels = 2',
    'CSET number_of_stages = 3',
    'CSET output_data_width = 58',
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
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = cc_cmplr_v3_0_2717b25e8a23e5e2',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c6db3a7e054146ffe59c74ae4c2ac3b0',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cc_cmplr_v3_0_2717b25e8a23e5e2
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_tlast_missing:out std_logic;
      event_tlast_unexpected:out std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tlast:out std_logic;
      m_axis_data_tuser:out std_logic_vector(15 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(23 downto 0);
      s_axis_data_tlast:in std_logic;
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net: std_logic_vector(57 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_captured: std_logic_vector(57 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_or_captured_net: std_logic_vector(57 downto 0) := (others=>\'0\');
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
  m_axis_data_tdata_data_ps_net <= m_axis_data_tdata_net(57 downto 0);
  m_axis_data_tuser_chan_sync_ps_net <= m_axis_data_tuser_net(8 downto 8);
  m_axis_data_tuser_chan_out_ps_net <= m_axis_data_tuser_net(0 downto 0);
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata_data;
  m_axis_data_tdata_data_ps_net_or_captured_net <= m_axis_data_tdata_data_ps_net or m_axis_data_tdata_data_ps_net_captured;
m_axis_data_tdata_data_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 58,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net_or_captured_net,
        ce => ce_1120,
        clr => \'0\',
        clk => clk_1120, 
        o => m_axis_data_tdata_data
    );
m_axis_data_tdata_data_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 58,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1120, 
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
        ce => ce_1120,
        clr => \'0\',
        clk => clk_1120, 
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
        clk => clk_1120, 
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
        ce => ce_1120,
        clr => \'0\',
        clk => clk_1120, 
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
        clk => clk_1120, 
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
        ce => ce_1120,
        clr => \'0\',
        clk => clk_1120, 
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
        clk => clk_1120, 
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
        ce => ce_1120,
        clr => \'0\',
        clk => clk_1120, 
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
        clk => clk_1120, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  cc_cmplr_v3_0_2717b25e8a23e5e2_instance : cc_cmplr_v3_0_2717b25e8a23e5e2
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
    ce_1120:in std_logic;
    ce_logic_1:in std_logic;
    clk:in std_logic;
    clk_1120:in std_logic;
    clk_logic_1:in std_logic;
    event_tlast_missing:out std_logic;
    event_tlast_unexpected:out std_logic;
    m_axis_data_tdata_data:out std_logic_vector(57 downto 0);
    m_axis_data_tlast:out std_logic;
    m_axis_data_tuser_chan_out:out std_logic_vector(0 downto 0);
    m_axis_data_tuser_chan_sync:out std_logic_vector(0 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_data:in std_logic_vector(23 downto 0);
    s_axis_data_tlast:in std_logic;
    s_axis_data_tready:out std_logic
  );
end',
      'entity_name' => 'xlcic_compiler_691a78f3d9f6f4d23a2519dbc0c21266',
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
    'entity_declaration_hash' => 'dc173394b77b1f245adf4be5610d12ba',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a1889cf44dae770fffdb6bf173d1f47b',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier virtex6 Xilinx,_Inc. 11.2',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
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
    'CSET component_name = mult_11_2_eb6becd4c4c6b065',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'eebe6d691be261a5bdb8aa69eebf730e',
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
      'core_name0' => 'mult_11_2_eb6becd4c4c6b065',
      'entity_name.0' => 'xlmult',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4170f474aacf8c7783e26f8650e8e005',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Multiplier virtex6 Xilinx,_Inc. 11.2',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET ccmimp = Distributed_Memory',
    'CSET clockenable = true',
    'CSET constvalue = 129',
    'CSET internaluser = 0',
    'CSET multiplier_construction = Use_Mults',
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
    'CSET component_name = mult_11_2_eb6becd4c4c6b065',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '17938472bc785ca6c06e8791b4140fc8',
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
      'core_name0' => 'mult_11_2_eb6becd4c4c6b065',
      'entity_name.0' => 'xlmult',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Complex_Multiplier virtex6 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET component_name = cmpy_v5_0_fc1d91881e8e8ae6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2a2c65b0a8593aecaaafd4121e65d821',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cmpy_v5_0_fc1d91881e8e8ae6
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
  cmpy_v5_0_fc1d91881e8e8ae6_instance : cmpy_v5_0_fc1d91881e8e8ae6
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
      'entity_name' => 'xlcomplex_multiplier_9420c9297365b1438cc1e8469b8205e1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '08dd4ab2a51a26cb713887c189bcb357',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
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
    'entity_declaration_hash' => '6eac3fcb48e2e71c2954ca4d25c4fadd',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '3e442c5aae97c606f18487c882444ac0',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f830871b3393dd7e40b7e0675bb0ca03',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((61 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((61 - 1) downto 0);
    output_port : out std_logic_vector((61 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_c88e29aa6b',
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
    'entity_declaration_hash' => '933f0a67148359c2b0b185c26938cbe3',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
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
    'entity_declaration_hash' => '96225f22753efb24df501279341ff3a1',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'bdfed1e492741393e8cf68439d9d42db',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4a64538b6366f4db15598525e5cb5dad',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ff1f2ebe802f9b6c778c02678a085410',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2d0470915f6b2ce230a0e046e0e2f672',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
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
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET bestprecision = true',
    'CSET channel_sequence = Basic',
    'CSET clock_frequency = 300',
    'CSET coefficient_buffer_type = Automatic',
    'CSET coefficient_file = no_coe_file_loaded',
    'CSET coefficient_fractional_bits = 16',
    'CSET coefficient_reload = false',
    'CSET coefficient_sets = 1',
    'CSET coefficient_sign = Signed',
    'CSET coefficient_structure = Inferred',
    'CSET coefficient_width = 16',
    'CSET coefficientsource = Vector',
    'CSET coefficientvector = 0.000274658203125,1.52587890625e-005,-0.0018310546875,-0.0027008056640625,0.001922607421875,0.00927734375,0.0063934326171875,-0.0126495361328125,-0.026824951171875,-0.0049896240234375,0.04400634765625,0.056427001953125,-0.0162811279296875,-0.11798095703125,-0.1091461181640625,0.0837860107421875,0.351348876953125,0.4773406982421875,0.351348876953125,0.0837860107421875,-0.1091461181640625,-0.11798095703125,-0.0162811279296875,0.056427001953125,0.04400634765625,-0.0049896240234375,-0.026824951171875,-0.0126495361328125,0.0063934326171875,0.00927734375,0.001922607421875,-0.0027008056640625,-0.0018310546875,1.52587890625e-005,0.000274658203125',
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
    'CSET hardwareoversamplingrate = 1400000',
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
    'CSET sampleperiod = 1400000',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_54d148b4178eb862',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '4249a0b98f9d8668a9a12152f24ae758',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_54d148b4178eb862
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
        ce => ce_2800000,
        clr => \'0\',
        clk => clk_2800000, 
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
        ce => ce_2800000,
        clr => \'0\',
        clk => clk_2800000, 
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
        ce => ce_2800000,
        clr => \'0\',
        clk => clk_2800000, 
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
        clk => clk_2800000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_54d148b4178eb862_instance : fr_cmplr_v6_3_54d148b4178eb862
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
      s_axis_data_tvalid=>ce_logic_1400000
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_1400000:in std_logic;
    ce_2800000:in std_logic;
    ce_logic_1400000:in std_logic;
    clk:in std_logic;
    clk_1400000:in std_logic;
    clk_2800000:in std_logic;
    clk_logic_1400000:in std_logic;
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
      'entity_name' => 'xlfir_compiler_9c8746ef58b9fecaf8fa2bea81370554',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT CIC_Compiler virtex6 Xilinx,_Inc. 3.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET clock_frequency = 200',
    'CSET differential_delay = 2',
    'CSET filter_type = Decimation',
    'CSET fixed_or_initial_rate = 2500',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 560',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET has_dout_tready = false',
    'CSET input_data_width = 24',
    'CSET input_sample_frequency = 0.00100000000',
    'CSET maximum_rate = 2500',
    'CSET minimum_rate = 2500',
    'CSET number_of_channels = 4',
    'CSET number_of_stages = 3',
    'CSET output_data_width = 61',
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
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = cc_cmplr_v3_0_e85aeee534196d83',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '37840c3a7c3bb55c233d00886cae67ab',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cc_cmplr_v3_0_e85aeee534196d83
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_tlast_missing:out std_logic;
      event_tlast_unexpected:out std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tlast:out std_logic;
      m_axis_data_tuser:out std_logic_vector(15 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(23 downto 0);
      s_axis_data_tlast:in std_logic;
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net: std_logic_vector(60 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_captured: std_logic_vector(60 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_data_ps_net_or_captured_net: std_logic_vector(60 downto 0) := (others=>\'0\');
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
  m_axis_data_tdata_data_ps_net <= m_axis_data_tdata_net(60 downto 0);
  m_axis_data_tuser_chan_sync_ps_net <= m_axis_data_tuser_net(8 downto 8);
  m_axis_data_tuser_chan_out_ps_net <= m_axis_data_tuser_net(1 downto 0);
  s_axis_data_tdata_net(23 downto 0) <= s_axis_data_tdata_data;
  m_axis_data_tdata_data_ps_net_or_captured_net <= m_axis_data_tdata_data_ps_net or m_axis_data_tdata_data_ps_net_captured;
m_axis_data_tdata_data_ps_net_synchronizer_1 : entity work.synth_reg_w_init
    generic map(
        width => 61,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net_or_captured_net,
        ce => ce_1400000,
        clr => \'0\',
        clk => clk_1400000, 
        o => m_axis_data_tdata_data
    );
m_axis_data_tdata_data_ps_net_synchronizer_2 : entity work.synth_reg_w_init
    generic map(
        width => 61,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_data_ps_net,
        ce => m_axis_data_tvalid_ps_net,
        clr => \'0\',
        clk => clk_1400000, 
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
        ce => ce_1400000,
        clr => \'0\',
        clk => clk_1400000, 
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
        clk => clk_1400000, 
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
        ce => ce_1400000,
        clr => \'0\',
        clk => clk_1400000, 
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
        clk => clk_1400000, 
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
        ce => ce_1400000,
        clr => \'0\',
        clk => clk_1400000, 
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
        clk => clk_1400000, 
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
        ce => ce_1400000,
        clr => \'0\',
        clk => clk_1400000, 
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
        clk => clk_1400000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  cc_cmplr_v3_0_e85aeee534196d83_instance : cc_cmplr_v3_0_e85aeee534196d83
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
      s_axis_data_tvalid=>ce_logic_560
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_1400000:in std_logic;
    ce_560:in std_logic;
    ce_logic_560:in std_logic;
    clk:in std_logic;
    clk_1400000:in std_logic;
    clk_560:in std_logic;
    clk_logic_560:in std_logic;
    event_tlast_missing:out std_logic;
    event_tlast_unexpected:out std_logic;
    m_axis_data_tdata_data:out std_logic_vector(60 downto 0);
    m_axis_data_tlast:out std_logic;
    m_axis_data_tuser_chan_out:out std_logic_vector(1 downto 0);
    m_axis_data_tuser_chan_sync:out std_logic_vector(0 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata_data:in std_logic_vector(23 downto 0);
    s_axis_data_tlast:in std_logic;
    s_axis_data_tready:out std_logic
  );
end',
      'entity_name' => 'xlcic_compiler_1c97a249b004729f66738a648c4f9593',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET coefficientvector = 3.0517578125e-005,-0.000335693359375,0.0001220703125,0.0003662109375,-0.000335693359375,-0.000457763671875,0.000732421875,0.000396728515625,-0.001251220703125,-0.0001220703125,0.0018310546875,-0.000518798828125,-0.002349853515625,0.0015869140625,0.00262451171875,-0.0030517578125,-0.002410888671875,0.0048828125,0.00140380859375,-0.0068359375,0.000579833984375,0.00860595703125,-0.00372314453125,-0.00970458984375,0.008087158203125,0.009552001953125,-0.013580322265625,-0.007476806640625,0.01995849609375,0.002655029296875,-0.02679443359375,0.00592041015625,0.0335693359375,-0.020050048828125,-0.039642333984375,0.04400634765625,0.04449462890625,-0.09368896484375,-0.047637939453125,0.314056396484375,0.5487060546875,0.314056396484375,-0.047637939453125,-0.09368896484375,0.04449462890625,0.04400634765625,-0.039642333984375,-0.020050048828125,0.0335693359375,0.00592041015625,-0.02679443359375,0.002655029296875,0.01995849609375,-0.007476806640625,-0.013580322265625,0.009552001953125,0.008087158203125,-0.00970458984375,-0.00372314453125,0.00860595703125,0.000579833984375,-0.0068359375,0.00140380859375,0.0048828125,-0.002410888671875,-0.0030517578125,0.00262451171875,0.0015869140625,-0.002349853515625,-0.000518798828125,0.0018310546875,-0.0001220703125,-0.001251220703125,0.000396728515625,0.000732421875,-0.000457763671875,-0.000335693359375,0.0003662109375,0.0001220703125,-0.000335693359375,3.0517578125e-005',
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
    'CSET hardwareoversamplingrate = 2800000',
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
    'CSET sampleperiod = 2800000',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_05afd5373121e2a3',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '82e8c039fa3ce4214b04fbe1c5a7d9b9',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_05afd5373121e2a3
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
        ce => ce_5600000,
        clr => \'0\',
        clk => clk_5600000, 
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
        ce => ce_5600000,
        clr => \'0\',
        clk => clk_5600000, 
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
        ce => ce_5600000,
        clr => \'0\',
        clk => clk_5600000, 
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
        clk => clk_5600000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_05afd5373121e2a3_instance : fr_cmplr_v6_3_05afd5373121e2a3
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
      s_axis_data_tvalid=>ce_logic_2800000
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_2800000:in std_logic;
    ce_5600000:in std_logic;
    ce_logic_2800000:in std_logic;
    clk:in std_logic;
    clk_2800000:in std_logic;
    clk_5600000:in std_logic;
    clk_logic_2800000:in std_logic;
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
      'entity_name' => 'xlfir_compiler_ef89cacae87a636bad21e5ee1476453a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b57c7b9af78392806ab186d28bbb54c0',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '8cb48d5ddd9116c482f3d16a19cba79a',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '67bd9015b8e928d460f7c5f3b4631534',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f6da37858f52b62562fa3360e4b0ae08',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET coefficientvector = -0.00089960851063079924,-0.0002249157799426658,-0.00025205352435853133,-0.0002806521286101239,-0.00031089131584517195,-0.00034269722372881465,-0.00037616962409380526,-0.00041105117237106746,-0.00044733074315489517,-0.00048471472954612091,-0.00052336190561365315,-0.00056319044450555452,-0.00060442542910108985,-0.00064658464222163326,-0.00068941316856086909,-0.00073236000049810767,-0.00077661402573390146,-0.00082175176687610527,-0.00086582739350004635,-0.00091132269508282376,-0.00095601244391201544,-0.0010007068043569713,-0.001044644902777165,-0.0010879784419822393,-0.001130269760220006,-0.0011715241102669938,-0.001211219825349245,-0.0012492407577302683,-0.0012851872848379012,-0.0013190644393220798,-0.001350416730233455,-0.0013789635369313386,-0.0014042458998037672,-0.0014264571157685878,-0.0014447544701356933,-0.0014589095693243858,-0.0014689784579712986,-0.0014741970290714683,-0.0014746358247218374,-0.0014697151794720652,-0.0014592650866278689,-0.0014429081337615757,-0.0014204502755638324,-0.0013914992066802409,-0.0013558081309493538,-0.0013130409780942648,-0.0012630375240242331,-0.0012054297444119807,-0.0011399342994373078,-0.0010663336734241071,-0.00098457141139676979,-0.00089413213596750425,-0.00079503111585463554,-0.0006870321652428826,-0.00056988286942057261,-0.00044358693301505415,-0.0003078703545871381,-0.00016271271597026926,-7.9827741730075126e-006,0.00015632712963674887,0.00033032451916071095,0.0005140054601653855,0.00070738546861263442,0.00091034537974544051,0.0011229203560243915,0.0013450332122009246,0.001576536187181229,0.001817268188175494,0.0020672101837621872,0.0023259985883021055,0.0025935590496376885,0.0028695800107471584,0.0031537821193611841,0.0034459215024343522,0.0037456473262674345,0.004052609944800863,0.0043664164153124439,0.0046866839827317732,0.0050130057597096451,0.0053449183715740967,0.0056819170128744826,0.0060235752551110414,0.0063693683180534311,0.0067187181202648244,0.0070711134218874577,0.0074260077164465853,0.0077827467589979063,0.0081408410899999634,0.0084995871263910568,0.0088583967412555493,0.0092166465388493872,0.0095736884300847321,0.0099288658643796428,0.010281518006068625,0.010630990405606285,0.010976649097102973,0.011317788182445828,0.011653744671433448,0.01198390634501138,0.012307594617639118,0.012624150179165249,0.012932981535009542,0.013233427969399874,0.013524879886440614,0.013806791238774201,0.01407850853189664,0.014339512988443531,0.014589254093098466,0.014827212238766603,0.015052876376364387,0.01526575993757506,0.015465418791113796,0.015651456168969596,0.015823414567229313,0.015980957163487172,0.016123753465642942,0.016251467770241113,0.016363830700498339,0.016460619833605319,0.016541573196774368,0.01660656200440086,0.016655442606692251,0.016688072161828171,0.016704405404059992,0.016704405404059992,0.016688072161828171,0.016655442606692251,0.01660656200440086,0.016541573196774368,0.016460619833605319,0.016363830700498339,0.016251467770241113,0.016123753465642942,0.015980957163487172,0.015823414567229313,0.015651456168969596,0.015465418791113796,0.01526575993757506,0.015052876376364387,0.014827212238766603,0.014589254093098466,0.014339512988443531,0.01407850853189664,0.013806791238774201,0.013524879886440614,0.013233427969399874,0.012932981535009542,0.012624150179165249,0.012307594617639118,0.01198390634501138,0.011653744671433448,0.011317788182445828,0.010976649097102973,0.010630990405606285,0.010281518006068625,0.0099288658643796428,0.0095736884300847321,0.0092166465388493872,0.0088583967412555493,0.0084995871263910568,0.0081408410899999634,0.0077827467589979063,0.0074260077164465853,0.0070711134218874577,0.0067187181202648244,0.0063693683180534311,0.0060235752551110414,0.0056819170128744826,0.0053449183715740967,0.0050130057597096451,0.0046866839827317732,0.0043664164153124439,0.004052609944800863,0.0037456473262674345,0.0034459215024343522,0.0031537821193611841,0.0028695800107471584,0.0025935590496376885,0.0023259985883021055,0.0020672101837621872,0.001817268188175494,0.001576536187181229,0.0013450332122009246,0.0011229203560243915,0.00091034537974544051,0.00070738546861263442,0.0005140054601653855,0.00033032451916071095,0.00015632712963674887,-7.9827741730075126e-006,-0.00016271271597026926,-0.0003078703545871381,-0.00044358693301505415,-0.00056988286942057261,-0.0006870321652428826,-0.00079503111585463554,-0.00089413213596750425,-0.00098457141139676979,-0.0010663336734241071,-0.0011399342994373078,-0.0012054297444119807,-0.0012630375240242331,-0.0013130409780942648,-0.0013558081309493538,-0.0013914992066802409,-0.0014204502755638324,-0.0014429081337615757,-0.0014592650866278689,-0.0014697151794720652,-0.0014746358247218374,-0.0014741970290714683,-0.0014689784579712986,-0.0014589095693243858,-0.0014447544701356933,-0.0014264571157685878,-0.0014042458998037672,-0.0013789635369313386,-0.001350416730233455,-0.0013190644393220798,-0.0012851872848379012,-0.0012492407577302683,-0.001211219825349245,-0.0011715241102669938,-0.001130269760220006,-0.0010879784419822393,-0.001044644902777165,-0.0010007068043569713,-0.00095601244391201544,-0.00091132269508282376,-0.00086582739350004635,-0.00082175176687610527,-0.00077661402573390146,-0.00073236000049810767,-0.00068941316856086909,-0.00064658464222163326,-0.00060442542910108985,-0.00056319044450555452,-0.00052336190561365315,-0.00048471472954612091,-0.00044733074315489517,-0.00041105117237106746,-0.00037616962409380526,-0.00034269722372881465,-0.00031089131584517195,-0.0002806521286101239,-0.00025205352435853133,-0.0002249157799426658,-0.00089960851063079924',
    'CSET columnconfig = 4',
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
    'CSET hardwareoversamplingrate = 2800000',
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
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_a7495039d232075b',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '079a013d5d1ab2fb8218207e76984e2a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_a7495039d232075b
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
  fr_cmplr_v6_3_a7495039d232075b_instance : fr_cmplr_v6_3_a7495039d232075b
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
      'entity_name' => 'xlfir_compiler_516bd78992d05073446d2f0e193ec7f1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET coefficientvector = -0.000899608510631,-0.000224915779943,-0.000252053524359,-0.00028065212861,-0.000310891315845,-0.000342697223729,-0.000376169624094,-0.000411051172371,-0.000447330743155,-0.000484714729546,-0.000523361905614,-0.000563190444506,-0.000604425429101,-0.000646584642222,-0.000689413168561,-0.000732360000498,-0.000776614025734,-0.000821751766876,-0.0008658273935,-0.000911322695083,-0.000956012443912,-0.00100070680436,-0.00104464490278,-0.00108797844198,-0.00113026976022,-0.00117152411027,-0.00121121982535,-0.00124924075773,-0.00128518728484,-0.00131906443932,-0.00135041673023,-0.00137896353693,-0.0014042458998,-0.00142645711577,-0.00144475447014,-0.00145890956932,-0.00146897845797,-0.00147419702907,-0.00147463582472,-0.00146971517947,-0.00145926508663,-0.00144290813376,-0.00142045027556,-0.00139149920668,-0.00135580813095,-0.00131304097809,-0.00126303752402,-0.00120542974441,-0.00113993429944,-0.00106633367342,-0.000984571411397,-0.000894132135968,-0.000795031115855,-0.000687032165243,-0.000569882869421,-0.000443586933015,-0.000307870354587,-0.00016271271597,-7.98277417301e-006,0.000156327129637,0.000330324519161,0.000514005460165,0.000707385468613,0.000910345379745,0.00112292035602,0.0013450332122,0.00157653618718,0.00181726818818,0.00206721018376,0.0023259985883,0.00259355904964,0.00286958001075,0.00315378211936,0.00344592150243,0.00374564732627,0.0040526099448,0.00436641641531,0.00468668398273,0.00501300575971,0.00534491837157,0.00568191701287,0.00602357525511,0.00636936831805,0.00671871812026,0.00707111342189,0.00742600771645,0.007782746759,0.00814084109,0.00849958712639,0.00885839674126,0.00921664653885,0.00957368843008,0.00992886586438,0.0102815180061,0.0106309904056,0.0109766490971,0.0113177881824,0.0116537446714,0.011983906345,0.0123075946176,0.0126241501792,0.012932981535,0.0132334279694,0.0135248798864,0.0138067912388,0.0140785085319,0.0143395129884,0.0145892540931,0.0148272122388,0.0150528763764,0.0152657599376,0.0154654187911,0.015651456169,0.0158234145672,0.0159809571635,0.0161237534656,0.0162514677702,0.0163638307005,0.0164606198336,0.0165415731968,0.0166065620044,0.0166554426067,0.0166880721618,0.0167044054041,0.0167044054041,0.0166880721618,0.0166554426067,0.0166065620044,0.0165415731968,0.0164606198336,0.0163638307005,0.0162514677702,0.0161237534656,0.0159809571635,0.0158234145672,0.015651456169,0.0154654187911,0.0152657599376,0.0150528763764,0.0148272122388,0.0145892540931,0.0143395129884,0.0140785085319,0.0138067912388,0.0135248798864,0.0132334279694,0.012932981535,0.0126241501792,0.0123075946176,0.011983906345,0.0116537446714,0.0113177881824,0.0109766490971,0.0106309904056,0.0102815180061,0.00992886586438,0.00957368843008,0.00921664653885,0.00885839674126,0.00849958712639,0.00814084109,0.007782746759,0.00742600771645,0.00707111342189,0.00671871812026,0.00636936831805,0.00602357525511,0.00568191701287,0.00534491837157,0.00501300575971,0.00468668398273,0.00436641641531,0.0040526099448,0.00374564732627,0.00344592150243,0.00315378211936,0.00286958001075,0.00259355904964,0.0023259985883,0.00206721018376,0.00181726818818,0.00157653618718,0.0013450332122,0.00112292035602,0.000910345379745,0.000707385468613,0.000514005460165,0.000330324519161,0.000156327129637,-7.98277417301e-006,-0.00016271271597,-0.000307870354587,-0.000443586933015,-0.000569882869421,-0.000687032165243,-0.000795031115855,-0.000894132135968,-0.000984571411397,-0.00106633367342,-0.00113993429944,-0.00120542974441,-0.00126303752402,-0.00131304097809,-0.00135580813095,-0.00139149920668,-0.00142045027556,-0.00144290813376,-0.00145926508663,-0.00146971517947,-0.00147463582472,-0.00147419702907,-0.00146897845797,-0.00145890956932,-0.00144475447014,-0.00142645711577,-0.0014042458998,-0.00137896353693,-0.00135041673023,-0.00131906443932,-0.00128518728484,-0.00124924075773,-0.00121121982535,-0.00117152411027,-0.00113026976022,-0.00108797844198,-0.00104464490278,-0.00100070680436,-0.000956012443912,-0.000911322695083,-0.0008658273935,-0.000821751766876,-0.000776614025734,-0.000732360000498,-0.000689413168561,-0.000646584642222,-0.000604425429101,-0.000563190444506,-0.000523361905614,-0.000484714729546,-0.000447330743155,-0.000411051172371,-0.000376169624094,-0.000342697223729,-0.000310891315845,-0.00028065212861,-0.000252053524359,-0.000224915779943,-0.000899608510631',
    'CSET columnconfig = 4',
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
    'CSET hardwareoversamplingrate = 2800000',
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
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_eb3f5e21c238e176',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b66c6d4bd4e4692f0a1ff1049f6e2e3e',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_eb3f5e21c238e176
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
  fr_cmplr_v6_3_eb3f5e21c238e176_instance : fr_cmplr_v6_3_eb3f5e21c238e176
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
      'entity_name' => 'xlfir_compiler_dadbc7b58cb62c04fef420f4c58ee0d3',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f1444eb71010588d2a2140dc0e27ede1',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7ad8655967fd50ef25e4214b6ce02114',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
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
    'SELECT Binary_Counter virtex6 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET component_name = cntr_11_0_3166d4cc5b09c744',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'be0aae355dfb7886fc8a19dd53b74d1a',
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
      'core_name0' => 'cntr_11_0_3166d4cc5b09c744',
      'entity_name.0' => 'xlcounter_free',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'de1f746dd9715ce11aa70927e72e6683',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '770d2f496fcabeae7299a45a8251944c',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '34d21ccdd3cab1c6824e5f058d84bfe4',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4b74a033d267a6d54e18d0696d80ceb0',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b07ed079a262a0116ac2b771b284e633',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlceprobe.vhd',
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
    'entity_declaration_hash' => '86f98af99eaeb2a67e631b41687d1a3e',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
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
    'entity_declaration_hash' => '86c87ac01e65200b9c3878185fcf10e8',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlpassthrough.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e9441fff49b79fa88003c6783e538c40',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2bac1517a0b2dfb37b2e2c2cfabcfe14',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b3e9682ddda5e90640aa3f3fdd702fce',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '46202d4aad67bb04025da5b986335d60',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '4564805610920cf34b4ef51598db3763',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '535732f7184f131be000b21f81e61bbf',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '7659e2b361bc26f4cd6927e770e13972',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
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
    'SELECT Divider_Generator virtex6 Xilinx,_Inc. 4.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET component_name = dv_gn_v4_0_e1825854b6ed410d',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3d3779c57c70158956acdd8c83d19fa2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component dv_gn_v4_0_e1825854b6ed410d
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
  dv_gn_v4_0_e1825854b6ed410d_instance : dv_gn_v4_0_e1825854b6ed410d
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
      'entity_name' => 'xldivider_generator_ee95dc360423b121d9ecd626691cc2ae',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
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
  $instrs = {
    'entity_declaration_hash' => 'd0c6113cdc8e6249b89a87cfb06d753e',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlusamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter virtex6 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET component_name = addsb_11_0_26986301a9f671cd',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ee6e25ec6ad3cb966541991f18b127d6',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(25 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(25 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_26986301a9f671cd',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '9e78198bf509d887f88e9aa6a41fe5ff',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlceprobe.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter virtex6 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET component_name = addsb_11_0_8b0747970e52f130',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '119ac5d050c51df5902b36ede729a751',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(26 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(26 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_8b0747970e52f130',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT Adder_Subtracter virtex6 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET component_name = addsb_11_0_239e4f614ba09ab1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '64b14e7c3f2a998bb43f653f1129b381',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(26 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(26 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_239e4f614ba09ab1',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f9e25e7bae6eb0d10fdd26722f6ff61f',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '458a1b9d33ec622f2739696d6f740a7b',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'aec1662802a83cf9a2851173b3b0b0fa',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c1b57058b3e239f6ade253137a206dcc',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '70112b5658440ef21522e6582a91c95e',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b2ecd5248090f6721c992a2d52257f46',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e1fd69d06f8fa49a5acb9deaa202ab2a',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '313f40cbdffb9221ce19a7e4ffb7561e',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b712a41e5db4c80909ca63e80729022c',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'abba64109ba1858d7177aebcb0ec6b30',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0addf6cabab9bc8719070717f4b07696',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0c3555f02c878f7b812c1f27fb9da5fa',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '876ec6b8c61dff2fa5c803dad8201979',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '6a1a1e4daac3bd151e51d22537d8a453',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldsamp.vhd',
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
  $instrs = [
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET data_fractional_bits = 24',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Signed',
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
    'CSET hardwareoversamplingrate = 5600000',
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
    'CSET output_width = 26',
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
    'CSET sampleperiod = 5600000',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_f22a7e3f4b613ff0',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e50b41db5e1d9333751a598c1d8ff62b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_f22a7e3f4b613ff0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      event_s_data_chanid_incorrect:out std_logic;
      m_axis_data_tdata:out std_logic_vector(31 downto 0);
      m_axis_data_tuser:out std_logic_vector(1 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tuser:in std_logic_vector(1 downto 0);
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_ps_net: std_logic_vector(25 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tuser_chanid_ps_net: std_logic_vector(1 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal s_axis_data_tuser_net: std_logic_vector(1 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_ps_net <= m_axis_data_tdata_net(25 downto 0);
  m_axis_data_tuser_chanid_ps_net <= m_axis_data_tuser_net(1 downto 0);
  s_axis_data_tdata_net(24 downto 0) <= s_axis_data_tdata;
  s_axis_data_tuser_net(1 downto 0) <= s_axis_data_tuser_chanid;
  m_axis_data_tdata_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 26,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_ps_net,
        ce => ce_56000000,
        clr => \'0\',
        clk => clk_56000000, 
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
        ce => ce_56000000,
        clr => \'0\',
        clk => clk_56000000, 
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
        ce => ce_56000000,
        clr => \'0\',
        clk => clk_56000000, 
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
        clk => clk_56000000, 
        o(0) => m_axis_data_tvalid_ps_net_captured
    );
  fr_cmplr_v6_3_f22a7e3f4b613ff0_instance : fr_cmplr_v6_3_f22a7e3f4b613ff0
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
      s_axis_data_tvalid=>ce_logic_5600000
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_5600000:in std_logic;
    ce_56000000:in std_logic;
    ce_logic_5600000:in std_logic;
    clk:in std_logic;
    clk_5600000:in std_logic;
    clk_56000000:in std_logic;
    clk_logic_5600000:in std_logic;
    event_s_data_chanid_incorrect:out std_logic;
    m_axis_data_tdata:out std_logic_vector(25 downto 0);
    m_axis_data_tuser_chanid:out std_logic_vector(1 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata:in std_logic_vector(24 downto 0);
    s_axis_data_tready:out std_logic;
    s_axis_data_tuser_chanid:in std_logic_vector(1 downto 0);
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_c8ab56fde252f177c3a1ef23ff29e49a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b3a7cfe8eded69fa8a0fe4fc7f194a30',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cdc1e147e9da47c60526d77ed2bc2de4',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgGenerateCores::{'wrapup'};
  push(@$results, &SgGenerateCores::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen';
  open(RESULTS, '> D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/script_results7359702494190223990') || 
    croak 'couldn\'t open D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/script_results7359702494190223990';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/script_results7359702494190223990';
};

if ($@) {
  open(RESULTS, '> D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/script_results7359702494190223990') || 
    croak 'couldn\'t open D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/script_results7359702494190223990';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/Sysgen_projects/dsp-cores-devel/models/netlist_ddc_bpm_476_066_virtex6/sysgen/script_results7359702494190223990';
  exit(1);
}

exit(0);
