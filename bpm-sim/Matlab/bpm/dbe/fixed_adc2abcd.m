%% Fixed point simulation of FPGA-based DDC. 
% The fixed point representation is rather slow, but it accounts for
% truncation and rounding inside the FPGA, and results should be bitwise
% compatible with FPGA calculations, except for possible transients during
% reset.


% Set fixed point preferences
fp = fipref;
fp.LoggingMode = 'On';
    
f = fimath( 'roundmode', 'floor',         ...
                'overflowmode', 'wrap',   ...
                'productmode', 'keepmsb',     ...
                'productwordlength', 16);
globalfimath(f);


%% Set acquisition parameters
adc_data = load('/home/aylons/Desktop/data_3_adc.txt');
dds_vector = load('/home/aylons/projetos/dsp-cores/bpm-sim/Matlab/bpm/dbe/uvx_dds_vec.mat');

fadc = 113040445;

input_w = 16;
mixed_w = 16;
decim_w = 32;
cordic_w = 32;

dds_sfi = sfi(dds_vec,16);

decim_ratio = 980;
cic_stages = 2;
cic_diff = 1;

%% Make time vector for adc data
Ts = 1/fadc;
n = 1:length(adc_data)';
t = n*Ts;

%% Calculations
IQ = sfi_mixer(adc_data, dds_sfi, mixed_w);