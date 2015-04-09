filename = 'simple_in.samples';

duration = 5e-3;
carrier_freq = 477e6;
data_freq = 35/148*carrier_freq;
modulating_freq = data_freq/35/3223*2;
bit_width = 16;

Ts = 1/data_freq;
t = 0:Ts:duration-Ts;

carrier = sin(2*pi*t*carrier_freq);
modulating = sin(2*pi*t*modulating_freq);

signal = round(((0.5+0.1*modulating).*carrier) * (2^(bit_width-1)-1));

adc_a = signal;
adc_b = signal;
adc_c = signal;
adc_d = signal;


%% Print file if option chosen
fileID = fopen(filename,'w');
for count = 1 : length(adc_a)
    fprintf(fileID,'%i\t%i\t%i\t%i\r\n',adc_a(count),adc_b(count), adc_c(count), adc_d(count));
end