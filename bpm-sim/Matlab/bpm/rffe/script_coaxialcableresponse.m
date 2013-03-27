close all
clear all

N = 1e5;        % Number of points
df = 10e6;      % Frequency resolution [Hz]
f = df*(0:N-1);

sirius_bpmparameters;

% CoaxialCable
fe=bpm.cable.fe;            % Cable characteristic frequency
Lcable=bpm.cable.length;    % Cable length [m]

% Frequency response of the Cable considering Skin effect (different
% values of cable length)
C1=exp(-(1+1i)*sqrt(f/fe)*Lcable/30.5);
C1inv=-10*log10(abs(C1));

Lcable2 = Lcable*2;
C2=exp(-(1+1i)*sqrt(f/fe)*Lcable2/30.5);
C2inv=-10*log10(abs(C2));

Lcable3 = Lcable*4;
C3=exp(-(1+1i)*sqrt(f/fe)*Lcable3/30.5);
C3inv=-10*log10(abs(C3));

figure
loglog(f/1e6,[C1inv' C2inv' C3inv'])
axis([10 10000 0.1 100])
xlabel('Frequency (MHz)')
ylabel('Attenuation (dB)')
grid minor