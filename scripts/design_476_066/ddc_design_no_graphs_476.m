% Heavily Based on http://www.mathworks.com/help/dsp/examples/
% implementing-the-filter-chain-of-a-digital-down-converter-in-hdl.html

Fs_poly_35_in = Fs_adc; % 112.5832 MHz;
decim_factor_poly_35 = 35;
Hpoly_35 = polyphase_35(Fs_poly_35_in, decim_factor_poly_35);

% Analysis
%fvtool(Hpoly_35, 'Fs', Fs_poly_35_in);

%% CIC Filter %%
R = 53;         % Decimation factor
D = 2;          % Differential delay
Nsecs = 5;      % Number of sections
IWL = 24;       % Input word length
IFL = 19;       % Input fraction length
OWL = 24;       % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic = mfilt.cicdecim(R, D, Nsecs, IWL, OWL);
hcic.InputFracLength = IFL;
info(hcic);

Fs_cic_in = Fs_poly_35_in/35;

%% Normalize CIC Gain to 0 dB at baseband
hgain = dfilt.scalar(1/gain(hcic)); % Define inverse CIC gain to be compensated for
hcicnorm = cascade(hgain,hcic);     % Cascade CIC response to this gain

%h = fvtool(hcicnorm, 'Fs', Fs_cic_in);
%set(gcf, 'Color', 'White');

%% Sum CIC quantization

%IFL_sum_sec = 19;       % Input fraction length
IFL_sum = 20;       % Input fraction length

hcic_sum = hcic;
hcic_sum.InputFracLength = IFL_sum;
info(hcic_sum);

%% CFIR Filter (decimate by 2)
Fs_cfir_in = Fs_cic_in/R;   % Sampling frequency
Apass = 0.01;           % dB
Astop = 60;             % dB
Aslope = 60;            % 60 dB slope over half the Nyquist range
Fpass = 5e3;          % Hz passband-edge frequency
Fstop = 6e3;          % Hz stopband-edge frequency
decim_factor_cfir = 3;

% Design decimation filter. D and Nsecs have been defined above as the
% differential delay and number of sections, respectively.
d = fdesign.decimator(decim_factor_cfir, 'ciccomp', D, Nsecs, Fpass, ...
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
    'InputFracLength', 19);
%    'InputFracLength', 12);


info(hcfir);

%% Sum CFIR
hcfir_sum = hcfir;

% quantization takes place.
set(hcfir_sum,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 20);
%    'InputFracLength', 23);
%    'InputFracLength', 26);

info(hcfir_sum);

%% Cascaded CIC + CFIR response
hcas1 = cascade(hcicnorm,hcfir);
%h1 = fvtool([hcicnorm,hcfir,hcas1], 'Fs', [Fs_cic_in,Fs_cfir_in,Fs_cic_in]);
%set(h,'Filters', [hcicnorm,hcfir,hcas1],'Fs',[Fs_cic_in,Fs_cfir_in,Fs_cic_in]);
%ylim([-200 10]);
%axis([0 .1 -0.8 0.8]);
%legend(h1,'hcicnorm','hcfir','cascade hcic + hcfir');

%% PFIR Filter (decimate by 2)
N = 120;       % 121 taps
Fs_pfir_in = Fs_cfir_in/decim_factor_cfir; 
Fpass = 1.5e3;            
Fstop = 3e3;
decim_factor_pfir = 2;

d = fdesign.decimator(decim_factor_pfir, 'lowpass', 'N,Fp,Fst', N, ...
                        Fpass, Fstop, Fs_pfir_in);
hpfir = design(d,'equiripple','Wpass',2);  % Give more weight to passband
set(hpfir,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 19);
%'InputFracLength', -11);
info(hpfir);

%% Sum PFIR

hpfir_sum = hpfir;
set(hpfir_sum,...
    'Arithmetic', 'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 20);
%    'InputFracLength', 23);
%    'InputFracLength', 26);

info(hpfir_sum);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm = cascade(hcicnorm,hcfir,hpfir);
%h2 = fvtool(hcicnorm, 'Fs', Fs_cic_in);
%set(h2,'Filters', [hcicnorm, hpfir, hcasnorm], 'Fs', ...
%        [Fs_cic_in, Fs_pfir_in, Fs_cic_in], 'NumberofPoints', NFFT*3);
%legend(h2,'hcicnorm','hpfir','cascade hcicnorm + hcfir + hpfir');

%% Cascade DSP until here
hcasnormfofb = cascade(Hpoly_35,hcicnorm,hcfir,hpfir);
%h4 = fvtool(hcasnormfofb, 'Fs', Fs_pfir_in, 'NumberofPoints', NFFT*3);
%legend(h4,'FOFB');

%% Second DDC for Monitoring Rate
%% CIC Filter %%
R_sec = 256;         % Decimation factor
D_sec = 2;          % Differential delay
Nsecs_sec = 5;      % Number of sections
IWL_sec = 24;       % Input word length
IFL_sec = 19;       % Input fraction length
OWL_sec = 24;       % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic_sec = mfilt.cicdecim(R_sec, D_sec, Nsecs_sec, IWL_sec, OWL_sec);
hcic_sec.InputFracLength = IFL_sec;
info(hcic_sec);

%% Sum CIC quantization

%IFL_sum_sec = 19;       % Input fraction length
IFL_sum_sec = 20;       % Input fraction length

hcic_sum_sec = hcic_sec;
hcic_sum_sec.InputFracLength = IFL_sum_sec;
info(hcic_sum_sec);

%% CIC Sec analysis
Fs_cic_sec_in = Fs_pfir_in/decim_factor_pfir;

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
    'InputFracLength', 19);
%    'InputFracLength', 23);
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
    'InputFracLength', 20);
%    'InputFracLength', 23);
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
    'InputFracLength', 19);
%    'InputFracLength', 23);
%'InputFracLength', -11);
info(hpfir_sec);

%% Sum PFIR

hpfir_sum_sec = hpfir_sec;
set(hpfir_sum_sec,...
    'Arithmetic', 'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  24,...
    'InputFracLength', 20);
%    'InputFracLength', 23);
%    'InputFracLength', 26);

info(hpfir_sum_sec);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm_sec = cascade(hcicnorm_sec,hcfir_sec,hpfir_sec);

% Plot response
%h2_sec = fvtool(hcas1_sec, 'Fs', Fs_cic_sec_in);
%set(h2_sec,'Filters', [hcas1_sec, hpfir_sec, hcasnorm_sec], 'Fs', ...
%        [Fs_cic_sec_in, Fs_pfir_sec_in, Fs_cic_sec_in], 'NumberofPoints', NFFT*3);
%ylim([-250 10]);