function CovF = beamcoverage(pickup, beampos, n)
%BEAMCOVERAGE Beam coverage factor for off-centered beams in a vacuum
%   chamber of arbitrary geometry.
%
%   CovF = beamcoverage(pickup, beampos, n)
%
%   Inputs:
%       pickup: BPM pick-up geometric characteristics
%       beampos: horizontal and vertical beam position [m]
%       n: number of points to describe the vacuum chamber geometry
%          - optional (default = 101)
%
%   Outputs:
%       CovF: coverage factor on each BPM pickup button, where the following
%             convention is adopted:
%             CovF(1): for button on negative x axis and positive y axis direction
%             CovF(2): for button on positive x axis and positive y axis direction
%             CovF(3): for button on negative x axis and negative y axis direction
%             CovF(4): for button on positive x axis and negative y axis direction
%   Examples:
%       pickup = pickuptemplate;
%       CovF = beamcoverage(pickuptemplate, [0 0])
%
%   See also PICKUPTEMPLATE

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Based on Angel Olmos (ALBA) Matlab script, which is based on Guenther Rehm's code (Diamond Light Source) and INFN/DAFNE calculations.
%   For further information please refer to www.cells.es/Divisions/Accelerators/RF_Diagnostics/Diagnostics/OrbitPosition/Tools/BPMs_GUI
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

x = beampos(:,1); y = beampos(:,2);

% Ensures that the points describing the chamber are symetrical in relation to all 4 quadrants
if nargin < 4
    n = 101;
else
    n = round(n/4)*4 + 1;
end

if strcmpi(pickup.chamber.type, 'circular')
    bd = pickup.button.diameter;
    r = pickup.chamber.radius;
    [theta,d] = cart2pol(x,y);
    
    dphi = bd/r*linspace(-0.5, 0.5, n);
    
    phi1 = 3*pi/4 + dphi;
    phi2 = pi/4 + dphi;
    phi3 = -3*pi/4 + dphi;
    phi4 = -pi/4 + dphi;
        
	cov1 = (r^2 - d^2)./(r^2 + d^2 - 2*r*d*cos(phi1-theta));
    cov2 = (r^2 - d^2)./(r^2 + d^2 - 2*r*d*cos(phi2-theta));
    cov3 = (r^2 - d^2)./(r^2 + d^2 - 2*r*d*cos(phi3-theta));
    cov4 = (r^2 - d^2)./(r^2 + d^2 - 2*r*d*cos(phi4-theta));
        
    Q1 = cumtrapz(dphi, cov1);
    Q2 = cumtrapz(dphi, cov2);
    Q3 = cumtrapz(dphi, cov3);
    Q4 = cumtrapz(dphi, cov4);
    
    Q1 = Q1(end)/2/pi;
    Q2 = Q2(end)/2/pi;
    Q3 = Q3(end)/2/pi;
    Q4 = Q4(end)/2/pi;
    
