data = importdata('output.dat');
numerator = data(:,1);
denominator = data(:,2);
exponent = data(:,3) - 127;
mantissa = 1 + data(:,4)/(2^23);
quotient = mantissa.*2.^(exponent);

result = numerator./denominator;
