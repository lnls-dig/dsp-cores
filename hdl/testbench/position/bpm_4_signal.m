function [adc_a, adc_b, adc_c, adc_d ] = bpm_4_signal(x_position, y_position, current, ...
                                        k_sum, k_y, k_x, t, fc, fadc)
%                                      fswR, sw_transition, ch2_gain, ch2_phase,  noise, ...
                                       
                                        
% bpm_signal returns a simulated BPM signal for two buttons, given the
% relative position of the beam.
%
% position => beam displacement from the center, in m (positive is nearer to
% btn_a)
% t => time vector
% fswR => Switching rate (in relation to ADC sampling frequency) 
% sw_off => switching duration
% ch2_gain => gain of ch2 relative to ch1
% ch2_phase => phase difference between ch2 and ch1, in radians

% Beam signal carrier
carrier  = cos(2*pi*fc*t); % + pi/3 to avoid any phase sync effects
% carrier2 = cos(2*pi*fc*t + ch2_phase);

% Delta/Sigma x K = pos (m)
% delta = pos*Sigma/K
 
% ch2_gain_mag = db2mag(ch2_gain);

L = length(t);
a = 0.25*(1/k_sum-x_position/k_x+y_position/k_y)*current;
b = 0.25*(1/k_sum+x_position/k_x+y_position/k_y)*current;
c = 0.25*(1/k_sum+x_position/k_x-y_position/k_y)*current;
d = 0.25*(1/k_sum-x_position/k_x-y_position/k_y)*current;

a_mod =  a .*carrier    ;          % + noise*randn([1,L]);
% a_mod2 = a.*carrier2*ch2_gain_mag + noise*randn([1,L]);
 
b_mod =  b.*carrier     ;          %+ noise*randn([1,L]);
% b_mod2 = b.*carrier2*ch2_gain_mag + noise*randn([1,L]);

c_mod =  c.*carrier      ;         %+ noise*randn([1,L]);
% c_mod2 = c.*carrier2*ch2_gain_mag + noise*randn([1,L]);

d_mod =  d.*carrier       ;        %+ noise*randn([1,L]);
% d_mod2 = d.*carrier2*ch2_gain_mag + noise*randn([1,L]);


% samples_off = ceil(sw_transition*fadc);
%straight configuration for swithc
%sw_s = repmat( [ zeros(1,floor(samples_off/2)) , ones(1,fswR-samples_off), ...
%                 zeros(1,ceil(samples_off/2)), zeros(1,fswR) ], ...
%                 1, length(t)/fswR/2 );

% cross configuration for switch            
% sw_c = [ zeros(1,fswR), sw_s(1:end-fswR)];


adc_a = a_mod; adc_b = b_mod; adc_c = c_mod; adc_d = d_mod;
%two channels
% a_ch1 = a_mod .*sw_s;
% a_ch2 = a_mod2.*sw_c;
% 
% adc_a = a_ch1 + a_ch2;
% 
% c_ch1 = c_mod .*sw_c;
% c_ch2 = c_mod2.*sw_s;
% 
% adc_c = c_ch1 + c_ch2; 
end