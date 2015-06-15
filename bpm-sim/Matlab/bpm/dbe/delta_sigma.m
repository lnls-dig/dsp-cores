function [ x y q sum] = delta_sigma(a, b, c, d)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

sum = a+b+c+d;
x = ((b+c)-(a+d))./sum;
y = ((a+b)-(c+d))./sum;
q = ((a+c)-(b+d))./sum;

end

