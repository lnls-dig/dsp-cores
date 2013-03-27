%SIRIUS_BPMPARAMETERS
%
%   Type "edit sirius_bpmparameters" to edit parameters.

% chamber = struct(...
%     'type', 'octogonal', ...
%     'up', 45e-3, ...                       % Vacuum chamber up face width [m]
%     'down', 45e-3, ...                     % Vacuum chamber down face width [m]
%     'left', 3e-3, ...                      % Vacuum chamber left height [m]
%     'right', 3e-3, ...                     % Vacuum chamber right height [m]
%     'height', 11e-3, ...                   % Vacuum chamber height [m]
%     'width', 66e-3, ...                    % Vacuum chamber width [m]
%     'buttonDistance', 25e-3 ...            % Horizontal distance of buttons from the center [m]
% );

chamber = struct(...
    'type', 'circular', ...
    'radius', 11.5e-3 ...                 % Vacuum chamber radius [m]
);

button = struct(...
    'type', 'round', ...
    'diameter', 10e-3, ...              % Button diameter [m]
    'gap', 0.3e-3, ...                  % Button gap [m]
    'thickness', 2e-3, ...              % Button thickness [m]
    'R0', 50 ...                        % Load impedance [ohm]
);

pickup = struct(...
    'type', 'button', ...
    'button', button, ...
    'chamber', chamber ...             % BPM vaccum chamber geometry
);

cable = struct(...
    'attenuator', 0, ...                % Attenuator [dB]
    'fe', 1.26e9, ...                   % Characteristic frequency of the cable [Hz]
    'length', 25 ...                    % Cable Length [m]
);

bpm = struct(...
    'pickup', pickup, ...
    'cable', cable ...
);