%% Get data from file
freq = 120e6
data = importdata('mixer_out.samples');
I = data(:,1)/(2^23);
Q = data(:,2)/(2^23);

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex); mag = mag/max(mag);

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fourierseries(mag(50:end), freq);
plot(ff_mag, 20*log10(MAF),'b'); hold on