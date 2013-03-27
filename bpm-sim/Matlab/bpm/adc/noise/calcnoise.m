function rms_position = calcnoise(abcd, rms_corr, rms_uncorr, K)
%CALCNOISE Calculate standard deviation of beam position given the RMS
%   value of noise (correlated and uncorrelated parts) and BPM inverse
%   sensitivity.
%
%   rms_position = calcnoise(abcd, rms_corr, rms_uncorr, K)
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
%
%   Outputs:
%       rms_position: estimated RMS value of position
%
%   Example:
%       rms_position = calcnoise([1 1 1 1], 1e-5*[1 1 1 1], 1e-6*[1 1 1 1], 10e6)
%
%       Estimates RMS value of position noise when antenna signals
%       A = B = C = D = 1, the correlated noise in all antennas has 1e-5
%       RMS value, the uncorrelated noise in all antennas has 1e-6 RMS
%       value and the difference over sum gain equals 10 nm. 
%       The result is approximately 5 nm.
%
%   See also simnoise

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

% Mean values of difference and sum
difference = a + b - c - d;
sum = a + b + c + d;

% Total variances of antenna signals (correlated + uncorrelated noise)
var_a = rms_a_corr.^2 + rms_a_uncorr.^2;
var_b = rms_b_corr.^2 + rms_b_uncorr.^2;
var_c = rms_c_corr.^2 + rms_c_uncorr.^2;
var_d = rms_d_corr.^2 + rms_d_uncorr.^2;

% Covariances of all combinations of antenna signals (correlated noise)
cov_ab = rms_a_corr.*rms_b_corr;
cov_cd = rms_c_corr.*rms_d_corr;
cov_ac = rms_a_corr.*rms_c_corr;
cov_bd = rms_b_corr.*rms_d_corr;
cov_ad = rms_a_corr.*rms_d_corr;
cov_bc = rms_b_corr.*rms_c_corr;

% Covariance between difference and sum signals
cov_difference_sum = var_a + var_b + 2*cov_ab -(var_c + var_d + 2*cov_cd);

% Variance of difference and sum
var_difference = var_a + var_b + var_c + var_d + 2*(cov_ab + cov_cd - cov_ac - cov_bd - cov_ad - cov_bc);
var_sum = var_a + var_b + var_c + var_d + 2*(cov_ab + cov_cd + cov_ac + cov_bd + cov_ad + cov_bc);

% Estimation of standard deviation value of difference over sum
% considereing Rao's approximation (better when |mean(sum)| >> |std(sum)|)
rms_position = K*sqrt((difference.^2.*var_sum + sum.^2.*var_difference - 2*cov_difference_sum.*difference.*sum)./(sum.^4));