function h = lpf(wp, ws)
    % Desired ripples
    delta_p = (10^(0.1/20) - 1);   % Passband ripple
    delta_s = 10^(-70/20);         % Stopband ripple
    
    % Weights for the Parks-McClellan algorithm
    W_p = 1;                      % Passband weight
    W_s = delta_p / delta_s;      % Stopband weight
    
    % Frequency bands and desired amplitudes
    F = [0 wp ws 1];
    Mags = [1 1 0 0];
    W = [W_p W_s];
    
    % Filter order
    N = 128;
    
    % Design the filter
    h = firpm(N, F, Mags, W);

end