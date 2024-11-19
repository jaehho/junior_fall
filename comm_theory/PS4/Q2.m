clc; clear; close all;

kf = 3e6; % Frequency sensitivity (Hz/V)
cases = [
    2,  15e6;   % Case 1: Amplitude 2 V,  frequency 15 MHz
    10, 10e6;   % Case 2: Amplitude 10 V, frequency 10 MHz
    2,  20e6    % Case 3: Amplitude 2 V,  frequency 20 MHz
];

universal_curve_estimates = [
    0.3, 12;
    0.4, 10;
    3, 4;
];

results = cell(size(cases, 1), 5); % Use a cell array for mixed data types
for i = 1:size(cases, 1)
    A = cases(i, 1); % Amplitude (V)
    fm = cases(i, 2); % Modulating frequency (Hz)

    delta_f = kf * A; % Frequency deviation (Hz)
    beta = delta_f / fm; % Modulation index

    if beta <= 1 % Narrowband condition
        bw_type = "Narrowband";
    else
        bw_type = "Wideband";
    end

    % Carson’s Rule
    BW_carson = 2 * (delta_f + fm); % Approximate bandwidth (Hz)

    % Calculate bandwidth using Universal Curve (estimate)
    bt_over_delta_f = universal_curve_estimates(universal_curve_estimates(:, 1) == beta, 2);
    if isempty(bt_over_delta_f) % Handle cases where no match is found
        BW_universal = NaN;
    else
        BW_universal = bt_over_delta_f * delta_f;
    end

    results(i, :) = {delta_f, beta, bw_type, BW_carson, BW_universal}; % Store results in the cell array
end

% Results table
T = cell2table(results, ...
    'VariableNames', {'Freq_Deviation_Hz', 'Mod_Index', 'Is_Wideband', 'Bandwidth_Carson_Hz', 'Universal_Curve_Hz'});
T.Amplitude_V = cases(:, 1);
T.Frequency_Hz = cases(:, 2);
T = T(:, {'Amplitude_V', 'Frequency_Hz', 'Freq_Deviation_Hz', 'Mod_Index', 'Is_Wideband', 'Bandwidth_Carson_Hz', 'Universal_Curve_Hz'});
disp(T);
