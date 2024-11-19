clc; clear; close all;

fc = 10;        % Carrier frequency (Hz)
Ac = 2;         % Carrier amplitude (V)

fm = 2;         % Modulating frequency (Hz)
mu_sens = 2;    % Amplitude sensitivity (V/V)

fs = 100;       % Sampling frequency (Hz)
ts = 1/fs;      % Sampling time
n = 2000;       % Number of samples
t = (0:n-1)*ts; % Time vector

Am_values = [0.4, 0.45, 0.6];

for i = 1:length(Am_values)
    Am = Am_values(i);
    
    % Modulation index calculation
    beta = mu_sens * Am / Ac * 100;
    is_overmodulated = beta > 100;
    
    m_t = Am * sin(2*pi*fm*t);
    
    % AM signal
    s_t = Ac * (1 + mu_sens * m_t) .* cos(2*pi*fc*t);
    
    figure;
    plot(t, s_t);
    title(sprintf('Am = %.2f (Modulation Index = %.1f%%, Overmodulated: %s)', ...
        Am, beta, string(is_overmodulated)));
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    xlim([0 1]);
    grid on;
end