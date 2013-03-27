%SCRIPT_SINGLEBUNCH2 Analysis of voltage signals at the RF front-end input
%   and internal signal path for a single-bunch beam.
%   
%   Edit the script file ("edit script_singlebunch2") to choose the
%   following parameters:
%       Iavg: average beam current [A]
%       tfinal: final time instant for time-domaion simulations [s]
%       beampos: horizontal and vertical beam position [m]

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease
%       2012-09-13 Rafael Antonio Baron (LNLS/DIG) - Added sweep of the BPM parameters

clear all
close all

% -----------------
% Script parameters
% -----------------
sirius_parameters;
sirius_bpmparameters;
Iavg = 0.001;
tfinal = 25*1/storagering.frf;
beampos = [0 0];
bd_sweep = 3e-3:1e-3:7e-3;
gap_sweep = 0.1e-3:0.1e-3:0.4e-3;
thickness_sweep = 2e-3:1e-3:5e-3;
nbunches = 1;
frf = storagering.frf;          % Revolution frequency
% -----------------

% Calculate current and voltage signal spectra on BPM pick-up and BPM cable
 r = bunchfseries(storagering, bpm, Iavg, nbunches, beampos, 1500);

% Sweep of button diameter
if exist('bd_sweep', 'var') && ~isempty(bd_sweep)
    sirius_bpmparameters;
    signalBDiameter = [];
    signalMaxDiameter = zeros(length(bd_sweep),1);
    for i = 1:length(bd_sweep)
        bpm.pickup.button.diameter = bd_sweep(i);

        % Calculate current and voltage signal spectra on BPM pick-up and BPM cable
        % r = bunchfseries(storagering, bpm, Iavg, nbunches, beampos, 1500);

        % Convert spectra to time-domain representation
        signalVim = fseries2time(r.freq, r.Vim, tfinal);
        [signalVcable, t] = fseries2time(r.freq, r.Vcable, tfinal);

        signalBDiameter = [signalBDiameter; signalVim];
        signalMaxDiameter(i) = max(abs(signalVim));
    end
    
    % Plot results
    figure;
    subplot(121)
    plot(t/1e-9,signalBDiameter);
    xlabel('Time (ns)');
    ylabel('Voltage (V)');
    title(sprintf('Voltage at button for a %0.2f mm gap, %0.2f mm thick button', bpm.pickup.button.gap*1e3, bpm.pickup.button.thickness*1e3));
    legend(buildlegend('\\phi = %0.2f mm', bd_sweep*1e3));
    grid on
    subplot(122)
    plot(bd_sweep*1e3,signalMaxDiameter)
    xlabel('Button diameter (mm)');
    ylabel('Peak Voltage (V)');
    title(sprintf('Peak Voltage at button as function of button diameter for a %0.2f mm gap, %0.2f mm thick', bpm.pickup.button.gap*1e3, bpm.pickup.button.thickness*1e3));
    grid on
end

% Sweep of button gap
if exist('gap_sweep', 'var') && ~isempty(gap_sweep)
    sirius_bpmparameters;
    signalBGap = [];
    signalMaxGap = zeros(length(gap_sweep),1); 
    for i = 1:length(gap_sweep)
        bpm.pickup.button.gap = gap_sweep(i);

        % Calculate current and voltage signal spectra on BPM pick-up and BPM cable
        % r = bunchfseries(storagering, bpm, Iavg, nbunches, beampos, 1500);

        % Convert spectra to time-domain representation
        signalVim = fseries2time(r.freq, r.Vim, tfinal);
        [signalVcable, t] = fseries2time(r.freq, r.Vcable, tfinal);

        signalBGap = [signalBGap; signalVim];
        signalMaxGap(i) = max(abs(signalVim));
    end
    
    % Plot results
    figure;
    subplot(121)
    plot(t/1e-9,signalBGap);
    xlabel('Time (ns)');
    ylabel('Voltage (V)');
    title(sprintf('Voltage at button for a %0.2f mm diameter, %0.2f mm thick button', bpm.pickup.button.diameter*1e3, bpm.pickup.button.thickness*1e3));
    legend(buildlegend('gap = %0.2f mm', gap_sweep*1e3));
    grid on
    subplot(122)
    plot(gap_sweep*1e3,signalMaxGap)
    xlabel('Button gap (mm)');
    ylabel('Peak Voltage (V)');
    title(sprintf('Peak Voltage at button for a %0.2f mm diameter, %0.2f mm thick button', bpm.pickup.button.diameter*1e3, bpm.pickup.button.thickness*1e3));
    grid on
