% Generates .COE file for 16-bit SIN and COS dds 

freq_num = 52;
freq_den = 203;

machine = 'sirius';

npts = freq_den;

% Compute integer sine and cosine waves
% By using pi/4 phase on both waves guarantees perfectly matched amplitudes
% and offsets.
cos_double = cos(2*pi*(0:npts-1)*freq_num/freq_den + pi/4)';
cos_integer = int16(round((2^15 - 1)*cos_double));
sin_integer = -[cos_integer(1); cos_integer(end:-1:2)];

% Write waves to file
sinID = fopen(sprintf('sin_lut_%s_%d_%d.coe', machine, freq_num, freq_den), 'w');
cosID = fopen(sprintf('cos_lut_%s_%d_%d.coe', machine, freq_num, freq_den), 'w');

fprintf(sinID, 'memory_initialization_radix=16;\r\nmemory_initialization_vector=\r\n');
fprintf(cosID, 'memory_initialization_radix=16;\r\nmemory_initialization_vector=\r\n');

fprintf(sinID,'%04x,\r\n', typecast(sin_integer(1:end-1),'uint16'));
fprintf(cosID,'%04x,\r\n', typecast(cos_integer(1:end-1),'uint16'));

% last element does not have a comma
fprintf(sinID,'%04x\r\n', typecast(sin_integer(end),'uint16'));
fprintf(cosID,'%04x\r\n', typecast(cos_integer(end),'uint16'));

fclose(sinID);
fclose(cosID);