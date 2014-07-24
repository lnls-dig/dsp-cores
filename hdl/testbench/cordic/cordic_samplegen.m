%noisegen
filename = 'samples.dat'

duration = 10e-6;
adc_freq = 100e6;
Ts = 1/adc_freq;

fc = 0.1e6;

t = 0:Ts:duration-Ts;

mag   = 0.5*sawtooth(2*pi*fc*t)+0.5;
phase = pi/4;%linspace(0,2*pi,length(mag));

[I, Q] = pol2cart(phase,mag);

fileID = fopen(filename,'w');
for count = 1 : length(mag)
    fprintf(fileID,'%e %e\r\n',I(count),Q(count));
end 