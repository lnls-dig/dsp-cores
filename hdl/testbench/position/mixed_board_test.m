%% Get data from ADC
data = importdata('mix_board.txt');

%% Use data to create the complex vector
freq = data_freq;

Ib_a = data(:,1)/(2^16);
Ib_b = data(:,2)/(2^16);
Ib_c = data(:,3)/(2^16);
Ib_d = data(:,4)/(2^16);

complex_board = Ib_b+1i*Q_board;   % Ensemble I and Q in a single MATLAB complex variable
mag = abs(complex_board); mag_board = mag_board(50:end)/max(mag_board);
mag_board = mag_board(1:floor(length(mag_board)/(3223*35/2))*round(3223*35/2));%/max(mag_calc);

%% Plotting
% Compute FFTs
figure()
[MAF_board, ff_mag_board] = fourierseries(I, freq);
plot(ff_mag_board, 20*log10(MAF_board)); hold on