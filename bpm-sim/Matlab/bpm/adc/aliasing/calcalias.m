function falias = calcalias(f, fs)
%CALCALIAS Calculate aliased frequencies.
%
%   falias = calcalias(f, fs)
%
%   Inputs:
%       f: array of frequency components
%       fs: sampling frequency
%
%   Outputs:
%       falias: array of aliased frequencies

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

nyqzone = floor(f./fs*2);
nyqzone_odd = mod(nyqzone,2) == 1;
falias = (1-nyqzone_odd).*(f - nyqzone.*fs/2) + nyqzone_odd.*(fs/2 - f + nyqzone.*fs/2);