else
    % Boundary Element Numerical Method
    % References: A. Stella, "ANALYSIS OF THE DAPHNE BEAM POSITION MONITOR WITH A BOUNDARY ELEMENT METHOD", Daphne Note CD-10 (1997)
    %             T. Shintake et al., "Sensitivity calculation of beam position monitor", Nuclear Instruments and Methods in Physics Research A254 (1987) pp146-150.

    % Calculate vacuum chamber shape
    [xchamb, ychamb] = chamber(pickup.chamber, n);

    % Calculate middle points between each positions of x and y (eg: xchamb = [1 2 3 4 5] --> xm = [1.5 2.5 3.5 4.5])
    xm = (xchamb(1:end-1) + xchamb(2:end))/2;
    ym = (ychamb(1:end-1) + ychamb(2:end))/2;

    m = length(xm);

    % Calulate borders of buttons projected to horizontal axis
    [b1, b2, b3, b4] = buttonborders(pickup, xm);

    % Distances between vacuum chamber discretization points
    sl = sqrt((xchamb(2:end)-xchamb(1:end-1)).^2+(ychamb(2:end)-ychamb(1:end-1)).^2);

    % Populate matrix G
    G = calcG(xm, ym, sl);

    % Populate matrix B
    B=zeros(length(x), m);
    for i=1:m
        B(:,i) = -log(sqrt((x-xm(i)).^2 + (y-ym(i)).^2));
    end

    % Inducted signal density over the chamber
    sig = G\B'; % inv(G)*B'

    % Button signal summed over button discretization points
    Q1 = sum(repmat(sl(b1), length(x), 1).*sig(b1,:)', 2);
    Q2 = sum(repmat(sl(b2), length(x), 1).*sig(b2,:)', 2);
    Q3 = sum(repmat(sl(b3), length(x), 1).*sig(b3,:)', 2);
    Q4 = sum(repmat(sl(b4), length(x), 1).*sig(b4,:)', 2);

    % % Verify if the integral of the entire contour is unitary
    % total = sum(repmat(sl, length(x), 1).*sig', 2);
    % if abs(1-total) > 10e-3
    %     warning('bpm:beamcoverage:inaccuratecalculation', 'Inaccurate calculation (contour integral = %d).', total);
    % end
end

% Correction factor (ratio between area of square with 'bd' side and button area)
if isfield(pickup.button, 'type') && strcmpi(pickup.button.type, 'round')
    CorrF = 4/pi;   % correction factor for round button
else
    warning('bpm:beamcoverage:unknownbuttontype', 'Unknown type of pickup button.');
    CorrF = 1;
end

% Calculate induced charge on each button
CovF = [Q1 Q2 Q3 Q4]/CorrF;


% -------------------
% Auxiliary Functions
% -------------------

% Calculate matrix G for the Boundary Element Numerical Method
function G = calcG(xm, ym, sl)
n = length(xm);
G = zeros(n, n);
for j=1:n
    for i=1:n
        if i==j 
            G(i,j) = 2*sl(j)*(1-log(sl(j)));
        else
            G(i,j) = -log(sqrt((xm(j)-xm(i))^2+(ym(j)-ym(i))^2))*sl(j);
        end
    end
end

% Calculate button borders
function [b1,b2,b3,b4] = buttonborders(pickup, xm)

bd = pickup.button.diameter;
n = length(xm)+1;

if strcmpi(pickup.chamber.type, 'octogonal')
    bcs = pickup.chamber.buttonDistance;
    
    bx1 = bcs/2 - bd/2; 
    bx2 = bcs/2 + bd/2;
elseif strcmpi(pickup.chamber.type, 'circular')
    r = pickup.chamber.radius;
    
    theta = bd/r;                % theta = angle defined by the button diameter
    alpha1 = (pi/4) - theta/2;   % alpha1 = angle defined from axis Y+ to upper button boundary
    alpha2 = (pi/4) + theta/2;   % alpha2 = angle defined from axis Y+ to lower button boundary
    bx1 = sin(alpha1)*r;         % bx1 = Distance from axis Y+ to the upper button boundary, projected over X axis
    bx2 = sin(alpha2)*r;         % bx2 = Distance from axis Y+ to the lower button boundary, projected over X axis
end

b1 = find(and((xm(1:end/2) > -bx2), (xm(1:end/2) < -bx1)));
b2 = find(and((xm(1:end/2) > bx1), (xm(1:end/2) < bx2)));
b3 = find(and((xm((end/2+1):end) > -bx2), (xm((end/2+1):end) < -bx1))) + (n-1)/2;
b4 = find(and((xm((end/2+1):end) > bx1), (xm((end/2+1):end) < bx2))) + (n-1)/2;

% Vacuum chamber geometry
function [x,y] = chamber(chamber, n)

if isfield(chamber, 'type')
    if strcmpi(chamber.type, 'circular')
        if isfield(chamber, 'radius')
            [x,y] = circular_chamber(chamber.radius, n);
        else
            error('The chamber field ''radius'' is not present in the chamber structure.');
        end
%     elseif strcmpi(chamber.type, 'elliptical')
%         if isfield(chamber, 'radius_h') && isfield(chamber, 'radius_v')
%             [x,y] = elliptical_chamber(chamber.radius_h, chamber.radius_v, n);
%         else
%             error('One or more chamber fields for elliptical chamber (''radius_h'', ''radius_v'') is not present in the chamber structure.');
%         end        
    elseif strcmpi(chamber.type, 'octogonal')
        if isfield(chamber, 'up') &&  isfield(chamber, 'down') && isfield(chamber, 'left') && isfield(chamber, 'right') && isfield(chamber, 'height') && isfield(chamber, 'width')
            [x,y] = octogonal_chamber(chamber.up, chamber.down, chamber.left, chamber.right, chamber.height, chamber.width, n);
        else
            error('One or more chamber fields for octogonal chamber (''up'', ''down'', ''left'', ''right'', ''height'', ''width'') is not present in the chamber structure.');
        end
    else
        error('Unkwnown chamber type.');
    end
else
    error('''type'' field is not present in the chamber structure.');
end

% Circular vacuum chamber geometry
function [x,y] = circular_chamber(r, n)
[x,y,z] = cylinder(r, n-1);
x = x(1, 1:n);
y = y(1, 1:n);

% Elliptical vacuum chamber geometry
function [x,y] = elliptical_chamber(rx, ry, n)
[x,y,z] = ellipsoid(0, 0, 0, rx, ry, 0, n-1);
x = x(ceil((n-1)/2), 1:n);
y = y(ceil((n-1)/2), 1:n);

% Octogonal vacuum chamber geometry
function [x,y] = octogonal_chamber(up, down, left, right, height, width, n)
x = [l(-width/2,-width/2,n) l(-width/2,-up/2,n) l(-up/2,up/2,161) l(up/2,width/2,n) l(width/2,width/2,n) l(width/2,width/2,n) l(width/2,down/2,n)  l(down/2,-down/2,161) l(-down/2,-width/2,n) l(-width/2,-width/2,n)];
x = [x x(1)];

y = [l(0,left/2,n) l(left/2,height/2,n) l(height/2,height/2,161) l(height/2,right/2,n) l(right/2,0,n) -l(0,right/2,n) -l(right/2,height/2,n) -l(height/2,height/2,161) -l(height/2,left/2,n) -l(left/2,0,n) ];
y = [y y(1)];

% Wrapper for linspace function
function ll=l(a,b,c)
ll=linspace(a,b,c+1);
ll=ll(1:c);