data = importdata('vectoring_out.dat');
mag_o = data(:,1);
phase_o = data(:,2);

plot(mag_o/2^24,'.b')
hold on; plot(phase_o/2^24, '.r')