function [gain_a, gain_b, gain_c, gain_d] = calc_dist_bpm(beam_pos, R, alpha)
% Calculate the appropriate gains forantennas A, B, C and D given
% the Beam position.
%
% Input:
%
%   beam_pos = beam_position in polar coordinates
%       beam_pos.A = Amplitude, relative to full scale chamber radius (R)
%       beam_pos.theta = Angle relative to first quadrant
%   R = Chamber Radius, arbitrary units
%   alpha = Antennas angle relative to first quadrant, in degrees
%
% Output:
%
%   gain_a = gain for antenna A
%   gain_b = gain for antenna B
%   gain_c = gain for antenna C
%   gain_d = gain for antenna D

if (nargin < 3)
    alpha = pi/4;       % middle of the chamber
end

% Beam position in polar coordinates
A = beam_pos.r;
theta = pi*beam_pos.theta/180;

square_partial = A^2 + R^2;
mult_partial = 2*A*R;

db = sqrt(square_partial - mult_partial*cos(theta-1*alpha));
da = sqrt(square_partial - mult_partial*cos(theta-3*alpha));
dd = sqrt(square_partial - mult_partial*cos(theta-5*alpha));
dc = sqrt(square_partial - mult_partial*cos(theta-7*alpha));

gain_a = 1+(R-da)/R;
gain_b = 1+(R-db)/R;
gain_c = 1+(R-dc)/R;
gain_d = 1+(R-dd)/R;

end
