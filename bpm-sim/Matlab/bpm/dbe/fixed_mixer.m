function [ IQ ] = fixed_mixer( input, dds_vector)
%fized_mixer Simulates the FPGA mixer using a fixed DDS.
%
%   This functions simulates the DDS inside the BPM FPGA. It is not meant
%   to simulate the FPGA work in the bit-level (this would require using
%   slow fixed-point calculations), but to give an idea of how well the 
%   FPGA DSP is perfoming at a certain bit width.
%
%   Inputs:
%       input: signal from ADC
%       dds_vector: dds_vector(1,:) must contain sin samples, dds_vector(2,:),
%                   cos. Data must be already scaled and rounded.
%   Outputs:
%       IQ : IQ(1,:) represents I, IQ(2,:) 


%   Copyright (C) 2015 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)

[input_len, channel_count] = size(input);
dds_len  = length(dds_vector);

repeats = floor(input_len/dds_len);
remainder = rem(input_len,dds_len);

dds_repeated = repmat(...
                   reshape(...
                       [repmat(dds_vector,repeats,1); dds_vector(1:remainder,:)], ...
                   input_len,1,2), ...
               [1 channel_count]);

IQ = bsxfun(@times,input,dds_repeated);

end
