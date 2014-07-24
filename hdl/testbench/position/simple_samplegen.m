filename = 'simple_in.samples';

duration = 50e-3;
data_freq = 120e6;
carrier_freq = 20e6;
modulating_freq = 2e3;

Ts = 1/data_freq;
t = 0:Ts:duration-Ts;

carrier = sin(2*pi*t*carrier_freq);
modulating = sin(2*pi*t*modulating_freq);

signal = (1+0.1*modulating).*carrier;

adc_a = signal;
adc_b = signal;
adc_c = signal;
adc_d = signal;


%% Print file if option chosen
fileID = fopen(filename,'w');
for count = 1 : length(adc_a)
    fprintf(fileID,'%e\t%e\t%e\t%e\r\n',adc_a(count),adc_b(count), adc_c(count), adc_d(count));
end