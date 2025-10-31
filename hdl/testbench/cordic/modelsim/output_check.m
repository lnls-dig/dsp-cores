pkg load all

%close all
bits= 32;

data = importdata('vectoring_in.samples');
I_o = data(:,1);
Q_o = data(:,2);

[phase_i, mag_i] = cart2pol(I_o./(2^(bits-1)-1),Q_o./(2^(bits-1)-1));

mag_i = mag_i./4;
%figure_rotate = figure()
%plot(mag_2,'.b');
%hold on; plot(phase_2, '.r');

data = importdata('vectoring_out.samples');
mag_o = data(:,1)./(2^(bits-1)-1)./1.65;
%phase_o = data(:,2);

figure
plot((mag_i(length(mag_o))-mag_o)./mag_i(length(mag_o)));
%hold on; plot(phase_o/(2^(bits-1)-1)*pi, '.r');

figure
plot(mag_i);
hold on; plot(mag_o, 'r');
