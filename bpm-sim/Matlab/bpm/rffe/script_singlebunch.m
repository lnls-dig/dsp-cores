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
nbunches = 256;

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%Plot Results%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(t*1e9,Ibeam,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Current (A)','FontSize',14)
title('Beam Current','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([24.95 25.05 min(Ibeam)-0.06*max(Ibeam) 1.06*max(Ibeam)])
elseif nbunches == 32
    axis([0 58 min(Ibeam)-0.06*max(Ibeam) 1.06*max(Ibeam)]);        
end
grid on
grid minor

figure
%subplot(121)
plot(t*1e9,Vim1,'Linewidth',2);
xlabel('Time (ns)','FontSize',14)
ylabel('Button Voltage (V)','FontSize',14)
title('Button Voltage','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([24.8 25.2 min(Vim1)-0.06*max(Vim1) 1.06*max(Vim1)])
elseif nbunches == 32
    axis([0 58 min(Vim1)-0.06*max(Vim1) 1.06*max(Vim1)]);
end
grid on
grid minor
%subplot(122)
figure
plot(t*1e9,Iim,'Linewidth',2);
xlabel('Time (ns)','FontSize',14)
ylabel('Button Current (A)','FontSize',14)
title('Button Current','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([24.8 25.2 min(Iim)-0.06*max(Iim) 1.06*max(Iim)])
elseif nbunches == 32
    axis([0 58 min(Iim)-0.06*max(Iim) 1.06*max(Iim)])
end
grid on
grid minor
% set(H1,'Linewidth',3)
% set(H2,'Linewidth',3)
% set(AX(1),'YLim',[-100 250])
% set(AX(1),'YTick',[-100:20:250])
% set(AX(2),'YLim',[-15 15])
% set(AX(2),'YTick',[-15:2:15])
% % set(AX(1),'Xlim',[24.5 26]);
% % set(AX(2),'Xlim',[24.5 26]);


%%%%%%%%%
figure
subplot(121)
plot(t*1E9,Vim1,'LineWidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Button Voltage (V)','FontSize',14)
title('Button Voltage','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([24.8 25.2 min(Vim1)-0.06*max(Vim1) 1.06*max(Vim1)])
elseif nbunches == 32
    axis([0 58 min(Vim1)-0.06*max(Vim1) 1.06*max(Vim1)])
end
grid on
grid minor

subplot(122)
plot(f/1e9,FVim1dBm,'LineWidth',2)
axis([-1 20 -80 20])
xlabel('Frequency (GHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
title('Button Voltage','FontSize',14)
set(gca,'fontsize',14);
grid on
grid minor

%%%%%%%%%
figure
subplot(1,2,1)
plot(t*1e9,Vim2,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Voltage After Cables','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([24.4 25.6 min(Vim2)-0.06*max(Vim2) 1.06*max(Vim2)]) 
elseif nbunches == 32
    axis([0 60 min(Vim2)-0.06*max(Vim2) 1.06*max(Vim2)])
end
grid on
grid minor
subplot(1,2,2)
plot(f/1e9,FVim2dBm,'LineWidth',2)
xlabel('Frequency (GHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
%if nbunches == 30
xlim([0 max(f)/4/1e9])
%end
set(gca,'fontsize',14);
title('Voltage After Cables','FontSize',14)
grid on
grid minor

%%%%%%%
figure
subplot(1,2,1)
plot(t*1e9,VC,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Cable Impulse Response','FontSize',14)
set(gca,'fontsize',14);
axis([-0.2 1.5 min(VC)-0.06*max(VC) 1.06*max(VC)])
grid on
grid minor
subplot(1,2,2)
plot(f/1e6,FCdBm,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
xlim([0 max(f)/2/1e9])
set(gca,'fontsize',14);
title('Cable Power Spectrum','FontSize',14)
grid on
grid minor

%%%%%%%
bpm_w = bpm_w/(2*pi);
bpf_mag = 20*log10(bpf_mag);
bpf_phase = bpf_phase*180/pi;

figure
subplot(1,2,1)
plot(bpm_w/1e6,bpf_mag,'Linewidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Magnitude (dB)','FontSize',14)
title('BPF Filter Response','FontSize',14)
%axis([0 max(bpm_w)/1e6/2 -150 5])
axis([0 1000 -150 5])
set(gca,'fontsize',14);
grid on
grid minor
subplot(1,2,2)
plot(bpm_w/1e6,bpf_phase,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Phase (degrees)','FontSize',14)
title('BPF Filter Response','FontSize',14)
%xlim([0 max(bpm_w)/1e6/2])
xlim([0 1000])
set(gca,'fontsize',14);
grid on
grid minor

%%%%%%%
figure
subplot(1,2,1)
plot(t*1e9,Vim3,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Signal After Cables and BPF','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([20.5 75 min(Vim3)-0.06*max(Vim3) 1.06*max(Vim3)]) 
elseif nbunches == 32
    axis([0 110 min(Vim3)-0.06*max(Vim3) 1.06*max(Vim3)])
end
grid on
grid minor
subplot(1,2,2)
plot(f/1e6,FVim3dBm,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
title('Signal After Cables and BPF','FontSize',14)
xlim([0 max(f)/1e9])
set(gca,'fontsize',14);
grid on
grid minor

%%%%%%%%
figure
subplot(1,2,1)
plot(t*1e9,Vim4,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Signal After Cables, BPF and LPF of the Osciloscope','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([21 78 min(Vim4)-0.06*max(Vim4) 1.06*max(Vim4)])
elseif nbunches == 32
    axis([0 107 min(Vim4)-0.06*max(Vim4) 1.06*max(Vim4)])
end
grid on
grid minor
subplot(1,2,2)
plot(f/1e6,FVim4dBm,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
title('Signal After Cables, BPF and LPF of the Osciloscope','FontSize',14)
xlim([0 max(f)/1e9])
set(gca,'fontsize',14);
grid on
grid minor

%%%%%%%%
figure
subplot(1,2,1)
plot(t*1e9,Vim5,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Signal After Cables, BPF and DC','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    axis([22 70 min(Vim5)-0.06*max(Vim5) 1.06*max(Vim5)])
elseif nbunches == 32
    axis([0 110 min(Vim5)-0.06*max(Vim5) 1.06*max(Vim5)])
end
grid on
grid minor
subplot(1,2,2)
plot(f/1e6,FVim5,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
title('Signal After Cables, BPF and DC','FontSize',14)
% expand the plot to show the peaks on the higher frequency side
xlim([0 max(f)/1e9])
set(gca,'fontsize',14);
grid on
grid minor

%%%%%%%%
figure
subplot(1,2,1)
plot(t*1e9,Vim6,'Linewidth',2)
xlabel('Time (ns)','FontSize',14)
ylabel('Voltage (V)','FontSize',14)
title('Signal After Cables, BPF, DC and LPF','FontSize',14)
set(gca,'fontsize',14);
if nbunches == 1
    %axis([24.95 25.4 min(Vim6)-0.06*max(Vim6) 1.06*max(Vim6)])
    axis([18 225 min(Vim6)-0.06*max(Vim6) 1.06*max(Vim6)])
elseif nbunches == 32
    axis([0 270 min(Vim6)-0.06*max(Vim6) 1.06*max(Vim6)])
end
grid on
grid minor
subplot(1,2,2)
plot(f/1e6,FVim6,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Power (dBm)','FontSize',14)
title('Signal After Cables, BPF, DC and LPF','FontSize',14)
xlim([0 max(f)/1e9])
set(gca,'fontsize',14);
grid on
grid minor

%%%%%%%
lpf_w = lpf_w/(2*pi);
lpf_mag = 20*log10(lpf_mag);
lpf_phase = lpf_phase*180/pi;

figure
subplot(1,2,1)
plot(lpf_w/1e6,lpf_mag,'Linewidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Magnitude (dB)','FontSize',14)
title('LPF Filter Response','FontSize',14)
%axis([0 max(bpm_w)/1e6/2 -150 5])
axis([0 160 -70 5])
set(gca,'fontsize',14);
grid on
grid minor
subplot(1,2,2)
plot(lpf_w/1e6,lpf_phase,'LineWidth',2)
xlabel('Frequency (MHz)','FontSize',14)
ylabel('Phase (degrees)','FontSize',14)
title('LPF Filter Response','FontSize',14)
%xlim([0 max(bpm_w)/1e6/2])
xlim([0 160])
set(gca,'fontsize',14);
grid on
grid minor

%%%%
dt_sim = 1/117.5e6;
%bpm_signal.time = d_t_sim*(0:N-1)';
bpm_signal.time = 0 : dt_sim : dt_sim*(N-1);
bpm_signal.signals.values = Vim3;
bpm_signal.signals.dimensions = 1;