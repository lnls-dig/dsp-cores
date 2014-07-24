// cordicg.v
// CORDIC processor
// Larry Doolittle, LBNL
// reference:
//   http://www.fpga-guru.com/cordic.htm

`timescale 1ns / 1ns

module addsubg(a,b,sum,control);
	parameter size=16;
	input [size-1:0] a, b;
	input control;
	output [size-1:0] sum;
	assign sum = control ? (a + b) : (a - b);
endmodule

module cstageg(clk, opin, xin, yin, zin, ain, opout, xout, yout, zout);
	parameter shift=1;
	parameter zwidth=16;
	parameter width=16;
	parameter def_op=0;
	input clk;
	input [1:0] opin;
	input [width-1:0] xin, yin;
	input [zwidth-1:0] zin, ain;
	output reg [1:0] opout;
	output reg [width-1:0] xout, yout;
	output reg [zwidth-1:0] zout;

	initial begin
		opout=def_op;  xout=0;  yout=0;  zout=0;
	end

	reg control_h=0;  // local saved state to implement slave mode
	wire control_l = opin[0] ? ~yin[width-1] : zin[zwidth-1];
	wire control = opin[1] ? ~control_h : control_l;
	wire [width-1:0] xv, yv;
	wire [zwidth-1:0] zv;
	addsubg #( width) ax(xin, {{(shift){yin[width-1]}},yin[width-1:shift]}, xv,  control);
	addsubg #( width) ay(yin, {{(shift){xin[width-1]}},xin[width-1:shift]}, yv, ~control);
	addsubg #(zwidth) az(zin,                                         ain , zv,  control);
	always @(posedge clk) begin
		opout <= opin;
		xout  <= xv;
		yout  <= yv;
		zout  <= zv;
		control_h <= control_l;
	end
endmodule

module cordicg(clk, opin, xin, yin, phasein, xout, yout, phaseout);
	parameter width=19;
	parameter def_op=0;
	input clk;   // timespec 8.33 ns
	input [1:0] opin;  //  1 forces y to zero (rect to polar), 0 forces theta to zero (polar to rect), 3 for slave mode
	input [width-1:0] xin;
	input [width-1:0] yin;
	input [width:0] phasein;
	output [width-1:0] xout;
	output [width-1:0] yout;
	output [width:0] phaseout;

// input buffer stage (routing)
reg [1:0] opin0=def_op;
reg [width-1:0] xin0=0, yin0=0;
reg [width:0] phasein0=0;
always @(posedge clk) begin
	opin0    <= opin;
	xin0     <= xin;
	yin0     <= yin;
	phasein0 <= phasein;
end

// zero stage: doesn't quite fit the pattern
reg  [1:0] op0=def_op;
wire [width-1:0] xw0,  yw0  ; wire [width:0] zw0;
reg  [width-1:0] x0=0, y0=0 ; reg  [width:0] z0=0;
wire control0_l = opin0[0] ? xin0[width-1] : phasein0[width]^phasein0[width-1];
reg control0_h=0;
// No inversion of control0_h, unlike all the other stages!
// Rotation is either 0 or 180, which are their own inverses.
wire control0 = opin0[1] ? control0_h : control0_l;
addsubg #(width) ax0 ({width{1'b0}}, xin0, xw0, ~control0);
addsubg #(width) ay0 ({width{1'b0}}, yin0, yw0, ~control0);
assign zw0 = {phasein0[width]^control0,phasein0[width-1:0]};
always @(posedge clk) begin op0 <= opin0; x0 <= xw0; y0 <= yw0; z0 <= zw0; control0_h <= control0_l; end

// first stage: can't use cstageg because repeat operator of zero is illegal
reg  [1:0] op1=def_op;
wire [width-1:0] xw1,   yw1   ; wire [width:0] zw1;
reg  [width-1:0] xt1=0, yt1=0 ; reg  [width:0] zt1=0;
wire control1_l = op0[0] ? ~y0[width-1] : z0[width];
reg control1_h=0;
wire control1 = op0[1] ? ~control1_h : control1_l;
addsubg #(width) ax1 (x0, y0, xw1,  control1);
addsubg #(width) ay1 (y0, x0, yw1, ~control1);
addsubg #(width+1) az1 (z0, {3'b001,{(width-2){1'b0}}}, zw1,  control1);
always @(posedge clk) begin op1 <= op0; xt1 <= xw1; yt1 <= yw1; zt1 <= zw1; control1_h <= control1_l; end
wire [25:0] x1 = {xt1,{(26-width){1'b0}}};
wire [25:0] y1 = {yt1,{(26-width){1'b0}}};
wire [26:0] z1 = {zt1,{(26-width){1'b0}}};
wire [1:0] op2 ; wire [25:0] x2 , y2 ; wire [26:0] z2 ;  cstageg #(  1, 27, 26, def_op) cs1  (clk, op1 , x1 ,  y1 , z1 , 27'd9904169, op2 , x2 ,  y2 ,  z2 );
wire [1:0] op3 ; wire [25:0] x3 , y3 ; wire [26:0] z3 ;  cstageg #(  2, 27, 26, def_op) cs2  (clk, op2 , x2 ,  y2 , z2 , 27'd5233091, op3 , x3 ,  y3 ,  z3 );
wire [1:0] op4 ; wire [25:0] x4 , y4 ; wire [26:0] z4 ;  cstageg #(  3, 27, 26, def_op) cs3  (clk, op3 , x3 ,  y3 , z3 , 27'd2656399, op4 , x4 ,  y4 ,  z4 );
wire [1:0] op5 ; wire [25:0] x5 , y5 ; wire [26:0] z5 ;  cstageg #(  4, 27, 26, def_op) cs4  (clk, op4 , x4 ,  y4 , z4 , 27'd1333354, op5 , x5 ,  y5 ,  z5 );
wire [1:0] op6 ; wire [25:0] x6 , y6 ; wire [26:0] z6 ;  cstageg #(  5, 27, 26, def_op) cs5  (clk, op5 , x5 ,  y5 , z5 , 27'd667327, op6 , x6 ,  y6 ,  z6 );
wire [1:0] op7 ; wire [25:0] x7 , y7 ; wire [26:0] z7 ;  cstageg #(  6, 27, 26, def_op) cs6  (clk, op6 , x6 ,  y6 , z6 , 27'd333745, op7 , x7 ,  y7 ,  z7 );
wire [1:0] op8 ; wire [25:0] x8 , y8 ; wire [26:0] z8 ;  cstageg #(  7, 27, 26, def_op) cs7  (clk, op7 , x7 ,  y7 , z7 , 27'd166883, op8 , x8 ,  y8 ,  z8 );
wire [1:0] op9 ; wire [25:0] x9 , y9 ; wire [26:0] z9 ;  cstageg #(  8, 27, 26, def_op) cs8  (clk, op8 , x8 ,  y8 , z8 , 27'd83443 , op9 , x9 ,  y9 ,  z9 );
wire [1:0] op10; wire [25:0] x10, y10; wire [26:0] z10;  cstageg #(  9, 27, 26, def_op) cs9  (clk, op9 , x9 ,  y9 , z9 , 27'd41721 , op10, x10,  y10,  z10);
wire [1:0] op11; wire [25:0] x11, y11; wire [26:0] z11;  cstageg #( 10, 27, 26, def_op) cs10 (clk, op10, x10,  y10, z10, 27'd20861 , op11, x11,  y11,  z11);
wire [1:0] op12; wire [25:0] x12, y12; wire [26:0] z12;  cstageg #( 11, 27, 26, def_op) cs11 (clk, op11, x11,  y11, z11, 27'd10430 , op12, x12,  y12,  z12);
wire [1:0] op13; wire [25:0] x13, y13; wire [26:0] z13;  cstageg #( 12, 27, 26, def_op) cs12 (clk, op12, x12,  y12, z12, 27'd5215  , op13, x13,  y13,  z13);
wire [1:0] op14; wire [25:0] x14, y14; wire [26:0] z14;  cstageg #( 13, 27, 26, def_op) cs13 (clk, op13, x13,  y13, z13, 27'd2608  , op14, x14,  y14,  z14);
wire [1:0] op15; wire [25:0] x15, y15; wire [26:0] z15;  cstageg #( 14, 27, 26, def_op) cs14 (clk, op14, x14,  y14, z14, 27'd1304  , op15, x15,  y15,  z15);
wire [1:0] op16; wire [25:0] x16, y16; wire [26:0] z16;  cstageg #( 15, 27, 26, def_op) cs15 (clk, op15, x15,  y15, z15, 27'd652   , op16, x16,  y16,  z16);
wire [1:0] op17; wire [25:0] x17, y17; wire [26:0] z17;  cstageg #( 16, 27, 26, def_op) cs16 (clk, op16, x16,  y16, z16, 27'd326   , op17, x17,  y17,  z17);
wire [1:0] op18; wire [25:0] x18, y18; wire [26:0] z18;  cstageg #( 17, 27, 26, def_op) cs17 (clk, op17, x17,  y17, z17, 27'd163   , op18, x18,  y18,  z18);
wire [1:0] op19; wire [25:0] x19, y19; wire [26:0] z19;  cstageg #( 18, 27, 26, def_op) cs18 (clk, op18, x18,  y18, z18, 27'd81    , op19, x19,  y19,  z19);
wire [1:0] op20; wire [25:0] x20, y20; wire [26:0] z20;  cstageg #( 19, 27, 26, def_op) cs19 (clk, op19, x19,  y19, z19, 27'd41    , op20, x20,  y20,  z20);
wire [1:0] op21; wire [25:0] x21, y21; wire [26:0] z21;  cstageg #( 20, 27, 26, def_op) cs20 (clk, op20, x20,  y20, z20, 27'd20    , op21, x21,  y21,  z21);
wire [1:0] op22; wire [25:0] x22, y22; wire [26:0] z22;  cstageg #( 21, 27, 26, def_op) cs21 (clk, op21, x21,  y21, z21, 27'd10    , op22, x22,  y22,  z22);
wire [1:0] op23; wire [25:0] x23, y23; wire [26:0] z23;  cstageg #( 22, 27, 26, def_op) cs22 (clk, op22, x22,  y22, z22, 27'd5     , op23, x23,  y23,  z23);
// round, not truncate
assign xout     = x23[25:26-width] + x23[25-width];
assign yout     = y23[25:26-width] + y23[25-width];
assign phaseout = z23[26:26-width] + z23[25-width];
endmodule
