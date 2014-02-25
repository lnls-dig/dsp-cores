%% Get data from file
Ffofb = 1.1743e+05;
mag = importdata('ddc_out.dat');
mag = mag/(2^31);

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fft2(mag(50:end), Ffofb, @blackmanharris);
plot(ff_mag, 20*log10(MAF),'b'); hold on