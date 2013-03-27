function dbm = volt2dbm(volt, R)
%VOLT2DBM Convert Volts to dBm unit.
%
%   dbm = volt2dbm(volt, R)
%
%   Inputs:
%       volt: signal expressed in Volts [V]
%       R: load impedance [ohm]
%
%   Outputs:
%       dbm: signal expressed in dBm [dBm]

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

dbm = 10*log10(1e3*volt.^2/R);