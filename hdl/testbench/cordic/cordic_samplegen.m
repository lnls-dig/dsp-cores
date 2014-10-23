%% Generates I and Q samples for vectoring mode test
vectoringfile = 'vectoring_in.dat'
rotatingfile  = 'rotating_in.dat'

duration = 10e-6;
adc_freq = 100e6;
Ts = 1/adc_freq;

fc = 1e6;

t = 0:Ts:duration-Ts;

mag   = (sawtooth(2*pi*fc*t)+1)/2;
phase = linspace(-pi, pi,length(mag));

[I, Q] = pol2cart(phase,mag);

%reescale to put in input file
phase = phase/pi;

vectorfileID = fopen(vectoringfile,'w');
rotfileID = fopen(rotatingfile,'w');
for count = 1 : length(mag)
    fprintf(vectorfileID,'%e %e\r\n',I(count),Q(count));
    fprintf(rotfileID,'%e %e\r\n',mag(count),phase(count));
end