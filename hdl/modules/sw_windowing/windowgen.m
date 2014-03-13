% Generates NIF file for input conditioning window.

% fswR = 1000
fswR = 1112/2
bit_width = 24
window = @tukeywin2
filename = 'window_n_556.ram'

memsize = fswR/2 + 1

fullwindow = window(fswR)*(1-2^-bit_width);
halfwindow = sfi(fullwindow(1:memsize),bit_width,bit_width-1);

fileID = fopen(filename,'w');
% must be a loop (not a simple fprintf) because of the hex function
for index = 1: memsize,
 fprintf(fileID,'write %04x %04s\r\n', index-1, hex(halfwindow(index)));
end 
