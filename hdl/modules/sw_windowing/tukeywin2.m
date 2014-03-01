function [window] = tukeywin2(len)
    ratio = 0.2;
    window = tukeywin(len,ratio);
end

