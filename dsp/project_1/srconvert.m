function out = srconvert(in)
    % Sampling rate converter from 11,025 Hz to 24,000 Hz using
    % multistage and polyphase interpolation approach.
    
    % Stage 1: Upsample by 5, downsample by 7
    L1 = 5;  % First upsampling factor
    M1 = 7;  % First downsampling factor
    
    % Stage 2: Upsample by 8, downsample by 7
    L2 = 8;  % Second upsampling factor
    M2 = 7;  % Second downsampling factor
    
    % Stage 3: Upsample by 8, downsample by 3
    L3 = 8;  % Third upsampling factor
    M3 = 3;  % Third downsampling factor
    
    % Step 1: Process the first stage
    out_stage1 = process_stage(in, L1, M1, 1024, 'Stage 1');
    
    % Step 2: Process the second stage
    out_stage2 = process_stage(out_stage1, L2, M2, 512, 'Stage 2');
    
    % Step 3: Process the third stage
    out = process_stage(out_stage2, L3, M3, 256, 'Stage 3');
end

function out_stage = process_stage(in, L, M, filter_length, stage_name)
    % Process a single stage of the multistage converter
    % Inputs:
    % in           - Input signal for the stage
    % L            - Upsampling factor
    % M            - Downsampling factor
    % filter_length- Length of the FIR filter
    % stage_name   - Name of the stage for logging and plotting purposes

    % Design low-pass filter for this stage
    wc = min(pi / L, pi / M);  % Cutoff frequency for this stage
    h = fir1(filter_length, wc);  % FIR filter of specified length
    fprintf('%s cutoff frequency: %f (normalized by Nyquist)\n', stage_name, wc);
    plot_filter(h, [stage_name, ' Filter']);
    
    % Polyphase decomposition of the filter
    H_poly = poly1(h, L);  % Polyphase components
    
    % Perform polyphase filtering
    out_stage = polyphase_filter(in, H_poly, L, M);
    
    % Plot the signal after this stage
    plot_signal(out_stage, ['Signal After ', stage_name, ' (Upsample by ', num2str(L), ', Downsample by ', num2str(M), ')']);
end

function out = polyphase_filter(in, H_poly, L, M)
    % Polyphase filter for interpolation and decimation.
    % Inputs:
    % in      - Input signal
    % H_poly  - Polyphase components of the FIR filter
    % L       - Upsampling factor
    % M       - Downsampling factor
    
    % Step 1: Upsample the signal by L (insert zeros)
    in_upsampled = upsample(in, L);
    
    % Step 2: Polyphase filtering using each polyphase component
    out_upsampled = zeros(size(in_upsampled));
    for i = 1:L
        % Apply each polyphase component to the shifted input signal
        out_upsampled = out_upsampled + fftfilt(H_poly(i,:), circshift(in_upsampled, [0, i-1]));
    end
    
    % Step 3: Downsample the filtered signal by M
    out = downsample(out_upsampled, M);
end

function plot_filter(h, title_str)
    % Plot the frequency response of a filter
    [H, W] = freqz(h, 1, 1024);
    figure;
    plot(W/pi, 20*log10(abs(H)));
    grid on;
    xlabel('Normalized Frequency (\omega / \pi)');
    ylabel('Magnitude (dB)');
    title(['Frequency Response of ' title_str]);
    ylim([-100, 10]); % Set y-axis limits for better visualization of attenuation
end

function plot_signal(signal, title_str)
    % Plot the signal in time domain and frequency domain
    figure;

    % Plot time domain
    subplot(2, 1, 1);
    plot(signal);
    grid on;
    title(['Time Domain of ' title_str]);
    xlabel('Samples');
    ylabel('Amplitude');
    
    % Plot frequency domain
    subplot(2, 1, 2);
    N = length(signal);
    freq_signal = fft(signal);
    f = (0:N-1)/N; % Normalized frequency from 0 to 1
    plot(f, 20*log10(abs(freq_signal)));
    grid on;
    title(['Frequency Domain of ' title_str]);
    xlabel('Normalized Frequency');
    ylabel('Magnitude (dB)');
    ylim([-100, 50]); % Set y-axis limits for better visualization
end
