// machine generated from cordicgx.m
// o=35  s=31
`ifndef CORDIC_COMPUTE
parameter cordic_delay=31;
`else
wire [34:0] x1 = {xt1,{(35-width){1'b0}}};
wire [34:0] y1 = {yt1,{(35-width){1'b0}}};
wire [35:0] z1 = {zt1,{(35-width){1'b0}}};
wire [1:0] op2 ; wire [34:0] x2 , y2 ; wire [35:0] z2 ;  cstageg #(  1, 36, 35, def_op) cs1  (clk, op1 , x1 ,  y1 , z1 , 36'd775967194, op2 , x2 ,  y2 ,  z2 );
wire [1:0] op3 ; wire [34:0] x3 , y3 ; wire [35:0] z3 ;  cstageg #(  2, 36, 35, def_op) cs2  (clk, op2 , x2 ,  y2 , z2 , 36'd-1615624778, op3 , x3 ,  y3 ,  z3 );
wire [1:0] op4 ; wire [34:0] x4 , y4 ; wire [35:0] z4 ;  cstageg #(  3, 36, 35, def_op) cs3  (clk, op3 , x3 ,  y3 , z3 , 36'd1360076098, op4 , x4 ,  y4 ,  z4 );
wire [1:0] op5 ; wire [34:0] x5 , y5 ; wire [35:0] z5 ;  cstageg #(  4, 36, 35, def_op) cs4  (clk, op4 , x4 ,  y4 , z4 , 36'd682677297, op5 , x5 ,  y5 ,  z5 );
wire [1:0] op6 ; wire [34:0] x6 , y6 ; wire [35:0] z6 ;  cstageg #(  5, 36, 35, def_op) cs5  (clk, op5 , x5 ,  y5 , z5 , 36'd341671446, op6 , x6 ,  y6 ,  z6 );
wire [1:0] op7 ; wire [34:0] x7 , y7 ; wire [35:0] z7 ;  cstageg #(  6, 36, 35, def_op) cs6  (clk, op6 , x6 ,  y6 , z6 , 36'd170877414, op7 , x7 ,  y7 ,  z7 );
wire [1:0] op8 ; wire [34:0] x8 , y8 ; wire [35:0] z8 ;  cstageg #(  7, 36, 35, def_op) cs7  (clk, op7 , x7 ,  y7 , z7 , 36'd85443921, op8 , x8 ,  y8 ,  z8 );
wire [1:0] op9 ; wire [34:0] x9 , y9 ; wire [35:0] z9 ;  cstageg #(  8, 36, 35, def_op) cs8  (clk, op8 , x8 ,  y8 , z8 , 36'd42722612, op9 , x9 ,  y9 ,  z9 );
wire [1:0] op10; wire [34:0] x10, y10; wire [35:0] z10;  cstageg #(  9, 36, 35, def_op) cs9  (clk, op9 , x9 ,  y9 , z9 , 36'd21361388, op10, x10,  y10,  z10);
wire [1:0] op11; wire [34:0] x11, y11; wire [35:0] z11;  cstageg #( 10, 36, 35, def_op) cs10 (clk, op10, x10,  y10, z10, 36'd10680704, op11, x11,  y11,  z11);
wire [1:0] op12; wire [34:0] x12, y12; wire [35:0] z12;  cstageg #( 11, 36, 35, def_op) cs11 (clk, op11, x11,  y11, z11, 36'd5340353, op12, x12,  y12,  z12);
wire [1:0] op13; wire [34:0] x13, y13; wire [35:0] z13;  cstageg #( 12, 36, 35, def_op) cs12 (clk, op12, x12,  y12, z12, 36'd2670177, op13, x13,  y13,  z13);
wire [1:0] op14; wire [34:0] x14, y14; wire [35:0] z14;  cstageg #( 13, 36, 35, def_op) cs13 (clk, op13, x13,  y13, z13, 36'd1335088, op14, x14,  y14,  z14);
wire [1:0] op15; wire [34:0] x15, y15; wire [35:0] z15;  cstageg #( 14, 36, 35, def_op) cs14 (clk, op14, x14,  y14, z14, 36'd667544, op15, x15,  y15,  z15);
wire [1:0] op16; wire [34:0] x16, y16; wire [35:0] z16;  cstageg #( 15, 36, 35, def_op) cs15 (clk, op15, x15,  y15, z15, 36'd333772, op16, x16,  y16,  z16);
wire [1:0] op17; wire [34:0] x17, y17; wire [35:0] z17;  cstageg #( 16, 36, 35, def_op) cs16 (clk, op16, x16,  y16, z16, 36'd166886, op17, x17,  y17,  z17);
wire [1:0] op18; wire [34:0] x18, y18; wire [35:0] z18;  cstageg #( 17, 36, 35, def_op) cs17 (clk, op17, x17,  y17, z17, 36'd83443 , op18, x18,  y18,  z18);
wire [1:0] op19; wire [34:0] x19, y19; wire [35:0] z19;  cstageg #( 18, 36, 35, def_op) cs18 (clk, op18, x18,  y18, z18, 36'd41722 , op19, x19,  y19,  z19);
wire [1:0] op20; wire [34:0] x20, y20; wire [35:0] z20;  cstageg #( 19, 36, 35, def_op) cs19 (clk, op19, x19,  y19, z19, 36'd20861 , op20, x20,  y20,  z20);
wire [1:0] op21; wire [34:0] x21, y21; wire [35:0] z21;  cstageg #( 20, 36, 35, def_op) cs20 (clk, op20, x20,  y20, z20, 36'd10430 , op21, x21,  y21,  z21);
wire [1:0] op22; wire [34:0] x22, y22; wire [35:0] z22;  cstageg #( 21, 36, 35, def_op) cs21 (clk, op21, x21,  y21, z21, 36'd5215  , op22, x22,  y22,  z22);
wire [1:0] op23; wire [34:0] x23, y23; wire [35:0] z23;  cstageg #( 22, 36, 35, def_op) cs22 (clk, op22, x22,  y22, z22, 36'd2608  , op23, x23,  y23,  z23);
wire [1:0] op24; wire [34:0] x24, y24; wire [35:0] z24;  cstageg #( 23, 36, 35, def_op) cs23 (clk, op23, x23,  y23, z23, 36'd1304  , op24, x24,  y24,  z24);
wire [1:0] op25; wire [34:0] x25, y25; wire [35:0] z25;  cstageg #( 24, 36, 35, def_op) cs24 (clk, op24, x24,  y24, z24, 36'd652   , op25, x25,  y25,  z25);
wire [1:0] op26; wire [34:0] x26, y26; wire [35:0] z26;  cstageg #( 25, 36, 35, def_op) cs25 (clk, op25, x25,  y25, z25, 36'd326   , op26, x26,  y26,  z26);
wire [1:0] op27; wire [34:0] x27, y27; wire [35:0] z27;  cstageg #( 26, 36, 35, def_op) cs26 (clk, op26, x26,  y26, z26, 36'd163   , op27, x27,  y27,  z27);
wire [1:0] op28; wire [34:0] x28, y28; wire [35:0] z28;  cstageg #( 27, 36, 35, def_op) cs27 (clk, op27, x27,  y27, z27, 36'd81    , op28, x28,  y28,  z28);
wire [1:0] op29; wire [34:0] x29, y29; wire [35:0] z29;  cstageg #( 28, 36, 35, def_op) cs28 (clk, op28, x28,  y28, z28, 36'd41    , op29, x29,  y29,  z29);
wire [1:0] op30; wire [34:0] x30, y30; wire [35:0] z30;  cstageg #( 29, 36, 35, def_op) cs29 (clk, op29, x29,  y29, z29, 36'd20    , op30, x30,  y30,  z30);
// round, not truncate
assign xout     = x30[34:35-width] + x30[34-width];
assign yout     = y30[34:35-width] + y30[34-width];
assign phaseout = z30[35:35-width] + z30[34-width];
`endif
