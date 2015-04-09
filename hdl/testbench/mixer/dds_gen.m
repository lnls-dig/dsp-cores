% Generates NIF file for SIN and COS dds

bit_width = 16

freq_num = 8;
freq_den = 35;

sin_filename = 'dds_sin.nif'
cos_filename = 'dds_cos.nif'

n = 0 : freq_den-1;

memsize = freq_den;

sin_value = sin(2*pi*n*freq_num/freq_den)*(1-2^-bit_width);
cos_value = cos(2*pi*n*freq_num/freq_den)*(1-2^-bit_width);

sin_fixed = sfi(sin_value,bit_width,bit_width-1);
cos_fixed = sfi(cos_value,bit_width,bit_width-1);

sinID = fopen(sin_filename,'w');
cosID = fopen(cos_filename,'w');

% must be a loop (not a simple fprintf) because of the hex function
for index = 1: memsize,
 fprintf(sinID,'write %04x %04s\r\n', index-1, hex(sin_fixed(index)));
 fprintf(cosID,'write %04x %04s\r\n', index-1, hex(cos_fixed(index)));
end 