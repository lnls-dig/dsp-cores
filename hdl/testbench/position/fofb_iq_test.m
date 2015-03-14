%% Get data from file
data = importdata('fofb_out.samples',' ',1);

%% Calculating from I, Q
I = data.data(:,1)/(2^31);
Q = data.data(:,2)/(2^31);

fofb_ratio = 980;
fofb_freq = data_freq/fofb_ratio;

complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag_calc = abs(complex(50:end));

%% Plotting
% Compute FFTs
[MAF_calc, ff_mag_calc] = fourierseries(mag_calc, fofb_freq);
plot(ff_mag_calc, 20*log10(MAF_calc),'.b'); hold on