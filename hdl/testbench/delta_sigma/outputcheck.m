data = importdata('delta_sigma.samples');
x_in = data(:,1);
y_in = data(:,2);
x_out = data(:,3);
y_out = data(:,4);

x_32bit = x_in*(2^31);
y_32bit = y_in*(2^31);

x_err = (x_out - x_32bit);
y_err = (y_out - y_32bit);

figure()
subplot(2,2,1)
plot(x_32bit); hold on; plot(x_out,'.r')

subplot(2,2,3)
plot(y_32bit); hold on; plot(y_out,'.r')

subplot(2,2,2)
plot(x_in, x_err,'.r')

subplot(2,2,4)
plot(y_in, y_err,'.r')
