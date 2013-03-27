function pickup = pickuptemplate(type)
%PICKUPTEMPLATE Generate BPM pick-up structure template.
%
%   pickup = pickuptemplate(type)
%
%   Inputs:
%       type: BPM pick-up type. Possible values:
%           'circular': 45° rotated circular BPM with equidistant buttons
%           'octogonal': octogonal BPM
%
%   Outputs:
%       pickup: BPM pick-up template structure.
%
%   Note: all physical quantities are expressed in the International System
%   of Units (SI).

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

if nargin < 1
    type = 'circular';
end

if strcmpi(type, 'circular')
    chamber = struct(...
        'type', 'circular', ...
        'radius', 14e-3 ...             % Vacuum chamber radius [m]
    );
elseif  strcmpi(type, 'octogonal')
    chamber = struct(...
        'type', 'octogonal', ...
        'up', 40.8e-3, ...             	% Vacuum chamber up face width [m]
        'down', 40.8e-3, ...            % Vacuum chamber down face width [m]
        'left', 10e-3, ...              % Vacuum chamber left height [m]
        'right', 10e-3, ...             % Vacuum chamber right height [m]
        'height', 38e-3, ...            % Vacuum chamber height [m]
        'width', 80e-3, ...             % Vacuum chamber width [m]    
        'buttonDistance', 12.5e-3 ...   % Horizontal distance of buttons from the center [m]
    );
end

button = struct(...
    'type', 'round', ...
    'diameter', 11e-3, ...              % Button diameter [m]
    'gap', 0.6e-3, ...                  % Button gap [m]
    'thickness', 3e-3, ...              % Button thickness [m]
    'R0', 50 ...                        % Load impedance [ohm]
);

pickup = struct(...
    'type', 'button', ...
    'button', button, ...               % Button geometry and electrical characteristics
    'chamber', chamber ...              % Vacuum chamber geometry
);