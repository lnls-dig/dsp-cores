data = importdata('vectoring_out.dat');
mag_o = data(:,1);
phase_o = data(:,2);

figure_vector = figure()
plot(mag_o*1.64676/2^24,'.b');
hold on; plot(phase_o/2^23*pi, '.r');

data = importdata('rotating_out.dat');
I_o = data(:,1);
Q_o = data(:,2);

[phase_2, mag_2] = cart2pol(I_o/2^23,Q_o/2^23);

figure_rotate = figure()
plot(mag_2,'.b');
hold on; plot(phase_2, '.r');