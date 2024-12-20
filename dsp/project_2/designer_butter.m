function Hd = butter
%BUTTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 24.1 and DSP System Toolbox 24.1.
% Generated on: 30-Oct-2024 22:59:53

% Butterworth Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

Fpass = 2500;        % Passband Frequency
Fstop = 4000;        % Stopband Frequency
Apass = 3;           % Passband Ripple (dB)
Astop = 95;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
