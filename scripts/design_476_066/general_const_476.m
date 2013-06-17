%% General Constants
NFFT = 8192;
frev_476 = 476066000;
h = 148;                        % Number of bunches

Fs_adc = 476.066e6*35/h;

N = 2^19+1e5;                   % Number of points
decim_factor = 10000;

% Accelerator characteristics
sirius_parameters;
sirius_bpmparameters;

dt = 1/Fs_adc/decim_factor;     % Time delta
dt_sim = 1/Fs_adc;              % Time delta for simulation
t = dt*(0:N-1);                 % Time vector
t_sim = t(1:decim_factor:end);  % Time vector for simulation

T = (N-1)*dt;                   % Max time

df = 1/T;                       % Frequency resolution
f = df*(0:N-1);                 % Frequency vector

%Fs_adc = 499.798e6*204/864;
Fs_adc_image = calcalias(frev_476, Fs_adc);

% Number of channels per ADC
n_ch = 4;
% Oversampling rate
n_ovs = 2;