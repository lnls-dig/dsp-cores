close all
%clear all

physicalConstants;

% FFT characteristics
dt = 0.5E-12;           % Time resolution [s]
N = 2^19+1e5;           % Number of points

% Accelerator characteristics
sirius_parameters;
sirius_bpmparameters;

% Test setup
x0=0;                           % X Beam position
y0=0;                           % Y Beam position

T = (N-1)*dt;                   % Max time
df = 1/T;                       % Frequency resolution
t = dt*(0:N-1);                 % Time vector
f = df*(0:N-1);                 % Frequency vector
Fs = 1/dt;                      % Sampling frequency

Z0 = bpm.pickup.button.R0;

beta = storagering.beta;        % Beam percentual speed (in relation to c)

frf = storagering.frf;          % Revolution frequency
Ib = 1e-3;                      % Single bunch current
h = storagering.h;
T_r = h/frf;
BL = storagering.bunchLength;
Att = bpm.cable.attenuator;     % Attenuation of the cable
fe = bpm.cable.fe;
Lcable = bpm.cable.length;      % Cable length in meters
bd = button.diameter;           % Button diameter [m]
nbunches = 32;

Q0 = Ib*T_r;

% "BPM Engineering" example
% bd = 15e-3;
% bpm.pickup.chamber.radius = 44e-3;
% bpm.pickup.button.gap = 0.4e-3;
% %bpm.pickup.button.thickness = 0.1e-3;
% BL =  3.3356e-011;
% Ne = 8e10;                       % Number of electrons on the bunch
% Q0 = Ne*e;
% Att = 0;

bunch_period = 1/frf;

%Beam current (gaussian profile)
Ibeam = Q0/(sqrt(2*pi)*BL)*exp(-(t-2.5e-8).^2/(2*BL^2));

if nbunches > 1
	w = 10*dt;
    t_pulse_end = bunch_period*nbunches;
    t_pulse = 0 : dt: t_pulse_end;
    d = w/2 : bunch_period : t_pulse_end;  
    y = pulstran(t_pulse,d,'rectpuls',w);
    Ibeam = conv(Ibeam, y, 'same');
end

%Calculations:
CovF = beamcoverage(bpm.pickup, [x0 y0]);    % Beam coverage factor
Cb = calccapacitance(bpm.pickup.button);    % Button capacitance

% Current at button 1 (negative x axis; positive y axis):
Iim = bd*CovF(1)/(beta*c)*diff(Ibeam)/dt;            % Button 1 - image current
Iim(length(Iim)+1) = Iim(length(Iim));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Equivalent model for the button capacitance+50R impedance%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

buttonResponse = tf([Z0],[Cb*Z0 1]);             
% Button voltage (time domain)
Vim1 = lsim(buttonResponse, Iim, t)/(10^(2*Att/10));                          
% Button voltage (frequency domain)
FVim1 = fft(Vim1); 
FVim1dBm = volt2dbm(2/N*abs(FVim1), 50);
%FVim1dBm = 20*log10(2/N*abs(FVim1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Equivalent model for the Coaxial cable, considering skin effect%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C = exp(-sqrt(abs(f)/fe)*Lcable/30.5).*exp(-sign(f).*1j.*sqrt(abs(f)/fe)*Lcable/30.5) + exp(-sqrt(abs(Fs-f)/fe)*Lcable/30.5).*exp(-sign(Fs-f).*1j.*sqrt(abs(Fs-f)/fe)*Lcable/30.5);     %Frequency response of the Cable considering Skin effect. ?? change to attenuation as a function of the cabel size???
%C = exp(-sqrt(abs(f)/fe)*Lcable/30.5).*exp(-sign(f).*1j.*sqrt(abs(f)/fe)*Lcable/30.5);
FC = C;
FCdBm = volt2dbm(2/N*abs(FC), 50);
%FCdBm = 20*log10(abs(FC));
VC = ifft(FC,'symmetric');

% Revolution frequency [Hz]
frev = frf/h;
m = 0:1500*h;
% Frequency and angular frequency vectors
freq = frev*m;

FVim2 = C'.*FVim1;                    %Signal spectrum at the end of the cable
Vim2 = ifft(FVim2, 'symmetric');
%Vim2 = fseries2time(freq, FVim2, t*1e9);
FVim2dBm = volt2dbm(2/N*abs(FVim2), 50);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%Equivalent model for the BandPass Filter%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rf=50;              %Second order BPF
Rf1=10;
Lf=0.1e-6;
Cf=1e-12;
%sys3=tf([Rf/Lf 0],[1 (Rf+Rf1)/Lf 1/(Lf*Cf)]);
% Second order Analog Bessel filter with 300 KHz around the revolution
% frquency
[bessel_b, bessel_a]= besself(2, [2*pi*(frf-20e6) 2*pi*(frf+20e6)]);
sys3 = tf(bessel_b, bessel_a);

bpf_n = N;
[bpf_resp, bpm_w] = freqs(bessel_b, bessel_a, bpf_n);

bpf_mag = abs(bpf_resp);
bpf_phase = angle(bpf_resp);

Vim3 = lsim(sys3,Vim2,t);
FVim3dBm = volt2dbm(2/N*abs(fft(Vim3)), 50);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%Equivalent model for the Osciloscope - LPF%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sys4=tf(1,[5e-11 1]);

Vim4 = lsim(sys4, Vim3, t);
FVim4dBm = volt2dbm(2/N*abs(fft(Vim4)), 50);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%   Demodulate signal  (before osciloscope %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Shift signal to base band
sine_f = 10*sin(2*pi*frf*t);
Vim5 = Vim3'.*sine_f;

%FVim5 = 20*log10(2/N*abs(fft(Vim5)));
FVim5 = volt2dbm(2/N*abs(fft(Vim5)), 50);

% LPF Bessel characteristic, second order, 30e6 cutoff frequency
[bessel_lpf_b, bessel_lpf_a]= besself(2, 30e6);
sys5 = tf(bessel_lpf_b, bessel_lpf_a);

lpf_n = N;
[lpf_resp, lpf_w] = freqs(bessel_lpf_b, bessel_lpf_a, lpf_n);

lpf_mag = abs(lpf_resp);
lpf_phase = angle(lpf_resp);

Vim6 = lsim(sys5,Vim5,t);
%FVim6 = 20*log10(2/N*abs(fft(Vim6)));
FVim6 = volt2dbm(2/N*abs(fft(Vim6)), 50);

%%%%
%dt_sim = dt;
%dt_sim = 1/117.5e6;
alias_freq = 27798000;
dt_sim = 1/(alias_freq*Fs/frf);
t_sim = dt_sim*(0:N-1);
T_sim = (N-1)*dt_sim;                   % Max time
df_sim = 1/T_sim;                       % Frequency resolution
f_sim = df_sim*(0:N-1);                 % Frequency vector
%bpm_signal.time = d_t_sim*(0:N-1)';
bpm_signal.time = t_sim';
bpm_signal.signals.values = Vim3;
bpm_signal.signals.dimensions = 1;