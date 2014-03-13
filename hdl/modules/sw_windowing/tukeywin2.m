function [window] = tukeywin2(len)
    ratio = 1.0;
    window = tukeywin(len,ratio);
end

