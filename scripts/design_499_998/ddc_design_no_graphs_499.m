% Heavily Based on http://www.mathworks.com/help/dsp/examples/
% implementing-the-filter-chain-of-a-digital-down-converter-in-hdl.html

%% General Constants
%NFFT = 8192;
F_adc_image = 25733200; %[MHz]

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
Fs_cic_in = 117500000; % 117.5 MHz;

%% Normalize CIC Gain to 0 dB at baseband
hgain = dfilt.scalar(1/gain(hcic)); % Define inverse CIC gain to be compensated for
hcicnorm = cascade(hgain,hcic);     % Cascade CIC response to this gain

%% CFIR Filter (decimate by 2)
Fs_cfir_in = Fs_cic_in/R;   % Sampling frequency 117.5MHz/47
Apass = 0.01;           % dB
Astop = 60;             % dB
Aslope = 60;            % 60 dB slope over half the Nyquist range
Fpass = 200e3;          % Hz passband-edge frequency
Fstop = 400e3;          % Hz stopband-edge frequency

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
    'InputFracLength', 11);
%    'InputFracLength', 12);


info(hcfir);

%% Cascaded CIC + CFIR response
hcas1 = cascade(hcicnorm,hcfir);

%% PFIR Filter (decimate by 2)
N = 80;       % 81 taps
Fs_pfir_in = Fs_cfir_in/2; 
Fpass = 180e3;               % 180 Khz passband
Fstop = 220e3;

d = fdesign.decimator(2, 'lowpass', 'N,Fp,Fst', N, ...
                        Fpass, Fstop, Fs_pfir_in);
hpfir = design(d,'equiripple','Wpass',2);  % Give more weight to passband
set(hpfir,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 11);
%'InputFracLength', -11);
info(hpfir);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm = cascade(hcicnorm,hcfir,hpfir);

%% Polyphase Decimation Filter (decimate by 59)
Fs_decim_tbt_in = Fs_pfir_in/2; 
decim_tbt_factor = 59;  % Decimation Factor
Hdecim_tbt = mfilt.firdecim(decim_tbt_factor);

% Set the arithmetic property.
set(Hdecim_tbt, 'Arithmetic', 'fixed', ...
    'CoeffWordLength', 16, ...
    'CoeffAutoScale', true, ...
    'Signed',         true, ...
    'InputWordLength', 24, ...
    'InputFracLength', 22, ...
    'FilterInternals',  'FullPrecision');

info(Hdecim_tbt);

%% Polyphase Sum Decimation Filter (decimate by 59)
% Set quantization

Hdecim_sum_tbt = Hdecim_tbt;

% Set the arithmetic property.
set(Hdecim_sum_tbt, 'Arithmetic', 'fixed', ...
    'CoeffWordLength', 16, ...
    'CoeffAutoScale', true, ...
    'Signed',         true, ...
    'InputWordLength', 24, ...
    'InputFracLength', 22, ...
    'FilterInternals',  'FullPrecision');

info(Hdecim_sum_tbt);

%% Second DDC for Monitoring Rate
%% CIC Filter %%
R_sec = 256;         % Decimation factor
D_sec = 2;          % Differential delay
Nsecs_sec = 5;      % Number of sections
IWL_sec = 24;       % Input word length
IFL_sec = 22;       % Input fraction length
OWL_sec = 24;       % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic_sec = mfilt.cicdecim(R_sec, D_sec, Nsecs_sec, IWL_sec, OWL_sec);
hcic_sec.InputFracLength = IFL_sec;
info(hcic_sec);

%% Sum CIC quantization

%IFL_sum_sec = 19;       % Input fraction length
IFL_sum_sec = 22;       % Input fraction length

hcic_sum_sec = hcic_sec;
hcic_sum_sec.InputFracLength = IFL_sum_sec;
info(hcic_sum_sec);

%% CIC Sec analysis
Fs_cic_sec_in = Fs_decim_tbt_in/59;

%% Normalize CIC Gain to 0 dB at baseband
hgain_sec = dfilt.scalar(1/gain(hcic_sec)); % Define inverse CIC gain to be compensated for
hcicnorm_sec = cascade(hgain_sec,hcic_sec);     % Cascade CIC response to this gain

%h_sec = fvtool(hcicnorm_sec, 'Fs', Fs_cic_sec_in);
%set(gcf, 'Color', 'White');

%% CFIR Filter (decimate by 2)
Fs_cfir_sec_in = Fs_cic_sec_in/R_sec;
Apass_sec = 0.01;           % dB
Astop_sec = 60;             % dB
Aslope_sec = 60;            % 60 dB slope over half the Nyquist range
Fpass_sec = 0.008e3;         % Hz passband-edge frequency
Fstop_sec = 0.014e3;          % Hz stopband-edge frequency

% Design decimation filter. D and Nsecs have been defined above as the
% differential delay and number of sections, respectively.
d_sec = fdesign.decimator(2, 'ciccomp', D_sec, Nsecs_sec, Fpass_sec, ...
                        Fstop_sec , Apass_sec, Astop_sec, Fs_cfir_sec_in);
hcfir_sec = design(d_sec,'equiripple',...
               'StopbandShape', 'linear',...
               'StopbandDecay', Aslope_sec);

% Now we have to define the fixed-point attributes of our multirate filter.
% By default, the fixed-point attributes of the accumulator and multipliers
% are set to ensure that full precision arithmetic is used, i.e. no
% quantization takes place.
set(hcfir_sec,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 23);
%    'InputFracLength', 12);
%    'InputFracLength', -11);

info(hcfir_sec);

%% Sum CFIR
hcfir_sum_sec = hcfir_sec;

% quantization takes place.
set(hcfir_sum_sec,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 23);
%    'InputFracLength', 26);

info(hcfir_sum_sec);


%% Cascaded CIC Sec + CFIR Sec response
hcas1_sec = cascade(hcicnorm_sec,hcfir_sec);

% Plot response
%h1_sec = fvtool([hcicnorm_sec,hcfir_sec,hcas1_sec], 'Fs', [Fs_cic_sec_in,Fs_cfir_sec_in,Fs_cic_sec_in]);

%% PFIR Filter (decimate by 2)
N_sec = 80;       % 81 taps
Fs_pfir_sec_in = Fs_cfir_sec_in/2; 
Fpass_sec = 0.006e3;              
Fstop_sec = 0.007e3;

d_sec = fdesign.decimator(2, 'lowpass', 'N,Fp,Fst', N_sec, ...
                        Fpass_sec, Fstop_sec, Fs_pfir_sec_in);
hpfir_sec = design(d_sec,'equiripple','Wpass',2);  % Give more weight to passband
set(hpfir_sec,...
    'Arithmetic', 'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 23);
%'InputFracLength', -11);
info(hpfir_sec);

%% Sum PFIR

hpfir_sum_sec = hpfir_sec;
set(hpfir_sum_sec,...
    'Arithmetic', 'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 23);
%    'InputFracLength', 26);

info(hpfir_sum_sec);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm_sec = cascade(hcicnorm_sec,hcfir_sec,hpfir_sec);

% Plot response
%h2_sec = fvtool(hcas1_sec, 'Fs', Fs_cic_sec_in);
%set(h2_sec,'Filters', [hcas1_sec, hpfir_sec, hcasnorm_sec], 'Fs', ...
%        [Fs_cic_sec_in, Fs_pfir_sec_in, Fs_cic_sec_in], 'NumberofPoints', NFFT*3);
%ylim([-250 10]);