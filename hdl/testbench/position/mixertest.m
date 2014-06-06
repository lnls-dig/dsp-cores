%% Get data from file
freq = 120e6
data = importdata('mixed_out.samples');
I = data(:,1)/(2^23);
Q = data(:,2)/(2^23);

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex); mag = mag(50:end)/max(mag);
mag = mag(1:floor(length(mag)/60e3)*60e3);%/max(mag_calc);

%% Plotting
% Compute FFTs
figure()
[MAF, ff_mag] = fourierseries(mag, freq);
plot(ff_mag, 20*log10(MAF),'ob'); hold on