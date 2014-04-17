% Generates NIF file for SIN and COS dds

clock_freq = 120e6
bit_width = 24
sig_freq = 20e6
sin_filename = 'dds_sin.nif'
cos_filename = 'dds_cos.nif'

%find the number of cycles that perfectly represents the
%sig_freq in clock_freq samples
samples = lcm(clock_freq, sig_freq)/gcd(clock_freq,sig_freq);

Ts = 1/clock_freq;
t = Ts : Ts : samples*Ts;

memsize = samples;

sin_value = sin(2*pi*t*sig_freq)*(1-2^-bit_width);
cos_value = cos(2*pi*t*sig_freq)*(1-2^-bit_width);

sin_fixed = sfi(sin_value,bit_width,bit_width-1);
cos_fixed = sfi(cos_value,bit_width,bit_width-1);

sinID = fopen(sin_filename,'w');
cosID = fopen(cos_filename,'w');

% must be a loop (not a simple fprintf) because of the hex function
for index = 1: memsize,
 fprintf(sinID,'write %04x %04s\r\n', index-1, hex(sin_fixed(index)));
 fprintf(cosID,'write %04x %04s\r\n', index-1, hex(cos_fixed(index)));
end 