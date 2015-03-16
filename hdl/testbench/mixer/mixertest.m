%% Get data from file
freq = data_freq;
data = importdata('mixer_out.samples');
I = data(:,1)/(2^32);
Q = data(:,2)/(2^32);

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex); mag = mag/max(mag);

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fourierseries(complex(50:end), freq);
plot(ff_mag, 20*log10(MAF),'b'); hold on
