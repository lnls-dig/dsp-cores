%% Get data from file
freq =  35/148*476e6;
input_width = 32;
data = importdata('mixer_out.samples');
I = data(:,1)/(2^(input_width-1));
Q = data(:,2)/(2^(input_width-1));

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex); mag = mag/max(mag);

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fourierseries(mag(50:end), freq);
plot(ff_mag, 20*log10(MAF),'b'); hold on