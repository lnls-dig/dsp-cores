%% Load data
adc_data = load('/home/aylons/Desktop/data_3_adc.txt');

load('uvx_dds_vec.mat'); %load dds matrix

%% Set parameters
fadc = 113040445;
decim_ratio = 980;

%% Make time vector for adc data
Ts = 1/fadc;
n = 1:length(adc_data)';
t = n*Ts;

%% Actual processing
IQ = fixed_mixer(adc_data,dds_vec);
IQ_decim = cic(IQ,1,2,decim_ratio);
[phase, mag] = cart2pol(IQ_decim(:,:,1),IQ_decim(:,:,1));

%% Make time vector for decimated data
T_decim = Ts*decim_ratio;
n = (1:length(mag))';
t_decim = n*T_decim;

%% Plot data
plot(t_decim(50:end),mag(50:end,:));