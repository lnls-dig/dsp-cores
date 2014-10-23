data = importdata('output.dat');
numerator = data(:,1);
denominator = data(:,2);
quotient = data(:,3)/(2^29);
remainder = data(:,4);

expected = numerator./denominator;
err = (quotient-expected)./expected;

plot(expected,'-xb');  hold on; plot(quotient,'or')