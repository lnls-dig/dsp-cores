function Cb = calccapacitance(button)
%CALCCAPACITANCE Calculation of button capacitance.
%
%   Cb = calccapacitance(button)
%
%   Inputs:
%       button: structure containing BPM pick-up button geometric and
%               electrical characteristics
%   Outputs:
%       Cb: button capacitance [F]

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Based on Angel Olmos (ALBA) Matlab script, which is based on Guenther Rehm's code (Diamond Light Source) and INFN/DAFNE calculations.
%	For further information please refer to www.cells.es/Divisions/Accelerators/RF_Diagnostics/Diagnostics/OrbitPosition/Tools/BPMs_GUI
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

physicalConstants;

Cb = 2*pi*e0/(log(1+2*button.gap/button.diameter))*button.thickness;