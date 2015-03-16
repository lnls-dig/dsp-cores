filename = 'mixer.samples';

duration = 25e-3;
carrier_freq = 477e6;
data_freq = 35/148*carrier_freq;

modulating_freq = 2e3;

bit_width = 16;

Ts = 1/data_freq;
t = 0:Ts:duration-Ts;

carrier = sin(2*pi*t*carrier_freq);
modulating = sin(2*pi*t*modulating_freq);

signal = (0.5+0.1*modulating).*carrier;

fileID = fopen(filename,'w');
for count = 1 : length(signal)
    fprintf(fileID, '%e\r\n',signal(count));
end 
