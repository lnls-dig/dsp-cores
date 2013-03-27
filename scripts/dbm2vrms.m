function vrms = dbm2vrms(dbm)
%DBM2VRMS Convert to Voltage RMS from dBm (50 ohm system)
%   Detailed explanation goes here
vrms = sqrt((0.05*10^(dbm/10))/2);

end

