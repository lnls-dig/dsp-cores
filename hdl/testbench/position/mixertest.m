%% Get data from file
data = importdata('mixed_out.samples');

%% Use data to create the complex vector
freq = data_freq;

I = data(:,1)/(2^32);
Q = data(:,2)/(2^32);

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex); mag = mag(50:end)/max(mag);
mag = mag(1:floor(length(mag)/(3223*35/2))*round(3223*35/2));%/max(mag_calc);

%% Plotting
% Compute FFTs
figure()
[MAF, ff_mag] = fourierseries(complex, freq);
plot(ff_mag, 20*log10(MAF)); hold on