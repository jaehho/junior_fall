function h = lpf(L_stage)
    % Define parameters based on input L_stage
    Fpass = 1 / L_stage;         % Passband frequency
    Fstop = Fpass * 1.2;         % Stopband frequency

    % Estimate filter order and other parameters using firpmord
    c = firpmord([Fpass Fstop], [1 0], [0.001 (10^(-85 / 20))], 2, 'cell');
    
    % Design the filter using firpm
    h = firpm(c{:});
end
