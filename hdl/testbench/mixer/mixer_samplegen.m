filename = 'mixer.samples';

duration = 50e-3;
data_freq = 35/148*476e6;
carrier_freq = data_freq*8/35;
modulating_freq = 2e3;

bit_width = 16;

Ts = 1/data_freq;
t = 0:Ts:duration-Ts;

carrier = sin(2*pi*t*carrier_freq);
modulating = sin(2*pi*t*modulating_freq);

signal = round(((0.5+0.1*modulating).*carrier)*2^(bit_width-1)-1);

fileID = fopen(filename,'w');
for count = 1 : length(signal)
    fprintf(fileID, '%d\r\n',signal(count));
end