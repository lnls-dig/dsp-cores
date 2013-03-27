function rms_position = simnoise(abcd, rms_corr, rms_uncorr, K, npts)
%SIMNOISE Get standard deviation of simulated beam position given the RMS
%   value of noise (correlated and uncorrelated parts) and BPM inverse
%   sensitivity.
%
%   rms_position = simnoise(abcd, rms_corr, rms_uncorr, K, npts)
%
%   Inputs:
%       abcd: 4xN matrix containing nominal value of antennas A, B, C, D,
%             where A = abcd(1, i), B = abcd(2, i), C = abcd(3, i),
%             D = abcd(4, i) and i = 1..N is the sample number
%       rms_corr: 4xN matrix containing RMS value of each antenna's
%                 correlated noise, following the same index convetion as
%                 in abcd
%       rms_uncorr: 4xN matrix containing RMS value of each antenna's 
%                   uncorrelated noise, following the same index convetion
%                   as in abcd
%       K: difference over sum gain (inverse of BPM sensitivity)
%       npts: number of points for simulation
%
%   Outputs:
%       rms_position: RMS value of position
%
%   Example:
%       rms_position = simnoise([1 1 1 1], 1e-5*[1 1 1 1], 1e-6*[1 1 1 1], 10e6, 10000)
%
%       RMS value of position noise when antenna signals A = B = C = D = 1,
%       the correlated noise in all antennas has 1e-5 RMS value, the
%       uncorrelated noise in all antennas has 1e-6 RMS value and the
%       difference over sum gain equals 10 nm. The result is approximately
%       5 nm.
%
%   See also calcnoise

%   Copyright (C) 2012 CNPEM
%   Licensed under GNU Lesser General Public License v3.0 (LGPL)
%
%   Revisions:
%       2012-08    Daniel de Oliveira Tavares (LNLS/DIG) - Initial realease

% Decompose abcd, rms_corr and rms_uncorr A, B, C, D components into
% individual variables for better code readability
a = abcd(:,1);
b = abcd(:,2);
c = abcd(:,3);
d = abcd(:,4);

rms_a_corr = rms_corr(:,1);
rms_b_corr = rms_corr(:,2);
rms_c_corr = rms_corr(:,3);
rms_d_corr = rms_corr(:,4);

rms_a_uncorr = rms_uncorr(:,1);
rms_b_uncorr = rms_uncorr(:,2);
rms_c_uncorr = rms_uncorr(:,3);
rms_d_uncorr = rms_uncorr(:,4);

nsamples = size(abcd,1);

% Genereate correlated noise component
random = randn(npts, nsamples);

a = repmat(a', npts, 1) + repmat(rms_a_corr', npts, 1).*random + repmat(rms_a_uncorr', npts, 1).*randn(npts,nsamples);
b = repmat(b', npts, 1) + repmat(rms_b_corr', npts, 1).*random + repmat(rms_b_uncorr', npts, 1).*randn(npts,nsamples);
c = repmat(c', npts, 1) + repmat(rms_c_corr', npts, 1).*random + repmat(rms_c_uncorr', npts, 1).*randn(npts,nsamples);
d = repmat(d', npts, 1) + repmat(rms_d_corr', npts, 1).*random + repmat(rms_d_uncorr', npts, 1).*randn(npts,nsamples);

difference = a + b - c - d;
sum = a + b + c + d;

rms_position = std(K*difference./sum);