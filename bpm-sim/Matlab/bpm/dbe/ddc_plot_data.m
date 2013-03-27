close all;

%% ADC Data Plot
figure
N_fft=length(adc_signal.signals.values);
f_fft=1/adc_signal.time(2)*linspace(0,1,N_fft);
plot(f_fft/1e6, 20*log10(2/N_fft*abs(fft(adc_signal.signals.values))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('ADC Data','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor

%% BPF Data Plot
figure
N_fft=length(bpf_signal.signals.values);
f_fft=1/bpf_signal.time(2)*linspace(0,1,N_fft);
plot(f_fft/1e6, 10*log10(2/N_fft*abs(fft(bpf_signal.signals.values))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('Signal After BPF','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor


%% NCO cos Data Plot
figure
subplot(211)
nco_cos_signal_value = squeeze(nco_cos_signal.signals.values);
N_fft=length(nco_cos_signal_value);
f_fft=1/nco_cos_signal.time(2)*linspace(0,1,N_fft);
plot(1/nco_cos_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(nco_cos_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('NCO cos','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor


%% NCO minus sin Plot
subplot(212)
nco_msin_signal_value = squeeze(nco_msin_signal.signals.values);
N_fft=length(nco_msin_signal_value);
f_fft=1/nco_msin_signal.time(2)*linspace(0,1,N_fft);
plot(1/nco_msin_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(nco_msin_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('NCO minus sin','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor

%% MIX I Data Plot
figure
subplot(211)
mix_i_signal_value = squeeze(mix_i_signal.signals.values);
N_fft=length(mix_i_signal_value);
f_fft=1/mix_i_signal.time(2)*linspace(0,1,N_fft);
plot(1/mix_i_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(mix_i_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('NCO mixer I','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor

%% MIX Q Data Plot
subplot(212)
mix_q_signal_value = squeeze(mix_q_signal.signals.values);
N_fft=length(mix_q_signal_value);
f_fft=1/mix_q_signal.time(2)*linspace(0,1,N_fft);
plot(1/mix_q_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(mix_q_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('NCO mixer Q','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor

%% CIC I Data Plot
figure
subplot(311)
cic_i_signal_value = squeeze(cic_i_signal.signals.values);
N_fft=length(cic_i_signal_value);
f_fft=1/cic_i_signal.time(2)*linspace(0,1,N_fft);
plot(1/cic_i_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(cic_i_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('CIC I','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor

%% CFIR I Data Plot
subplot(312)
cfir_q_signal_value = squeeze(cfir_q_signal.signals.values);
N_fft=length(cfir_q_signal_value);
f_fft=1/cfir_q_signal.time(2)*linspace(0,1,N_fft);
plot(1/cfir_q_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(cfir_q_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('CFIR I','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor

%% PFIR I Data Plot
subplot(313)
pfir_q_signal_value = squeeze(pfir_q_signal.signals.values);
N_fft=length(pfir_q_signal_value);
f_fft=1/pfir_q_signal.time(2)*linspace(0,1,N_fft);
plot(1/pfir_q_signal.time(2)*linspace(0,1,N_fft)/1e6, 20*log10(2/N_fft*abs(fft(pfir_q_signal_value))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('PFIR I','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor