function Hd = fir_polyphase_fofb(Fs, decim_factor)
%FIR_POLYPHASE_FOFB Returns a multirate filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.13 and the DSP System Toolbox 8.1.
%
% Generated on: 24-Jan-2013 17:12:31
%

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
%Fs = 3216662.1622;  % Sampling Frequency

Fpass = 1200;            % Passband Frequency
Fstop = 6000;            % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.001;           % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);
decf = decim_factor;                    % Decimation Factor
num  = get(Hd, 'Numerator');  % Get the numerator from the current filter.

Hd  = mfilt.firdecim(decf, num);

% [EOF]
