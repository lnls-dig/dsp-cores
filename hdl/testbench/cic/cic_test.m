data = importdata('cic_out.dat');
plot(20*log10(abs(fft(data))));