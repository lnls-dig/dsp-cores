// machine generated from cordicgx.m
// o=26  s=24
`ifndef CORDIC_COMPUTE
parameter cordic_delay=24;
`else
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
`endif
