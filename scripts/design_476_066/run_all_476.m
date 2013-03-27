addpath(genpath('D:\Sysgen_projects\ddc_bpm_476_066'));
general_const_476;

%script_singlebunch_no_graphs_2_476;
ddc_design_no_graphs_476;
%Hbpf_adc = bpf_adc_design_no_graphs_476(Fs_adc, Fs_adc_image);
Hbpf_adc = bpf_adc_design_no_graphs2_476(Fs_adc, Fs_adc_image);
dds_freq = calc_dds_freq(Fs_adc, Fs_adc_image);
dds_freq_bin = dec2bin(dds_freq);
vrms_att = dbm2vrms(-10)-[dbm2vrms(-10.001)
                          dbm2vrms(-10.001)
                          dbm2vrms(-10.002)
                          dbm2vrms(-10.002)
                          dbm2vrms(-10.003)
                          dbm2vrms(-10.003)
                          dbm2vrms(-10.004)
                          dbm2vrms(-10.004)]';
