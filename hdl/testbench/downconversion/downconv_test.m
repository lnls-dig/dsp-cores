%% Get data from file
freq = 120e3
data = importdata('downconv_out.samples','\t',1);
I = data.data(:,1)/(2^31);
Q = data.data(:,2)/(2^31);
mag = data.data(:,3)/(2^31);
phase = data.data(:,4)/(2^31);

%% Calculating from I, Q
complex = I+1i*Q;   % Ensemble I and Q in a single MATLAB complex variable
mag_calc = abs(complex(50:end));
mag_calc = mag_calc(1:floor(length(mag_calc)/60)*60);%/max(mag_calc);

%% Plotting
% Compute FFTs
[MAF_calc, ff_mag_calc] = fourierseries(mag_calc, freq);
plot(ff_mag_calc, 20*log10(MAF_calc),'.b'); hold on

%% Straight from CORDIC
mag = mag(50:end);
mag_cordic = mag(1:floor(length(mag)/60)*60);%max(mag);

[MAF_cord, ff_mag_cordic] = fourierseries(mag_cordic, freq);
plot(ff_mag_cordic, 20*log10(MAF_cord),'.r'); hold on