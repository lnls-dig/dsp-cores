% Generates NIF file for input conditioning window.

% fswR = 1000
% fswR = 1112/2
fswR = 1000/2
bit_width = 24
window = @tukeywin2
filename = 'window_n_500.ram'

memsize = fswR/2 + 1

fullwindow = window(fswR)*(1-2^-bit_width);
% MATLAB
%halfwindow = sfi(fullwindow(1:memsize),bit_width,bit_width-1);
% OCTAVE
halfwindow = fixed(1, bit_width-1, fullwindow(1:memsize));

fileID = fopen(filename,'w');
% must be a loop (not a simple fprintf) because of the hex function
for index = 1: memsize,
 fprintf(fileID,'write %04x %06x\r\n', index-1, uint32(float(halfwindow(index))*2^(bit_width-1)));
end 
