figure
N_fft=length(Y_DATA_OUT_MULT_FPGA.signals.values);
f_fft=1/Y_DATA_OUT_MULT_FPGA.time(2)*linspace(0,1,N_fft);
plot(f_fft/1e6, 20*log10(2/N_fft*abs(fft(Y_DATA_OUT_MULT_FPGA.signals.values))),'r');
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Amplitude (dB)','FontSize',14)
title('ADC Data','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f_fft)/1e6/2])
set(gca,'fontsize',14);
grid on
grid minor