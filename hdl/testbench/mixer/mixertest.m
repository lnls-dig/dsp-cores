%% Get data from file
Ffofb = 1.1743e+05;
data = importdata('mixer_out.dat')
I = data(:,1)/(2^23);
Q = data(:,2)/(2^23);

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex); mag = mag/max(mag);

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fft2(mag(50:end), Ffofb, @blackmanharris);
plot(ff_mag, 20*log10(MAF),'b'); hold on