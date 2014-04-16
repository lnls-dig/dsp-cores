filename = 'cic.samples';
duration = 50e-3;
input_freq = 120e6;

Ts = 1/input_freq;
t = 0:Ts:duration-Ts;

signal = sin(2*pi*t*10e3) ...
        +sin(2*pi*t*30e3) ...
        +sin(2*pi*t*50e3) ...
        +sin(2*pi*t*60e3) ...
        +sin(2*pi*t*100e3)...
        +sin(2*pi*t*118e3);

% Set max peak value to something near, but necessarily below 1
signal = 0.99*signal./max(signal);

fileID = fopen(filename,'w');
for count = 1 : length(signal)
    fprintf(fileID, '%e\r\n',signal(count));
end

beep;