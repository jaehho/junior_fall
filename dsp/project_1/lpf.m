function h = lpf()
    % Define specifications
    fs = 24000; % Sampling frequency
    wp = (11025 / fs) * pi; % Passband cutoff frequency (normalized)
    ws = 1.2 * wp; % Stopband frequency
    passband_ripple = 0.1; % Passband ripple (in dB)
    stopband_attenuation = 70; % Stopband attenuation (in dB)
    
    % Convert dB to linear scale
    delta_p = 10^(-passband_ripple / 20); % Passband ripple
    delta_s = 10^(-stopband_attenuation / 20); % Stopband attenuation

    % Define the frequency vector
    f = [0, wp, ws, 1]; % Normalized frequency (0 to 1)
    m = [1, 1, 0, 0]; % Desired magnitude response (1 in passband, 0 in stopband)
    
    % Calculate the necessary filter order using the given parameters
    % Using the formula for filter order approximation (based on given specs)
    delta_f = ws - wp; % Transition width
    order = ceil((stopband_attenuation - 7.95) / (14.36 * delta_f)); % Calculate order
    
    % Design the filter using firpm (Parks-McClellan)
    h = firpm(order, f, m, [delta_p, delta_s]); % Use firpm for filter design

    % Verify group delay specifications
    grpdelay_b = grpdelay(h); % Calculate group delay
    max_grpdelay = max(grpdelay_b);
    min_grpdelay = min(grpdelay_b);
    
    % Check if the group delay difference is within specifications
    if abs(max_grpdelay - min_grpdelay) > 720
        error('Group delay specification not met.');
    end
    
    % Plot the frequency response for verification
    fvtool(h, 1); % Visualize the filter response
end
