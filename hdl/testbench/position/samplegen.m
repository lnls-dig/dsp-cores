filename = 'position_in.samples'
% Sirius parameters
fc = 477999596;
fadc = 35/148*fc;
bit_width = 16;

current = 0.4;
k_x = 1e6;
k_y = k_x;
k_sum = 1;

y_max = 1000;
y_step = 250;
y_samples_per_step = 30000;
y_number_of_steps = 2*y_max/y_step - 1;

x_max = 1000;
x_step = 500;
x_samples_per_step = y_samples_per_step * y_number_of_steps;
x_number_of_steps = 2*x_max/x_step -1;

y = -y_max+y_step:y_step:y_max-y_step;
y_pos = repmat(y,y_samples_per_step,1);
y_pos = y_pos(:)';

y_pos = repmat(y_pos, 1, x_number_of_steps); %repeat for each new x value

x = -x_max+x_step:x_step:x_max-x_step;
x_pos = repmat(x,x_samples_per_step,1);
x_pos = x_pos(:)';

Ts = 1/fadc;
t = 0 : Ts : Ts*length(y_pos)-Ts;

[adc_a, adc_b, adc_c, adc_d ] = bpm_4_signal(x_pos, y_pos, current, k_sum, k_y, k_x, t, fc, fadc);

adc_a = round(adc_a*((2^bit_width-1)-1));
adc_b = round(adc_b*((2^bit_width-1)-1));
adc_c = round(adc_c*((2^bit_width-1)-1));
adc_d = round(adc_d*((2^bit_width-1)-1));


%% Print file if option chosen
fileID = fopen(filename,'w');
for count = 1 : length(adc_a)
    fprintf(fileID,'%d\t%d\t%d\t%d\r\n',adc_a(count),adc_b(count), adc_c(count), adc_d(count));
end