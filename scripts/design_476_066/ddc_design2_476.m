% Heavily Based on http://www.mathworks.com/help/dsp/examples/implementing-
%the-filter-chain-of-a-digital-down-converter-in-hdl.html

%% General Constants
NFFT = 8192; % Points
Fs = 112583200; % 117.5 MHz

%% CIC Filter %%
R = 47;         % Decimation factor
D = 2;          % Differential delay
Nsecs = 5;      % Number of sections
IWL = 24;       % Input word length
IFL = 22;       % Input fraction length
OWL = 24;       % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic = mfilt.cicdecim(R, D, Nsecs, IWL, OWL);
hcic.InputFracLength = IFL;
info(hcic);

%% CIC analysis
Fs_cic_in = Fs;
h = fvtool(hcic, 'Fs', Fs_cic_in);
set(gcf, 'Color', 'White');
%legend(h,'hcicnorm');

%% Normalize CIC Gain to 0 dB at baseband
hgain = dfilt.scalar(1/gain(hcic)); % Define inverse CIC gain to be compensated for
hcicnorm = cascade(hgain,hcic);     % Cascade CIC response to this gain

% Replace the CIC in FVTool with a normalized CIC.
setfilter(h, hcicnorm, 'Fs', Fs_cic_in);
legend(h,'hcicnorm');
title('CIC Filter Response');

%% CFIR Filter (decimate by 2)
Fs_cfir_in = Fs_cic_in/R;   % Sampling frequency 117.5MHz/47
Apass = 0.01;           % dB
Astop = 60;             % dB
Aslope = 60;            % 60 dB slope over half the Nyquist range
Fpass = 500e3;          % Hz passband-edge frequency
Fstop = 600e3;          % Hz stopband-edge frequency

% Design decimation filter. D and Nsecs have been defined above as the
% differential delay and number of sections, respectively.
d = fdesign.decimator(2, 'ciccomp', D, Nsecs, Fpass, ...
                        Fstop , Apass, Astop, Fs_cfir_in);
hcfir = design(d,'equiripple',...
               'StopbandShape', 'linear',...
               'StopbandDecay', Aslope);

% Now we have to define the fixed-point attributes of our multirate filter.
% By default, the fixed-point attributes of the accumulator and multipliers
% are set to ensure that full precision arithmetic is used, i.e. no
% quantization takes place.
set(hcfir,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 12);
%    'InputFracLength', 12);
%    'InputFracLength', -11);

info(hcfir);

%% Cascaded CIC + CFIR response
hcas1 = cascade(hcicnorm,hcfir);
h1 = fvtool([hcicnorm,hcfir,hcas1], 'Fs', [Fs_cic_in,Fs_cfir_in,Fs_cic_in]);
%set(h,'Filters', [hcicnorm,hcfir,hcas1],'Fs',[Fs_cic_in,Fs_cfir_in,Fs_cic_in]);
%ylim([-200 10]);
%axis([0 .1 -0.8 0.8]);
legend(h1,'hcicnorm','hcfir','cascade hcic + hcfir');

%% PFIR Filter (decimate by 2)
N = 80;       % 81 taps
Fs_pfir_in = Fs_cfir_in/2; 
Fpass = 300e3;               % 180 Khz passband
Fstop = 350e3;

d = fdesign.decimator(2, 'lowpass', 'N,Fp,Fst', N, ...
                        Fpass, Fstop, Fs_pfir_in);
hpfir = design(d,'equiripple','Wpass',2);  % Give more weight to passband
set(hpfir,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 11);
%   'InputFracLength', 11);
%'InputFracLength', -11);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm = cascade(hcicnorm,hcfir,hpfir);
h2 = fvtool(hcicnorm, 'Fs', Fs_cic_in);
set(h2,'Filters', [hcicnorm, hpfir, hcasnorm], 'Fs', ...
        [Fs_cic_in, Fs_pfir_in, Fs_cic_in], 'NumberofPoints', NFFT*3);
%ylim([-200 10]);
legend(h2,'hcicnorm','hpfir','cascade hcicnorm + hcfir + hpfir');

%% CIC + CFIR + PFIR Cascaded Response
h3 = fvtool(hcasnorm, 'Fs', Fs_cic_in);
%ylim([-200 10]);
legend(h3,'cascade hcicnorm + hcfir + hpfir');