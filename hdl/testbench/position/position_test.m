%% Get data from file
freq = 120e3
data = importdata('position_out.samples',' ',1);

x = data.data(:,1)/(2^31)*8.5e-3;
y = data.data(:,2)/(2^31)*8.5e-3;
q = data.data(:,3)/(2^31);
sigma = data.data(:,3)/(2^31);