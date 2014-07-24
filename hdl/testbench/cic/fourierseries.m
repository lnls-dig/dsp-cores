function [fft_amplitude, f, fft_phase] = fourierseries(data, Fs, window)
%FFT2   Scaled FOURIERSERIES.
%
%   [fft_amplitude, f, fft_phase] = FOURIERSERIES(data, Fs, window)

%   Copyright (C) 2014 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)

if nargin < 2
    Fs = 1;
end
if nargin < 3
    window = @rectwin;
end

if any(size(data) == 1)
    data = data(:);
end

npts = size(data,1);
data = data.*repmat(window(npts), 1, size(data,2));
fft_amplitude = abs(fft(data))/npts;
fft_phase = angle(fft(data));

half_npts = ceil(npts/2+1);
fft_amplitude = fft_amplitude(1:half_npts, :);
fft_phase = fft_phase(1:half_npts, :);

if rem(npts,2) > 0
    fft_amplitude = [fft_amplitude(1,:); 2*fft_amplitude(2:end,:)];
else
    fft_amplitude = [fft_amplitude(1,:); 2*fft_amplitude(2:end-1,:); fft_amplitude(end,:)];
end

df = Fs/npts;

f = 0:df:(half_npts-1)*df;
