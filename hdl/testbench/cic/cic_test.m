%% Data grabbing
freq = 120e3;
data = importdata('cic_out.samples');
samples = data/2^31;

%% Plotting
% Compute FFTs
[MAF, ff_mag] = fourierseries(samples(50:end), freq, @blackmanharris);
plot(ff_mag, 20*log10(MAF),'b');

beep;
