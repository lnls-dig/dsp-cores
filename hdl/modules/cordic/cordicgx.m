cordicg_conf

fprintf('// machine generated from cordicgx.m\n');
fprintf('// o=%d  s=%d\n', o, s);
fprintf('`ifndef CORDIC_COMPUTE\n');
fprintf('parameter cordic_delay=%d;\n', s);
fprintf('`else\n');

% 39 is ASCII for single-quote
fprintf('wire [%d:0] x1 = {xt1,{(%d-width){1%cb0}}};\n', o-1, o, 39);
fprintf('wire [%d:0] y1 = {yt1,{(%d-width){1%cb0}}};\n', o-1, o, 39);
fprintf('wire [%d:0] z1 = {zt1,{(%d-width){1%cb0}}};\n', o,   o, 39);

ix=[0:s-2];
a=floor(atan((0.5).^ix)/(2*pi)*2^(o+1)+.5);
for i=[1:s-2]
  fprintf('wire [1:0] op%-2d; wire [%d:0] x%-2d, y%-2d; wire [%d:0] z%-2d;  ', i+1, o-1, i+1, i+1, o, i+1);
  fprintf('cstageg #( %2d, %d, %d, def_op) ', i, o+1, o);
  fprintf('cs%-2d (clk, op%-2d, x%-2d,  y%-2d, z%-2d, %2d%cd%-6d, op%-2d, x%-2d,  y%-2d,  z%-2d);\n',i,i,i,i,i,o+1,39,a(i+1),i+1,i+1,i+1,i+1);
end

% This rounding construction can be considered wasteful; it adds
% hardware and slows the logic down.  OTOH, I haven't found any
% alternative that works as well.

fprintf('// round, not truncate\n');
fprintf('assign xout     = x%d[%d:%d-width] + x%d[%d-width];\n', s-1, o-1, o, s-1, o-1);
fprintf('assign yout     = y%d[%d:%d-width] + y%d[%d-width];\n', s-1, o-1, o, s-1, o-1);
fprintf('assign phaseout = z%d[%d:%d-width] + z%d[%d-width];\n', s-1, o,   o, s-1, o-1);
fprintf('`endif\n');
