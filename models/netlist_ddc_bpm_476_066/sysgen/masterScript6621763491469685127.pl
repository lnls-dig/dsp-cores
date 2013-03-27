
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
    'HDL_PATH' => 'D:/Sysgen_projects/ddc_bpm_476_066/models',
    'Impl_file' => 'ISE Defaults',
    'Impl_file_sgadvanced' => '',
    'Synth_file' => 'XST Defaults',
    'Synth_file_sgadvanced' => '',
    'TEMP' => 'C:/TEMP',
    'TMP' => 'C:/TEMP',
    'Temp' => 'C:/TEMP',
    'Tmp' => 'C:/TEMP',
    'base_system_period_hardware' => 8.882321838928696,
    'base_system_period_simulink' => 8.882321838928696E-9,
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
      ],
      'values' => [
        'target1',
        'target2',
        'target3',
      ],
    },
    'compilation_target' => 'HDL Netlist',
    'core_generation' => 1.0,
    'core_generation_sgadvanced' => '',
    'core_is_deployed' => 0.0,
    'coregen_core_generation_tmpdir' => 'C:/TEMP/sysgentmp-lucas.russo/cg_wk/c83c092214b20238f',
    'coregen_part_family' => 'virtex6',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'ddc_bpm_476_066_sim_1mdb',
    'design_full_path' => 'D:\\Sysgen_projects\\ddc_bpm_476_066\\models\\ddc_bpm_476_066_sim_1mdb.mdl',
    'device' => 'xc6vlx240t-1ff1156',
    'device_speed' => '-1',
    'directory' => 'D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066',
    'dsp_cache_root_path' => 'C:/TEMP/sysgentmp-lucas.russo',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/perl_results.v', },
      ],
    ],
    'fxdptinstalled' => 1.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 2335.0008544921875,
    'generating_subsystem_handle' => 2335.0008544921875,
    'generation_directory' => './netlist_ddc_bpm_476_066',
    'has_advanced_control' => '0',
    'hdlDir' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'vhdl',
    'hdl_path' => 'D:/Sysgen_projects/ddc_bpm_476_066/models',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '13.4i',
    'master_sysgen_token_handle' => 2336.0006103515625,
    'matlab' => 'C:/Program Files/MATLAB/R2011b',
    'matlab_fixedpoint' => 1.0,
    'mdlHandle' => 2335.0008544921875,
    'mdlPath' => 'D:/Sysgen_projects/ddc_bpm_476_066/models/ddc_bpm_476_066_sim_1mdb.mdl',
    'modelDiagnostics' => [
      {
        'count' => 880.0,
        'isMask' => 0.0,
        'type' => 'ddc_bpm_476_066_sim_1mdb Total blocks',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Clock',
      },
      {
        'count' => 6.0,
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
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'Display',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Fcn',
      },
      {
        'count' => 70.0,
        'isMask' => 0.0,
        'type' => 'From',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Gain',
      },
      {
        'count' => 58.0,
        'isMask' => 0.0,
        'type' => 'Goto',
      },
      {
        'count' => 36.0,
        'isMask' => 0.0,
        'type' => 'GotoTagVisibility',
      },
      {
        'count' => 108.0,
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
        'count' => 92.0,
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
        'count' => 309.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 4.0,
        'isMask' => 0.0,
        'type' => 'Saturate',
      },
      {
        'count' => 31.0,
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
        'count' => 49.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 8.0,
        'isMask' => 0.0,
        'type' => 'Sum',
      },
      {
        'count' => 1.0,
        'isMask' => 0.0,
        'type' => 'Switch',
      },
      {
        'count' => 63.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 7.0,
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
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Manual Switch',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Repeating table',
      },
      {
        'count' => 10.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Adder/Subtracter Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Arithmetic Relational Operator Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bitwise Expression Evaluator Block',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Concatenator Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx CORDIC 5.0 Block',
      },
      {
        'count' => 2.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Clock Enable Probe Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Complex Multiplier 5.0  Block',
      },
      {
        'count' => 10.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx DDS Compiler 5.0 Block',
      },
      {
        'count' => 25.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Delay Block',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Divider Generator 4.0 Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx FIFO Block Block',
      },
      {
        'count' => 8.0,
        'isMask' => 1.0,
        'type' => 'Xilinx FIR Compiler 6.2 Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx FIR Compiler 6.3 Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 98.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Inverter Block',
      },
      {
        'count' => 59.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Register Block',
      },
      {
        'count' => 3.0,
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
        'count' => 33.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Reinterpreter Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'D:/Sysgen_projects/ddc_bpm_476_066/models/ddc_bpm_476_066_sim_1mdb.mdl',
    'myxilinx' => 'C:/Xilinx/13.4/ISE_DS/ISE',
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '45033',
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
    'simulation_island_subsystem_handle' => 2335.0008544921875,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => 8.882321838928696E-9,
    'speed' => '-1',
    'synth_file' => 'XST Defaults*',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'vhdl',
    'synthesis_tool' => 'XST',
    'synthesis_tool_sgadvanced' => '',
    'sysclk_period' => 8.882321838928696,
    'sysgen' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'sysgenTokenSettings' => {
      'Impl_file' => 'ISE Defaults',
      'Impl_file_sgadvanced' => '',
      'Synth_file' => 'XST Defaults',
      'Synth_file_sgadvanced' => '',
      'base_system_period_hardware' => 8.882321838928696,
      'base_system_period_simulink' => 8.882321838928696E-9,
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
        ],
        'values' => [
          'target1',
          'target2',
          'target3',
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
      'directory' => './netlist_ddc_bpm_476_066',
      'eval_field' => '0',
      'has_advanced_control' => '0',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 2336.0006103515625,
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
      'simulation_island_subsystem_handle' => 2335.0008544921875,
      'simulink_period' => 8.882321838928696E-9,
      'speed' => '-1',
      'synth_file' => 'XST Defaults*',
      'synthesis_language' => 'vhdl',
      'synthesis_tool' => 'XST',
      'synthesis_tool_sgadvanced' => '',
      'sysclk_period' => 8.882321838928696,
      'testbench' => 0,
      'testbench_sgadvanced' => '',
      'trim_vbits' => 1.0,
      'trim_vbits_sgadvanced' => '',
      'xilinx_device' => 'xc6vlx240t-1ff1156',
      'xilinxfamily' => 'virtex6',
    },
    'sysgen_Root' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 8.882321838928696,
    'tempdir' => 'C:/TEMP',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen',
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
    'vsimtime' => '440275.000000 ns',
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
    'entity_declaration_hash' => '263e5488cedc91b0703679b5442781d4',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'dcd0587b419d479cffdccf7033047348',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT Complex_Multiplier virtex6 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET aclken = true',
    'CSET aportwidth = 25',
    'CSET aresetn = false',
    'CSET atuserwidth = 1',
    'CSET bportwidth = 25',
    'CSET btuserwidth = 1',
    'CSET ctrltuserwidth = 1',
    'CSET flowcontrol = NonBlocking',
    'CSET hasatlast = false',
    'CSET hasatuser = false',
    'CSET hasbtlast = false',
    'CSET hasbtuser = false',
    'CSET hasctrltlast = false',
    'CSET hasctrltuser = false',
    'CSET latencyconfig = Manual',
    'CSET minimumlatency = 6',
    'CSET multtype = Use_Mults',
    'CSET optimizegoal = Performance',
    'CSET outputwidth = 25',
    'CSET outtlastbehv = Null',
    'CSET roundmode = Truncate',
    'CSET component_name = cmpy_v5_0_78d146491d572de9',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b0c098f4d4846d297127201db37fe546',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component cmpy_v5_0_78d146491d572de9
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(63 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_a_tdata:in std_logic_vector(63 downto 0);
      s_axis_a_tvalid:in std_logic;
      s_axis_b_tdata:in std_logic_vector(63 downto 0);
      s_axis_b_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal s_axis_a_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal s_axis_b_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_imag <= m_axis_dout_tdata_net(56 downto 32);
  m_axis_dout_tdata_real <= m_axis_dout_tdata_net(24 downto 0);
  s_axis_a_tdata_net(56 downto 32) <= s_axis_a_tdata_imag;
  s_axis_a_tdata_net(24 downto 0) <= s_axis_a_tdata_real;
  s_axis_b_tdata_net(56 downto 32) <= s_axis_b_tdata_imag;
  s_axis_b_tdata_net(24 downto 0) <= s_axis_b_tdata_real;
  cmpy_v5_0_78d146491d572de9_instance : cmpy_v5_0_78d146491d572de9
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_a_tdata=>s_axis_a_tdata_net,
      s_axis_a_tvalid=>s_axis_a_tvalid,
      s_axis_b_tdata=>s_axis_b_tdata_net,
      s_axis_b_tvalid=>s_axis_b_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_dout_tdata_imag:out std_logic_vector(24 downto 0);
    m_axis_dout_tdata_real:out std_logic_vector(24 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_a_tdata_imag:in std_logic_vector(24 downto 0);
    s_axis_a_tdata_real:in std_logic_vector(24 downto 0);
    s_axis_a_tvalid:in std_logic;
    s_axis_b_tdata_imag:in std_logic_vector(24 downto 0);
    s_axis_b_tdata_real:in std_logic_vector(24 downto 0);
    s_axis_b_tvalid:in std_logic
  );
end',
      'entity_name' => 'xlcomplex_multiplier_4e038c8e711d3f80f8a1c7b3e0cb325b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c4e63a1e3e5e1b1e57bdb2955d25ae68',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fcd9022399c54f961b70084055d369e3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d_1_22: std_logic_vector((25 - 1) downto 0);
begin
  d_1_22 <= d;
  q <= d_1_22;
end',
      'crippled_entity' => 'is
  port (
    d : in std_logic_vector((25 - 1) downto 0);
    q : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'delay_7bdda5bffb',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '2063078bf46cf146fefaa30a355d7b3f',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
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
    'entity_declaration_hash' => 'abe8fa246d36726d0902cb9e3f9b3ff6',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.2',
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
    'CSET coefficientvector = -3.19881109434e-005,-3.34757195765e-005,-3.48867711839e-005,-3.62107041422e-005,-3.74369770819e-005,-3.85551197684e-005,-3.95547851252e-005,-4.04258021945e-005,-4.11582298157e-005,-4.17424108002e-005,-4.2169026368e-005,-4.24291506081e-005,-4.25143047185e-005,-4.24165107753e-005,-4.21283447776e-005,-4.16429887131e-005,-4.09542813842e-005,-4.00567677386e-005,-3.89457464435e-005,-3.76173154487e-005,-3.6068415283e-005,-3.42968698351e-005,-3.23014243728e-005,-3.00817805621e-005,-2.76386282547e-005,-2.49736738206e-005,-2.20896648129e-005,-1.89904107612e-005,-1.5680799905e-005,-1.21668116873e-005,-8.45552484613e-006,-4.55512095526e-006,-4.74883281192e-007,3.7748091587e-006,8.18249243499e-006,1.27356335212e-005,1.74206511449e-005,2.22229417145e-005,2.71269103415e-005,3.21160069563e-005,3.71727674939e-005,4.2278860104e-005,4.7415136318e-005,5.2561687084e-005,5.76979035543e-005,6.28025424934e-005,6.78537961464e-005,7.28293663896e-005,7.77065429591e-005,8.24622855355e-005,8.7073309439e-005,9.15161746683e-005,9.57673779991e-005,9.98034478356e-005,0.000103601041492,0.000107137044566,0.000110388672039,0.000113333570738,0.000115949922773,0.000118216549539,0.000120113015884,0.000121619734017,0.000122718066721,0.00012339042944,0.000123620390801,0.000123392771107,0.000122693738384,0.000121510901496,0.000119833399919,0.000117651989696,0.000114959125164,0.000111749036008,0.000108017799216,0.000103763405539,9.89858200459e-005,9.3687036395e-005,8.78711244581e-005,8.15442709421e-005,7.47148126866e-005,6.73932623281e-005,5.95923260492e-005,5.13269131541e-005,4.26141372411e-005,3.34733087689e-005,2.39259188422e-005,1.39956140765e-005,3.70816242985e-006,-6.90859007421e-006,-1.78247717771e-005,-2.90085469756e-005,-4.04261866463e-005,-5.2042148238e-005,-6.38191644344e-005,-7.57183407459e-005,-8.76992617574e-005,-9.97201058186e-005,-0.000111737767927,-0.000123707990514,-0.000135585501816,-0.00014732416146,-0.000158877112879,-0.000170196942118,-0.000181235842566,-0.000191945785124,-0.000202278693274,-0.000212186622487,-0.000221621943391,-0.000230537528077,-0.000238886938914,-0.000246624619191,-0.000253706084928,-0.000260088117138,-0.000265728953823,-0.000270588480973,-0.000274628421835,-0.000277812523675,-0.000280106741305,-0.000281479416585,-0.000281901453154,-0.000281346485627,-0.000279791042494,-0.00027721470199,-0.000273600240182,-0.000268933770568,-0.000263204874469,-0.000256406721545,-0.000248536179754,-0.000239593914144,-0.000229584473848,-0.000218516366723,-0.000206402121086,-0.000193258334046,-0.000179105705971,-0.000163969060666,-0.000147877350891,-0.000130863648878,-0.000112965121588,-9.42229904531e-005,-7.46824754472e-005,-5.43927233552e-005,-3.34067201729e-005,-1.17811876324e-005,1.0423536101e-005,3.31436314498e-005,5.6311947997e-005,7.98581703813e-005,0.000103708999225,0.000127788346748,0.000152017546652,0.000176315577814,0.000200599301246,0.000224783709749,0.000248782189601,0.000272506793583,0.000295868524592,0.000318777629016,0.000341143899029,0.000362876982883,0.000383886702248,0.000404083375596,0.000423378146597,0.000441683316437,0.000458912678965,0.000474981857497,0.000489808642138,0.000503313326401,0.000515419041924,0.000526052090047,0.000535142269011,0.000542623195519,0.000548432619427,0.000552512730283,0.000554810454496,0.00055527774188,0.000553871840366,0.000550555557665,0.000545297508722,0.000538072347796,0.000528860984064,0.000517650779666,0.000504435729154,0.000489216619361,0.00047200116875,0.000452804145366,0.000431647462562,0.000408560251742,0.000383578911433,0.000356747132061,0.000328115895878,0.000297743451581,0.000265695263223,0.000232043933115,0.000196869098485,0.000160257301782,0.000122301834545,8.31025549253e-005,4.27656789541e-005,1.40354582766e-006,-4.08656424913e-005,-8.39181069241e-005,-0.000127624801666,-0.000171851748706,-0.000216460395772,-0.000261307996909,-0.000306248014796,-0.000351130543825,-0.000395802752877,-0.000440109346648,-0.000483893044267,-0.00052699507392,-0.000569255682056,-0.00061051465573,-0.000650611856528,-0.000689387764481,-0.000726684030297,-0.000762344034189,-0.000796213449529,-0.000828140809507,-0.000857978074927,-0.000885581201251,-0.000910810702967,-0.000933532213318,-0.000953617037449,-0.000970942696964,-0.000985393463943,-0.000996860882419,-0.00100524427535,-0.00101045123514,-0.00101239809576,-0.00101101038462,-0.00100622325219,-0.000997981877792,-0.00098624184948,-0.000970969516587,-0.000952142313087,-0.000929749050275,-0.000903790177244,-0.00087427800773,-0.000841236911994,-0.000804703472494,-0.000764726602207,-0.00072136762456,-0.000674700314047,-0.000624810896711,-0.000571798009798,-0.00051577262001,-0.000456857899905,-0.000395189062142,-0.000330913151362,-0.000264188793675,-0.00019518590383,-0.000124085350303,-5.10785786472e-005,2.36328063536e-005,9.98374991174e-005,0.000177314991468,0.000255836109695,0.000335163589396,0.000415052686902,0.000495251825934,0.000575503278033,0.000655543875137,0.000735105752601,0.000813917120774,0.000891703063193,0.000968186359282,0.00104308832937,0.00111612969973,0.00118703148527,0.00125551588728,0.00132130720389,0.00138413275029,0.00144372378628,0.00149981644818,0.00155215268241,0.00160048117767,0.00164455829305,0.00168414897896,0.00171902768796,0.00174897927255,0.0017737998669,0.00179329774965,0.00180729418468,0.00181562423715,0.00181813756171,0.00181469916022,0.00180519010612,0.00178950823275,0.00176756878302,0.00173930501788,0.00170466878101,0.00166363101764,0.00161618224495,0.00156233297216,0.00150211406818,0.00143557707502,0.00136279446515,0.00128385984141,0.00119888807785,0.00110801540036,0.00101139940594,0.000909219019783,0.000801674389323,0.000688986714711,0.000571398015399,0.000449170832582,0.000322587867524,0.000191951555961,5.75835789596e-005,-8.01756891692e-005,-0.000220967795148,-0.000364416882207,-0.000510130425609,-0.000657700026849,-0.000806702265003,-0.000956699603466,-0.00110724135019,-0.00125786466929,-0.00140809564181,-0.00155745037308,-0.00170543614427,-0.00185155260508,-0.00199529300498,-0.00213614545972,-0.00227359424991,-0.00240712114854,-0.00253620677379,-0.00266033196372,-0.00277897916908,-0.00289163386066,-0.00299778594719,-0.00309693119999,-0.00318857268048,-0.00327222216642,-0.00334740157302,-0.00341364436477,-0.0034704969539,-0.0035175200816,-0.00355429017771,-0.00358040069503,-0.0035954634143,-0.0035991097157,-0.00359099181327,-0.0035707839483,-0.00353818353795,-0.00349291227566,-0.00343471717962,-0.0033633715861,-0.0032786760843,-0.00318045938953,-0.003068579152,-0.00294292269809,-0.00280340770169,-0.00264998278317,-0.00248262803346,-0.0023013554615,-0.00210620936297,-0.00189726660862,-0.00167463685095,-0.00143846264778,-0.00118891950191,-0.000926215815895,-0.000650592761623,-0.000362324064186,-6.17157001332e-005,0.000250894489805,0.000575137273058,0.000910612581976,0.00125689015411,0.00161351025487,0.00197998448119,0.00235579664452,0.00274040373148,0.00313323693984,0.00353370278783,0.00394118429397,0.00435504222498,0.00477461640862,0.00519922710855,0.00562817645768,0.00606074994674,0.00649621796423,0.00693383738414,0.00737285319725,0.00781250018209,0.00825200461121,0.00869058598857,0.00912745881335,0.00956183436592,0.00999292251118,0.0104199335146,0.0108420798663,0.0112585781083,0.0116686506603,0.012071527639,0.012466448666,0.0128526646603,0.0132294396093,0.0135960523151,0.0139517981098,0.014295990537,0.0146279629933,0.0149470703265,0.0152526903859,0.0155442255204,0.0158211040203,0.0160827814991,0.0163287422115,0.0165585003042,0.0167716009957,0.0169676216817,0.0171461729647,0.0173068996023,0.0174494813744,0.0175736338647,0.0176791091561,0.0177656964365,0.0178332225151,0.0178815522458,0.0179105888587,0.0179202741969,0.0179105888587,0.0178815522458,0.0178332225151,0.0177656964365,0.0176791091561,0.0175736338647,0.0174494813744,0.0173068996023,0.0171461729647,0.0169676216817,0.0167716009957,0.0165585003042,0.0163287422115,0.0160827814991,0.0158211040203,0.0155442255204,0.0152526903859,0.0149470703265,0.0146279629933,0.014295990537,0.0139517981098,0.0135960523151,0.0132294396093,0.0128526646603,0.012466448666,0.012071527639,0.0116686506603,0.0112585781083,0.0108420798663,0.0104199335146,0.00999292251118,0.00956183436592,0.00912745881335,0.00869058598857,0.00825200461121,0.00781250018209,0.00737285319725,0.00693383738414,0.00649621796423,0.00606074994674,0.00562817645768,0.00519922710855,0.00477461640862,0.00435504222498,0.00394118429397,0.00353370278783,0.00313323693984,0.00274040373148,0.00235579664452,0.00197998448119,0.00161351025487,0.00125689015411,0.000910612581976,0.000575137273058,0.000250894489805,-6.17157001332e-005,-0.000362324064186,-0.000650592761623,-0.000926215815895,-0.00118891950191,-0.00143846264778,-0.00167463685095,-0.00189726660862,-0.00210620936297,-0.0023013554615,-0.00248262803346,-0.00264998278317,-0.00280340770169,-0.00294292269809,-0.003068579152,-0.00318045938953,-0.0032786760843,-0.0033633715861,-0.00343471717962,-0.00349291227566,-0.00353818353795,-0.0035707839483,-0.00359099181327,-0.0035991097157,-0.0035954634143,-0.00358040069503,-0.00355429017771,-0.0035175200816,-0.0034704969539,-0.00341364436477,-0.00334740157302,-0.00327222216642,-0.00318857268048,-0.00309693119999,-0.00299778594719,-0.00289163386066,-0.00277897916908,-0.00266033196372,-0.00253620677379,-0.00240712114854,-0.00227359424991,-0.00213614545972,-0.00199529300498,-0.00185155260508,-0.00170543614427,-0.00155745037308,-0.00140809564181,-0.00125786466929,-0.00110724135019,-0.000956699603466,-0.000806702265003,-0.000657700026849,-0.000510130425609,-0.000364416882207,-0.000220967795148,-8.01756891692e-005,5.75835789596e-005,0.000191951555961,0.000322587867524,0.000449170832582,0.000571398015399,0.000688986714711,0.000801674389323,0.000909219019783,0.00101139940594,0.00110801540036,0.00119888807785,0.00128385984141,0.00136279446515,0.00143557707502,0.00150211406818,0.00156233297216,0.00161618224495,0.00166363101764,0.00170466878101,0.00173930501788,0.00176756878302,0.00178950823275,0.00180519010612,0.00181469916022,0.00181813756171,0.00181562423715,0.00180729418468,0.00179329774965,0.0017737998669,0.00174897927255,0.00171902768796,0.00168414897896,0.00164455829305,0.00160048117767,0.00155215268241,0.00149981644818,0.00144372378628,0.00138413275029,0.00132130720389,0.00125551588728,0.00118703148527,0.00111612969973,0.00104308832937,0.000968186359282,0.000891703063193,0.000813917120774,0.000735105752601,0.000655543875137,0.000575503278033,0.000495251825934,0.000415052686902,0.000335163589396,0.000255836109695,0.000177314991468,9.98374991174e-005,2.36328063536e-005,-5.10785786472e-005,-0.000124085350303,-0.00019518590383,-0.000264188793675,-0.000330913151362,-0.000395189062142,-0.000456857899905,-0.00051577262001,-0.000571798009798,-0.000624810896711,-0.000674700314047,-0.00072136762456,-0.000764726602207,-0.000804703472494,-0.000841236911994,-0.00087427800773,-0.000903790177244,-0.000929749050275,-0.000952142313087,-0.000970969516587,-0.00098624184948,-0.000997981877792,-0.00100622325219,-0.00101101038462,-0.00101239809576,-0.00101045123514,-0.00100524427535,-0.000996860882419,-0.000985393463943,-0.000970942696964,-0.000953617037449,-0.000933532213318,-0.000910810702967,-0.000885581201251,-0.000857978074927,-0.000828140809507,-0.000796213449529,-0.000762344034189,-0.000726684030297,-0.000689387764481,-0.000650611856528,-0.00061051465573,-0.000569255682056,-0.00052699507392,-0.000483893044267,-0.000440109346648,-0.000395802752877,-0.000351130543825,-0.000306248014796,-0.000261307996909,-0.000216460395772,-0.000171851748706,-0.000127624801666,-8.39181069241e-005,-4.08656424913e-005,1.40354582766e-006,4.27656789541e-005,8.31025549253e-005,0.000122301834545,0.000160257301782,0.000196869098485,0.000232043933115,0.000265695263223,0.000297743451581,0.000328115895878,0.000356747132061,0.000383578911433,0.000408560251742,0.000431647462562,0.000452804145366,0.00047200116875,0.000489216619361,0.000504435729154,0.000517650779666,0.000528860984064,0.000538072347796,0.000545297508722,0.000550555557665,0.000553871840366,0.00055527774188,0.000554810454496,0.000552512730283,0.000548432619427,0.000542623195519,0.000535142269011,0.000526052090047,0.000515419041924,0.000503313326401,0.000489808642138,0.000474981857497,0.000458912678965,0.000441683316437,0.000423378146597,0.000404083375596,0.000383886702248,0.000362876982883,0.000341143899029,0.000318777629016,0.000295868524592,0.000272506793583,0.000248782189601,0.000224783709749,0.000200599301246,0.000176315577814,0.000152017546652,0.000127788346748,0.000103708999225,7.98581703813e-005,5.6311947997e-005,3.31436314498e-005,1.0423536101e-005,-1.17811876324e-005,-3.34067201729e-005,-5.43927233552e-005,-7.46824754472e-005,-9.42229904531e-005,-0.000112965121588,-0.000130863648878,-0.000147877350891,-0.000163969060666,-0.000179105705971,-0.000193258334046,-0.000206402121086,-0.000218516366723,-0.000229584473848,-0.000239593914144,-0.000248536179754,-0.000256406721545,-0.000263204874469,-0.000268933770568,-0.000273600240182,-0.00027721470199,-0.000279791042494,-0.000281346485627,-0.000281901453154,-0.000281479416585,-0.000280106741305,-0.000277812523675,-0.000274628421835,-0.000270588480973,-0.000265728953823,-0.000260088117138,-0.000253706084928,-0.000246624619191,-0.000238886938914,-0.000230537528077,-0.000221621943391,-0.000212186622487,-0.000202278693274,-0.000191945785124,-0.000181235842566,-0.000170196942118,-0.000158877112879,-0.00014732416146,-0.000135585501816,-0.000123707990514,-0.000111737767927,-9.97201058186e-005,-8.76992617574e-005,-7.57183407459e-005,-6.38191644344e-005,-5.2042148238e-005,-4.04261866463e-005,-2.90085469756e-005,-1.78247717771e-005,-6.90859007421e-006,3.70816242985e-006,1.39956140765e-005,2.39259188422e-005,3.34733087689e-005,4.26141372411e-005,5.13269131541e-005,5.95923260492e-005,6.73932623281e-005,7.47148126866e-005,8.15442709421e-005,8.78711244581e-005,9.3687036395e-005,9.89858200459e-005,0.000103763405539,0.000108017799216,0.000111749036008,0.000114959125164,0.000117651989696,0.000119833399919,0.000121510901496,0.000122693738384,0.000123392771107,0.000123620390801,0.00012339042944,0.000122718066721,0.000121619734017,0.000120113015884,0.000118216549539,0.000115949922773,0.000113333570738,0.000110388672039,0.000107137044566,0.000103601041492,9.98034478356e-005,9.57673779991e-005,9.15161746683e-005,8.7073309439e-005,8.24622855355e-005,7.77065429591e-005,7.28293663896e-005,6.78537961464e-005,6.28025424934e-005,5.76979035543e-005,5.2561687084e-005,4.7415136318e-005,4.2278860104e-005,3.71727674939e-005,3.21160069563e-005,2.71269103415e-005,2.22229417145e-005,1.74206511449e-005,1.27356335212e-005,8.18249243499e-006,3.7748091587e-006,-4.74883281192e-007,-4.55512095526e-006,-8.45552484613e-006,-1.21668116873e-005,-1.5680799905e-005,-1.89904107612e-005,-2.20896648129e-005,-2.49736738206e-005,-2.76386282547e-005,-3.00817805621e-005,-3.23014243728e-005,-3.42968698351e-005,-3.6068415283e-005,-3.76173154487e-005,-3.89457464435e-005,-4.00567677386e-005,-4.09542813842e-005,-4.16429887131e-005,-4.21283447776e-005,-4.24165107753e-005,-4.25143047185e-005,-4.24291506081e-005,-4.2169026368e-005,-4.17424108002e-005,-4.11582298157e-005,-4.04258021945e-005,-3.95547851252e-005,-3.85551197684e-005,-3.74369770819e-005,-3.62107041422e-005,-3.48867711839e-005,-3.34757195765e-005,-3.19881109434e-005',
    'CSET columnconfig = 14',
    'CSET data_buffer_type = Automatic',
    'CSET data_fractional_bits = 23',
    'CSET data_has_tlast = Not_Required',
    'CSET data_sign = Signed',
    'CSET data_tuser_width = 1',
    'CSET data_width = 25',
    'CSET decimation_rate = 35',
    'CSET displayreloadorder = false',
    'CSET filter_architecture = Systolic_Multiply_Accumulate',
    'CSET filter_selection = 1',
    'CSET filter_type = Decimation',
    'CSET gen_mif_files = false',
    'CSET gen_mif_from_coe = false',
    'CSET gen_mif_from_spec = false',
    'CSET gui_behaviour = Sysgen_uUPP',
    'CSET hardwareoversamplingrate = 1',
    'CSET has_aclken = true',
    'CSET has_aresetn = false',
    'CSET input_buffer_type = Automatic',
    'CSET inter_column_pipe_length = 4',
    'CSET interpolation_rate = 1',
    'CSET m_data_has_tready = false',
    'CSET m_data_has_tuser = Not_Required',
    'CSET multi_column_support = Disabled',
    'CSET num_reload_slots = 1',
    'CSET number_channels = 1',
    'CSET number_paths = 1',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Full_Precision',
    'CSET output_width = 46',
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
    'CSET s_data_has_tuser = Not_Required',
    'CSET sample_frequency = 0.00100000000',
    'CSET sampleperiod = 1',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_2_cb3666f40622a730',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '3955711a030ffbecaf7fe89e0a97eecc',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_2_cb3666f40622a730
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(47 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(31 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(47 downto 0) := (others=>\'0\');
signal m_axis_data_tdata_ps_net: std_logic_vector(45 downto 0) := (others=>\'0\');
signal m_axis_data_tvalid_ps_net: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_captured: std_logic := \'0\';
signal m_axis_data_tvalid_ps_net_or_captured_net: std_logic := \'0\';
signal s_axis_data_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_ps_net <= m_axis_data_tdata_net(45 downto 0);
  s_axis_data_tdata_net(24 downto 0) <= s_axis_data_tdata;
  m_axis_data_tdata_ps_net_synchronizer : entity work.synth_reg_w_init
    generic map(
        width => 46,
        init_index => 0,
        init_value => "0",
        latency => 1
    )
    port map (
        i => m_axis_data_tdata_ps_net,
        ce => ce_35,
        clr => \'0\',
        clk => clk_35, 
        o => m_axis_data_tdata
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
  fr_cmplr_v6_2_cb3666f40622a730_instance : fr_cmplr_v6_2_cb3666f40622a730
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid_ps_net,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
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
    m_axis_data_tdata:out std_logic_vector(45 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata:in std_logic_vector(24 downto 0);
    s_axis_data_tready:out std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_ef038eb54cf1fac5e9395f0d67a05c1c',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e78648c2556b97aba98000cd9a034aaf',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((46 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port <= signed_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((46 - 1) downto 0);
    output_port : out std_logic_vector((46 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_29ed43c71e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = [
    'SELECT FIR_Compiler virtex6 Xilinx,_Inc. 6.3',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET bestprecision = false',
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
    'CSET coefficientvector = 0.001220703125,-0.00126647949219,-0.00411987304688,0.00101470947266,0.00844573974609,0.00091552734375,-0.013427734375,-0.00555419921875,0.0164489746094,0.0115814208984,-0.0152282714844,-0.0155334472656,0.00936889648438,0.0126571655273,-0.00191497802734,0.000473022460938,-0.000831604003906,-0.0232086181641,-0.00813293457031,0.0494766235352,0.0326995849609,-0.0692977905273,-0.0704193115234,0.0729141235352,0.11206817627,-0.0556259155273,-0.144691467285,0.0208129882813,0.157043457031,0.0208129882813,-0.144691467285,-0.0556259155273,0.11206817627,0.0729141235352,-0.0704193115234,-0.0692977905273,0.0326995849609,0.0494766235352,-0.00813293457031,-0.0232086181641,-0.000831604003906,0.000473022460938,-0.00191497802734,0.0126571655273,0.00936889648438,-0.0155334472656,-0.0152282714844,0.0115814208984,0.0164489746094,-0.00555419921875,-0.013427734375,0.00091552734375,0.00844573974609,0.00101470947266,-0.00411987304688,-0.00126647949219,0.001220703125',
    'CSET columnconfig = 29',
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
    'CSET hardwareoversamplingrate = 1',
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
    'CSET number_paths = 1',
    'CSET optimization_goal = Area',
    'CSET output_buffer_type = Automatic',
    'CSET output_rounding_mode = Full_Precision',
    'CSET output_width = 34',
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
    'CSET sampleperiod = 1',
    'CSET select_pattern = All',
    'CSET stopband_max = 1',
    'CSET stopband_min = 0.50000000000',
    'CSET zero_pack_factor = 1',
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = fr_cmplr_v6_3_8dca82a218dd87c6',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fbcd92a6c5fedf6ca0b9924fb87613fb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component fr_cmplr_v6_3_8dca82a218dd87c6
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(39 downto 0);
      m_axis_data_tvalid:out std_logic;
      s_axis_data_tdata:in std_logic_vector(15 downto 0);
      s_axis_data_tready:out std_logic;
      s_axis_data_tvalid:in std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(39 downto 0) := (others=>\'0\');
signal s_axis_data_tdata_net: std_logic_vector(15 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata <= m_axis_data_tdata_net(33 downto 0);
  s_axis_data_tdata_net(15 downto 0) <= s_axis_data_tdata;
  fr_cmplr_v6_3_8dca82a218dd87c6_instance : fr_cmplr_v6_3_8dca82a218dd87c6
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tvalid=>m_axis_data_tvalid,
      s_axis_data_tdata=>s_axis_data_tdata_net,
      s_axis_data_tready=>s_axis_data_tready,
      s_axis_data_tvalid=>ce_logic_1
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    ce_logic_1:in std_logic;
    clk:in std_logic;
    clk_logic_1:in std_logic;
    m_axis_data_tdata:out std_logic_vector(33 downto 0);
    m_axis_data_tvalid:out std_logic;
    s_axis_data_tdata:in std_logic_vector(15 downto 0);
    s_axis_data_tready:out std_logic;
    src_ce:in std_logic;
    src_clk:in std_logic
  );
end',
      'entity_name' => 'xlfir_compiler_db690cb1dac026c47ff98d5afcede74f',
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
    'entity_declaration_hash' => 'c5f975f70c725cfd0e46e1fa219047f2',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((25 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_6a1bb6dda6',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '14defb81f74514b6688b9975e1d57d9b',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cdc1e147e9da47c60526d77ed2bc2de4',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT CORDIC virtex6 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET aclken = true',
    'CSET architectural_configuration = Parallel',
    'CSET aresetn = false',
    'CSET cartesian_has_tlast = false',
    'CSET cartesian_has_tuser = false',
    'CSET cartesian_tuser_width = 1',
    'CSET coarse_rotation = true',
    'CSET compensation_scaling = BRAM',
    'CSET data_format = SignedFraction',
    'CSET flow_control = NonBlocking',
    'CSET functional_selection = Translate',
    'CSET input_width = 25',
    'CSET iterations = 0',
    'CSET optimize_goal = Resources',
    'CSET out_tlast_behv = Null',
    'CSET out_tready = false',
    'CSET output_width = 25',
    'CSET phase_format = Radians',
    'CSET phase_has_tlast = false',
    'CSET phase_has_tuser = false',
    'CSET phase_tuser_width = 1',
    'CSET pipelining_mode = Maximum',
    'CSET precision = 0',
    'CSET round_mode = Nearest_Even',
    'CSET component_name = crdc_v5_0_ac582be577bf89c0',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '068020fd769e38db4068d2da45b64c1a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component crdc_v5_0_ac582be577bf89c0
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(63 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_cartesian_tdata:in std_logic_vector(63 downto 0);
      s_axis_cartesian_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
signal s_axis_cartesian_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_phase <= m_axis_dout_tdata_net(56 downto 32);
  m_axis_dout_tdata_real <= m_axis_dout_tdata_net(24 downto 0);
  s_axis_cartesian_tdata_net(56 downto 32) <= s_axis_cartesian_tdata_imag;
  s_axis_cartesian_tdata_net(24 downto 0) <= s_axis_cartesian_tdata_real;
  crdc_v5_0_ac582be577bf89c0_instance : crdc_v5_0_ac582be577bf89c0
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_dout_tdata=>m_axis_dout_tdata_net,
      m_axis_dout_tvalid=>m_axis_dout_tvalid,
      s_axis_cartesian_tdata=>s_axis_cartesian_tdata_net,
      s_axis_cartesian_tvalid=>s_axis_cartesian_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_dout_tdata_phase:out std_logic_vector(24 downto 0);
    m_axis_dout_tdata_real:out std_logic_vector(24 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_cartesian_tdata_imag:in std_logic_vector(24 downto 0);
    s_axis_cartesian_tdata_real:in std_logic_vector(24 downto 0);
    s_axis_cartesian_tvalid:in std_logic
  );
end',
      'entity_name' => 'xlcordic_c062cc3a2d77ede2032de397150e15cd',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '18fef3496fdc79903edf740cff345a09',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ccd6371bd3e2ffd80b4724db90035c9a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal in0_1_23: unsigned((27 - 1) downto 0);
  signal in1_1_27: unsigned((23 - 1) downto 0);
  signal y_2_1_concat: unsigned((50 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end',
      'crippled_entity' => 'is
  port (
    in0 : in std_logic_vector((27 - 1) downto 0);
    in1 : in std_logic_vector((23 - 1) downto 0);
    y : out std_logic_vector((50 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'concat_0d0fc5690d',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9160e7884f99e941b4e013b0a10ee4bf',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c64d42e35ae4b2c6e596525e6220461a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((50 - 1) downto 0);
  signal output_port_5_5_force: signed((50 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port_5_5_force <= unsigned_to_signed(input_port_1_40);
  output_port <= signed_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((50 - 1) downto 0);
    output_port : out std_logic_vector((50 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_1d284b35d5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '9448c05371da8c7343423249cdf392e3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: unsigned((23 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_unsigned(input_port);
  output_port <= unsigned_to_std_logic_vector(input_port_1_40);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((23 - 1) downto 0);
    output_port : out std_logic_vector((23 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_48a79104f5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '211c5bcdf38841ef8191462741070684',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal input_port_1_40: signed((27 - 1) downto 0);
  signal output_port_5_5_force: unsigned((27 - 1) downto 0);
begin
  input_port_1_40 <= std_logic_vector_to_signed(input_port);
  output_port_5_5_force <= signed_to_unsigned(input_port_1_40);
  output_port <= unsigned_to_std_logic_vector(output_port_5_5_force);
end',
      'crippled_entity' => 'is
  port (
    input_port : in std_logic_vector((27 - 1) downto 0);
    output_port : out std_logic_vector((27 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'reinterpret_bf9824e821',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'eaef404ab47876d8c10086b1c41ac9b1',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xldelay.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '52cbb362561811f45b215ee4a01ebbe3',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_24: boolean;
  signal b_1_27: boolean;
  signal c_1_30: boolean;
  signal d_1_33: boolean;
  signal bit_7_53: boolean;
  signal bit_7_36: boolean;
  signal fulldout_7_2_bit: boolean;
begin
  a_1_24 <= ((a) = "1");
  b_1_27 <= ((b) = "1");
  c_1_30 <= ((c) = "1");
  d_1_33 <= ((d) = "1");
  bit_7_53 <= ((boolean_to_vector(b_1_27) and boolean_to_vector(a_1_24)) = "1");
  bit_7_36 <= ((boolean_to_vector(c_1_30) and boolean_to_vector(bit_7_53)) = "1");
  fulldout_7_2_bit <= ((boolean_to_vector(d_1_33) and boolean_to_vector(bit_7_36)) = "1");
  dout <= boolean_to_vector(fulldout_7_2_bit);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    c : in std_logic_vector((1 - 1) downto 0);
    d : in std_logic_vector((1 - 1) downto 0);
    dout : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'expr_24cbf78c62',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
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
    'SELECT Fifo_Generator virtex6 Xilinx,_Inc. 8.4',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET almost_empty_flag = false',
    'CSET almost_full_flag = false',
    'CSET data_count = false',
    'CSET data_count_width = 7',
    'CSET disable_timing_violations = false',
    'CSET dout_reset_value = 0',
    'CSET empty_threshold_assert_value = 2',
    'CSET empty_threshold_negate_value = 3',
    'CSET enable_ecc = false',
    'CSET enable_reset_synchronization = true',
    'CSET fifo_implementation = Common_Clock_Distributed_RAM',
    'CSET full_flags_reset_value = 0',
    'CSET full_threshold_assert_value = 14',
    'CSET full_threshold_negate_value = 13',
    'CSET inject_dbit_error = false',
    'CSET inject_sbit_error = false',
    'CSET input_data_width = 27',
    'CSET input_depth = 128',
    'CSET output_data_width = 27',
    'CSET output_depth = 128',
    'CSET overflow_flag = false',
    'CSET overflow_sense = Active_High',
    'CSET performance_options = First_Word_Fall_Through',
    'CSET programmable_empty_type = No_Programmable_Empty_Threshold',
    'CSET programmable_full_type = No_Programmable_Full_Threshold',
    'CSET read_clock_frequency = 100',
    'CSET read_data_count = false',
    'CSET read_data_count_width = 7',
    'CSET reset_pin = false',
    'CSET reset_type = Asynchronous_Reset',
    'CSET underflow_flag = false',
    'CSET underflow_sense = Active_High',
    'CSET use_dout_reset = true',
    'CSET use_embedded_registers = false',
    'CSET use_extra_logic = false',
    'CSET valid_flag = false',
    'CSET valid_sense = Active_High',
    'CSET write_acknowledge_flag = false',
    'CSET write_acknowledge_sense = Active_High',
    'CSET write_clock_frequency = 100',
    'CSET write_data_count = false',
    'CSET write_data_count_width = 7',
    'CSET component_name = fifo_fg84_26bc5f646d342e7f',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e4b3f8511646c2ea2b4cc169a2546583',
    'sourceFile' => 'hdl/xlfifogen.vhd',
    'templateKeyValues' => {
      'core_component_def' => '      clk: in std_logic;
      din: in std_logic_vector(data_width - 1 downto 0);
      wr_en: in std_logic;
      rd_en: in std_logic;
      dout: out std_logic_vector(data_width - 1 downto 0);
      full: out std_logic;
      empty: out std_logic',
      'core_instance_text' => '        clk => clk,
        din => din,
        wr_en => wr_en,
        rd_en => rd_en,
        dout => dout,
        full => core_full,
        empty => empty',
      'core_name0' => 'fifo_fg84_26bc5f646d342e7f',
      'entity_name.0' => 'xlfifogen',
      'needs_core' => 1,
    },
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
  $instrs = [
    'SELECT Divider_Generator virtex6 Xilinx,_Inc. 4.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET aclken = true',
    'CSET algorithm_type = High_Radix',
    'CSET aresetn = false',
    'CSET clocks_per_division = 1',
    'CSET divide_by_zero_detect = false',
    'CSET dividend_and_quotient_width = 27',
    'CSET dividend_has_tlast = false',
    'CSET dividend_has_tuser = false',
    'CSET dividend_tuser_width = 1',
    'CSET divisor_has_tlast = false',
    'CSET divisor_has_tuser = false',
    'CSET divisor_tuser_width = 1',
    'CSET divisor_width = 27',
    'CSET flowcontrol = NonBlocking',
    'CSET fractional_width = 46',
    'CSET latency = 39',
    'CSET latency_configuration = Automatic',
    'CSET operand_sign = Signed',
    'CSET optimizegoal = Performance',
    'CSET outtlastbehv = Null',
    'CSET outtready = false',
    'CSET remainder_type = Fractional',
    'CSET component_name = dv_gn_v4_0_5ce7b020ea0b7ee9',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '2ebfbf08b0b9a1b69180dcd4c3f7a014',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component dv_gn_v4_0_5ce7b020ea0b7ee9
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_dout_tdata:out std_logic_vector(79 downto 0);
      m_axis_dout_tvalid:out std_logic;
      s_axis_dividend_tdata:in std_logic_vector(31 downto 0);
      s_axis_dividend_tready:out std_logic;
      s_axis_dividend_tvalid:in std_logic;
      s_axis_divisor_tdata:in std_logic_vector(31 downto 0);
      s_axis_divisor_tready:out std_logic;
      s_axis_divisor_tvalid:in std_logic
    );
end component;
signal m_axis_dout_tdata_net: std_logic_vector(79 downto 0) := (others=>\'0\');
signal m_axis_dout_tdata_quotient_net: std_logic_vector(26 downto 0) := (others=>\'0\');
signal m_axis_dout_tdata_shift_out_net: std_logic_vector(49 downto 0) := (others=>\'0\');
signal m_axis_dout_tdata_fractional_net: std_logic_vector(45 downto 0) := (others=>\'0\');
signal s_axis_dividend_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
signal s_axis_divisor_tdata_net: std_logic_vector(31 downto 0) := (others=>\'0\');
begin
  m_axis_dout_tdata_quotient_net <= m_axis_dout_tdata_net(72 downto 46);
  m_axis_dout_tdata_fractional_net <= m_axis_dout_tdata_net(45 downto 0);
  s_axis_dividend_tdata_net(26 downto 0) <= s_axis_dividend_tdata_dividend;
  s_axis_divisor_tdata_net(26 downto 0) <= s_axis_divisor_tdata_divisor;
  m_axis_dout_tdata_quotient <= m_axis_dout_tdata_shift_out_net(49 downto 23);
m_axis_dout_tdata_fractional <= m_axis_dout_tdata_shift_out_net(22 downto 0);
m_axis_dout_tdata_shift_out_net <= shift_division_result(m_axis_dout_tdata_quotient_net, m_axis_dout_tdata_fractional_net, 23, 0, 1);
  dv_gn_v4_0_5ce7b020ea0b7ee9_instance : dv_gn_v4_0_5ce7b020ea0b7ee9
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
    m_axis_dout_tdata_fractional:out std_logic_vector(22 downto 0);
    m_axis_dout_tdata_quotient:out std_logic_vector(26 downto 0);
    m_axis_dout_tvalid:out std_logic;
    s_axis_dividend_tdata_dividend:in std_logic_vector(26 downto 0);
    s_axis_dividend_tready:out std_logic;
    s_axis_dividend_tvalid:in std_logic;
    s_axis_divisor_tdata_divisor:in std_logic_vector(26 downto 0);
    s_axis_divisor_tready:out std_logic;
    s_axis_divisor_tvalid:in std_logic
  );
end',
      'entity_name' => 'xldivider_generator_abfd96133d2f7eb1baefa6637fb34af7',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '4170f474aacf8c7783e26f8650e8e005',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '2b41724f48f69c7ee1fa3110cdf5545a',
    'sourceFile' => 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen/hdl/xlregister.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ebcefc21c310af3e1e33b63bdaad7ace',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((27 - 1) downto 0);
  signal b_1_34: signed((27 - 1) downto 0);
  signal result_18_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  result_18_3_rel <= a_1_31 > b_1_34;
  op <= boolean_to_vector(result_18_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((27 - 1) downto 0);
    b : in std_logic_vector((27 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_6505656e93',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
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
    'entity_declaration_hash' => '809cb24bb4ee71020080e78f2fa1e744',
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
  $instrs = [
    'SELECT Adder_Subtracter virtex6 Xilinx,_Inc. 11.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET AINIT_Value = 0',
    'CSET A_Type = Signed',
    'CSET A_Width = 27',
    'CSET Add_Mode = Subtract',
    'CSET B_Constant = false',
    'CSET B_Type = Signed',
    'CSET B_Value = 0',
    'CSET B_Width = 27',
    'CSET Borrow_Sense = Active_Low',
    'CSET Bypass = false',
    'CSET Bypass_CE_Priority = Bypass_Overrides_CE',
    'CSET Bypass_Sense = Active_Low',
    'CSET CE = false',
    'CSET C_In = false',
    'CSET C_Out = false',
    'CSET Implementation = Fabric',
    'CSET Latency = 0',
    'CSET Out_Width = 27',
    'CSET SCLR = false',
    'CSET SINIT = false',
    'CSET SINIT_Value = 0',
    'CSET SSET = false',
    'CSET Sync_CE_Priority = Sync_Overrides_CE',
    'CSET Sync_Ctrl_Priority = Reset_Overrides_Set',
    'CSET component_name = addsb_11_0_1482f9e8df81448a',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cca1fdaee2900b9d7ed43ea349f97d05',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(27 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(27 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_1482f9e8df81448a',
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
    'CSET A_Width = 27',
    'CSET Add_Mode = Add',
    'CSET B_Constant = false',
    'CSET B_Type = Signed',
    'CSET B_Value = 0',
    'CSET B_Width = 27',
    'CSET Borrow_Sense = Active_Low',
    'CSET Bypass = false',
    'CSET Bypass_CE_Priority = Bypass_Overrides_CE',
    'CSET Bypass_Sense = Active_Low',
    'CSET CE = false',
    'CSET C_In = false',
    'CSET C_Out = false',
    'CSET Implementation = Fabric',
    'CSET Latency = 0',
    'CSET Out_Width = 27',
    'CSET SCLR = false',
    'CSET SINIT = false',
    'CSET SINIT_Value = 0',
    'CSET SSET = false',
    'CSET Sync_CE_Priority = Sync_Overrides_CE',
    'CSET Sync_Ctrl_Priority = Reset_Overrides_Set',
    'CSET component_name = addsb_11_0_2f1626aeedb3c308',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'ffa8662b3d443f24b8217fec3a6b7aed',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(27 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(27 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_2f1626aeedb3c308',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = [
    'SELECT DDS_Compiler virtex6 Xilinx,_Inc. 5.0',
    '# 13.4_O.87xd',
    '# DEVICE virtex6',
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
    'CSET latency = 12',
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
    'CSET output_width = 25',
    'CSET parameter_entry = Hardware_Parameters',
    'CSET partspresent = Phase_Generator_and_SIN_COS_LUT',
    'CSET period = 1',
    'CSET phase_increment = Fixed',
    'CSET phase_offset = Fixed',
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
    'SET device = xc6vlx240t',
    'SET package = ff1156',
    'SET speedgrade = -1',
    'CSET component_name = dds_cmplr_v5_0_6634d29470e010d2',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c1b9981b7cdbdf62cd130a6a86b9c8b7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => ' is
  component dds_cmplr_v5_0_6634d29470e010d2
    port(
      aclk:in std_logic;
      aclken:in std_logic;
      m_axis_data_tdata:out std_logic_vector(63 downto 0);
      m_axis_data_tready:in std_logic;
      m_axis_data_tvalid:out std_logic
    );
end component;
signal m_axis_data_tdata_net: std_logic_vector(63 downto 0) := (others=>\'0\');
begin
  m_axis_data_tdata_sine <= m_axis_data_tdata_net(56 downto 32);
  m_axis_data_tdata_cosine <= m_axis_data_tdata_net(24 downto 0);
  dds_cmplr_v5_0_6634d29470e010d2_instance : dds_cmplr_v5_0_6634d29470e010d2
    port map(
      aclk=>clk,
      aclken=>ce,
      m_axis_data_tdata=>m_axis_data_tdata_net,
      m_axis_data_tready=>m_axis_data_tready,
      m_axis_data_tvalid=>m_axis_data_tvalid
    );
end ',
      'crippled_entity' => 'is 
  port(
    ce:in std_logic;
    clk:in std_logic;
    m_axis_data_tdata_cosine:out std_logic_vector(24 downto 0);
    m_axis_data_tdata_sine:out std_logic_vector(24 downto 0);
    m_axis_data_tready:in std_logic;
    m_axis_data_tvalid:out std_logic
  );
end',
      'entity_name' => 'xldds_compiler_6f120d2f1e42c793cb38e9b66336b36a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgGenerateCores::{'wrapup'};
  push(@$results, &SgGenerateCores::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/13.4/ISE_DS/ISE/sysgen';
  open(RESULTS, '> D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/script_results1572776477518600556') || 
    croak 'couldn\'t open D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/script_results1572776477518600556';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/script_results1572776477518600556';
};

if ($@) {
  open(RESULTS, '> D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/script_results1572776477518600556') || 
    croak 'couldn\'t open D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/script_results1572776477518600556';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing D:/Sysgen_projects/ddc_bpm_476_066/models/netlist_ddc_bpm_476_066/sysgen/script_results1572776477518600556';
  exit(1);
}

exit(0);
