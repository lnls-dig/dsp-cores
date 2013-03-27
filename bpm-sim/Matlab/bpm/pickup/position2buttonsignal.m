function [V,P] = position2buttonsignal(pickup, beampos, I, frf)
%POSITION2BUTTONSIGNAL Calculation of button signals for off-centered beams
%   in a vacuum chamber of arbitrary geometry.
%
%   [V,P] = position2buttonsignal(pickup, beampos, I, frf)
%
%   Inputs:
%       pickup: structure containing BPM pick-up geometric and electrical
%               characteristics
%       beampos: horizontal and vertical beam position [m]
%       I: beam current [A]
%       frf: beam RF frequency [Hz]
%
%   Outputs:
%       V: voltage on each BPM pick-up button [Vp]
%       P: power on each BPM pick-up button [W]

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Based on Angel Olmos (ALBA) Matlab script, which is based on Guenther Rehm's code (Diamond Light Source) and INFN/DAFNE calculations.
%	For further information please refer to www.cells.es/Divisions/Accelerators/RF_Diagnostics/Diagnostics/OrbitPosition/Tools/BPMs_GUI
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

if (size(beampos,2) ~= 2) || (size(beampos,1) ~= length(I))
     error('bpm:position2buttonsignal:inputarguments', 'Incompatible input argument sizes.');
end

physicalConstants;

% Ensures that I is column vector
I = I(:);

bd = pickup.button.diameter;
R0 = pickup.button.R0;

% Calculate induced charge on each button
CovF = beamcoverage(pickup, beampos);


% Button radius (m)
r = bd/2;

% Calculate button capacitance
Cb = calccapacitance(pickup.button);

w1 = 1/(R0*Cb);
w2 = c/(2*r*1e-3);

% RF frequency (rad/s)
wrf = 2*pi*frf;

% Average power on the load for each button (W)
P = zeros(size(beampos,1), 4);
for i=1:4
    P(:,i) = 0.5*(I.^2)*R0*((w1/w2)^2)*(((wrf/w1)^2)/(1+((wrf/w1)^2))).*(CovF(:,i).^2);
end

% Voltage on the load for each button (V)
V = sqrt(P*2*R0);