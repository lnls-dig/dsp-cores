% Heavily Based on http://www.mathworks.com/help/dsp/examples/implementing-
%the-filter-chain-of-a-digital-down-converter-in-hdl.html

%% General Constants
NFFT = 8192; % Points
Fs = 117500000; % 117.5 MHz

%% CIC Filter %%
R = 250;         % Decimation factor
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
h = fvtool(hcic, 'Fs', Fs_cic_in/188/59);
set(gcf, 'Color', 'White');
%legend(h,'hcicnorm');

%% Normalize CIC Gain to 0 dB at baseband
hgain = dfilt.scalar(1/gain(hcic)); % Define inverse CIC gain to be compensated for
hcicnorm = cascade(hgain,hcic);     % Cascade CIC response to this gain

% Replace the CIC in FVTool with a normalized CIC.
setfilter(h, hcicnorm, 'Fs', Fs_cic_in);
figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14)
gcachild = get(gca,'Children');
set(gca, 'Xcolor', 'k');
set(gca, 'Ycolor', 'k');
set(gcachild, 'Linewidth', 2);

% Change plot marker
hchildren = get(h,'children');
haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');
hlinemod = hline(1:2);
set(hlinemod, 'Marker', 's', 'MarkerSize', 6);

legend(h,'hcicnorm');
title('CIC Filter Response', 'fontsize',14);
set(gca,'fontsize',14);
%ylim([-250 10]);
axis([0 0.3 -4 0.5]);

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
    'InputFracLength', 12);
%    'InputFracLength', 12);
%    'InputFracLength', -11);

info(hcfir);

%% Cascaded CIC + CFIR response
hcas1 = cascade(hcicnorm,hcfir);
h1 = fvtool([hcicnorm,hcfir,hcas1], 'Fs', [Fs_cic_in,Fs_cfir_in,Fs_cic_in]);
figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14)
gcachild = get(gca,'Children');
set(gca, 'Xcolor', 'k');
set(gca, 'Ycolor', 'k');
set(gcachild, 'Linewidth', 2);
set(gca,'fontsize',14);

% Change plot marker
hchildren = get(h1,'children');
haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');
hlinemod = hline(5:6);
set(hlinemod, 'Marker', 's', 'MarkerSize', 6);
hlinemod = hline(3:4);
set(hlinemod, 'Marker', '*', 'MarkerSize', 6);
hlinemod = hline(1:2);
set(hlinemod, 'Marker', 'o', 'MarkerSize', 6);

legend(h1,'hcicnorm','hcfir','cascade hcic + hcfir');
title('CIC + CFIR Filter Response', 'fontsize',14);
axis([0 0.3 -4 3]);


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
%   'InputFracLength', 11);
%'InputFracLength', -11);

%% CIC + CFIR + PFIR Cascaded Response
hcasnorm = cascade(hcicnorm,hcfir,hpfir);
h2 = fvtool(hcas1, 'Fs', Fs_cic_in);
set(h2,'Filters', [hcas1, hpfir, hcasnorm], 'Fs', ...
        [Fs_cic_in, Fs_pfir_in, Fs_cic_in], 'NumberofPoints', NFFT*3);

% Change plot marker
hchildren = get(h2,'children');
haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');
hlinemod = hline(5:6);
set(hlinemod, 'Marker', 's', 'MarkerSize', 6);
hlinemod = hline(3:4);
set(hlinemod, 'Marker', 'd', 'MarkerSize', 6, 'Color', 'magenta');
hlinemod = hline(1:2);
set(hlinemod, 'Marker', 'o', 'MarkerSize', 6);

% Change line width and x, y, color
figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14)
gcachild = get(gca,'Children');
set(gca, 'Xcolor', 'k');
set(gca, 'Ycolor', 'k');
set(gcachild, 'Linewidth', 1);   
set(gca,'fontsize',14);
legend(h2,'hcicnorm + hcfir','hpfir','cascade hcicnorm + hcfir + hpfir');
title('CIC + CFIR + PFIR Filter Response', 'fontsize',14);
axis([0 1.5 -80 5]);


%% CIC + CFIR + PFIR Cascaded Response
h3 = fvtool(hcasnorm, 'Fs', Fs_cic_in);

% Change plot line color
hchildren = get(h3,'children');
haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');
set(hline, 'Color', 'r');

% Change line width and x, y, color
figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14)
gcachild = get(gca,'Children');
set(gca, 'Xcolor', 'k');
set(gca, 'Ycolor', 'k');
set(gcachild, 'Linewidth', 1);   
set(gca,'fontsize',14); 

% Change plot marker
hchildren = get(h3,'children');
haxes = hchildren(strcmpi(get(hchildren,'type'),'axes'));
hline = get(haxes,'children');
hlinemod = hline(1:2);
set(hlinemod, 'Marker', 'o', 'MarkerSize', 6);

axis([0 1 -180 5]);
legend(h3,'hcicnorm + hcfir + hpfir');
title('Total Cascaded Filter Response', 'fontsize',14);