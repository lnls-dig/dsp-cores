isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

if isOctave 
	pkg load all
end

%% Generates I and Q samples for vectoring mode test
vectoringfile = 'vectoring_in.samples'
rotatingfile  = 'rotating_in.samples'

duration = 10e-6;
adc_freq = 100e6;
Ts = 1/adc_freq;
bits = 32;

fc = 1e6;

t = 0:Ts:duration-Ts;

mag   = (sawtooth(2*pi*fc*t)+1)/2;
phase = linspace(-pi/pi, pi/pi,length(mag));

[I, Q] = pol2cart(phase,mag);

%reescale to put in input file
phase = phase/pi;

vectorfileID = fopen(vectoringfile,'w');
rotfileID = fopen(rotatingfile,'w');
for count = 1 : length(mag)
    fprintf(vectorfileID,'%d %d\r\n',int32(I(count)*(2^(bits-1)-1)),int32(Q(count)*(2^(bits-1)-1)));
    fprintf(rotfileID,'%e %e\r\n',mag(count),phase(count));
end
