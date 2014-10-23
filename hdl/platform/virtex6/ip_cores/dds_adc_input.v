////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: dds_adc_input.v
// /___/   /\     Timestamp: Fri Jul 19 09:46:19 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/lerwys/Xilinx_projects/coregen/coregen/ipcore_dir/tmp/_cg/dds_adc_input.ngc /home/lerwys/Xilinx_projects/coregen/coregen/ipcore_dir/tmp/_cg/dds_adc_input.v 
// Device	: 6vlx240tff1156-1
// Input file	: /home/lerwys/Xilinx_projects/coregen/coregen/ipcore_dir/tmp/_cg/dds_adc_input.ngc
// Output file	: /home/lerwys/Xilinx_projects/coregen/coregen/ipcore_dir/tmp/_cg/dds_adc_input.v
// # of Modules	: 1
// Design Name	: dds_adc_input
// Xilinx        : /opt/Xilinx/13.4/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module dds_adc_input (
  aclk, m_axis_data_tvalid, m_axis_data_tdata
)/* synthesis syn_black_box syn_noprune=1 */;
  input aclk;
  output m_axis_data_tvalid;
  output [31 : 0] m_axis_data_tdata;
  
  // synthesis translate_off
  
  wire \U0/i_synth/i_dds/i_rdy.i_single_channel.i_non_trivial_lat.i_rdy/opt_has_pipe.first_q ;
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire sig00000169;
  wire sig0000016a;
  wire sig0000016b;
  wire sig0000016c;
  wire sig0000016d;
  wire sig0000016e;
  wire sig0000016f;
  wire sig00000170;
  wire sig00000171;
  wire sig00000172;
  wire sig00000173;
  wire sig00000174;
  wire sig00000175;
  wire sig00000176;
  wire sig00000177;
  wire sig00000178;
  wire sig00000179;
  wire sig0000017a;
  wire sig0000017b;
  wire sig0000017c;
  wire sig0000017d;
  wire sig0000017e;
  wire sig0000017f;
  wire sig00000180;
  wire sig00000181;
  wire sig00000182;
  wire sig00000183;
  wire sig00000184;
  wire sig00000185;
  wire sig00000186;
  wire sig00000187;
  wire sig00000188;
  wire sig00000189;
  wire sig0000018a;
  wire sig0000018b;
  wire sig0000018c;
  wire sig0000018d;
  wire sig0000018e;
  wire sig0000018f;
  wire sig00000190;
  wire sig00000191;
  wire sig00000192;
  wire sig00000193;
  wire sig00000194;
  wire sig00000195;
  wire sig00000196;
  wire sig00000197;
  wire sig00000198;
  wire sig00000199;
  wire sig0000019a;
  wire sig0000019b;
  wire sig0000019c;
  wire sig0000019d;
  wire sig0000019e;
  wire sig0000019f;
  wire sig000001a0;
  wire sig000001a1;
  wire sig000001a2;
  wire sig000001a3;
  wire sig000001a4;
  wire sig000001a5;
  wire sig000001a6;
  wire sig000001a7;
  wire sig000001a8;
  wire sig000001a9;
  wire sig000001aa;
  wire sig000001ab;
  wire sig000001ac;
  wire sig000001ad;
  wire sig000001ae;
  wire sig000001af;
  wire sig000001b0;
  wire sig000001b1;
  wire sig000001b2;
  wire sig000001b3;
  wire sig000001b4;
  wire sig000001b5;
  wire sig000001b6;
  wire sig000001b7;
  wire sig000001b8;
  wire sig000001b9;
  wire sig000001ba;
  wire sig000001bb;
  wire sig000001bc;
  wire sig000001bd;
  wire sig000001be;
  wire sig000001bf;
  wire \blk00000069/sig000002af ;
  wire \blk00000069/sig000002ae ;
  wire \blk00000069/sig000002ad ;
  wire \blk00000069/sig000002ac ;
  wire \blk00000069/sig000002ab ;
  wire \blk00000069/sig000002aa ;
  wire \blk00000069/sig000002a9 ;
  wire \blk00000069/sig000002a8 ;
  wire \blk00000069/sig000002a7 ;
  wire \blk00000069/sig000002a6 ;
  wire \blk00000069/sig000002a5 ;
  wire \blk00000069/sig000002a4 ;
  wire \blk00000069/sig000002a3 ;
  wire \blk00000069/sig000002a2 ;
  wire \blk00000069/sig000002a1 ;
  wire \blk00000069/sig000002a0 ;
  wire \blk00000069/sig0000029f ;
  wire \blk00000069/sig0000029e ;
  wire \blk00000069/sig0000029d ;
  wire \blk00000069/sig0000029c ;
  wire \blk00000069/sig0000029b ;
  wire \blk00000069/sig0000029a ;
  wire \blk00000069/sig00000299 ;
  wire \blk00000069/sig00000298 ;
  wire \blk00000069/sig00000297 ;
  wire \blk00000069/sig00000296 ;
  wire \blk00000069/sig00000295 ;
  wire \blk00000069/sig00000294 ;
  wire \blk00000069/sig00000293 ;
  wire \blk00000069/sig00000292 ;
  wire \blk00000069/sig00000291 ;
  wire \blk00000069/sig00000290 ;
  wire \blk00000069/sig0000028f ;
  wire \blk00000069/sig0000028e ;
  wire \blk00000069/sig0000028d ;
  wire \blk00000069/sig0000028c ;
  wire \blk00000069/sig0000028b ;
  wire \blk00000069/sig0000028a ;
  wire \blk00000069/sig00000289 ;
  wire \blk00000069/sig00000288 ;
  wire \blk00000069/sig00000287 ;
  wire \blk00000069/sig00000286 ;
  wire \blk00000069/sig00000285 ;
  wire \blk00000069/sig00000284 ;
  wire \blk00000069/sig00000283 ;
  wire \blk00000069/sig00000282 ;
  wire \blk00000069/sig00000281 ;
  wire \blk00000069/sig00000280 ;
  wire \blk00000069/sig0000027f ;
  wire \blk00000069/sig0000027e ;
  wire \blk00000069/sig0000027d ;
  wire \blk00000069/sig0000027c ;
  wire \blk00000069/sig0000027b ;
  wire \blk00000069/sig0000027a ;
  wire \blk00000069/sig00000279 ;
  wire \blk00000069/sig00000278 ;
  wire \blk00000069/sig00000277 ;
  wire \blk00000069/sig00000276 ;
  wire \blk00000069/sig00000275 ;
  wire \blk00000069/sig00000274 ;
  wire \blk00000069/sig00000273 ;
  wire \blk00000069/sig00000272 ;
  wire \blk00000069/sig00000271 ;
  wire \blk00000069/sig00000270 ;
  wire \blk00000069/sig0000026f ;
  wire \blk00000069/sig0000026e ;
  wire \blk00000069/sig0000026d ;
  wire \blk00000069/sig0000026c ;
  wire \blk00000069/sig0000026b ;
  wire \blk00000069/sig0000026a ;
  wire \blk00000069/sig00000269 ;
  wire \blk00000069/sig00000268 ;
  wire \blk00000069/sig00000267 ;
  wire \blk00000069/sig00000266 ;
  wire \blk00000069/sig00000265 ;
  wire \blk00000069/sig00000264 ;
  wire \blk00000069/sig00000263 ;
  wire \blk00000069/sig00000262 ;
  wire \blk00000069/sig00000261 ;
  wire \blk00000069/sig00000260 ;
  wire \blk00000069/sig0000025f ;
  wire \blk00000069/sig0000025e ;
  wire \blk00000069/sig0000025d ;
  wire \blk00000069/sig0000025c ;
  wire \blk00000069/sig0000025b ;
  wire \blk00000069/sig0000025a ;
  wire \blk00000069/sig00000259 ;
  wire \blk00000069/sig00000258 ;
  wire \blk00000069/sig00000257 ;
  wire \blk00000069/sig00000256 ;
  wire \blk00000069/sig00000255 ;
  wire \blk00000069/sig00000254 ;
  wire \blk00000069/sig00000253 ;
  wire \blk00000069/sig00000252 ;
  wire \blk00000069/sig00000251 ;
  wire \blk000000fa/sig000003a0 ;
  wire \blk000000fa/sig0000039f ;
  wire \blk000000fa/sig0000039e ;
  wire \blk000000fa/sig0000039d ;
  wire \blk000000fa/sig0000039c ;
  wire \blk000000fa/sig0000039b ;
  wire \blk000000fa/sig0000039a ;
  wire \blk000000fa/sig00000399 ;
  wire \blk000000fa/sig00000398 ;
  wire \blk000000fa/sig00000397 ;
  wire \blk000000fa/sig00000396 ;
  wire \blk000000fa/sig00000395 ;
  wire \blk000000fa/sig00000394 ;
  wire \blk000000fa/sig00000393 ;
  wire \blk000000fa/sig00000392 ;
  wire \blk000000fa/sig00000391 ;
  wire \blk000000fa/sig00000390 ;
  wire \blk000000fa/sig0000038f ;
  wire \blk000000fa/sig0000038e ;
  wire \blk000000fa/sig0000038d ;
  wire \blk000000fa/sig0000038c ;
  wire \blk000000fa/sig0000038b ;
  wire \blk000000fa/sig0000038a ;
  wire \blk000000fa/sig00000389 ;
  wire \blk000000fa/sig00000388 ;
  wire \blk000000fa/sig00000387 ;
  wire \blk000000fa/sig00000386 ;
  wire \blk000000fa/sig00000385 ;
  wire \blk000000fa/sig00000384 ;
  wire \blk000000fa/sig00000383 ;
  wire \blk000000fa/sig00000382 ;
  wire \blk000000fa/sig00000381 ;
  wire \blk000000fa/sig00000380 ;
  wire \blk000000fa/sig0000037f ;
  wire \blk000000fa/sig0000037e ;
  wire \blk000000fa/sig0000037d ;
  wire \blk000000fa/sig0000037c ;
  wire \blk000000fa/sig0000037b ;
  wire \blk000000fa/sig0000037a ;
  wire \blk000000fa/sig00000379 ;
  wire \blk000000fa/sig00000378 ;
  wire \blk000000fa/sig00000377 ;
  wire \blk000000fa/sig00000376 ;
  wire \blk000000fa/sig00000375 ;
  wire \blk000000fa/sig00000374 ;
  wire \blk000000fa/sig00000373 ;
  wire \blk000000fa/sig00000372 ;
  wire \blk000000fa/sig00000371 ;
  wire \blk000000fa/sig00000370 ;
  wire \blk000000fa/sig0000036f ;
  wire \blk000000fa/sig0000036e ;
  wire \blk000000fa/sig0000036d ;
  wire \blk000000fa/sig0000036c ;
  wire \blk000000fa/sig0000036b ;
  wire \blk000000fa/sig0000036a ;
  wire \blk000000fa/sig00000369 ;
  wire \blk000000fa/sig00000368 ;
  wire \blk000000fa/sig00000367 ;
  wire \blk000000fa/sig00000366 ;
  wire \blk000000fa/sig00000365 ;
  wire \blk000000fa/sig00000364 ;
  wire \blk000000fa/sig00000363 ;
  wire \blk000000fa/sig00000362 ;
  wire \blk000000fa/sig00000361 ;
  wire \blk000000fa/sig00000360 ;
  wire \blk000000fa/sig0000035f ;
  wire \blk000000fa/sig0000035e ;
  wire \blk000000fa/sig0000035d ;
  wire \blk000000fa/sig0000035c ;
  wire \blk000000fa/sig0000035b ;
  wire \blk000000fa/sig0000035a ;
  wire \blk000000fa/sig00000359 ;
  wire \blk000000fa/sig00000358 ;
  wire \blk000000fa/sig00000357 ;
  wire \blk000000fa/sig00000356 ;
  wire \blk000000fa/sig00000355 ;
  wire \blk000000fa/sig00000354 ;
  wire \blk000000fa/sig00000353 ;
  wire \blk000000fa/sig00000352 ;
  wire \blk000000fa/sig00000351 ;
  wire \blk000000fa/sig00000350 ;
  wire \blk000000fa/sig0000034f ;
  wire \blk000000fa/sig0000034e ;
  wire \blk000000fa/sig0000034d ;
  wire \blk000000fa/sig0000034c ;
  wire \blk000000fa/sig0000034b ;
  wire \blk000000fa/sig0000034a ;
  wire \blk000000fa/sig00000349 ;
  wire \blk000000fa/sig00000348 ;
  wire \blk000000fa/sig00000347 ;
  wire \blk000000fa/sig00000346 ;
  wire \blk000000fa/sig00000345 ;
  wire \blk000000fa/sig00000344 ;
  wire \blk000000fa/sig00000343 ;
  wire \blk000000fa/sig00000342 ;
  wire \blk0000018b/sig000003cf ;
  wire \blk0000018b/sig000003ce ;
  wire \blk0000018b/sig000003cd ;
  wire \blk0000018b/sig000003cc ;
  wire \blk0000018b/sig000003cb ;
  wire \blk0000018b/sig000003ca ;
  wire \blk0000018b/sig000003c9 ;
  wire \blk0000018b/sig000003c8 ;
  wire \blk0000018b/sig000003c7 ;
  wire \blk0000018b/sig000003c6 ;
  wire \blk0000018b/sig000003c5 ;
  wire \blk0000018b/sig000003c4 ;
  wire \blk0000018b/sig000003c3 ;
  wire \blk0000018b/sig000003c2 ;
  wire \blk0000018b/sig000003c1 ;
  wire \blk0000018b/sig000003b6 ;
  wire \blk0000018b/sig000003b5 ;
  wire \blk0000018b/sig000003b4 ;
  wire \blk0000018b/sig000003b3 ;
  wire \blk0000018b/sig000003b2 ;
  wire \blk0000018b/sig000003b1 ;
  wire \blk0000018b/sig000003b0 ;
  wire \blk0000018b/sig000003af ;
  wire \blk0000018b/sig000003ae ;
  wire \blk0000018b/sig000003ad ;
  wire \blk0000018b/sig000003ac ;
  wire \blk0000018b/sig000003ab ;
  wire \blk0000018b/sig000003aa ;
  wire \blk0000018b/sig000003a9 ;
  wire \blk0000018b/sig000003a8 ;
  wire \blk0000018b/sig000003a7 ;
  wire \blk0000018b/sig000003a6 ;
  wire \blk0000018b/sig000003a5 ;
  wire \blk0000018b/sig000003a4 ;
  wire \blk0000018b/sig000003a3 ;
  wire NLW_blk000002a3_CASCADEINA_UNCONNECTED;
  wire NLW_blk000002a3_CASCADEINB_UNCONNECTED;
  wire NLW_blk000002a3_CASCADEOUTA_UNCONNECTED;
  wire NLW_blk000002a3_CASCADEOUTB_UNCONNECTED;
  wire NLW_blk000002a3_DBITERR_UNCONNECTED;
  wire NLW_blk000002a3_INJECTDBITERR_UNCONNECTED;
  wire NLW_blk000002a3_INJECTSBITERR_UNCONNECTED;
  wire NLW_blk000002a3_SBITERR_UNCONNECTED;
  wire \NLW_blk000002a3_DIADI<31>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<30>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<29>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<28>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<27>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<26>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<25>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<24>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<23>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<22>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<21>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<20>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<19>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<18>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<17>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<16>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<15>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<14>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<13>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<12>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<11>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<10>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<9>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIADI<8>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<31>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<30>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<29>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<28>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<27>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<26>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<25>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<24>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<23>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<22>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<21>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<20>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<19>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<18>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<17>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<16>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<15>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<14>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<13>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<12>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<11>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<10>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<9>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<8>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<7>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<6>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<5>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<4>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIBDI<0>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPADIP<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPADIP<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPADIP<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPBDIP<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPBDIP<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPBDIP<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_DIPBDIP<0>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<31>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<30>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<29>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<28>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<27>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<26>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<25>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<24>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<23>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<22>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<21>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<20>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<19>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<18>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<17>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<16>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<15>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<14>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<13>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<12>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<11>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<10>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<9>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<8>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<7>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOADO<6>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<31>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<30>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<29>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<28>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<27>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<26>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<25>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<24>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<23>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<22>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<21>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<20>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<19>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<18>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<17>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<16>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<15>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<14>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<13>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<12>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<11>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<10>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<9>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<8>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<7>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOBDO<6>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPADOP<0>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_DOPBDOP<0>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_blk000002a3_RDADDRECC<0>_UNCONNECTED ;
  wire NLW_blk000002a4_CASCADEINA_UNCONNECTED;
  wire NLW_blk000002a4_CASCADEINB_UNCONNECTED;
  wire NLW_blk000002a4_CASCADEOUTA_UNCONNECTED;
  wire NLW_blk000002a4_CASCADEOUTB_UNCONNECTED;
  wire NLW_blk000002a4_DBITERR_UNCONNECTED;
  wire NLW_blk000002a4_INJECTDBITERR_UNCONNECTED;
  wire NLW_blk000002a4_INJECTSBITERR_UNCONNECTED;
  wire NLW_blk000002a4_SBITERR_UNCONNECTED;
  wire \NLW_blk000002a4_DIADI<31>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<30>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<29>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<28>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<27>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<26>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<25>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<24>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<23>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<22>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<21>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<20>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<19>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<18>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<17>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<16>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<15>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<14>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<13>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<12>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<11>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<10>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<9>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIADI<8>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<31>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<30>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<29>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<28>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<27>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<26>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<25>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<24>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<23>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<22>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<21>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<20>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<19>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<18>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<17>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<16>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<15>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<14>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<13>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<12>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<11>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<10>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<9>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<8>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<7>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<6>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<5>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<4>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIBDI<0>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPADIP<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPADIP<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPADIP<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPBDIP<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPBDIP<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPBDIP<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_DIPBDIP<0>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<31>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<30>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<29>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<28>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<27>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<26>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<25>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<24>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<23>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<22>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<21>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<20>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<19>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<18>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<17>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<16>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<15>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<14>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<13>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<12>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<11>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<10>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<9>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOADO<8>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<31>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<30>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<29>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<28>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<27>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<26>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<25>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<24>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<23>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<22>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<21>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<20>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<19>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<18>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<17>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<16>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<15>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<14>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<13>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<12>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<11>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<10>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<9>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOBDO<8>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOPADOP<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOPADOP<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOPADOP<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOPBDOP<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOPBDOP<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_DOPBDOP<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<7>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<6>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<5>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<4>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_ECCPARITY<0>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<8>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<7>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<6>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<5>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<4>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<3>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<2>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<1>_UNCONNECTED ;
  wire \NLW_blk000002a4_RDADDRECC<0>_UNCONNECTED ;
  wire NLW_blk000002a5_Q15_UNCONNECTED;
  wire NLW_blk000002a7_Q15_UNCONNECTED;
  wire \NLW_blk0000018b/blk000001b7_Q15_UNCONNECTED ;
  wire \NLW_blk0000018b/blk000001b5_Q15_UNCONNECTED ;
  wire \NLW_blk0000018b/blk000001b3_Q15_UNCONNECTED ;
  wire [7 : 0] \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q ;
  wire [7 : 0] \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q ;
  wire [7 : 0] \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q ;
  wire [7 : 0] \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q ;
  assign
    m_axis_data_tdata[31] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [7],
    m_axis_data_tdata[30] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [6],
    m_axis_data_tdata[29] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [5],
    m_axis_data_tdata[28] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [4],
    m_axis_data_tdata[27] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [3],
    m_axis_data_tdata[26] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [2],
    m_axis_data_tdata[25] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [1],
    m_axis_data_tdata[24] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [0],
    m_axis_data_tdata[23] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [7],
    m_axis_data_tdata[22] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [6],
    m_axis_data_tdata[21] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [5],
    m_axis_data_tdata[20] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [4],
    m_axis_data_tdata[19] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [3],
    m_axis_data_tdata[18] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [2],
    m_axis_data_tdata[17] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [1],
    m_axis_data_tdata[16] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [0],
    m_axis_data_tdata[15] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [7],
    m_axis_data_tdata[14] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [6],
    m_axis_data_tdata[13] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [5],
    m_axis_data_tdata[12] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [4],
    m_axis_data_tdata[11] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [3],
    m_axis_data_tdata[10] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [2],
    m_axis_data_tdata[9] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [1],
    m_axis_data_tdata[8] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [0],
    m_axis_data_tdata[7] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [7],
    m_axis_data_tdata[6] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [6],
    m_axis_data_tdata[5] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [5],
    m_axis_data_tdata[4] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [4],
    m_axis_data_tdata[3] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [3],
    m_axis_data_tdata[2] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [2],
    m_axis_data_tdata[1] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [1],
    m_axis_data_tdata[0] = \U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [0],
    m_axis_data_tvalid = \U0/i_synth/i_dds/i_rdy.i_single_channel.i_non_trivial_lat.i_rdy/opt_has_pipe.first_q ;
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  FDE #(
    .INIT ( 1'b1 ))
  blk00000003 (
    .C(aclk),
    .CE(sig00000007),
    .D(sig00000004),
    .Q(sig0000006c)
  );
  FDE #(
    .INIT ( 1'b1 ))
  blk00000004 (
    .C(aclk),
    .CE(sig00000007),
    .D(sig00000005),
    .Q(sig0000006b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(aclk),
    .CE(sig00000007),
    .D(sig00000006),
    .Q(sig00000003)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000039),
    .Q(\U0/i_synth/i_dds/i_rdy.i_single_channel.i_non_trivial_lat.i_rdy/opt_has_pipe.first_q )
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000008),
    .Q(sig000000b5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000009),
    .Q(sig000000b4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000000a),
    .Q(sig000000b3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000000b),
    .Q(sig000000b2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000000c),
    .Q(sig000000b1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000000d),
    .Q(sig000000b0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000000e),
    .Q(sig000000af)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000000f),
    .Q(sig000000ae)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000010),
    .Q(sig000000ad)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000010 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000011),
    .Q(sig000000ac)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000011 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000012),
    .Q(sig000000ab)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000012 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000013),
    .Q(sig000000aa)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000013 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000014),
    .Q(sig000000a9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000014 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000015),
    .Q(sig000000a8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000015 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000016),
    .Q(sig000000a7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000016 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000017),
    .Q(sig000000a6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000017 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000018),
    .Q(sig000000a5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000018 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000019),
    .Q(sig000000a4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000019 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000001a),
    .Q(sig000000a3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000001b),
    .Q(sig000000a2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000001c),
    .Q(sig000000a1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000001d),
    .Q(sig000000a0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000001e),
    .Q(sig0000009f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000001f),
    .Q(sig0000009e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000001f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000020),
    .Q(sig0000009d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000020 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000021),
    .Q(sig0000009c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000021 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000022),
    .Q(sig0000009b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000022 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000023),
    .Q(sig0000009a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000023 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000024),
    .Q(sig00000099)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000025),
    .Q(sig00000098)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000026),
    .Q(sig00000097)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000027),
    .Q(sig00000096)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000028),
    .Q(sig00000095)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000029),
    .Q(sig00000094)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000029 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000002a),
    .Q(sig00000093)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000002b),
    .Q(sig00000092)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000002c),
    .Q(sig00000091)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000002d),
    .Q(sig00000090)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000002e),
    .Q(sig0000008f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000002f),
    .Q(sig0000008e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000030),
    .Q(sig0000008d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000030 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000031),
    .Q(sig0000008c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000031 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000032),
    .Q(sig0000008b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000033),
    .Q(sig0000008a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000034),
    .Q(sig00000089)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000035),
    .Q(sig00000088)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000036),
    .Q(sig00000087)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000037),
    .Q(sig00000086)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000038),
    .Q(sig00000085)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000006a),
    .Q(sig000000d8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000069),
    .Q(sig0000007a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000068),
    .Q(sig00000079)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000067),
    .Q(sig00000078)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000066),
    .Q(sig00000077)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000065),
    .Q(sig00000076)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000064),
    .Q(sig00000075)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000063),
    .Q(sig00000074)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000062),
    .Q(sig00000073)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000061),
    .Q(sig00000072)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000060),
    .Q(sig00000071)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000005f),
    .Q(sig00000070)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000005e),
    .Q(sig0000006f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000005d),
    .Q(sig0000006e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000046 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000005c),
    .Q(sig0000006d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000047 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000005b),
    .Q(sig000000d7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000048 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000005a),
    .Q(sig000000d6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000059),
    .Q(sig000000d5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000058),
    .Q(sig000000d4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000057),
    .Q(sig000000d3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000056),
    .Q(sig000000d2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000055),
    .Q(sig000000d1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000054),
    .Q(sig000000d0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000053),
    .Q(sig000000cf)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000052),
    .Q(sig000000ce)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000051 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000051),
    .Q(sig000000cd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000052 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000050),
    .Q(sig000000cc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000053 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000004f),
    .Q(sig000000cb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000054 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000004e),
    .Q(sig000000ca)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000055 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000004d),
    .Q(sig000000c9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000056 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000004c),
    .Q(sig000000c8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000057 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000004b),
    .Q(sig000000c7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000058 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000004a),
    .Q(sig000000c6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000059 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000049),
    .Q(sig000000c5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000048),
    .Q(sig000000c4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000047),
    .Q(sig000000c3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000046),
    .Q(sig000000c2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000045),
    .Q(sig000000c1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000044),
    .Q(sig000000c0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000005f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000043),
    .Q(sig000000bf)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000060 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000042),
    .Q(sig000000be)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000061 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000041),
    .Q(sig000000bd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000062 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000040),
    .Q(sig000000bc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000063 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000003f),
    .Q(sig000000bb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000064 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000003e),
    .Q(sig000000ba)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000065 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000003d),
    .Q(sig000000b9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000066 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000003c),
    .Q(sig000000b8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000067 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000003b),
    .Q(sig000000b7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000068 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000003a),
    .Q(sig000000b6)
  );
  XORCY   blk000001b9 (
    .CI(sig000000ec),
    .LI(sig0000010c),
    .O(sig00000104)
  );
  MUXCY   blk000001ba (
    .CI(sig000000ec),
    .DI(sig00000002),
    .S(sig0000010c),
    .O(sig000000eb)
  );
  XORCY   blk000001bb (
    .CI(sig000000ed),
    .LI(sig0000010b),
    .O(sig00000103)
  );
  MUXCY   blk000001bc (
    .CI(sig000000ed),
    .DI(sig00000002),
    .S(sig0000010b),
    .O(sig000000ec)
  );
  XORCY   blk000001bd (
    .CI(sig000000ee),
    .LI(sig0000010a),
    .O(sig00000102)
  );
  MUXCY   blk000001be (
    .CI(sig000000ee),
    .DI(sig00000002),
    .S(sig0000010a),
    .O(sig000000ed)
  );
  XORCY   blk000001bf (
    .CI(sig000000ef),
    .LI(sig00000109),
    .O(sig00000101)
  );
  MUXCY   blk000001c0 (
    .CI(sig000000ef),
    .DI(sig00000002),
    .S(sig00000109),
    .O(sig000000ee)
  );
  XORCY   blk000001c1 (
    .CI(sig000000f0),
    .LI(sig00000108),
    .O(sig00000100)
  );
  MUXCY   blk000001c2 (
    .CI(sig000000f0),
    .DI(sig00000002),
    .S(sig00000108),
    .O(sig000000ef)
  );
  XORCY   blk000001c3 (
    .CI(sig000000f1),
    .LI(sig00000107),
    .O(sig000000ff)
  );
  MUXCY   blk000001c4 (
    .CI(sig000000f1),
    .DI(sig00000002),
    .S(sig00000107),
    .O(sig000000f0)
  );
  XORCY   blk000001c5 (
    .CI(sig000000f2),
    .LI(sig00000106),
    .O(sig000000fe)
  );
  MUXCY   blk000001c6 (
    .CI(sig000000f2),
    .DI(sig00000002),
    .S(sig00000106),
    .O(sig000000f1)
  );
  XORCY   blk000001c7 (
    .CI(sig000000f3),
    .LI(sig00000105),
    .O(sig000000fd)
  );
  MUXCY   blk000001c8 (
    .CI(sig000000f3),
    .DI(sig00000002),
    .S(sig00000105),
    .O(sig000000f2)
  );
  MUXCY   blk000001c9 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000f4),
    .O(sig000000f3)
  );
  XORCY   blk000001ca (
    .CI(sig000000f6),
    .LI(sig00000123),
    .O(sig0000011c)
  );
  MUXCY   blk000001cb (
    .CI(sig000000f6),
    .DI(sig00000002),
    .S(sig00000123),
    .O(sig000000f5)
  );
  XORCY   blk000001cc (
    .CI(sig000000f7),
    .LI(sig00000122),
    .O(sig0000011b)
  );
  MUXCY   blk000001cd (
    .CI(sig000000f7),
    .DI(sig00000002),
    .S(sig00000122),
    .O(sig000000f6)
  );
  XORCY   blk000001ce (
    .CI(sig000000f8),
    .LI(sig00000121),
    .O(sig0000011a)
  );
  MUXCY   blk000001cf (
    .CI(sig000000f8),
    .DI(sig00000002),
    .S(sig00000121),
    .O(sig000000f7)
  );
  XORCY   blk000001d0 (
    .CI(sig000000f9),
    .LI(sig00000120),
    .O(sig00000119)
  );
  MUXCY   blk000001d1 (
    .CI(sig000000f9),
    .DI(sig00000002),
    .S(sig00000120),
    .O(sig000000f8)
  );
  XORCY   blk000001d2 (
    .CI(sig000000fa),
    .LI(sig0000011f),
    .O(sig00000118)
  );
  MUXCY   blk000001d3 (
    .CI(sig000000fa),
    .DI(sig00000002),
    .S(sig0000011f),
    .O(sig000000f9)
  );
  XORCY   blk000001d4 (
    .CI(sig000000fb),
    .LI(sig0000011e),
    .O(sig00000117)
  );
  MUXCY   blk000001d5 (
    .CI(sig000000fb),
    .DI(sig00000002),
    .S(sig0000011e),
    .O(sig000000fa)
  );
  XORCY   blk000001d6 (
    .CI(sig000000fc),
    .LI(sig0000011d),
    .O(sig00000116)
  );
  MUXCY   blk000001d7 (
    .CI(sig000000fc),
    .DI(sig00000002),
    .S(sig0000011d),
    .O(sig000000fb)
  );
  XORCY   blk000001d8 (
    .CI(sig00000002),
    .LI(sig000001bd),
    .O(sig00000115)
  );
  MUXCY   blk000001d9 (
    .CI(sig00000002),
    .DI(sig0000012b),
    .S(sig000001bd),
    .O(sig000000fc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001da (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000151),
    .Q(sig0000015d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001db (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000150),
    .Q(sig0000015c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001dc (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000014f),
    .Q(sig0000015b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001dd (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000014e),
    .Q(sig0000015a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001de (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000014d),
    .Q(sig00000159)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001df (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000014c),
    .Q(sig00000158)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e0 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000014b),
    .Q(sig00000157)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e1 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000014a),
    .Q(sig00000156)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e2 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000149),
    .Q(sig00000155)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e3 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000148),
    .Q(sig00000154)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e4 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000147),
    .Q(sig00000153)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e5 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000146),
    .Q(sig00000152)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e6 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000145),
    .Q(sig00000187)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e7 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000144),
    .Q(sig00000186)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e8 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000143),
    .Q(sig00000185)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001e9 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000142),
    .Q(sig00000184)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ea (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000141),
    .Q(sig00000183)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001eb (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000140),
    .Q(sig00000182)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ec (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000013f),
    .Q(sig00000181)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ed (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000013e),
    .Q(sig00000180)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ee (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000013d),
    .Q(sig0000017f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ef (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000013c),
    .Q(sig0000017e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f0 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000013b),
    .Q(sig0000017d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f1 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000013a),
    .Q(sig0000017c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f2 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000007a),
    .Q(sig000001bc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f3 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000079),
    .Q(sig000001bb)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f4 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000016c),
    .Q(sig000001aa)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f5 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000016b),
    .Q(sig000001a9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f6 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000016a),
    .Q(sig000001a8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f7 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000169),
    .Q(sig000001a7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f8 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000168),
    .Q(sig000001a6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001f9 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000167),
    .Q(sig000001a5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001fa (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000166),
    .Q(sig000001a4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001fb (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000165),
    .Q(sig000001a3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001fc (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000164),
    .Q(sig000001a2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001fd (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000163),
    .Q(sig000001a1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001fe (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000162),
    .Q(sig000001a0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000001ff (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000161),
    .Q(sig0000019f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000200 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000160),
    .Q(sig0000019e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000201 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000015f),
    .Q(sig0000019d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000202 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000015e),
    .Q(sig0000019c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000203 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000017b),
    .Q(sig000001b9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000204 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000017a),
    .Q(sig000001b8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000205 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000179),
    .Q(sig000001b7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000206 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000178),
    .Q(sig000001b6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000207 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000177),
    .Q(sig000001b5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000208 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000176),
    .Q(sig000001b4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000209 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000175),
    .Q(sig000001b3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000020a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000174),
    .Q(sig000001b2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000020b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000173),
    .Q(sig000001b1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000020c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000172),
    .Q(sig000001b0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000020d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000171),
    .Q(sig000001af)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000020e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000170),
    .Q(sig000001ae)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000020f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000016f),
    .Q(sig000001ad)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000210 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000016e),
    .Q(sig000001ac)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000211 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000016d),
    .Q(sig000001ab)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000212 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000018f),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000213 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000018e),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000214 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000018d),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000215 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000018c),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000216 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000018b),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000217 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000018a),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000218 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000189),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000219 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000188),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ls/opt_has_pipe.first_q [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000021a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000132),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000021b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000131),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000021c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000130),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000021d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000012f),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000021e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000012e),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000021f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000012d),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000220 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000012c),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000221 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000e2),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_cos_ms/opt_has_pipe.first_q [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000222 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000199),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000223 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000198),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000224 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000197),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000225 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000196),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000226 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000195),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000227 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000194),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000228 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000193),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000229 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000192),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ls/opt_has_pipe.first_q [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000022a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000139),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000022b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000138),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000022c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000137),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000022d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000136),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000022e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000135),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000022f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000134),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000230 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000133),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000231 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000ea),
    .Q(\U0/i_synth/i_dds/I_SINCOS.i_rom/i_rtl.i_quarter_table.i_piped_map.i_cardinal_sin_ms/opt_has_pipe.first_q [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000232 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000114),
    .Q(sig000000db)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000233 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000113),
    .Q(sig000000dc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000234 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000112),
    .Q(sig000000dd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000235 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000111),
    .Q(sig000000de)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000236 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000110),
    .Q(sig000000df)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000237 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000010f),
    .Q(sig000000e0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000238 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000010e),
    .Q(sig000000e1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000239 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000010d),
    .Q(sig00000191)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000023a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000012b),
    .Q(sig000000e3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000023b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000012a),
    .Q(sig000000e4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000023c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000129),
    .Q(sig000000e5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000023d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000128),
    .Q(sig000000e6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000023e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000127),
    .Q(sig000000e7)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000023f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000126),
    .Q(sig000000e8)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000240 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000125),
    .Q(sig000000e9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000241 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000124),
    .Q(sig0000019b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000242 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000eb),
    .Q(sig00000190)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000243 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000104),
    .Q(sig0000018f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000244 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000103),
    .Q(sig0000018e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000245 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000102),
    .Q(sig0000018d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000246 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000101),
    .Q(sig0000018c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000247 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000100),
    .Q(sig0000018b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000248 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000ff),
    .Q(sig0000018a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000249 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000fe),
    .Q(sig00000189)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000024a (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000fd),
    .Q(sig00000188)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000024b (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000000f5),
    .Q(sig0000019a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000024c (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000011c),
    .Q(sig00000199)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000024d (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000011b),
    .Q(sig00000198)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000024e (
    .C(aclk),
    .CE(sig00000001),
    .D(sig0000011a),
    .Q(sig00000197)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000024f (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000119),
    .Q(sig00000196)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000250 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000118),
    .Q(sig00000195)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000251 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000117),
    .Q(sig00000194)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000252 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000116),
    .Q(sig00000193)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000253 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig00000115),
    .Q(sig00000192)
  );
  LUT3 #(
    .INIT ( 8'hA9 ))
  blk00000254 (
    .I0(sig0000006c),
    .I1(sig00000003),
    .I2(sig0000006b),
    .O(sig00000004)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk00000255 (
    .I0(sig0000006c),
    .I1(sig00000003),
    .I2(sig0000006b),
    .O(sig00000039)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk00000256 (
    .I0(sig0000006c),
    .I1(sig00000003),
    .I2(sig0000006b),
    .O(sig00000007)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000257 (
    .I0(sig0000006b),
    .I1(sig00000003),
    .O(sig00000005)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000258 (
    .I0(sig000000e5),
    .I1(sig000000d9),
    .O(sig00000137)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000259 (
    .I0(sig000000dd),
    .I1(sig000000da),
    .O(sig00000130)
  );
  LUT3 #(
    .INIT ( 8'h9A ))
  blk0000025a (
    .I0(sig000000e4),
    .I1(sig000000d9),
    .I2(sig000000e5),
    .O(sig00000138)
  );
  LUT3 #(
    .INIT ( 8'h9A ))
  blk0000025b (
    .I0(sig000000dc),
    .I1(sig000000da),
    .I2(sig000000dd),
    .O(sig00000131)
  );
  LUT4 #(
    .INIT ( 16'hAA6A ))
  blk0000025c (
    .I0(sig000000e3),
    .I1(sig000000e4),
    .I2(sig000000e5),
    .I3(sig000000d9),
    .O(sig00000139)
  );
  LUT4 #(
    .INIT ( 16'hAA6A ))
  blk0000025d (
    .I0(sig000000db),
    .I1(sig000000dc),
    .I2(sig000000dd),
    .I3(sig000000da),
    .O(sig00000132)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000025e (
    .I0(sig000001ac),
    .I1(sig0000012b),
    .O(sig0000011d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000025f (
    .I0(sig000001ad),
    .I1(sig0000012b),
    .O(sig0000011e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000260 (
    .I0(sig000001ae),
    .I1(sig0000012b),
    .O(sig0000011f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000261 (
    .I0(sig000001af),
    .I1(sig0000012b),
    .O(sig00000120)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000262 (
    .I0(sig000001b0),
    .I1(sig0000012b),
    .O(sig00000121)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000263 (
    .I0(sig000001b1),
    .I1(sig0000012b),
    .O(sig00000122)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000264 (
    .I0(sig000001b2),
    .I1(sig0000012b),
    .O(sig00000123)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000265 (
    .I0(sig000001b3),
    .I1(sig0000012b),
    .O(sig00000124)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000266 (
    .I0(sig000001b4),
    .I1(sig0000012b),
    .O(sig00000125)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000267 (
    .I0(sig000001b5),
    .I1(sig0000012b),
    .O(sig00000126)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000268 (
    .I0(sig000001b6),
    .I1(sig0000012b),
    .O(sig00000127)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000269 (
    .I0(sig000001b7),
    .I1(sig0000012b),
    .O(sig00000128)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000026a (
    .I0(sig000001b8),
    .I1(sig0000012b),
    .O(sig00000129)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000026b (
    .I0(sig000001b9),
    .I1(sig0000012b),
    .O(sig0000012a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000026c (
    .I0(sig0000006d),
    .I1(sig00000079),
    .O(sig00000146)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000026d (
    .I0(sig00000077),
    .I1(sig00000079),
    .O(sig00000150)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000026e (
    .I0(sig00000078),
    .I1(sig00000079),
    .O(sig00000151)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000026f (
    .I0(sig0000006e),
    .I1(sig00000079),
    .O(sig00000147)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000270 (
    .I0(sig0000006f),
    .I1(sig00000079),
    .O(sig00000148)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000271 (
    .I0(sig00000070),
    .I1(sig00000079),
    .O(sig00000149)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000272 (
    .I0(sig00000071),
    .I1(sig00000079),
    .O(sig0000014a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000273 (
    .I0(sig00000072),
    .I1(sig00000079),
    .O(sig0000014b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000274 (
    .I0(sig00000073),
    .I1(sig00000079),
    .O(sig0000014c)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000275 (
    .I0(sig00000074),
    .I1(sig00000079),
    .O(sig0000014d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000276 (
    .I0(sig00000075),
    .I1(sig00000079),
    .O(sig0000014e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000277 (
    .I0(sig00000076),
    .I1(sig00000079),
    .O(sig0000014f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000278 (
    .I0(sig0000012b),
    .I1(sig000001ba),
    .O(sig00000114)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000279 (
    .I0(sig00000191),
    .I1(sig00000190),
    .O(sig000000e2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000027a (
    .I0(sig0000019b),
    .I1(sig0000019a),
    .O(sig000000ea)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000027b (
    .I0(sig0000012b),
    .I1(sig000001ba),
    .O(sig000000f4)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000027c (
    .I0(sig0000019c),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000105)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000027d (
    .I0(sig0000019d),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000106)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000027e (
    .I0(sig0000019e),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000107)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000027f (
    .I0(sig0000019f),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000108)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000280 (
    .I0(sig000001a0),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000109)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000281 (
    .I0(sig000001a1),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig0000010a)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000282 (
    .I0(sig000001a2),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig0000010b)
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  blk00000283 (
    .I0(sig000000e6),
    .I1(sig0000019b),
    .I2(sig0000019a),
    .I3(sig000000e9),
    .I4(sig000000e8),
    .I5(sig000000e7),
    .O(sig000000d9)
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  blk00000284 (
    .I0(sig000000de),
    .I1(sig00000191),
    .I2(sig00000190),
    .I3(sig000000e1),
    .I4(sig000000e0),
    .I5(sig000000df),
    .O(sig000000da)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk00000285 (
    .I0(sig000001a3),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig0000010c)
  );
  LUT5 #(
    .INIT ( 32'h6AAAAAAA ))
  blk00000286 (
    .I0(sig000000e7),
    .I1(sig0000019b),
    .I2(sig0000019a),
    .I3(sig000000e9),
    .I4(sig000000e8),
    .O(sig00000135)
  );
  LUT6 #(
    .INIT ( 64'h6AAAAAAAAAAAAAAA ))
  blk00000287 (
    .I0(sig000000e6),
    .I1(sig0000019b),
    .I2(sig0000019a),
    .I3(sig000000e9),
    .I4(sig000000e8),
    .I5(sig000000e7),
    .O(sig00000136)
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  blk00000288 (
    .I0(sig000000e8),
    .I1(sig0000019b),
    .I2(sig0000019a),
    .I3(sig000000e9),
    .O(sig00000134)
  );
  LUT5 #(
    .INIT ( 32'h6AAAAAAA ))
  blk00000289 (
    .I0(sig000000df),
    .I1(sig00000191),
    .I2(sig00000190),
    .I3(sig000000e1),
    .I4(sig000000e0),
    .O(sig0000012e)
  );
  LUT6 #(
    .INIT ( 64'h6AAAAAAAAAAAAAAA ))
  blk0000028a (
    .I0(sig000000de),
    .I1(sig00000191),
    .I2(sig00000190),
    .I3(sig000000e1),
    .I4(sig000000e0),
    .I5(sig000000df),
    .O(sig0000012f)
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  blk0000028b (
    .I0(sig000000e0),
    .I1(sig00000191),
    .I2(sig00000190),
    .I3(sig000000e1),
    .O(sig0000012d)
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  blk0000028c (
    .I0(sig000000e1),
    .I1(sig00000191),
    .I2(sig00000190),
    .O(sig0000012c)
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  blk0000028d (
    .I0(sig000000e9),
    .I1(sig0000019b),
    .I2(sig0000019a),
    .O(sig00000133)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000028e (
    .I0(sig0000006d),
    .I1(sig00000079),
    .O(sig0000013a)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000028f (
    .I0(sig00000077),
    .I1(sig00000079),
    .O(sig00000144)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000290 (
    .I0(sig00000078),
    .I1(sig00000079),
    .O(sig00000145)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000291 (
    .I0(sig0000006e),
    .I1(sig00000079),
    .O(sig0000013b)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000292 (
    .I0(sig0000006f),
    .I1(sig00000079),
    .O(sig0000013c)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000293 (
    .I0(sig00000070),
    .I1(sig00000079),
    .O(sig0000013d)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000294 (
    .I0(sig00000071),
    .I1(sig00000079),
    .O(sig0000013e)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000295 (
    .I0(sig00000072),
    .I1(sig00000079),
    .O(sig0000013f)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000296 (
    .I0(sig00000073),
    .I1(sig00000079),
    .O(sig00000140)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000297 (
    .I0(sig00000074),
    .I1(sig00000079),
    .O(sig00000141)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000298 (
    .I0(sig00000075),
    .I1(sig00000079),
    .O(sig00000142)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000299 (
    .I0(sig00000076),
    .I1(sig00000079),
    .O(sig00000143)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000029a (
    .I0(sig000001a4),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig0000010d)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000029b (
    .I0(sig000001a5),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig0000010e)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000029c (
    .I0(sig000001a6),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig0000010f)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000029d (
    .I0(sig000001a7),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000110)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000029e (
    .I0(sig000001a8),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000111)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000029f (
    .I0(sig000001a9),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000112)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk000002a0 (
    .I0(sig000001aa),
    .I1(sig0000012b),
    .I2(sig000001ba),
    .O(sig00000113)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000002a1 (
    .I0(sig000001ab),
    .O(sig000001bd)
  );
  INV   blk000002a2 (
    .I(sig00000003),
    .O(sig00000006)
  );
  RAMB36E1 #(
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0101010101010101010101010101010000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0101010101010101010101010101010101010101010101010101010101010101 ),
    .INIT_04 ( 256'h0101010101010101010101010101010101010101010101010101010101010101 ),
    .INIT_05 ( 256'h0202020202020202020202020202020202020202020202020202020202010101 ),
    .INIT_06 ( 256'h0202020202020202020202020202020202020202020202020202020202020202 ),
    .INIT_07 ( 256'h0303030303030303030303020202020202020202020202020202020202020202 ),
    .INIT_08 ( 256'h0303030303030303030303030303030303030303030303030303030303030303 ),
    .INIT_09 ( 256'h0303030303030303030303030303030303030303030303030303030303030303 ),
    .INIT_0A ( 256'h0404040404040404040404040404040404040404040404040403030303030303 ),
    .INIT_0B ( 256'h0404040404040404040404040404040404040404040404040404040404040404 ),
    .INIT_0C ( 256'h0505050505050504040404040404040404040404040404040404040404040404 ),
    .INIT_0D ( 256'h0505050505050505050505050505050505050505050505050505050505050505 ),
    .INIT_0E ( 256'h0505050505050505050505050505050505050505050505050505050505050505 ),
    .INIT_0F ( 256'h0606060606060606060606060606060606060606050505050505050505050505 ),
    .INIT_10 ( 256'h0606060606060606060606060606060606060606060606060606060606060606 ),
    .INIT_11 ( 256'h0706060606060606060606060606060606060606060606060606060606060606 ),
    .INIT_12 ( 256'h0707070707070707070707070707070707070707070707070707070707070707 ),
    .INIT_13 ( 256'h0707070707070707070707070707070707070707070707070707070707070707 ),
    .INIT_14 ( 256'h0808080808080808080808080807070707070707070707070707070707070707 ),
    .INIT_15 ( 256'h0808080808080808080808080808080808080808080808080808080808080808 ),
    .INIT_16 ( 256'h0808080808080808080808080808080808080808080808080808080808080808 ),
    .INIT_17 ( 256'h0909090909090909090909090909090909090909090909090908080808080808 ),
    .INIT_18 ( 256'h0909090909090909090909090909090909090909090909090909090909090909 ),
    .INIT_19 ( 256'h0A0A0A0909090909090909090909090909090909090909090909090909090909 ),
    .INIT_1A ( 256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A ),
    .INIT_1B ( 256'h0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A ),
    .INIT_1C ( 256'h0B0B0B0B0B0B0B0B0B0B0B0B0B0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A ),
    .INIT_1D ( 256'h0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B ),
    .INIT_1E ( 256'h0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B ),
    .INIT_1F ( 256'h0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B0B0B0B0B0B0B0B0B0B ),
    .INIT_20 ( 256'h0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C ),
    .INIT_21 ( 256'h0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C ),
    .INIT_22 ( 256'h0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0C0C0C ),
    .INIT_23 ( 256'h0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D ),
    .INIT_24 ( 256'h0E0E0E0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D ),
    .INIT_25 ( 256'h0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E ),
    .INIT_26 ( 256'h0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E ),
    .INIT_27 ( 256'h0F0F0F0F0F0F0F0F0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E ),
    .INIT_28 ( 256'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F ),
    .INIT_29 ( 256'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F ),
    .INIT_2A ( 256'h10101010101010101010100F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F ),
    .INIT_2B ( 256'h1010101010101010101010101010101010101010101010101010101010101010 ),
    .INIT_2C ( 256'h1010101010101010101010101010101010101010101010101010101010101010 ),
    .INIT_2D ( 256'h1111111111111111111111111010101010101010101010101010101010101010 ),
    .INIT_2E ( 256'h1111111111111111111111111111111111111111111111111111111111111111 ),
    .INIT_2F ( 256'h1111111111111111111111111111111111111111111111111111111111111111 ),
    .INIT_30 ( 256'h1212121212121212121211111111111111111111111111111111111111111111 ),
    .INIT_31 ( 256'h1212121212121212121212121212121212121212121212121212121212121212 ),
    .INIT_32 ( 256'h1212121212121212121212121212121212121212121212121212121212121212 ),
    .INIT_33 ( 256'h1313131313131212121212121212121212121212121212121212121212121212 ),
    .INIT_34 ( 256'h1313131313131313131313131313131313131313131313131313131313131313 ),
    .INIT_35 ( 256'h1313131313131313131313131313131313131313131313131313131313131313 ),
    .INIT_36 ( 256'h1313131313131313131313131313131313131313131313131313131313131313 ),
    .INIT_37 ( 256'h1414141414141414141414141414141414141414141414141414141414141414 ),
    .INIT_38 ( 256'h1414141414141414141414141414141414141414141414141414141414141414 ),
    .INIT_39 ( 256'h1414141414141414141414141414141414141414141414141414141414141414 ),
    .INIT_3A ( 256'h1515151515151515151515151515151515151515151414141414141414141414 ),
    .INIT_3B ( 256'h1515151515151515151515151515151515151515151515151515151515151515 ),
    .INIT_3C ( 256'h1515151515151515151515151515151515151515151515151515151515151515 ),
    .INIT_3D ( 256'h1616161616161615151515151515151515151515151515151515151515151515 ),
    .INIT_3E ( 256'h1616161616161616161616161616161616161616161616161616161616161616 ),
    .INIT_3F ( 256'h1616161616161616161616161616161616161616161616161616161616161616 ),
    .INIT_40 ( 256'h1616161616161616161616161616161616161616161616161616161616161616 ),
    .INIT_41 ( 256'h1717171717171717171717171717171717171717171616161616161616161616 ),
    .INIT_42 ( 256'h1717171717171717171717171717171717171717171717171717171717171717 ),
    .INIT_43 ( 256'h1717171717171717171717171717171717171717171717171717171717171717 ),
    .INIT_44 ( 256'h1717171717171717171717171717171717171717171717171717171717171717 ),
    .INIT_45 ( 256'h1818181818181818181818181818181818181818181818181818181818171717 ),
    .INIT_46 ( 256'h1818181818181818181818181818181818181818181818181818181818181818 ),
    .INIT_47 ( 256'h1818181818181818181818181818181818181818181818181818181818181818 ),
    .INIT_48 ( 256'h1818181818181818181818181818181818181818181818181818181818181818 ),
    .INIT_49 ( 256'h1919191919191919191919191919191919191919191919191919191919191818 ),
    .INIT_4A ( 256'h1919191919191919191919191919191919191919191919191919191919191919 ),
    .INIT_4B ( 256'h1919191919191919191919191919191919191919191919191919191919191919 ),
    .INIT_4C ( 256'h1919191919191919191919191919191919191919191919191919191919191919 ),
    .INIT_4D ( 256'h1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A191919191919191919 ),
    .INIT_4E ( 256'h1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A ),
    .INIT_4F ( 256'h1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A ),
    .INIT_50 ( 256'h1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A ),
    .INIT_51 ( 256'h1B1B1B1B1B1B1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A ),
    .INIT_52 ( 256'h1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B ),
    .INIT_53 ( 256'h1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B ),
    .INIT_54 ( 256'h1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B ),
    .INIT_55 ( 256'h1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B ),
    .INIT_56 ( 256'h1C1C1C1C1C1C1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B ),
    .INIT_57 ( 256'h1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C ),
    .INIT_58 ( 256'h1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C ),
    .INIT_59 ( 256'h1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C ),
    .INIT_5A ( 256'h1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C ),
    .INIT_5B ( 256'h1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C ),
    .INIT_5C ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1C1C1C1C1C1C1C1C1C1C1C1C1C1C ),
    .INIT_5D ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D ),
    .INIT_5E ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D ),
    .INIT_5F ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D ),
    .INIT_60 ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D ),
    .INIT_61 ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D ),
    .INIT_62 ( 256'h1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D ),
    .INIT_63 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D ),
    .INIT_64 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_65 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_66 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_67 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_68 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_69 ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_6A ( 256'h1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_6B ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E ),
    .INIT_6C ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_6D ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_6E ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_6F ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_70 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_71 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_72 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_73 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_74 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_75 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_76 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_77 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_78 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_79 ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_7A ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_7B ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_7C ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_7D ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_7E ( 256'h1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_7F ( 256'h20202020202020202020202020202020202020201F1F1F1F1F1F1F1F1F1F1F1F ),
    .INIT_A ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .READ_WIDTH_A ( 9 ),
    .READ_WIDTH_B ( 9 ),
    .WRITE_WIDTH_A ( 9 ),
    .WRITE_WIDTH_B ( 0 ),
    .EN_ECC_READ ( "FALSE" ),
    .EN_ECC_WRITE ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_B ( 36'h000000000 ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "TDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .RSTREG_PRIORITY_A ( "RSTREG" ),
    .RSTREG_PRIORITY_B ( "RSTREG" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .INIT_FILE ( "NONE" ))
  blk000002a3 (
    .CASCADEINA(NLW_blk000002a3_CASCADEINA_UNCONNECTED),
    .CASCADEINB(NLW_blk000002a3_CASCADEINB_UNCONNECTED),
    .CASCADEOUTA(NLW_blk000002a3_CASCADEOUTA_UNCONNECTED),
    .CASCADEOUTB(NLW_blk000002a3_CASCADEOUTB_UNCONNECTED),
    .CLKARDCLK(aclk),
    .CLKBWRCLK(aclk),
    .DBITERR(NLW_blk000002a3_DBITERR_UNCONNECTED),
    .ENARDEN(sig00000001),
    .ENBWREN(sig00000001),
    .INJECTDBITERR(NLW_blk000002a3_INJECTDBITERR_UNCONNECTED),
    .INJECTSBITERR(NLW_blk000002a3_INJECTSBITERR_UNCONNECTED),
    .REGCEAREGCE(sig00000001),
    .REGCEB(sig00000001),
    .RSTRAMARSTRAM(sig00000002),
    .RSTRAMB(sig00000002),
    .RSTREGARSTREG(sig00000002),
    .RSTREGB(sig00000002),
    .SBITERR(NLW_blk000002a3_SBITERR_UNCONNECTED),
    .ADDRARDADDR({sig00000001, sig0000015d, sig0000015c, sig0000015b, sig0000015a, sig00000159, sig00000158, sig00000157, sig00000156, sig00000155, 
sig00000154, sig00000153, sig00000152, sig00000001, sig00000001, sig00000001}),
    .ADDRBWRADDR({sig00000001, sig00000187, sig00000186, sig00000185, sig00000184, sig00000183, sig00000182, sig00000181, sig00000180, sig0000017f, 
sig0000017e, sig0000017d, sig0000017c, sig00000001, sig00000001, sig00000001}),
    .DIADI({\NLW_blk000002a3_DIADI<31>_UNCONNECTED , \NLW_blk000002a3_DIADI<30>_UNCONNECTED , \NLW_blk000002a3_DIADI<29>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<28>_UNCONNECTED , \NLW_blk000002a3_DIADI<27>_UNCONNECTED , \NLW_blk000002a3_DIADI<26>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<25>_UNCONNECTED , \NLW_blk000002a3_DIADI<24>_UNCONNECTED , \NLW_blk000002a3_DIADI<23>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<22>_UNCONNECTED , \NLW_blk000002a3_DIADI<21>_UNCONNECTED , \NLW_blk000002a3_DIADI<20>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<19>_UNCONNECTED , \NLW_blk000002a3_DIADI<18>_UNCONNECTED , \NLW_blk000002a3_DIADI<17>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<16>_UNCONNECTED , \NLW_blk000002a3_DIADI<15>_UNCONNECTED , \NLW_blk000002a3_DIADI<14>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<13>_UNCONNECTED , \NLW_blk000002a3_DIADI<12>_UNCONNECTED , \NLW_blk000002a3_DIADI<11>_UNCONNECTED , 
\NLW_blk000002a3_DIADI<10>_UNCONNECTED , \NLW_blk000002a3_DIADI<9>_UNCONNECTED , \NLW_blk000002a3_DIADI<8>_UNCONNECTED , sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIBDI({\NLW_blk000002a3_DIBDI<31>_UNCONNECTED , \NLW_blk000002a3_DIBDI<30>_UNCONNECTED , \NLW_blk000002a3_DIBDI<29>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<28>_UNCONNECTED , \NLW_blk000002a3_DIBDI<27>_UNCONNECTED , \NLW_blk000002a3_DIBDI<26>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<25>_UNCONNECTED , \NLW_blk000002a3_DIBDI<24>_UNCONNECTED , \NLW_blk000002a3_DIBDI<23>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<22>_UNCONNECTED , \NLW_blk000002a3_DIBDI<21>_UNCONNECTED , \NLW_blk000002a3_DIBDI<20>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<19>_UNCONNECTED , \NLW_blk000002a3_DIBDI<18>_UNCONNECTED , \NLW_blk000002a3_DIBDI<17>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<16>_UNCONNECTED , \NLW_blk000002a3_DIBDI<15>_UNCONNECTED , \NLW_blk000002a3_DIBDI<14>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<13>_UNCONNECTED , \NLW_blk000002a3_DIBDI<12>_UNCONNECTED , \NLW_blk000002a3_DIBDI<11>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<10>_UNCONNECTED , \NLW_blk000002a3_DIBDI<9>_UNCONNECTED , \NLW_blk000002a3_DIBDI<8>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<7>_UNCONNECTED , \NLW_blk000002a3_DIBDI<6>_UNCONNECTED , \NLW_blk000002a3_DIBDI<5>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<4>_UNCONNECTED , \NLW_blk000002a3_DIBDI<3>_UNCONNECTED , \NLW_blk000002a3_DIBDI<2>_UNCONNECTED , 
\NLW_blk000002a3_DIBDI<1>_UNCONNECTED , \NLW_blk000002a3_DIBDI<0>_UNCONNECTED }),
    .DIPADIP({\NLW_blk000002a3_DIPADIP<3>_UNCONNECTED , \NLW_blk000002a3_DIPADIP<2>_UNCONNECTED , \NLW_blk000002a3_DIPADIP<1>_UNCONNECTED , 
sig00000002}),
    .DIPBDIP({\NLW_blk000002a3_DIPBDIP<3>_UNCONNECTED , \NLW_blk000002a3_DIPBDIP<2>_UNCONNECTED , \NLW_blk000002a3_DIPBDIP<1>_UNCONNECTED , 
\NLW_blk000002a3_DIPBDIP<0>_UNCONNECTED }),
    .DOADO({\NLW_blk000002a3_DOADO<31>_UNCONNECTED , \NLW_blk000002a3_DOADO<30>_UNCONNECTED , \NLW_blk000002a3_DOADO<29>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<28>_UNCONNECTED , \NLW_blk000002a3_DOADO<27>_UNCONNECTED , \NLW_blk000002a3_DOADO<26>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<25>_UNCONNECTED , \NLW_blk000002a3_DOADO<24>_UNCONNECTED , \NLW_blk000002a3_DOADO<23>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<22>_UNCONNECTED , \NLW_blk000002a3_DOADO<21>_UNCONNECTED , \NLW_blk000002a3_DOADO<20>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<19>_UNCONNECTED , \NLW_blk000002a3_DOADO<18>_UNCONNECTED , \NLW_blk000002a3_DOADO<17>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<16>_UNCONNECTED , \NLW_blk000002a3_DOADO<15>_UNCONNECTED , \NLW_blk000002a3_DOADO<14>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<13>_UNCONNECTED , \NLW_blk000002a3_DOADO<12>_UNCONNECTED , \NLW_blk000002a3_DOADO<11>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<10>_UNCONNECTED , \NLW_blk000002a3_DOADO<9>_UNCONNECTED , \NLW_blk000002a3_DOADO<8>_UNCONNECTED , 
\NLW_blk000002a3_DOADO<7>_UNCONNECTED , \NLW_blk000002a3_DOADO<6>_UNCONNECTED , sig0000017b, sig0000017a, sig00000179, sig00000178, sig00000177, 
sig00000176}),
    .DOBDO({\NLW_blk000002a3_DOBDO<31>_UNCONNECTED , \NLW_blk000002a3_DOBDO<30>_UNCONNECTED , \NLW_blk000002a3_DOBDO<29>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<28>_UNCONNECTED , \NLW_blk000002a3_DOBDO<27>_UNCONNECTED , \NLW_blk000002a3_DOBDO<26>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<25>_UNCONNECTED , \NLW_blk000002a3_DOBDO<24>_UNCONNECTED , \NLW_blk000002a3_DOBDO<23>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<22>_UNCONNECTED , \NLW_blk000002a3_DOBDO<21>_UNCONNECTED , \NLW_blk000002a3_DOBDO<20>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<19>_UNCONNECTED , \NLW_blk000002a3_DOBDO<18>_UNCONNECTED , \NLW_blk000002a3_DOBDO<17>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<16>_UNCONNECTED , \NLW_blk000002a3_DOBDO<15>_UNCONNECTED , \NLW_blk000002a3_DOBDO<14>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<13>_UNCONNECTED , \NLW_blk000002a3_DOBDO<12>_UNCONNECTED , \NLW_blk000002a3_DOBDO<11>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<10>_UNCONNECTED , \NLW_blk000002a3_DOBDO<9>_UNCONNECTED , \NLW_blk000002a3_DOBDO<8>_UNCONNECTED , 
\NLW_blk000002a3_DOBDO<7>_UNCONNECTED , \NLW_blk000002a3_DOBDO<6>_UNCONNECTED , sig0000016c, sig0000016b, sig0000016a, sig00000169, sig00000168, 
sig00000167}),
    .DOPADOP({\NLW_blk000002a3_DOPADOP<3>_UNCONNECTED , \NLW_blk000002a3_DOPADOP<2>_UNCONNECTED , \NLW_blk000002a3_DOPADOP<1>_UNCONNECTED , 
\NLW_blk000002a3_DOPADOP<0>_UNCONNECTED }),
    .DOPBDOP({\NLW_blk000002a3_DOPBDOP<3>_UNCONNECTED , \NLW_blk000002a3_DOPBDOP<2>_UNCONNECTED , \NLW_blk000002a3_DOPBDOP<1>_UNCONNECTED , 
\NLW_blk000002a3_DOPBDOP<0>_UNCONNECTED }),
    .ECCPARITY({\NLW_blk000002a3_ECCPARITY<7>_UNCONNECTED , \NLW_blk000002a3_ECCPARITY<6>_UNCONNECTED , \NLW_blk000002a3_ECCPARITY<5>_UNCONNECTED , 
\NLW_blk000002a3_ECCPARITY<4>_UNCONNECTED , \NLW_blk000002a3_ECCPARITY<3>_UNCONNECTED , \NLW_blk000002a3_ECCPARITY<2>_UNCONNECTED , 
\NLW_blk000002a3_ECCPARITY<1>_UNCONNECTED , \NLW_blk000002a3_ECCPARITY<0>_UNCONNECTED }),
    .RDADDRECC({\NLW_blk000002a3_RDADDRECC<8>_UNCONNECTED , \NLW_blk000002a3_RDADDRECC<7>_UNCONNECTED , \NLW_blk000002a3_RDADDRECC<6>_UNCONNECTED , 
\NLW_blk000002a3_RDADDRECC<5>_UNCONNECTED , \NLW_blk000002a3_RDADDRECC<4>_UNCONNECTED , \NLW_blk000002a3_RDADDRECC<3>_UNCONNECTED , 
\NLW_blk000002a3_RDADDRECC<2>_UNCONNECTED , \NLW_blk000002a3_RDADDRECC<1>_UNCONNECTED , \NLW_blk000002a3_RDADDRECC<0>_UNCONNECTED }),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .WEBWE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  RAMB36E1 #(
    .INITP_00 ( 256'h001FFFFFFFFFF00000000007FFFFFFFFFC0000000001FFFFFFFFFE0000000000 ),
    .INITP_01 ( 256'h00000FFFFFFFFFFC0000000001FFFFFFFFFF00000000007FFFFFFFFFC0000000 ),
    .INITP_02 ( 256'h0000007FFFFFFFFFE00000000007FFFFFFFFFE00000000007FFFFFFFFFE00000 ),
    .INITP_03 ( 256'h000003FFFFFFFFFFC00000000007FFFFFFFFFF00000000001FFFFFFFFFFC0000 ),
    .INITP_04 ( 256'h00FFFFFFFFFFFC00000000001FFFFFFFFFFF000000000007FFFFFFFFFFC00000 ),
    .INITP_05 ( 256'hFFFFFFE000000000000FFFFFFFFFFFE000000000001FFFFFFFFFFFC000000000 ),
    .INITP_06 ( 256'h00000000FFFFFFFFFFFFE0000000000003FFFFFFFFFFFF8000000000003FFFFF ),
    .INITP_07 ( 256'hFFFE00000000000001FFFFFFFFFFFFFE00000000000007FFFFFFFFFFFFE00000 ),
    .INITP_08 ( 256'hFFFFFFFC0000000000000007FFFFFFFFFFFFFFC000000000000007FFFFFFFFFF ),
    .INITP_09 ( 256'hFFFF000000000000000001FFFFFFFFFFFFFFFFF00000000000000003FFFFFFFF ),
    .INITP_0A ( 256'h0000000003FFFFFFFFFFFFFFFFFFFF00000000000000000003FFFFFFFFFFFFFF ),
    .INITP_0B ( 256'hFFFC0000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFE000000000000 ),
    .INITP_0C ( 256'hFFFFFFFFC0000000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFF ),
    .INITP_0D ( 256'h000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INITP_0E ( 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC000000000000 ),
    .INITP_0F ( 256'h00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_00 ( 256'hC6C0B9B3ADA7A09A948D87817B746E68615B554F48423C352F29231C16100903 ),
    .INIT_01 ( 256'h8F89827C767069635D56504A443D37312A241E18110B05FEF8F2ECE5DFD9D2CC ),
    .INIT_02 ( 256'h58524B453F39322C261F19130D0600FAF3EDE7E1DAD4CEC7C1BBB5AEA8A29C95 ),
    .INIT_03 ( 256'h211B140E0801FBF5EFE8E2DCD5CFC9C3BCB6B0AAA39D97908A847E77716B645E ),
    .INIT_04 ( 256'hEAE3DDD7D0CAC4BEB7B1ABA59E98928B857F79726C666059534D46403A342D27 ),
    .INIT_05 ( 256'hB2ACA69F99938D86807A736D67615A544E48413B352F28221C150F0903FCF6F0 ),
    .INIT_06 ( 256'h7B746E68625B554F48423C362F29231D16100A04FDF7F1EBE4DED8D1CBC5BFB8 ),
    .INIT_07 ( 256'h433D36302A241D17110A04FEF8F1EBE5DFD8D2CCC6BFB9B3ADA6A09A948D8781 ),
    .INIT_08 ( 256'h0B05FEF8F2ECE5DFD9D3CCC6C0BAB3ADA7A19A948E88817B756F68625C564F49 ),
    .INIT_09 ( 256'hD2CCC6C0BAB3ADA7A19A948E88817B756F68625C564F49433D36302A241D1711 ),
    .INIT_0A ( 256'h9A948D87817B746E68625C554F49433C36302A241D17110B04FEF8F2EBE5DFD9 ),
    .INIT_0B ( 256'h615B544E48423C352F29231D16100A04FDF7F1EBE5DED8D2CCC5BFB9B3ADA6A0 ),
    .INIT_0C ( 256'h28211B150F0902FCF6F0EAE3DDD7D1CBC4BEB8B2ABA59F99938C86807A746D67 ),
    .INIT_0D ( 256'hEEE8E2DBD5CFC9C3BCB6B0AAA49D97918B857E78726C665F59534D47403A342E ),
    .INIT_0E ( 256'hB4AEA7A19B958F89827C76706A635D57514B453E38322C261F19130D0701FAF4 ),
    .INIT_0F ( 256'h79736D67615A544E48423C352F29231D17100A04FEF8F2EBE5DFD9D3CDC6C0BA ),
    .INIT_10 ( 256'h3E38322C261F19130D0701FBF4EEE8E2DCD6D0C9C3BDB7B1ABA49E98928C867F ),
    .INIT_11 ( 256'h03FDF6F0EAE4DED8D2CBC5BFB9B3ADA7A19A948E88827C766F69635D57514B44 ),
    .INIT_12 ( 256'hC7C0BAB4AEA8A29C969089837D77716B655F58524C46403A342E27211B150F09 ),
    .INIT_13 ( 256'h8A847E78726B655F59534D47413B352E28221C16100A04FEF7F1EBE5DFD9D3CD ),
    .INIT_14 ( 256'h4D47413A342E28221C16100A04FEF8F1EBE5DFD9D3CDC7C1BBB5AFA8A29C9690 ),
    .INIT_15 ( 256'h0F0903FDF7F1EAE4DED8D2CCC6C0BAB4AEA8A29C968F89837D77716B655F5953 ),
    .INIT_16 ( 256'hD0CAC4BEB8B2ACA6A09A948E88827C76706A645D57514B453F39332D27211B15 ),
    .INIT_17 ( 256'h918B857F79736D67615B554F49433D37312B251F19130D0701FAF4EEE8E2DCD6 ),
    .INIT_18 ( 256'h514B453F39332D27211B150F0903FDF7F1EBE5DFD9D3CDC7C1BBB5AFA9A39D97 ),
    .INIT_19 ( 256'h100A04FEF9F3EDE7E1DBD5CFC9C3BDB7B1ABA59F99938D87817B756F69635D57 ),
    .INIT_1A ( 256'hCFC9C3BDB7B1ABA59F99938E88827C76706A645E58524C46403A342E28221C16 ),
    .INIT_1B ( 256'h8D87817B756F69635D57514C46403A342E28221C16100A04FEF8F3EDE7E1DBD5 ),
    .INIT_1C ( 256'h4A443E38322C26201A150F0903FDF7F1EBE5DFD9D4CEC8C2BCB6B0AAA49E9893 ),
    .INIT_1D ( 256'h0600FAF4EEE8E2DDD7D1CBC5BFB9B3AEA8A29C96908A847F79736D67615B554F ),
    .INIT_1E ( 256'hC1BBB5AFA9A49E98928C86817B756F69635D58524C46403A342F29231D17110B ),
    .INIT_1F ( 256'h7B756F6A645E58524D47413B352F2A241E18120D0701FBF5EFEAE4DED8D2CCC7 ),
    .INIT_20 ( 256'h342F29231D17120C0600FAF5EFE9E3DED8D2CCC6C1BBB5AFA9A49E98928C8781 ),
    .INIT_21 ( 256'hEDE7E1DBD6D0CAC4BFB9B3ADA8A29C96918B857F7A746E68625D57514B46403A ),
    .INIT_22 ( 256'hA49E98938D87827C76706B655F5A544E48433D37312C26201B150F0904FEF8F2 ),
    .INIT_23 ( 256'h5A554F49433E38322D27211C16100B05FFFAF4EEE8E3DDD7D2CCC6C0BBB5AFAA ),
    .INIT_24 ( 256'h0F0A04FFF9F3EEE8E2DDD7D1CCC6C0BBB5AFAAA49E99938D88827C77716B6660 ),
    .INIT_25 ( 256'hC4BEB8B3ADA8A29C97918B86807B756F6A645E59534E48423D37312C26201B15 ),
    .INIT_26 ( 256'h77716C66605B55504A443F39342E28231D18120D0701FCF6F0EBE5E0DAD4CFC9 ),
    .INIT_27 ( 256'h29231E18120D0702FCF7F1ECE6E0DBD5D0CAC5BFBAB4AEA9A39E98938D87827C ),
    .INIT_28 ( 256'hD9D4CEC9C3BEB8B3ADA8A29D97928C87817C76716B65605A554F4A443F39342E ),
    .INIT_29 ( 256'h89837E79736E68635D58524D47423C37312C26211B16100B0500FAF5EFEAE4DF ),
    .INIT_2A ( 256'h37322C27221C17110C0601FBF6F1EBE6E0DBD5D0CAC5C0BAB5AFAAA49F99948E ),
    .INIT_2B ( 256'hE4DFDAD4CFC9C4BFB9B4AEA9A49E99938E89837E78736D68635D58524D48423D ),
    .INIT_2C ( 256'h908B86807B75706B65605B55504B45403A35302A25201A150F0A05FFFAF5EFEA ),
    .INIT_2D ( 256'h3B35302B26201B16100B0600FBF6F0EBE6E0DBD6D0CBC6C0BBB6B0ABA6A09B96 ),
    .INIT_2E ( 256'hE4DFD9D4CFCAC4BFBAB5AFAAA59F9A95908A85807A75706A65605B55504B4540 ),
    .INIT_2F ( 256'h8C87817C77726C67625D58524D48433D38332E28231E19130E0904FEF9F4EFE9 ),
    .INIT_30 ( 256'h322D28231E18130E0904FEF9F4EFEAE4DFDAD5D0CAC5C0BBB6B0ABA6A19C9691 ),
    .INIT_31 ( 256'hD7D2CDC8C3BEB9B3AEA9A49F9A958F8A85807B76706B66615C57514C47423D38 ),
    .INIT_32 ( 256'h7B76716C67625D57524D48433E39342F29241F1A15100B0601FBF6F1ECE7E2DD ),
    .INIT_33 ( 256'h1D18130E0904FFFAF5F0EBE6E1DCD7D2CCC7C2BDB8B3AEA9A49F9A95908A8580 ),
    .INIT_34 ( 256'hBEB9B4AFAAA5A09B96918C87827D78736E69645F5A55504B46413C37322D2822 ),
    .INIT_35 ( 256'h5D59544F4A45403B36312C27221D18130E0904FFFAF5F0EBE6E1DCD7D2CDC8C3 ),
    .INIT_36 ( 256'hFBF6F1EDE8E3DED9D4CFCAC5C0BBB6B1ADA8A39E99948F8A85807B76716C6762 ),
    .INIT_37 ( 256'h97938E89847F7A75716C67625D58534E4A45403B36312C27221E19140F0A0500 ),
    .INIT_38 ( 256'h322D29241F1A15100C0702FDF8F3EFEAE5E0DBD6D2CDC8C3BEB9B5B0ABA6A19C ),
    .INIT_39 ( 256'hCBC6C2BDB8B3AFAAA5A09C97928D88847F7A75716C67625D59544F4A45413C37 ),
    .INIT_3A ( 256'h635E5955504B46423D38342F2A25211C17120E0904FFFBF6F1ECE8E3DED9D5D0 ),
    .INIT_3B ( 256'hF8F4EFEBE6E1DDD8D3CFCAC5C1BCB7B2AEA9A4A09B96928D88847F7A75716C67 ),
    .INIT_3C ( 256'h8D88837F7A76716C68635F5A55514C47433E3A35302C27221E1914100B0602FD ),
    .INIT_3D ( 256'h1F1B16110D0804FFFBF6F2EDE8E4DFDBD6D2CDC8C4BFBBB6B1ADA8A49F9A9691 ),
    .INIT_3E ( 256'hB0ABA7A29E9995908C87837E7A75716C68635F5A56514D48443F3A36312D2824 ),
    .INIT_3F ( 256'h3F3B36322D2924201B17120E0A0501FCF8F3EFEAE6E1DDD8D4CFCBC6C2BDB9B4 ),
    .INIT_40 ( 256'hCCC8C4BFBBB6B2AEA9A5A09C98938F8A86817D7974706B67635E5A55514C4843 ),
    .INIT_41 ( 256'h58544F4B47423E3A35312C28241F1B17120E0A0501FDF8F4EFEBE7E2DED9D5D1 ),
    .INIT_42 ( 256'hE2DDD9D5D1CCC8C4BFBBB7B3AEAAA6A19D9994908C87837F7B76726E6965615C ),
    .INIT_43 ( 256'h6A65615D5955504C48443F3B37332E2A26221D1915110C080400FBF7F3EEEAE6 ),
    .INIT_44 ( 256'hF0ECE7E3DFDBD7D3CECAC6C2BEB9B5B1ADA9A5A09C9894908B87837F7B76726E ),
    .INIT_45 ( 256'h74706C6864605B57534F4B47433F3A36322E2A26221D1915110D090500FCF8F4 ),
    .INIT_46 ( 256'hF6F2EEEAE6E2DEDAD6D2CECAC6C2BEBAB6B1ADA9A5A19D9995918D8984807C78 ),
    .INIT_47 ( 256'h77736F6B67635F5B57534F4B47433F3B37332F2B27231F1B17130F0B0703FFFB ),
    .INIT_48 ( 256'hF6F2EEEAE6E2DEDAD6D2CECAC6C2BEBBB7B3AFABA7A39F9B97938F8B87837F7B ),
    .INIT_49 ( 256'h726E6B67635F5B57534F4C4844403C3834302C2925211D1915110D090501FDFA ),
    .INIT_4A ( 256'hEDE9E5E2DEDAD6D2CFCBC7C3BFBBB8B4B0ACA8A4A19D9995918D8A86827E7A76 ),
    .INIT_4B ( 256'h66625E5B57534F4C4844403D3935312E2A26221E1B17130F0B080400FCF8F5F1 ),
    .INIT_4C ( 256'hDDD9D5D2CECAC7C3BFBBB8B4B0ADA9A5A29E9A96938F8B8784807C7975716D6A ),
    .INIT_4D ( 256'h524E4A47433F3C3834312D2A26221F1B1714100C090501FEFAF6F3EFEBE8E4E0 ),
    .INIT_4E ( 256'hC4C1BDBAB6B2AFABA8A4A19D9996928F8B8884807D7976726E6B6764605C5955 ),
    .INIT_4F ( 256'h35322E2B2724201D1916120F0B070400FDF9F6F2EFEBE8E4E1DDDAD6D3CFCBC8 ),
    .INIT_50 ( 256'hA4A09D9996938F8C8885817E7A7774706D6966625F5B5854514D4A4643403C39 ),
    .INIT_51 ( 256'h100D0A060300FCF9F5F2EFEBE8E5E1DEDAD7D4D0CDC9C6C3BFBCB8B5B1AEABA7 ),
    .INIT_52 ( 256'h7B7874716E6A6764615D5A5753504D4946433F3C3935322F2B2825211E1A1714 ),
    .INIT_53 ( 256'hE3E0DDDAD6D3D0CDC9C6C3C0BCB9B6B3AFACA9A6A29F9C9995928F8B8885827E ),
    .INIT_54 ( 256'h4A4743403D3A3734302D2A2724201D1A1714100D0A070400FDFAF7F4F0EDEAE7 ),
    .INIT_55 ( 256'hAEABA8A5A29E9B9895928F8C8986827F7C797673706C696663605D5A5653504D ),
    .INIT_56 ( 256'h100D0A070401FEFBF8F5F2EFEBE8E5E2DFDCD9D6D3D0CDCAC7C4C1BDBAB7B4B1 ),
    .INIT_57 ( 256'h706D6A6764615E5B5855524F4C494643403D3A3734312E2B2825221F1C191613 ),
    .INIT_58 ( 256'hCECBC8C5C2BFBCB9B6B4B1AEABA8A5A29F9C999693908D8A8885827F7C797673 ),
    .INIT_59 ( 256'h292624211E1B181512100D0A070401FFFCF9F6F3F0EDEAE8E5E2DFDCD9D6D3D1 ),
    .INIT_5A ( 256'h83807D7A7775726F6C6A6764615E5C595653514E4B484543403D3A3734322F2C ),
    .INIT_5B ( 256'hDAD7D4D2CFCCC9C7C4C1BFBCB9B6B4B1AEACA9A6A3A19E9B989693908E8B8885 ),
    .INIT_5C ( 256'h2E2C292724211F1C191714120F0C0A070402FFFCFAF7F4F2EFECEAE7E4E2DFDC ),
    .INIT_5D ( 256'h817F7C797774726F6D6A686562605D5B585653504E4B494643413E3C39363431 ),
    .INIT_5E ( 256'hD2CFCDCAC8C5C3C0BEBBB9B6B4B1AFACAAA7A5A2A09D9B989593908E8B898684 ),
    .INIT_5F ( 256'h201D1B181614110F0C0A07050300FEFBF9F6F4F2EFEDEAE8E5E3E0DEDBD9D6D4 ),
    .INIT_60 ( 256'h6B69676462605D5B595654524F4D4B484643413F3C3A383533302E2C29272422 ),
    .INIT_61 ( 256'hB5B3B0AEACAAA7A5A3A19E9C9A979593918E8C8A878583807E7C79777572706E ),
    .INIT_62 ( 256'hFCFAF8F6F3F1EFEDEBE8E6E4E2E0DDDBD9D7D4D2D0CECCC9C7C5C3C0BEBCBAB7 ),
    .INIT_63 ( 256'h413F3D3B39373432302E2C2A282523211F1D1B19161412100E0C0907050301FE ),
    .INIT_64 ( 256'h8482807E7C7A777573716F6D6B69676563615F5D5A58565452504E4C4A484543 ),
    .INIT_65 ( 256'hC4C2C0BEBCBAB8B6B4B2B0AEACAAA8A6A4A2A09E9C9A98969492908E8C8A8886 ),
    .INIT_66 ( 256'h0200FEFCFAF8F7F5F3F1EFEDEBE9E7E5E3E1DFDEDCDAD8D6D4D2D0CECCCAC8C6 ),
    .INIT_67 ( 256'h3E3C3A38363433312F2D2B2928262422201E1C1B19171513110F0D0B0A080604 ),
    .INIT_68 ( 256'h77757372706E6C6B6967656362605E5C5B5957555352504E4C4A49474543413F ),
    .INIT_69 ( 256'hAEACAAA9A7A5A4A2A09E9D9B9998969493918F8D8C8A8886858381807E7C7A79 ),
    .INIT_6A ( 256'hE2E1DFDDDCDAD8D7D5D4D2D0CFCDCBCAC8C7C5C3C2C0BEBDBBB9B8B6B4B3B1AF ),
    .INIT_6B ( 256'h141311100E0D0B09080605030200FFFDFBFAF8F7F5F4F2F0EFEDECEAE9E7E5E4 ),
    .INIT_6C ( 256'h444241403E3D3B3A3837353432312F2E2C2B292826252322201F1D1C1A191716 ),
    .INIT_6D ( 256'h71706E6D6C6A696866656362615F5E5C5B595857555452514F4E4D4B4A484745 ),
    .INIT_6E ( 256'h9C9B99989796949392908F8E8C8B8A888786848382807F7E7C7B797877757473 ),
    .INIT_6F ( 256'hC5C3C2C1C0BEBDBCBBB9B8B7B6B4B3B2B1AFAEADACAAA9A8A6A5A4A3A1A09F9D ),
    .INIT_70 ( 256'hEBE9E8E7E6E5E4E3E1E0DFDEDDDBDAD9D8D7D6D4D3D2D1D0CECDCCCBC9C8C7C6 ),
    .INIT_71 ( 256'h0E0D0C0B0A090807060403020100FFFEFDFCFBF9F8F7F6F5F4F3F1F0EFEEEDEC ),
    .INIT_72 ( 256'h2F2E2D2C2B2A292827262524232221201F1E1D1C1B1A1918171615141311100F ),
    .INIT_73 ( 256'h4E4D4C4B4A4A494847464544434241403F3E3D3C3B3A39383736353433323130 ),
    .INIT_74 ( 256'h6B6A69686766656564636261605F5E5E5D5C5B5A59585756565554535251504F ),
    .INIT_75 ( 256'h848483828181807F7E7D7D7C7B7A797978777675757473727170706F6E6D6C6B ),
    .INIT_76 ( 256'h9C9B9A9A99989897969595949393929190908F8E8D8D8C8B8A8A898887878685 ),
    .INIT_77 ( 256'hB1B0B0AFAEAEADACACABABAAA9A9A8A7A7A6A5A5A4A3A3A2A1A1A09F9F9E9D9D ),
    .INIT_78 ( 256'hC3C3C2C2C1C1C0BFBFBEBEBDBDBCBCBBBABAB9B9B8B7B7B6B6B5B4B4B3B3B2B1 ),
    .INIT_79 ( 256'hD3D3D2D2D2D1D1D0D0CFCFCECECDCDCCCCCBCBCACAC9C9C8C8C7C7C6C5C5C4C4 ),
    .INIT_7A ( 256'hE1E1E0E0DFDFDFDEDEDDDDDDDCDCDBDBDADADAD9D9D8D8D7D7D7D6D6D5D5D4D4 ),
    .INIT_7B ( 256'hECECEBEBEBEBEAEAEAE9E9E9E8E8E8E7E7E7E6E6E5E5E5E4E4E4E3E3E3E2E2E1 ),
    .INIT_7C ( 256'hF5F5F4F4F4F4F3F3F3F3F2F2F2F2F1F1F1F0F0F0F0EFEFEFEFEEEEEEEDEDEDEC ),
    .INIT_7D ( 256'hFBFBFBFBFAFAFAFAFAF9F9F9F9F9F9F8F8F8F8F8F7F7F7F7F7F6F6F6F6F5F5F5 ),
    .INIT_7E ( 256'hFFFFFFFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFCFCFCFCFCFCFCFBFBFB ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .DOA_REG ( 1 ),
    .DOB_REG ( 1 ),
    .READ_WIDTH_A ( 9 ),
    .READ_WIDTH_B ( 9 ),
    .WRITE_WIDTH_A ( 9 ),
    .WRITE_WIDTH_B ( 0 ),
    .EN_ECC_READ ( "FALSE" ),
    .EN_ECC_WRITE ( "FALSE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "TDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .RSTREG_PRIORITY_A ( "RSTREG" ),
    .RSTREG_PRIORITY_B ( "RSTREG" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .INIT_FILE ( "NONE" ))
  blk000002a4 (
    .CASCADEINA(NLW_blk000002a4_CASCADEINA_UNCONNECTED),
    .CASCADEINB(NLW_blk000002a4_CASCADEINB_UNCONNECTED),
    .CASCADEOUTA(NLW_blk000002a4_CASCADEOUTA_UNCONNECTED),
    .CASCADEOUTB(NLW_blk000002a4_CASCADEOUTB_UNCONNECTED),
    .CLKARDCLK(aclk),
    .CLKBWRCLK(aclk),
    .DBITERR(NLW_blk000002a4_DBITERR_UNCONNECTED),
    .ENARDEN(sig00000001),
    .ENBWREN(sig00000001),
    .INJECTDBITERR(NLW_blk000002a4_INJECTDBITERR_UNCONNECTED),
    .INJECTSBITERR(NLW_blk000002a4_INJECTSBITERR_UNCONNECTED),
    .REGCEAREGCE(sig00000001),
    .REGCEB(sig00000001),
    .RSTRAMARSTRAM(sig00000002),
    .RSTRAMB(sig00000002),
    .RSTREGARSTREG(sig00000002),
    .RSTREGB(sig00000002),
    .SBITERR(NLW_blk000002a4_SBITERR_UNCONNECTED),
    .ADDRARDADDR({sig00000001, sig0000015d, sig0000015c, sig0000015b, sig0000015a, sig00000159, sig00000158, sig00000157, sig00000156, sig00000155, 
sig00000154, sig00000153, sig00000152, sig00000001, sig00000001, sig00000001}),
    .ADDRBWRADDR({sig00000001, sig00000187, sig00000186, sig00000185, sig00000184, sig00000183, sig00000182, sig00000181, sig00000180, sig0000017f, 
sig0000017e, sig0000017d, sig0000017c, sig00000001, sig00000001, sig00000001}),
    .DIADI({\NLW_blk000002a4_DIADI<31>_UNCONNECTED , \NLW_blk000002a4_DIADI<30>_UNCONNECTED , \NLW_blk000002a4_DIADI<29>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<28>_UNCONNECTED , \NLW_blk000002a4_DIADI<27>_UNCONNECTED , \NLW_blk000002a4_DIADI<26>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<25>_UNCONNECTED , \NLW_blk000002a4_DIADI<24>_UNCONNECTED , \NLW_blk000002a4_DIADI<23>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<22>_UNCONNECTED , \NLW_blk000002a4_DIADI<21>_UNCONNECTED , \NLW_blk000002a4_DIADI<20>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<19>_UNCONNECTED , \NLW_blk000002a4_DIADI<18>_UNCONNECTED , \NLW_blk000002a4_DIADI<17>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<16>_UNCONNECTED , \NLW_blk000002a4_DIADI<15>_UNCONNECTED , \NLW_blk000002a4_DIADI<14>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<13>_UNCONNECTED , \NLW_blk000002a4_DIADI<12>_UNCONNECTED , \NLW_blk000002a4_DIADI<11>_UNCONNECTED , 
\NLW_blk000002a4_DIADI<10>_UNCONNECTED , \NLW_blk000002a4_DIADI<9>_UNCONNECTED , \NLW_blk000002a4_DIADI<8>_UNCONNECTED , sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .DIBDI({\NLW_blk000002a4_DIBDI<31>_UNCONNECTED , \NLW_blk000002a4_DIBDI<30>_UNCONNECTED , \NLW_blk000002a4_DIBDI<29>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<28>_UNCONNECTED , \NLW_blk000002a4_DIBDI<27>_UNCONNECTED , \NLW_blk000002a4_DIBDI<26>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<25>_UNCONNECTED , \NLW_blk000002a4_DIBDI<24>_UNCONNECTED , \NLW_blk000002a4_DIBDI<23>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<22>_UNCONNECTED , \NLW_blk000002a4_DIBDI<21>_UNCONNECTED , \NLW_blk000002a4_DIBDI<20>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<19>_UNCONNECTED , \NLW_blk000002a4_DIBDI<18>_UNCONNECTED , \NLW_blk000002a4_DIBDI<17>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<16>_UNCONNECTED , \NLW_blk000002a4_DIBDI<15>_UNCONNECTED , \NLW_blk000002a4_DIBDI<14>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<13>_UNCONNECTED , \NLW_blk000002a4_DIBDI<12>_UNCONNECTED , \NLW_blk000002a4_DIBDI<11>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<10>_UNCONNECTED , \NLW_blk000002a4_DIBDI<9>_UNCONNECTED , \NLW_blk000002a4_DIBDI<8>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<7>_UNCONNECTED , \NLW_blk000002a4_DIBDI<6>_UNCONNECTED , \NLW_blk000002a4_DIBDI<5>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<4>_UNCONNECTED , \NLW_blk000002a4_DIBDI<3>_UNCONNECTED , \NLW_blk000002a4_DIBDI<2>_UNCONNECTED , 
\NLW_blk000002a4_DIBDI<1>_UNCONNECTED , \NLW_blk000002a4_DIBDI<0>_UNCONNECTED }),
    .DIPADIP({\NLW_blk000002a4_DIPADIP<3>_UNCONNECTED , \NLW_blk000002a4_DIPADIP<2>_UNCONNECTED , \NLW_blk000002a4_DIPADIP<1>_UNCONNECTED , 
sig00000002}),
    .DIPBDIP({\NLW_blk000002a4_DIPBDIP<3>_UNCONNECTED , \NLW_blk000002a4_DIPBDIP<2>_UNCONNECTED , \NLW_blk000002a4_DIPBDIP<1>_UNCONNECTED , 
\NLW_blk000002a4_DIPBDIP<0>_UNCONNECTED }),
    .DOADO({\NLW_blk000002a4_DOADO<31>_UNCONNECTED , \NLW_blk000002a4_DOADO<30>_UNCONNECTED , \NLW_blk000002a4_DOADO<29>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<28>_UNCONNECTED , \NLW_blk000002a4_DOADO<27>_UNCONNECTED , \NLW_blk000002a4_DOADO<26>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<25>_UNCONNECTED , \NLW_blk000002a4_DOADO<24>_UNCONNECTED , \NLW_blk000002a4_DOADO<23>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<22>_UNCONNECTED , \NLW_blk000002a4_DOADO<21>_UNCONNECTED , \NLW_blk000002a4_DOADO<20>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<19>_UNCONNECTED , \NLW_blk000002a4_DOADO<18>_UNCONNECTED , \NLW_blk000002a4_DOADO<17>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<16>_UNCONNECTED , \NLW_blk000002a4_DOADO<15>_UNCONNECTED , \NLW_blk000002a4_DOADO<14>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<13>_UNCONNECTED , \NLW_blk000002a4_DOADO<12>_UNCONNECTED , \NLW_blk000002a4_DOADO<11>_UNCONNECTED , 
\NLW_blk000002a4_DOADO<10>_UNCONNECTED , \NLW_blk000002a4_DOADO<9>_UNCONNECTED , \NLW_blk000002a4_DOADO<8>_UNCONNECTED , sig00000174, sig00000173, 
sig00000172, sig00000171, sig00000170, sig0000016f, sig0000016e, sig0000016d}),
    .DOBDO({\NLW_blk000002a4_DOBDO<31>_UNCONNECTED , \NLW_blk000002a4_DOBDO<30>_UNCONNECTED , \NLW_blk000002a4_DOBDO<29>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<28>_UNCONNECTED , \NLW_blk000002a4_DOBDO<27>_UNCONNECTED , \NLW_blk000002a4_DOBDO<26>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<25>_UNCONNECTED , \NLW_blk000002a4_DOBDO<24>_UNCONNECTED , \NLW_blk000002a4_DOBDO<23>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<22>_UNCONNECTED , \NLW_blk000002a4_DOBDO<21>_UNCONNECTED , \NLW_blk000002a4_DOBDO<20>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<19>_UNCONNECTED , \NLW_blk000002a4_DOBDO<18>_UNCONNECTED , \NLW_blk000002a4_DOBDO<17>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<16>_UNCONNECTED , \NLW_blk000002a4_DOBDO<15>_UNCONNECTED , \NLW_blk000002a4_DOBDO<14>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<13>_UNCONNECTED , \NLW_blk000002a4_DOBDO<12>_UNCONNECTED , \NLW_blk000002a4_DOBDO<11>_UNCONNECTED , 
\NLW_blk000002a4_DOBDO<10>_UNCONNECTED , \NLW_blk000002a4_DOBDO<9>_UNCONNECTED , \NLW_blk000002a4_DOBDO<8>_UNCONNECTED , sig00000165, sig00000164, 
sig00000163, sig00000162, sig00000161, sig00000160, sig0000015f, sig0000015e}),
    .DOPADOP({\NLW_blk000002a4_DOPADOP<3>_UNCONNECTED , \NLW_blk000002a4_DOPADOP<2>_UNCONNECTED , \NLW_blk000002a4_DOPADOP<1>_UNCONNECTED , 
sig00000175}),
    .DOPBDOP({\NLW_blk000002a4_DOPBDOP<3>_UNCONNECTED , \NLW_blk000002a4_DOPBDOP<2>_UNCONNECTED , \NLW_blk000002a4_DOPBDOP<1>_UNCONNECTED , 
sig00000166}),
    .ECCPARITY({\NLW_blk000002a4_ECCPARITY<7>_UNCONNECTED , \NLW_blk000002a4_ECCPARITY<6>_UNCONNECTED , \NLW_blk000002a4_ECCPARITY<5>_UNCONNECTED , 
\NLW_blk000002a4_ECCPARITY<4>_UNCONNECTED , \NLW_blk000002a4_ECCPARITY<3>_UNCONNECTED , \NLW_blk000002a4_ECCPARITY<2>_UNCONNECTED , 
\NLW_blk000002a4_ECCPARITY<1>_UNCONNECTED , \NLW_blk000002a4_ECCPARITY<0>_UNCONNECTED }),
    .RDADDRECC({\NLW_blk000002a4_RDADDRECC<8>_UNCONNECTED , \NLW_blk000002a4_RDADDRECC<7>_UNCONNECTED , \NLW_blk000002a4_RDADDRECC<6>_UNCONNECTED , 
\NLW_blk000002a4_RDADDRECC<5>_UNCONNECTED , \NLW_blk000002a4_RDADDRECC<4>_UNCONNECTED , \NLW_blk000002a4_RDADDRECC<3>_UNCONNECTED , 
\NLW_blk000002a4_RDADDRECC<2>_UNCONNECTED , \NLW_blk000002a4_RDADDRECC<1>_UNCONNECTED , \NLW_blk000002a4_RDADDRECC<0>_UNCONNECTED }),
    .WEA({sig00000002, sig00000002, sig00000002, sig00000002}),
    .WEBWE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000002a5 (
    .A0(sig00000001),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(aclk),
    .D(sig000001bc),
    .Q(sig000001be),
    .Q15(NLW_blk000002a5_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000002a6 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000001be),
    .Q(sig0000012b)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000002a7 (
    .A0(sig00000001),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(sig00000001),
    .CLK(aclk),
    .D(sig000001bb),
    .Q(sig000001bf),
    .Q15(NLW_blk000002a7_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000002a8 (
    .C(aclk),
    .CE(sig00000001),
    .D(sig000001bf),
    .Q(sig000001ba)
  );
  XORCY   \blk00000069/blk000000f9  (
    .CI(\blk00000069/sig000002ae ),
    .LI(\blk00000069/sig000002af ),
    .O(sig00000009)
  );
  MUXCY   \blk00000069/blk000000f8  (
    .CI(\blk00000069/sig000002ae ),
    .DI(sig000000b4),
    .S(\blk00000069/sig000002af ),
    .O(sig00000008)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000f7  (
    .I0(sig000000b4),
    .I1(sig00000002),
    .O(\blk00000069/sig000002af )
  );
  XORCY   \blk00000069/blk000000f6  (
    .CI(\blk00000069/sig000002ac ),
    .LI(\blk00000069/sig000002ad ),
    .O(sig0000000a)
  );
  MUXCY   \blk00000069/blk000000f5  (
    .CI(\blk00000069/sig000002ac ),
    .DI(sig000000b3),
    .S(\blk00000069/sig000002ad ),
    .O(\blk00000069/sig000002ae )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000f4  (
    .I0(sig000000b3),
    .I1(sig00000002),
    .O(\blk00000069/sig000002ad )
  );
  XORCY   \blk00000069/blk000000f3  (
    .CI(\blk00000069/sig000002aa ),
    .LI(\blk00000069/sig000002ab ),
    .O(sig0000000b)
  );
  MUXCY   \blk00000069/blk000000f2  (
    .CI(\blk00000069/sig000002aa ),
    .DI(sig000000b2),
    .S(\blk00000069/sig000002ab ),
    .O(\blk00000069/sig000002ac )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000f1  (
    .I0(sig000000b2),
    .I1(sig00000001),
    .O(\blk00000069/sig000002ab )
  );
  XORCY   \blk00000069/blk000000f0  (
    .CI(\blk00000069/sig000002a8 ),
    .LI(\blk00000069/sig000002a9 ),
    .O(sig0000000c)
  );
  MUXCY   \blk00000069/blk000000ef  (
    .CI(\blk00000069/sig000002a8 ),
    .DI(sig000000b1),
    .S(\blk00000069/sig000002a9 ),
    .O(\blk00000069/sig000002aa )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000ee  (
    .I0(sig000000b1),
    .I1(sig00000001),
    .O(\blk00000069/sig000002a9 )
  );
  XORCY   \blk00000069/blk000000ed  (
    .CI(\blk00000069/sig000002a6 ),
    .LI(\blk00000069/sig000002a7 ),
    .O(sig0000000d)
  );
  MUXCY   \blk00000069/blk000000ec  (
    .CI(\blk00000069/sig000002a6 ),
    .DI(sig000000b0),
    .S(\blk00000069/sig000002a7 ),
    .O(\blk00000069/sig000002a8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000eb  (
    .I0(sig000000b0),
    .I1(sig00000001),
    .O(\blk00000069/sig000002a7 )
  );
  XORCY   \blk00000069/blk000000ea  (
    .CI(\blk00000069/sig000002a4 ),
    .LI(\blk00000069/sig000002a5 ),
    .O(sig0000000e)
  );
  MUXCY   \blk00000069/blk000000e9  (
    .CI(\blk00000069/sig000002a4 ),
    .DI(sig000000af),
    .S(\blk00000069/sig000002a5 ),
    .O(\blk00000069/sig000002a6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000e8  (
    .I0(sig000000af),
    .I1(sig00000002),
    .O(\blk00000069/sig000002a5 )
  );
  XORCY   \blk00000069/blk000000e7  (
    .CI(\blk00000069/sig000002a2 ),
    .LI(\blk00000069/sig000002a3 ),
    .O(sig0000000f)
  );
  MUXCY   \blk00000069/blk000000e6  (
    .CI(\blk00000069/sig000002a2 ),
    .DI(sig000000ae),
    .S(\blk00000069/sig000002a3 ),
    .O(\blk00000069/sig000002a4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000e5  (
    .I0(sig000000ae),
    .I1(sig00000001),
    .O(\blk00000069/sig000002a3 )
  );
  XORCY   \blk00000069/blk000000e4  (
    .CI(\blk00000069/sig000002a0 ),
    .LI(\blk00000069/sig000002a1 ),
    .O(sig00000010)
  );
  MUXCY   \blk00000069/blk000000e3  (
    .CI(\blk00000069/sig000002a0 ),
    .DI(sig000000ad),
    .S(\blk00000069/sig000002a1 ),
    .O(\blk00000069/sig000002a2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000e2  (
    .I0(sig000000ad),
    .I1(sig00000002),
    .O(\blk00000069/sig000002a1 )
  );
  XORCY   \blk00000069/blk000000e1  (
    .CI(\blk00000069/sig0000029e ),
    .LI(\blk00000069/sig0000029f ),
    .O(sig00000011)
  );
  MUXCY   \blk00000069/blk000000e0  (
    .CI(\blk00000069/sig0000029e ),
    .DI(sig000000ac),
    .S(\blk00000069/sig0000029f ),
    .O(\blk00000069/sig000002a0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000df  (
    .I0(sig000000ac),
    .I1(sig00000001),
    .O(\blk00000069/sig0000029f )
  );
  XORCY   \blk00000069/blk000000de  (
    .CI(\blk00000069/sig0000029c ),
    .LI(\blk00000069/sig0000029d ),
    .O(sig00000012)
  );
  MUXCY   \blk00000069/blk000000dd  (
    .CI(\blk00000069/sig0000029c ),
    .DI(sig000000ab),
    .S(\blk00000069/sig0000029d ),
    .O(\blk00000069/sig0000029e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000dc  (
    .I0(sig000000ab),
    .I1(sig00000002),
    .O(\blk00000069/sig0000029d )
  );
  XORCY   \blk00000069/blk000000db  (
    .CI(\blk00000069/sig0000029a ),
    .LI(\blk00000069/sig0000029b ),
    .O(sig00000013)
  );
  MUXCY   \blk00000069/blk000000da  (
    .CI(\blk00000069/sig0000029a ),
    .DI(sig000000aa),
    .S(\blk00000069/sig0000029b ),
    .O(\blk00000069/sig0000029c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000d9  (
    .I0(sig000000aa),
    .I1(sig00000002),
    .O(\blk00000069/sig0000029b )
  );
  XORCY   \blk00000069/blk000000d8  (
    .CI(\blk00000069/sig00000298 ),
    .LI(\blk00000069/sig00000299 ),
    .O(sig00000014)
  );
  MUXCY   \blk00000069/blk000000d7  (
    .CI(\blk00000069/sig00000298 ),
    .DI(sig000000a9),
    .S(\blk00000069/sig00000299 ),
    .O(\blk00000069/sig0000029a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000d6  (
    .I0(sig000000a9),
    .I1(sig00000002),
    .O(\blk00000069/sig00000299 )
  );
  XORCY   \blk00000069/blk000000d5  (
    .CI(\blk00000069/sig00000296 ),
    .LI(\blk00000069/sig00000297 ),
    .O(sig00000015)
  );
  MUXCY   \blk00000069/blk000000d4  (
    .CI(\blk00000069/sig00000296 ),
    .DI(sig000000a8),
    .S(\blk00000069/sig00000297 ),
    .O(\blk00000069/sig00000298 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000d3  (
    .I0(sig000000a8),
    .I1(sig00000002),
    .O(\blk00000069/sig00000297 )
  );
  XORCY   \blk00000069/blk000000d2  (
    .CI(\blk00000069/sig00000294 ),
    .LI(\blk00000069/sig00000295 ),
    .O(sig00000016)
  );
  MUXCY   \blk00000069/blk000000d1  (
    .CI(\blk00000069/sig00000294 ),
    .DI(sig000000a7),
    .S(\blk00000069/sig00000295 ),
    .O(\blk00000069/sig00000296 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000d0  (
    .I0(sig000000a7),
    .I1(sig00000002),
    .O(\blk00000069/sig00000295 )
  );
  XORCY   \blk00000069/blk000000cf  (
    .CI(\blk00000069/sig00000292 ),
    .LI(\blk00000069/sig00000293 ),
    .O(sig00000017)
  );
  MUXCY   \blk00000069/blk000000ce  (
    .CI(\blk00000069/sig00000292 ),
    .DI(sig000000a6),
    .S(\blk00000069/sig00000293 ),
    .O(\blk00000069/sig00000294 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000cd  (
    .I0(sig000000a6),
    .I1(sig00000001),
    .O(\blk00000069/sig00000293 )
  );
  XORCY   \blk00000069/blk000000cc  (
    .CI(\blk00000069/sig00000290 ),
    .LI(\blk00000069/sig00000291 ),
    .O(sig00000018)
  );
  MUXCY   \blk00000069/blk000000cb  (
    .CI(\blk00000069/sig00000290 ),
    .DI(sig000000a5),
    .S(\blk00000069/sig00000291 ),
    .O(\blk00000069/sig00000292 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000ca  (
    .I0(sig000000a5),
    .I1(sig00000001),
    .O(\blk00000069/sig00000291 )
  );
  XORCY   \blk00000069/blk000000c9  (
    .CI(\blk00000069/sig0000028e ),
    .LI(\blk00000069/sig0000028f ),
    .O(sig00000019)
  );
  MUXCY   \blk00000069/blk000000c8  (
    .CI(\blk00000069/sig0000028e ),
    .DI(sig000000a4),
    .S(\blk00000069/sig0000028f ),
    .O(\blk00000069/sig00000290 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000c7  (
    .I0(sig000000a4),
    .I1(sig00000001),
    .O(\blk00000069/sig0000028f )
  );
  XORCY   \blk00000069/blk000000c6  (
    .CI(\blk00000069/sig0000028c ),
    .LI(\blk00000069/sig0000028d ),
    .O(sig0000001a)
  );
  MUXCY   \blk00000069/blk000000c5  (
    .CI(\blk00000069/sig0000028c ),
    .DI(sig000000a3),
    .S(\blk00000069/sig0000028d ),
    .O(\blk00000069/sig0000028e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000c4  (
    .I0(sig000000a3),
    .I1(sig00000002),
    .O(\blk00000069/sig0000028d )
  );
  XORCY   \blk00000069/blk000000c3  (
    .CI(\blk00000069/sig0000028a ),
    .LI(\blk00000069/sig0000028b ),
    .O(sig0000001b)
  );
  MUXCY   \blk00000069/blk000000c2  (
    .CI(\blk00000069/sig0000028a ),
    .DI(sig000000a2),
    .S(\blk00000069/sig0000028b ),
    .O(\blk00000069/sig0000028c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000c1  (
    .I0(sig000000a2),
    .I1(sig00000001),
    .O(\blk00000069/sig0000028b )
  );
  XORCY   \blk00000069/blk000000c0  (
    .CI(\blk00000069/sig00000288 ),
    .LI(\blk00000069/sig00000289 ),
    .O(sig0000001c)
  );
  MUXCY   \blk00000069/blk000000bf  (
    .CI(\blk00000069/sig00000288 ),
    .DI(sig000000a1),
    .S(\blk00000069/sig00000289 ),
    .O(\blk00000069/sig0000028a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000be  (
    .I0(sig000000a1),
    .I1(sig00000002),
    .O(\blk00000069/sig00000289 )
  );
  XORCY   \blk00000069/blk000000bd  (
    .CI(\blk00000069/sig00000286 ),
    .LI(\blk00000069/sig00000287 ),
    .O(sig0000001d)
  );
  MUXCY   \blk00000069/blk000000bc  (
    .CI(\blk00000069/sig00000286 ),
    .DI(sig000000a0),
    .S(\blk00000069/sig00000287 ),
    .O(\blk00000069/sig00000288 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000bb  (
    .I0(sig00000001),
    .I1(sig000000a0),
    .O(\blk00000069/sig00000287 )
  );
  XORCY   \blk00000069/blk000000ba  (
    .CI(\blk00000069/sig00000284 ),
    .LI(\blk00000069/sig00000285 ),
    .O(sig0000001e)
  );
  MUXCY   \blk00000069/blk000000b9  (
    .CI(\blk00000069/sig00000284 ),
    .DI(sig0000009f),
    .S(\blk00000069/sig00000285 ),
    .O(\blk00000069/sig00000286 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000b8  (
    .I0(sig00000002),
    .I1(sig0000009f),
    .O(\blk00000069/sig00000285 )
  );
  XORCY   \blk00000069/blk000000b7  (
    .CI(\blk00000069/sig00000282 ),
    .LI(\blk00000069/sig00000283 ),
    .O(sig0000001f)
  );
  MUXCY   \blk00000069/blk000000b6  (
    .CI(\blk00000069/sig00000282 ),
    .DI(sig0000009e),
    .S(\blk00000069/sig00000283 ),
    .O(\blk00000069/sig00000284 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000b5  (
    .I0(sig00000002),
    .I1(sig0000009e),
    .O(\blk00000069/sig00000283 )
  );
  XORCY   \blk00000069/blk000000b4  (
    .CI(\blk00000069/sig00000280 ),
    .LI(\blk00000069/sig00000281 ),
    .O(sig00000020)
  );
  MUXCY   \blk00000069/blk000000b3  (
    .CI(\blk00000069/sig00000280 ),
    .DI(sig0000009d),
    .S(\blk00000069/sig00000281 ),
    .O(\blk00000069/sig00000282 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000b2  (
    .I0(sig00000002),
    .I1(sig0000009d),
    .O(\blk00000069/sig00000281 )
  );
  XORCY   \blk00000069/blk000000b1  (
    .CI(\blk00000069/sig0000027e ),
    .LI(\blk00000069/sig0000027f ),
    .O(sig00000021)
  );
  MUXCY   \blk00000069/blk000000b0  (
    .CI(\blk00000069/sig0000027e ),
    .DI(sig0000009c),
    .S(\blk00000069/sig0000027f ),
    .O(\blk00000069/sig00000280 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000af  (
    .I0(sig00000002),
    .I1(sig0000009c),
    .O(\blk00000069/sig0000027f )
  );
  XORCY   \blk00000069/blk000000ae  (
    .CI(\blk00000069/sig0000027c ),
    .LI(\blk00000069/sig0000027d ),
    .O(sig00000022)
  );
  MUXCY   \blk00000069/blk000000ad  (
    .CI(\blk00000069/sig0000027c ),
    .DI(sig0000009b),
    .S(\blk00000069/sig0000027d ),
    .O(\blk00000069/sig0000027e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000ac  (
    .I0(sig00000002),
    .I1(sig0000009b),
    .O(\blk00000069/sig0000027d )
  );
  XORCY   \blk00000069/blk000000ab  (
    .CI(\blk00000069/sig0000027a ),
    .LI(\blk00000069/sig0000027b ),
    .O(sig00000023)
  );
  MUXCY   \blk00000069/blk000000aa  (
    .CI(\blk00000069/sig0000027a ),
    .DI(sig0000009a),
    .S(\blk00000069/sig0000027b ),
    .O(\blk00000069/sig0000027c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000a9  (
    .I0(sig00000001),
    .I1(sig0000009a),
    .O(\blk00000069/sig0000027b )
  );
  XORCY   \blk00000069/blk000000a8  (
    .CI(\blk00000069/sig00000278 ),
    .LI(\blk00000069/sig00000279 ),
    .O(sig00000024)
  );
  MUXCY   \blk00000069/blk000000a7  (
    .CI(\blk00000069/sig00000278 ),
    .DI(sig00000099),
    .S(\blk00000069/sig00000279 ),
    .O(\blk00000069/sig0000027a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000a6  (
    .I0(sig00000001),
    .I1(sig00000099),
    .O(\blk00000069/sig00000279 )
  );
  XORCY   \blk00000069/blk000000a5  (
    .CI(\blk00000069/sig00000276 ),
    .LI(\blk00000069/sig00000277 ),
    .O(sig00000025)
  );
  MUXCY   \blk00000069/blk000000a4  (
    .CI(\blk00000069/sig00000276 ),
    .DI(sig00000098),
    .S(\blk00000069/sig00000277 ),
    .O(\blk00000069/sig00000278 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000a3  (
    .I0(sig00000001),
    .I1(sig00000098),
    .O(\blk00000069/sig00000277 )
  );
  XORCY   \blk00000069/blk000000a2  (
    .CI(\blk00000069/sig00000274 ),
    .LI(\blk00000069/sig00000275 ),
    .O(sig00000026)
  );
  MUXCY   \blk00000069/blk000000a1  (
    .CI(\blk00000069/sig00000274 ),
    .DI(sig00000097),
    .S(\blk00000069/sig00000275 ),
    .O(\blk00000069/sig00000276 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk000000a0  (
    .I0(sig00000002),
    .I1(sig00000097),
    .O(\blk00000069/sig00000275 )
  );
  XORCY   \blk00000069/blk0000009f  (
    .CI(\blk00000069/sig00000272 ),
    .LI(\blk00000069/sig00000273 ),
    .O(sig00000027)
  );
  MUXCY   \blk00000069/blk0000009e  (
    .CI(\blk00000069/sig00000272 ),
    .DI(sig00000096),
    .S(\blk00000069/sig00000273 ),
    .O(\blk00000069/sig00000274 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000009d  (
    .I0(sig00000001),
    .I1(sig00000096),
    .O(\blk00000069/sig00000273 )
  );
  XORCY   \blk00000069/blk0000009c  (
    .CI(\blk00000069/sig00000270 ),
    .LI(\blk00000069/sig00000271 ),
    .O(sig00000028)
  );
  MUXCY   \blk00000069/blk0000009b  (
    .CI(\blk00000069/sig00000270 ),
    .DI(sig00000095),
    .S(\blk00000069/sig00000271 ),
    .O(\blk00000069/sig00000272 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000009a  (
    .I0(sig00000002),
    .I1(sig00000095),
    .O(\blk00000069/sig00000271 )
  );
  XORCY   \blk00000069/blk00000099  (
    .CI(\blk00000069/sig0000026e ),
    .LI(\blk00000069/sig0000026f ),
    .O(sig00000029)
  );
  MUXCY   \blk00000069/blk00000098  (
    .CI(\blk00000069/sig0000026e ),
    .DI(sig00000094),
    .S(\blk00000069/sig0000026f ),
    .O(\blk00000069/sig00000270 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000097  (
    .I0(sig00000001),
    .I1(sig00000094),
    .O(\blk00000069/sig0000026f )
  );
  XORCY   \blk00000069/blk00000096  (
    .CI(\blk00000069/sig0000026c ),
    .LI(\blk00000069/sig0000026d ),
    .O(sig0000002a)
  );
  MUXCY   \blk00000069/blk00000095  (
    .CI(\blk00000069/sig0000026c ),
    .DI(sig00000093),
    .S(\blk00000069/sig0000026d ),
    .O(\blk00000069/sig0000026e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000094  (
    .I0(sig00000002),
    .I1(sig00000093),
    .O(\blk00000069/sig0000026d )
  );
  XORCY   \blk00000069/blk00000093  (
    .CI(\blk00000069/sig0000026a ),
    .LI(\blk00000069/sig0000026b ),
    .O(sig0000002b)
  );
  MUXCY   \blk00000069/blk00000092  (
    .CI(\blk00000069/sig0000026a ),
    .DI(sig00000092),
    .S(\blk00000069/sig0000026b ),
    .O(\blk00000069/sig0000026c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000091  (
    .I0(sig00000002),
    .I1(sig00000092),
    .O(\blk00000069/sig0000026b )
  );
  XORCY   \blk00000069/blk00000090  (
    .CI(\blk00000069/sig00000268 ),
    .LI(\blk00000069/sig00000269 ),
    .O(sig0000002c)
  );
  MUXCY   \blk00000069/blk0000008f  (
    .CI(\blk00000069/sig00000268 ),
    .DI(sig00000091),
    .S(\blk00000069/sig00000269 ),
    .O(\blk00000069/sig0000026a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000008e  (
    .I0(sig00000002),
    .I1(sig00000091),
    .O(\blk00000069/sig00000269 )
  );
  XORCY   \blk00000069/blk0000008d  (
    .CI(\blk00000069/sig00000266 ),
    .LI(\blk00000069/sig00000267 ),
    .O(sig0000002d)
  );
  MUXCY   \blk00000069/blk0000008c  (
    .CI(\blk00000069/sig00000266 ),
    .DI(sig00000090),
    .S(\blk00000069/sig00000267 ),
    .O(\blk00000069/sig00000268 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000008b  (
    .I0(sig00000002),
    .I1(sig00000090),
    .O(\blk00000069/sig00000267 )
  );
  XORCY   \blk00000069/blk0000008a  (
    .CI(\blk00000069/sig00000264 ),
    .LI(\blk00000069/sig00000265 ),
    .O(sig0000002e)
  );
  MUXCY   \blk00000069/blk00000089  (
    .CI(\blk00000069/sig00000264 ),
    .DI(sig0000008f),
    .S(\blk00000069/sig00000265 ),
    .O(\blk00000069/sig00000266 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000088  (
    .I0(sig00000002),
    .I1(sig0000008f),
    .O(\blk00000069/sig00000265 )
  );
  XORCY   \blk00000069/blk00000087  (
    .CI(\blk00000069/sig00000262 ),
    .LI(\blk00000069/sig00000263 ),
    .O(sig0000002f)
  );
  MUXCY   \blk00000069/blk00000086  (
    .CI(\blk00000069/sig00000262 ),
    .DI(sig0000008e),
    .S(\blk00000069/sig00000263 ),
    .O(\blk00000069/sig00000264 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000085  (
    .I0(sig00000001),
    .I1(sig0000008e),
    .O(\blk00000069/sig00000263 )
  );
  XORCY   \blk00000069/blk00000084  (
    .CI(\blk00000069/sig00000260 ),
    .LI(\blk00000069/sig00000261 ),
    .O(sig00000030)
  );
  MUXCY   \blk00000069/blk00000083  (
    .CI(\blk00000069/sig00000260 ),
    .DI(sig0000008d),
    .S(\blk00000069/sig00000261 ),
    .O(\blk00000069/sig00000262 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000082  (
    .I0(sig00000001),
    .I1(sig0000008d),
    .O(\blk00000069/sig00000261 )
  );
  XORCY   \blk00000069/blk00000081  (
    .CI(\blk00000069/sig0000025e ),
    .LI(\blk00000069/sig0000025f ),
    .O(sig00000031)
  );
  MUXCY   \blk00000069/blk00000080  (
    .CI(\blk00000069/sig0000025e ),
    .DI(sig0000008c),
    .S(\blk00000069/sig0000025f ),
    .O(\blk00000069/sig00000260 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000007f  (
    .I0(sig00000001),
    .I1(sig0000008c),
    .O(\blk00000069/sig0000025f )
  );
  XORCY   \blk00000069/blk0000007e  (
    .CI(\blk00000069/sig0000025c ),
    .LI(\blk00000069/sig0000025d ),
    .O(sig00000032)
  );
  MUXCY   \blk00000069/blk0000007d  (
    .CI(\blk00000069/sig0000025c ),
    .DI(sig0000008b),
    .S(\blk00000069/sig0000025d ),
    .O(\blk00000069/sig0000025e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000007c  (
    .I0(sig00000002),
    .I1(sig0000008b),
    .O(\blk00000069/sig0000025d )
  );
  XORCY   \blk00000069/blk0000007b  (
    .CI(\blk00000069/sig0000025a ),
    .LI(\blk00000069/sig0000025b ),
    .O(sig00000033)
  );
  MUXCY   \blk00000069/blk0000007a  (
    .CI(\blk00000069/sig0000025a ),
    .DI(sig0000008a),
    .S(\blk00000069/sig0000025b ),
    .O(\blk00000069/sig0000025c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000079  (
    .I0(sig00000001),
    .I1(sig0000008a),
    .O(\blk00000069/sig0000025b )
  );
  XORCY   \blk00000069/blk00000078  (
    .CI(\blk00000069/sig00000258 ),
    .LI(\blk00000069/sig00000259 ),
    .O(sig00000034)
  );
  MUXCY   \blk00000069/blk00000077  (
    .CI(\blk00000069/sig00000258 ),
    .DI(sig00000089),
    .S(\blk00000069/sig00000259 ),
    .O(\blk00000069/sig0000025a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000076  (
    .I0(sig00000002),
    .I1(sig00000089),
    .O(\blk00000069/sig00000259 )
  );
  XORCY   \blk00000069/blk00000075  (
    .CI(\blk00000069/sig00000256 ),
    .LI(\blk00000069/sig00000257 ),
    .O(sig00000035)
  );
  MUXCY   \blk00000069/blk00000074  (
    .CI(\blk00000069/sig00000256 ),
    .DI(sig00000088),
    .S(\blk00000069/sig00000257 ),
    .O(\blk00000069/sig00000258 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000073  (
    .I0(sig00000001),
    .I1(sig00000088),
    .O(\blk00000069/sig00000257 )
  );
  XORCY   \blk00000069/blk00000072  (
    .CI(\blk00000069/sig00000254 ),
    .LI(\blk00000069/sig00000255 ),
    .O(sig00000036)
  );
  MUXCY   \blk00000069/blk00000071  (
    .CI(\blk00000069/sig00000254 ),
    .DI(sig00000087),
    .S(\blk00000069/sig00000255 ),
    .O(\blk00000069/sig00000256 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk00000070  (
    .I0(sig00000002),
    .I1(sig00000087),
    .O(\blk00000069/sig00000255 )
  );
  XORCY   \blk00000069/blk0000006f  (
    .CI(\blk00000069/sig00000252 ),
    .LI(\blk00000069/sig00000253 ),
    .O(sig00000037)
  );
  MUXCY   \blk00000069/blk0000006e  (
    .CI(\blk00000069/sig00000252 ),
    .DI(sig00000086),
    .S(\blk00000069/sig00000253 ),
    .O(\blk00000069/sig00000254 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000006d  (
    .I0(sig00000002),
    .I1(sig00000086),
    .O(\blk00000069/sig00000253 )
  );
  XORCY   \blk00000069/blk0000006c  (
    .CI(sig00000002),
    .LI(\blk00000069/sig00000251 ),
    .O(sig00000038)
  );
  MUXCY   \blk00000069/blk0000006b  (
    .CI(sig00000002),
    .DI(sig00000085),
    .S(\blk00000069/sig00000251 ),
    .O(\blk00000069/sig00000252 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000069/blk0000006a  (
    .I0(sig00000002),
    .I1(sig00000085),
    .O(\blk00000069/sig00000251 )
  );
  XORCY   \blk000000fa/blk0000018a  (
    .CI(\blk000000fa/sig0000039f ),
    .LI(\blk000000fa/sig000003a0 ),
    .O(sig00000069)
  );
  MUXCY   \blk000000fa/blk00000189  (
    .CI(\blk000000fa/sig0000039f ),
    .DI(sig000000b4),
    .S(\blk000000fa/sig000003a0 ),
    .O(sig0000006a)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000188  (
    .I0(sig000000b4),
    .I1(sig00000084),
    .O(\blk000000fa/sig000003a0 )
  );
  XORCY   \blk000000fa/blk00000187  (
    .CI(\blk000000fa/sig0000039d ),
    .LI(\blk000000fa/sig0000039e ),
    .O(sig00000068)
  );
  MUXCY   \blk000000fa/blk00000186  (
    .CI(\blk000000fa/sig0000039d ),
    .DI(sig000000b3),
    .S(\blk000000fa/sig0000039e ),
    .O(\blk000000fa/sig0000039f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000185  (
    .I0(sig000000b3),
    .I1(sig00000084),
    .O(\blk000000fa/sig0000039e )
  );
  XORCY   \blk000000fa/blk00000184  (
    .CI(\blk000000fa/sig0000039b ),
    .LI(\blk000000fa/sig0000039c ),
    .O(sig00000067)
  );
  MUXCY   \blk000000fa/blk00000183  (
    .CI(\blk000000fa/sig0000039b ),
    .DI(sig000000b2),
    .S(\blk000000fa/sig0000039c ),
    .O(\blk000000fa/sig0000039d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000182  (
    .I0(sig000000b2),
    .I1(sig00000084),
    .O(\blk000000fa/sig0000039c )
  );
  XORCY   \blk000000fa/blk00000181  (
    .CI(\blk000000fa/sig00000399 ),
    .LI(\blk000000fa/sig0000039a ),
    .O(sig00000066)
  );
  MUXCY   \blk000000fa/blk00000180  (
    .CI(\blk000000fa/sig00000399 ),
    .DI(sig000000b1),
    .S(\blk000000fa/sig0000039a ),
    .O(\blk000000fa/sig0000039b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000017f  (
    .I0(sig000000b1),
    .I1(sig00000084),
    .O(\blk000000fa/sig0000039a )
  );
  XORCY   \blk000000fa/blk0000017e  (
    .CI(\blk000000fa/sig00000397 ),
    .LI(\blk000000fa/sig00000398 ),
    .O(sig00000065)
  );
  MUXCY   \blk000000fa/blk0000017d  (
    .CI(\blk000000fa/sig00000397 ),
    .DI(sig000000b0),
    .S(\blk000000fa/sig00000398 ),
    .O(\blk000000fa/sig00000399 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000017c  (
    .I0(sig000000b0),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000398 )
  );
  XORCY   \blk000000fa/blk0000017b  (
    .CI(\blk000000fa/sig00000395 ),
    .LI(\blk000000fa/sig00000396 ),
    .O(sig00000064)
  );
  MUXCY   \blk000000fa/blk0000017a  (
    .CI(\blk000000fa/sig00000395 ),
    .DI(sig000000af),
    .S(\blk000000fa/sig00000396 ),
    .O(\blk000000fa/sig00000397 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000179  (
    .I0(sig000000af),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000396 )
  );
  XORCY   \blk000000fa/blk00000178  (
    .CI(\blk000000fa/sig00000393 ),
    .LI(\blk000000fa/sig00000394 ),
    .O(sig00000063)
  );
  MUXCY   \blk000000fa/blk00000177  (
    .CI(\blk000000fa/sig00000393 ),
    .DI(sig000000ae),
    .S(\blk000000fa/sig00000394 ),
    .O(\blk000000fa/sig00000395 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000176  (
    .I0(sig000000ae),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000394 )
  );
  XORCY   \blk000000fa/blk00000175  (
    .CI(\blk000000fa/sig00000391 ),
    .LI(\blk000000fa/sig00000392 ),
    .O(sig00000062)
  );
  MUXCY   \blk000000fa/blk00000174  (
    .CI(\blk000000fa/sig00000391 ),
    .DI(sig000000ad),
    .S(\blk000000fa/sig00000392 ),
    .O(\blk000000fa/sig00000393 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000173  (
    .I0(sig000000ad),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000392 )
  );
  XORCY   \blk000000fa/blk00000172  (
    .CI(\blk000000fa/sig0000038f ),
    .LI(\blk000000fa/sig00000390 ),
    .O(sig00000061)
  );
  MUXCY   \blk000000fa/blk00000171  (
    .CI(\blk000000fa/sig0000038f ),
    .DI(sig000000ac),
    .S(\blk000000fa/sig00000390 ),
    .O(\blk000000fa/sig00000391 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000170  (
    .I0(sig000000ac),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000390 )
  );
  XORCY   \blk000000fa/blk0000016f  (
    .CI(\blk000000fa/sig0000038d ),
    .LI(\blk000000fa/sig0000038e ),
    .O(sig00000060)
  );
  MUXCY   \blk000000fa/blk0000016e  (
    .CI(\blk000000fa/sig0000038d ),
    .DI(sig000000ab),
    .S(\blk000000fa/sig0000038e ),
    .O(\blk000000fa/sig0000038f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000016d  (
    .I0(sig000000ab),
    .I1(sig00000084),
    .O(\blk000000fa/sig0000038e )
  );
  XORCY   \blk000000fa/blk0000016c  (
    .CI(\blk000000fa/sig0000038b ),
    .LI(\blk000000fa/sig0000038c ),
    .O(sig0000005f)
  );
  MUXCY   \blk000000fa/blk0000016b  (
    .CI(\blk000000fa/sig0000038b ),
    .DI(sig000000aa),
    .S(\blk000000fa/sig0000038c ),
    .O(\blk000000fa/sig0000038d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000016a  (
    .I0(sig000000aa),
    .I1(sig00000084),
    .O(\blk000000fa/sig0000038c )
  );
  XORCY   \blk000000fa/blk00000169  (
    .CI(\blk000000fa/sig00000389 ),
    .LI(\blk000000fa/sig0000038a ),
    .O(sig0000005e)
  );
  MUXCY   \blk000000fa/blk00000168  (
    .CI(\blk000000fa/sig00000389 ),
    .DI(sig000000a9),
    .S(\blk000000fa/sig0000038a ),
    .O(\blk000000fa/sig0000038b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000167  (
    .I0(sig000000a9),
    .I1(sig00000084),
    .O(\blk000000fa/sig0000038a )
  );
  XORCY   \blk000000fa/blk00000166  (
    .CI(\blk000000fa/sig00000387 ),
    .LI(\blk000000fa/sig00000388 ),
    .O(sig0000005d)
  );
  MUXCY   \blk000000fa/blk00000165  (
    .CI(\blk000000fa/sig00000387 ),
    .DI(sig000000a8),
    .S(\blk000000fa/sig00000388 ),
    .O(\blk000000fa/sig00000389 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000164  (
    .I0(sig000000a8),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000388 )
  );
  XORCY   \blk000000fa/blk00000163  (
    .CI(\blk000000fa/sig00000385 ),
    .LI(\blk000000fa/sig00000386 ),
    .O(sig0000005c)
  );
  MUXCY   \blk000000fa/blk00000162  (
    .CI(\blk000000fa/sig00000385 ),
    .DI(sig000000a7),
    .S(\blk000000fa/sig00000386 ),
    .O(\blk000000fa/sig00000387 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000161  (
    .I0(sig000000a7),
    .I1(sig00000084),
    .O(\blk000000fa/sig00000386 )
  );
  XORCY   \blk000000fa/blk00000160  (
    .CI(\blk000000fa/sig00000383 ),
    .LI(\blk000000fa/sig00000384 ),
    .O(sig0000005b)
  );
  MUXCY   \blk000000fa/blk0000015f  (
    .CI(\blk000000fa/sig00000383 ),
    .DI(sig000000a6),
    .S(\blk000000fa/sig00000384 ),
    .O(\blk000000fa/sig00000385 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000015e  (
    .I0(sig000000a6),
    .I1(sig00000083),
    .O(\blk000000fa/sig00000384 )
  );
  XORCY   \blk000000fa/blk0000015d  (
    .CI(\blk000000fa/sig00000381 ),
    .LI(\blk000000fa/sig00000382 ),
    .O(sig0000005a)
  );
  MUXCY   \blk000000fa/blk0000015c  (
    .CI(\blk000000fa/sig00000381 ),
    .DI(sig000000a5),
    .S(\blk000000fa/sig00000382 ),
    .O(\blk000000fa/sig00000383 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000015b  (
    .I0(sig000000a5),
    .I1(sig00000082),
    .O(\blk000000fa/sig00000382 )
  );
  XORCY   \blk000000fa/blk0000015a  (
    .CI(\blk000000fa/sig0000037f ),
    .LI(\blk000000fa/sig00000380 ),
    .O(sig00000059)
  );
  MUXCY   \blk000000fa/blk00000159  (
    .CI(\blk000000fa/sig0000037f ),
    .DI(sig000000a4),
    .S(\blk000000fa/sig00000380 ),
    .O(\blk000000fa/sig00000381 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000158  (
    .I0(sig000000a4),
    .I1(sig00000081),
    .O(\blk000000fa/sig00000380 )
  );
  XORCY   \blk000000fa/blk00000157  (
    .CI(\blk000000fa/sig0000037d ),
    .LI(\blk000000fa/sig0000037e ),
    .O(sig00000058)
  );
  MUXCY   \blk000000fa/blk00000156  (
    .CI(\blk000000fa/sig0000037d ),
    .DI(sig000000a3),
    .S(\blk000000fa/sig0000037e ),
    .O(\blk000000fa/sig0000037f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000155  (
    .I0(sig000000a3),
    .I1(sig00000080),
    .O(\blk000000fa/sig0000037e )
  );
  XORCY   \blk000000fa/blk00000154  (
    .CI(\blk000000fa/sig0000037b ),
    .LI(\blk000000fa/sig0000037c ),
    .O(sig00000057)
  );
  MUXCY   \blk000000fa/blk00000153  (
    .CI(\blk000000fa/sig0000037b ),
    .DI(sig000000a2),
    .S(\blk000000fa/sig0000037c ),
    .O(\blk000000fa/sig0000037d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000152  (
    .I0(sig000000a2),
    .I1(sig0000007f),
    .O(\blk000000fa/sig0000037c )
  );
  XORCY   \blk000000fa/blk00000151  (
    .CI(\blk000000fa/sig00000379 ),
    .LI(\blk000000fa/sig0000037a ),
    .O(sig00000056)
  );
  MUXCY   \blk000000fa/blk00000150  (
    .CI(\blk000000fa/sig00000379 ),
    .DI(sig000000a1),
    .S(\blk000000fa/sig0000037a ),
    .O(\blk000000fa/sig0000037b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000014f  (
    .I0(sig000000a1),
    .I1(sig0000007e),
    .O(\blk000000fa/sig0000037a )
  );
  XORCY   \blk000000fa/blk0000014e  (
    .CI(\blk000000fa/sig00000377 ),
    .LI(\blk000000fa/sig00000378 ),
    .O(sig00000055)
  );
  MUXCY   \blk000000fa/blk0000014d  (
    .CI(\blk000000fa/sig00000377 ),
    .DI(sig000000a0),
    .S(\blk000000fa/sig00000378 ),
    .O(\blk000000fa/sig00000379 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000014c  (
    .I0(sig000000a0),
    .I1(sig0000007d),
    .O(\blk000000fa/sig00000378 )
  );
  XORCY   \blk000000fa/blk0000014b  (
    .CI(\blk000000fa/sig00000375 ),
    .LI(\blk000000fa/sig00000376 ),
    .O(sig00000054)
  );
  MUXCY   \blk000000fa/blk0000014a  (
    .CI(\blk000000fa/sig00000375 ),
    .DI(sig0000009f),
    .S(\blk000000fa/sig00000376 ),
    .O(\blk000000fa/sig00000377 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000149  (
    .I0(sig0000009f),
    .I1(sig0000007c),
    .O(\blk000000fa/sig00000376 )
  );
  XORCY   \blk000000fa/blk00000148  (
    .CI(\blk000000fa/sig00000373 ),
    .LI(\blk000000fa/sig00000374 ),
    .O(sig00000053)
  );
  MUXCY   \blk000000fa/blk00000147  (
    .CI(\blk000000fa/sig00000373 ),
    .DI(sig0000009e),
    .S(\blk000000fa/sig00000374 ),
    .O(\blk000000fa/sig00000375 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000146  (
    .I0(sig0000009e),
    .I1(sig0000007b),
    .O(\blk000000fa/sig00000374 )
  );
  XORCY   \blk000000fa/blk00000145  (
    .CI(\blk000000fa/sig00000371 ),
    .LI(\blk000000fa/sig00000372 ),
    .O(sig00000052)
  );
  MUXCY   \blk000000fa/blk00000144  (
    .CI(\blk000000fa/sig00000371 ),
    .DI(sig0000009d),
    .S(\blk000000fa/sig00000372 ),
    .O(\blk000000fa/sig00000373 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000143  (
    .I0(sig00000002),
    .I1(sig0000009d),
    .O(\blk000000fa/sig00000372 )
  );
  XORCY   \blk000000fa/blk00000142  (
    .CI(\blk000000fa/sig0000036f ),
    .LI(\blk000000fa/sig00000370 ),
    .O(sig00000051)
  );
  MUXCY   \blk000000fa/blk00000141  (
    .CI(\blk000000fa/sig0000036f ),
    .DI(sig0000009c),
    .S(\blk000000fa/sig00000370 ),
    .O(\blk000000fa/sig00000371 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000140  (
    .I0(sig00000002),
    .I1(sig0000009c),
    .O(\blk000000fa/sig00000370 )
  );
  XORCY   \blk000000fa/blk0000013f  (
    .CI(\blk000000fa/sig0000036d ),
    .LI(\blk000000fa/sig0000036e ),
    .O(sig00000050)
  );
  MUXCY   \blk000000fa/blk0000013e  (
    .CI(\blk000000fa/sig0000036d ),
    .DI(sig0000009b),
    .S(\blk000000fa/sig0000036e ),
    .O(\blk000000fa/sig0000036f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000013d  (
    .I0(sig00000002),
    .I1(sig0000009b),
    .O(\blk000000fa/sig0000036e )
  );
  XORCY   \blk000000fa/blk0000013c  (
    .CI(\blk000000fa/sig0000036b ),
    .LI(\blk000000fa/sig0000036c ),
    .O(sig0000004f)
  );
  MUXCY   \blk000000fa/blk0000013b  (
    .CI(\blk000000fa/sig0000036b ),
    .DI(sig0000009a),
    .S(\blk000000fa/sig0000036c ),
    .O(\blk000000fa/sig0000036d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000013a  (
    .I0(sig00000002),
    .I1(sig0000009a),
    .O(\blk000000fa/sig0000036c )
  );
  XORCY   \blk000000fa/blk00000139  (
    .CI(\blk000000fa/sig00000369 ),
    .LI(\blk000000fa/sig0000036a ),
    .O(sig0000004e)
  );
  MUXCY   \blk000000fa/blk00000138  (
    .CI(\blk000000fa/sig00000369 ),
    .DI(sig00000099),
    .S(\blk000000fa/sig0000036a ),
    .O(\blk000000fa/sig0000036b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000137  (
    .I0(sig00000002),
    .I1(sig00000099),
    .O(\blk000000fa/sig0000036a )
  );
  XORCY   \blk000000fa/blk00000136  (
    .CI(\blk000000fa/sig00000367 ),
    .LI(\blk000000fa/sig00000368 ),
    .O(sig0000004d)
  );
  MUXCY   \blk000000fa/blk00000135  (
    .CI(\blk000000fa/sig00000367 ),
    .DI(sig00000098),
    .S(\blk000000fa/sig00000368 ),
    .O(\blk000000fa/sig00000369 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000134  (
    .I0(sig00000002),
    .I1(sig00000098),
    .O(\blk000000fa/sig00000368 )
  );
  XORCY   \blk000000fa/blk00000133  (
    .CI(\blk000000fa/sig00000365 ),
    .LI(\blk000000fa/sig00000366 ),
    .O(sig0000004c)
  );
  MUXCY   \blk000000fa/blk00000132  (
    .CI(\blk000000fa/sig00000365 ),
    .DI(sig00000097),
    .S(\blk000000fa/sig00000366 ),
    .O(\blk000000fa/sig00000367 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000131  (
    .I0(sig00000002),
    .I1(sig00000097),
    .O(\blk000000fa/sig00000366 )
  );
  XORCY   \blk000000fa/blk00000130  (
    .CI(\blk000000fa/sig00000363 ),
    .LI(\blk000000fa/sig00000364 ),
    .O(sig0000004b)
  );
  MUXCY   \blk000000fa/blk0000012f  (
    .CI(\blk000000fa/sig00000363 ),
    .DI(sig00000096),
    .S(\blk000000fa/sig00000364 ),
    .O(\blk000000fa/sig00000365 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000012e  (
    .I0(sig00000002),
    .I1(sig00000096),
    .O(\blk000000fa/sig00000364 )
  );
  XORCY   \blk000000fa/blk0000012d  (
    .CI(\blk000000fa/sig00000361 ),
    .LI(\blk000000fa/sig00000362 ),
    .O(sig0000004a)
  );
  MUXCY   \blk000000fa/blk0000012c  (
    .CI(\blk000000fa/sig00000361 ),
    .DI(sig00000095),
    .S(\blk000000fa/sig00000362 ),
    .O(\blk000000fa/sig00000363 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000012b  (
    .I0(sig00000002),
    .I1(sig00000095),
    .O(\blk000000fa/sig00000362 )
  );
  XORCY   \blk000000fa/blk0000012a  (
    .CI(\blk000000fa/sig0000035f ),
    .LI(\blk000000fa/sig00000360 ),
    .O(sig00000049)
  );
  MUXCY   \blk000000fa/blk00000129  (
    .CI(\blk000000fa/sig0000035f ),
    .DI(sig00000094),
    .S(\blk000000fa/sig00000360 ),
    .O(\blk000000fa/sig00000361 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000128  (
    .I0(sig00000002),
    .I1(sig00000094),
    .O(\blk000000fa/sig00000360 )
  );
  XORCY   \blk000000fa/blk00000127  (
    .CI(\blk000000fa/sig0000035d ),
    .LI(\blk000000fa/sig0000035e ),
    .O(sig00000048)
  );
  MUXCY   \blk000000fa/blk00000126  (
    .CI(\blk000000fa/sig0000035d ),
    .DI(sig00000093),
    .S(\blk000000fa/sig0000035e ),
    .O(\blk000000fa/sig0000035f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000125  (
    .I0(sig00000002),
    .I1(sig00000093),
    .O(\blk000000fa/sig0000035e )
  );
  XORCY   \blk000000fa/blk00000124  (
    .CI(\blk000000fa/sig0000035b ),
    .LI(\blk000000fa/sig0000035c ),
    .O(sig00000047)
  );
  MUXCY   \blk000000fa/blk00000123  (
    .CI(\blk000000fa/sig0000035b ),
    .DI(sig00000092),
    .S(\blk000000fa/sig0000035c ),
    .O(\blk000000fa/sig0000035d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000122  (
    .I0(sig00000002),
    .I1(sig00000092),
    .O(\blk000000fa/sig0000035c )
  );
  XORCY   \blk000000fa/blk00000121  (
    .CI(\blk000000fa/sig00000359 ),
    .LI(\blk000000fa/sig0000035a ),
    .O(sig00000046)
  );
  MUXCY   \blk000000fa/blk00000120  (
    .CI(\blk000000fa/sig00000359 ),
    .DI(sig00000091),
    .S(\blk000000fa/sig0000035a ),
    .O(\blk000000fa/sig0000035b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000011f  (
    .I0(sig00000002),
    .I1(sig00000091),
    .O(\blk000000fa/sig0000035a )
  );
  XORCY   \blk000000fa/blk0000011e  (
    .CI(\blk000000fa/sig00000357 ),
    .LI(\blk000000fa/sig00000358 ),
    .O(sig00000045)
  );
  MUXCY   \blk000000fa/blk0000011d  (
    .CI(\blk000000fa/sig00000357 ),
    .DI(sig00000090),
    .S(\blk000000fa/sig00000358 ),
    .O(\blk000000fa/sig00000359 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000011c  (
    .I0(sig00000002),
    .I1(sig00000090),
    .O(\blk000000fa/sig00000358 )
  );
  XORCY   \blk000000fa/blk0000011b  (
    .CI(\blk000000fa/sig00000355 ),
    .LI(\blk000000fa/sig00000356 ),
    .O(sig00000044)
  );
  MUXCY   \blk000000fa/blk0000011a  (
    .CI(\blk000000fa/sig00000355 ),
    .DI(sig0000008f),
    .S(\blk000000fa/sig00000356 ),
    .O(\blk000000fa/sig00000357 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000119  (
    .I0(sig00000002),
    .I1(sig0000008f),
    .O(\blk000000fa/sig00000356 )
  );
  XORCY   \blk000000fa/blk00000118  (
    .CI(\blk000000fa/sig00000353 ),
    .LI(\blk000000fa/sig00000354 ),
    .O(sig00000043)
  );
  MUXCY   \blk000000fa/blk00000117  (
    .CI(\blk000000fa/sig00000353 ),
    .DI(sig0000008e),
    .S(\blk000000fa/sig00000354 ),
    .O(\blk000000fa/sig00000355 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000116  (
    .I0(sig00000002),
    .I1(sig0000008e),
    .O(\blk000000fa/sig00000354 )
  );
  XORCY   \blk000000fa/blk00000115  (
    .CI(\blk000000fa/sig00000351 ),
    .LI(\blk000000fa/sig00000352 ),
    .O(sig00000042)
  );
  MUXCY   \blk000000fa/blk00000114  (
    .CI(\blk000000fa/sig00000351 ),
    .DI(sig0000008d),
    .S(\blk000000fa/sig00000352 ),
    .O(\blk000000fa/sig00000353 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000113  (
    .I0(sig00000002),
    .I1(sig0000008d),
    .O(\blk000000fa/sig00000352 )
  );
  XORCY   \blk000000fa/blk00000112  (
    .CI(\blk000000fa/sig0000034f ),
    .LI(\blk000000fa/sig00000350 ),
    .O(sig00000041)
  );
  MUXCY   \blk000000fa/blk00000111  (
    .CI(\blk000000fa/sig0000034f ),
    .DI(sig0000008c),
    .S(\blk000000fa/sig00000350 ),
    .O(\blk000000fa/sig00000351 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000110  (
    .I0(sig00000002),
    .I1(sig0000008c),
    .O(\blk000000fa/sig00000350 )
  );
  XORCY   \blk000000fa/blk0000010f  (
    .CI(\blk000000fa/sig0000034d ),
    .LI(\blk000000fa/sig0000034e ),
    .O(sig00000040)
  );
  MUXCY   \blk000000fa/blk0000010e  (
    .CI(\blk000000fa/sig0000034d ),
    .DI(sig0000008b),
    .S(\blk000000fa/sig0000034e ),
    .O(\blk000000fa/sig0000034f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000010d  (
    .I0(sig00000002),
    .I1(sig0000008b),
    .O(\blk000000fa/sig0000034e )
  );
  XORCY   \blk000000fa/blk0000010c  (
    .CI(\blk000000fa/sig0000034b ),
    .LI(\blk000000fa/sig0000034c ),
    .O(sig0000003f)
  );
  MUXCY   \blk000000fa/blk0000010b  (
    .CI(\blk000000fa/sig0000034b ),
    .DI(sig0000008a),
    .S(\blk000000fa/sig0000034c ),
    .O(\blk000000fa/sig0000034d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk0000010a  (
    .I0(sig00000002),
    .I1(sig0000008a),
    .O(\blk000000fa/sig0000034c )
  );
  XORCY   \blk000000fa/blk00000109  (
    .CI(\blk000000fa/sig00000349 ),
    .LI(\blk000000fa/sig0000034a ),
    .O(sig0000003e)
  );
  MUXCY   \blk000000fa/blk00000108  (
    .CI(\blk000000fa/sig00000349 ),
    .DI(sig00000089),
    .S(\blk000000fa/sig0000034a ),
    .O(\blk000000fa/sig0000034b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000107  (
    .I0(sig00000002),
    .I1(sig00000089),
    .O(\blk000000fa/sig0000034a )
  );
  XORCY   \blk000000fa/blk00000106  (
    .CI(\blk000000fa/sig00000347 ),
    .LI(\blk000000fa/sig00000348 ),
    .O(sig0000003d)
  );
  MUXCY   \blk000000fa/blk00000105  (
    .CI(\blk000000fa/sig00000347 ),
    .DI(sig00000088),
    .S(\blk000000fa/sig00000348 ),
    .O(\blk000000fa/sig00000349 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000104  (
    .I0(sig00000002),
    .I1(sig00000088),
    .O(\blk000000fa/sig00000348 )
  );
  XORCY   \blk000000fa/blk00000103  (
    .CI(\blk000000fa/sig00000345 ),
    .LI(\blk000000fa/sig00000346 ),
    .O(sig0000003c)
  );
  MUXCY   \blk000000fa/blk00000102  (
    .CI(\blk000000fa/sig00000345 ),
    .DI(sig00000087),
    .S(\blk000000fa/sig00000346 ),
    .O(\blk000000fa/sig00000347 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk00000101  (
    .I0(sig00000002),
    .I1(sig00000087),
    .O(\blk000000fa/sig00000346 )
  );
  XORCY   \blk000000fa/blk00000100  (
    .CI(\blk000000fa/sig00000343 ),
    .LI(\blk000000fa/sig00000344 ),
    .O(sig0000003b)
  );
  MUXCY   \blk000000fa/blk000000ff  (
    .CI(\blk000000fa/sig00000343 ),
    .DI(sig00000086),
    .S(\blk000000fa/sig00000344 ),
    .O(\blk000000fa/sig00000345 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk000000fe  (
    .I0(sig00000002),
    .I1(sig00000086),
    .O(\blk000000fa/sig00000344 )
  );
  XORCY   \blk000000fa/blk000000fd  (
    .CI(sig00000002),
    .LI(\blk000000fa/sig00000342 ),
    .O(sig0000003a)
  );
  MUXCY   \blk000000fa/blk000000fc  (
    .CI(sig00000002),
    .DI(sig00000085),
    .S(\blk000000fa/sig00000342 ),
    .O(\blk000000fa/sig00000343 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk000000fa/blk000000fb  (
    .I0(sig00000002),
    .I1(sig00000085),
    .O(\blk000000fa/sig00000342 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001b8  (
    .C(aclk),
    .CE(\blk0000018b/sig000003cc ),
    .D(\blk0000018b/sig000003cf ),
    .Q(\blk0000018b/sig000003a5 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk0000018b/blk000001b7  (
    .A0(\blk0000018b/sig000003cb ),
    .A1(\blk0000018b/sig000003cb ),
    .A2(\blk0000018b/sig000003cb ),
    .A3(\blk0000018b/sig000003cb ),
    .CE(\blk0000018b/sig000003cc ),
    .CLK(aclk),
    .D(\blk0000018b/sig000003b4 ),
    .Q(\blk0000018b/sig000003cf ),
    .Q15(\NLW_blk0000018b/blk000001b7_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001b6  (
    .C(aclk),
    .CE(\blk0000018b/sig000003cc ),
    .D(\blk0000018b/sig000003ce ),
    .Q(\blk0000018b/sig000003a7 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk0000018b/blk000001b5  (
    .A0(\blk0000018b/sig000003cb ),
    .A1(\blk0000018b/sig000003cb ),
    .A2(\blk0000018b/sig000003cb ),
    .A3(\blk0000018b/sig000003cb ),
    .CE(\blk0000018b/sig000003cc ),
    .CLK(aclk),
    .D(\blk0000018b/sig000003b6 ),
    .Q(\blk0000018b/sig000003ce ),
    .Q15(\NLW_blk0000018b/blk000001b5_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001b4  (
    .C(aclk),
    .CE(\blk0000018b/sig000003cc ),
    .D(\blk0000018b/sig000003cd ),
    .Q(\blk0000018b/sig000003a3 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk0000018b/blk000001b3  (
    .A0(\blk0000018b/sig000003cb ),
    .A1(\blk0000018b/sig000003cb ),
    .A2(\blk0000018b/sig000003cb ),
    .A3(\blk0000018b/sig000003cb ),
    .CE(\blk0000018b/sig000003cc ),
    .CLK(aclk),
    .D(\blk0000018b/sig000003b2 ),
    .Q(\blk0000018b/sig000003cd ),
    .Q15(\NLW_blk0000018b/blk000001b3_Q15_UNCONNECTED )
  );
  VCC   \blk0000018b/blk000001b2  (
    .P(\blk0000018b/sig000003cc )
  );
  GND   \blk0000018b/blk000001b1  (
    .G(\blk0000018b/sig000003cb )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001b0  (
    .I0(\blk0000018b/sig000003b6 ),
    .I1(\blk0000018b/sig000003b5 ),
    .O(\blk0000018b/sig000003ca )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001af  (
    .I0(\blk0000018b/sig000003b4 ),
    .I1(\blk0000018b/sig000003b3 ),
    .O(\blk0000018b/sig000003c9 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001ae  (
    .I0(\blk0000018b/sig000003b0 ),
    .I1(\blk0000018b/sig000003af ),
    .O(\blk0000018b/sig000003c7 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001ad  (
    .I0(\blk0000018b/sig000003ae ),
    .I1(\blk0000018b/sig000003ad ),
    .O(\blk0000018b/sig000003c6 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001ac  (
    .I0(\blk0000018b/sig000003b2 ),
    .I1(\blk0000018b/sig000003b1 ),
    .O(\blk0000018b/sig000003c8 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001ab  (
    .I0(\blk0000018b/sig000003aa ),
    .I1(\blk0000018b/sig000003a9 ),
    .O(\blk0000018b/sig000003c4 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001aa  (
    .I0(\blk0000018b/sig000003a8 ),
    .I1(\blk0000018b/sig000003a7 ),
    .O(\blk0000018b/sig000003c3 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001a9  (
    .I0(\blk0000018b/sig000003ac ),
    .I1(\blk0000018b/sig000003ab ),
    .O(\blk0000018b/sig000003c5 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001a8  (
    .I0(\blk0000018b/sig000003a4 ),
    .I1(\blk0000018b/sig000003a3 ),
    .O(\blk0000018b/sig000003c1 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk0000018b/blk000001a7  (
    .I0(\blk0000018b/sig000003a6 ),
    .I1(\blk0000018b/sig000003a5 ),
    .O(\blk0000018b/sig000003c2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a6  (
    .C(aclk),
    .D(\blk0000018b/sig000003a4 ),
    .Q(\blk0000018b/sig000003a9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a5  (
    .C(aclk),
    .D(\blk0000018b/sig000003a6 ),
    .Q(\blk0000018b/sig000003ab )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a4  (
    .C(aclk),
    .D(\blk0000018b/sig000003a8 ),
    .Q(\blk0000018b/sig000003ad )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a3  (
    .C(aclk),
    .D(\blk0000018b/sig000003aa ),
    .Q(\blk0000018b/sig000003af )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a2  (
    .C(aclk),
    .D(\blk0000018b/sig000003ac ),
    .Q(\blk0000018b/sig000003b1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a1  (
    .C(aclk),
    .D(\blk0000018b/sig000003ae ),
    .Q(\blk0000018b/sig000003b3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk000001a0  (
    .C(aclk),
    .D(\blk0000018b/sig000003b0 ),
    .Q(\blk0000018b/sig000003b5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000019f  (
    .C(aclk),
    .D(sig00000084),
    .Q(\blk0000018b/sig000003a4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000019e  (
    .C(aclk),
    .D(sig00000083),
    .Q(\blk0000018b/sig000003a6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000019d  (
    .C(aclk),
    .D(sig00000082),
    .Q(\blk0000018b/sig000003a8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000019c  (
    .C(aclk),
    .D(sig00000081),
    .Q(\blk0000018b/sig000003aa )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000019b  (
    .C(aclk),
    .D(sig00000080),
    .Q(\blk0000018b/sig000003ac )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000019a  (
    .C(aclk),
    .D(sig0000007f),
    .Q(\blk0000018b/sig000003ae )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000199  (
    .C(aclk),
    .D(sig0000007e),
    .Q(\blk0000018b/sig000003b0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000198  (
    .C(aclk),
    .D(sig0000007d),
    .Q(\blk0000018b/sig000003b2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000197  (
    .C(aclk),
    .D(sig0000007c),
    .Q(\blk0000018b/sig000003b4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000196  (
    .C(aclk),
    .D(sig0000007b),
    .Q(\blk0000018b/sig000003b6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000195  (
    .C(aclk),
    .D(\blk0000018b/sig000003c1 ),
    .Q(sig00000084)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000194  (
    .C(aclk),
    .D(\blk0000018b/sig000003c2 ),
    .Q(sig00000083)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000193  (
    .C(aclk),
    .D(\blk0000018b/sig000003c3 ),
    .Q(sig00000082)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000192  (
    .C(aclk),
    .D(\blk0000018b/sig000003c4 ),
    .Q(sig00000081)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000191  (
    .C(aclk),
    .D(\blk0000018b/sig000003c5 ),
    .Q(sig00000080)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk00000190  (
    .C(aclk),
    .D(\blk0000018b/sig000003c6 ),
    .Q(sig0000007f)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000018f  (
    .C(aclk),
    .D(\blk0000018b/sig000003c7 ),
    .Q(sig0000007e)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000018e  (
    .C(aclk),
    .D(\blk0000018b/sig000003c8 ),
    .Q(sig0000007d)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000018d  (
    .C(aclk),
    .D(\blk0000018b/sig000003c9 ),
    .Q(sig0000007c)
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk0000018b/blk0000018c  (
    .C(aclk),
    .D(\blk0000018b/sig000003ca ),
    .Q(sig0000007b)
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
