L = 320;
M = 147;

% Normalized frequencies
wp = M / L;    % Passband edge (normalized)
ws = 1.2 * wp;        % Stopband edge (normalized)

% Import the lowpass filter
h = lpf(wp, ws);
disp(h(1:10));

% Verify the filter meets the specifications
[R, G, A] = examlpf(h, wp, ws);

if (R > 0.1) || (A > -70) || (G > 720)
    error('Filter does not meet the specifications.');
end