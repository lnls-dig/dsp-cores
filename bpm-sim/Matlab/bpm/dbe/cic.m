function filtered = cic( input, m, n, ratio)
%CIC Decimation: decimates I_i and Q_i data to I_o and Q_i using a CIC filter
% as specified by tge variable. The fixed-point output from the cic is
% converted to a floating-point variable, and then assigned to the
% return variables.
%
% **The output gain is not adjusted - results may be very large numbers.**
%
% Variables:
%
%   input:  must be of floating-point type (not fixed). May have different
%   channels, each row being a channel.
%   m:      differential delay
%   n:      number of stages
%   ratio:  decimation ratio

cic_f = mfilt.cicdecim(ratio, m, n, 32);
cic_f.InputFracLength = 0;

filtered_sfi = filter(cic_f,input);

filtered = floor(double(filtered_sfi)*2^cic_f.OutputFracLength);

end