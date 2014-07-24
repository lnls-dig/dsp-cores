%% Get data from file
freq = 120e3
data = importdata('downconv_out.samples');
I = data(:,1)/(2^31);
Q = data(:,2)/(2^31);

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex(50:end));
mag = mag(1:floor(length(mag)/60)*60)/max(mag);

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fourierseries(mag, freq);
plot(ff_mag, 20*log10(MAF),'b'); hold on