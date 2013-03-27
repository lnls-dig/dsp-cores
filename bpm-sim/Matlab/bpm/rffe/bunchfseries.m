function r = bunchfseries(accelerator, bpm, Iavg, nbunches, beampos, nharmonicsRF, nharmonicsRev)
%BUNCHFSERIES Calculate Fourier Series of current and voltage signals for
%   button BPMs (take antenna with higher singal amplitude).
%
%   r = bunchfseries(accelerator, bpm, Iavg, nbunches, beampos, nharmonicsRF, nharmonicsRev)
%
%   Inputs:
%       accelerator: accelerator characteristics
%       bpm: BPM characteristics
%       Iavg: total average beam current [A]
%       nbunches: number of bunches on the beam
%       beampos: horizontal (beampos(1)) and vertical (beampos(2)) beam
%                position [m] - optional (default = [0 0])
%       nharmonicsRF: number of RF harmonics to take into account on the
%                     analysis - optional (default = 100)
%       nharmonicsRev: number of revolution harmonics to take into account
%                      on the analysis - optional (default = 100)
%
%   Outputs:
%       r.freq: frequency vector [Hz]
%       r.Ibeam: Fourier series coefficients of beam current [A]
%       r.Iim: Fourier series coefficients of beam image current [A] on BPM
%              button where signal amplitude is the highest
%       r.Vim: Fourier series coefficients of voltage on button [V]
%       r.Vcable: Fourier series coefficients of voltage at the end of the
%                 coaxial cable (RF front-end input) [V]
%
%   See also FSERIES2TIME

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

if nargin < 5
    beampos = [0 0];
end
if nargin < 6
    nharmonicsRF = 100;
end
if nargin < 7
    nharmonicsRev = 100;
end

physicalConstants;

h = accelerator.h;
frf = accelerator.frf;
bl = accelerator.bunchLength;
beta = accelerator.beta;
R0 = bpm.pickup.button.R0;
bd = bpm.pickup.button.diameter;
fe = bpm.cable.fe;
cablelength = bpm.cable.length;

% Revolution frequency [Hz]
frev = frf/h;

% Filling ratio (0 <= dfill <= 1)
dfill = nbunches/h;          

% m is the index of the beam revolution harmonics
m = 0:nharmonicsRF*h;

% Frequency and angular frequency vectors
f = frev*m;
omega = 2*pi*f;

% Calculate the charge [C] of each bunch based on average beam current
Q0 = Iavg/frev/nbunches;

if nbunches == 1
    Ibeam = frev*Q0*exp(-2*pi^2*bl^2*f.^2).*exp(-1j*1/2/frf*f);
else    
    q = -nharmonicsRev:nharmonicsRev;
    beamcharge_spectrum = Q0*exp(-2*pi^2*bl^2*(q*frf).^2);
    Ibeam = zeros(1,length(m));
    for i=1:length(m)
        Ibeam(i) = frf*dfill*sum(beamcharge_spectrum.*sinc(dfill*(m(i)-q*h)));
    end
end
    
% Beam current to image current
CovF = beamcoverage(bpm.pickup, beampos, 500);
Iim = max(CovF)*bd/(beta*c)*(1j*omega).*Ibeam;

% Calculate button impedance
Cb = calccapacitance(bpm.pickup.button);
Z0 = R0*Cb;

% Button response (convert image current to voltage on button)
Vim = R0./(1j*omega*Z0 + 1).*Iim;

% Coaxial cable response
Vcable = exp(-sqrt(abs(f)/fe)*cablelength/30.5).*exp(-sign(f).*1j.*sqrt(abs(f)/fe)*cablelength/30.5).*Vim;

r = struct('freq', f, 'Ibeam', Ibeam, 'Iim', Iim, 'Vim', Vim, 'Vcable', Vcable);