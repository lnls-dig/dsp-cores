function y = moving_average( x , window)

if (nargin < 2)
    window = 15;
end

h = ones(window,1)/window;
y = filter(h, 1, x);

end