end

% Sweep of button thickness
if exist('thickness_sweep', 'var') && ~isempty(thickness_sweep)
    sirius_bpmparameters;
    signalBThickness = [];
    signalMaxThickness = zeros(length(thickness_sweep),1);
    for i=1:length(thickness_sweep)
        bpm.pickup.button.thickness = thickness_sweep(i);
        
        % Calculate current and voltage signal spectra on BPM pick-up and BPM cable
        %r = bunchfseries(storagering, bpm, Iavg, nbunches, beampos, 1500);

        % Convert spectra to time-domain representation
        signalVim = fseries2time(r.freq, r.Vim, tfinal);
        [signalVcable, t] = fseries2time(r.freq, r.Vcable, tfinal);

        signalBThickness = [signalBThickness; signalVim];
        signalMaxThickness(i) = max(abs(signalVim));
    end
    
    % Plot results
    figure;
    subplot(121)
    plot(t/1e-9,signalBThickness);
    xlabel('Time (ns)');
    ylabel('Voltage (V)');
    title(sprintf('Voltage at button for a %0.2f mm diameter, %0.2f mm gap button', bpm.pickup.button.diameter*1e3, bpm.pickup.button.gap*1e3));
    legend(buildlegend('thick = %0.2f mm', thickness_sweep*1e3));
    grid on
    subplot(122)
    plot(thickness_sweep*1e3,signalMaxThickness)
    xlabel('Button thickness (mm)');
    ylabel('Peak Voltage (V)');
    title(sprintf('Peak Voltage at button for a %0.2f mm diameter, %0.2f mm gap button', bpm.pickup.button.diameter*1e3, bpm.pickup.button.gap*1e3));
    grid on
end

sirius_bpmparameters;
for i=1:length(thickness_sweep)
    % Calculate current and voltage signal spectra on BPM pick-up and BPM cable
    %r = bunchfseries(storagering, bpm, Iavg, nbunches, beampos, 1500);
    
    % Convert spectra to time-domain representation
    signalVim = fseries2time(r.freq, r.Vim, tfinal);
    signalIbeam = fseries2time(r.freq, r.Ibeam, tfinal);
    signalIim = fseries2time(r.freq, r.Iim, tfinal);
    [signalVcable, t] = fseries2time(r.freq, r.Vcable, tfinal);
end

% Bandpass filtering on the RF front-end
% Second order BPF
%Rf = 50;
%Rf1 = 10;
%Lf = 0.1e-6;
%Cf = 1e-12;
%sys_bpf = tf([Rf/Lf 0],[1 (Rf+Rf1)/Lf 1/(Lf*Cf)]);
%signalVbpf = lsim(sys_bpf, signalVcable, t)';

[bessel_b, bessel_a]= besself(2, [2*pi*(frf-40e6) 2*pi*(frf+40e6)]);
sys_bpf = tf(bessel_b, bessel_a);
signalVbpf = lsim(sys_bpf, signalVcable, t)';

% Plot results
figure;
plot(t/1e-9, [signalIbeam' signalIim']);
xlabel('Time (ns)');
ylabel('Current (A)');
title('Beam current and image current at button (nominal button parameters)');
legend('Beam current','Image current');
grid on
    
figure;
plot(t/1e-9, [signalVim' signalVcable']);
xlabel('Time (ns)');
ylabel('Voltage (V)');
legend('Voltage at button', 'Voltage at RF front-end input');
title('RF front-end voltages (nominal button parameters)');
grid on

figure;
plot(t/1e-9,[signalVcable' signalVbpf']);
xlabel('Time (ns)');
ylabel('Voltage (V)');
title('RF front-end voltages (nominal button parameters)');
legend('RF front-end input voltage', 'RF front-end BPF output voltage');
grid on