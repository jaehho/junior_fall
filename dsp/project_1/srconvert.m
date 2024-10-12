function out = srconvert(in)
    % Initial Sampling Rate (11,025 Hz)
    Fs_in = 11025;
    fprintf('Starting Sampling Rate Conversion from %d Hz to 24,000 Hz\n', Fs_in);
    fprintf('Input signal length: %d samples\n', length(in));
    
    % The overall ratio of sampling rate change is 24000 / 11025 = 320 / 147
    % We break this into multiple stages:
    % Stage 1: Upsample by 5, downsample by 7 -> (5/7)
    % Stage 2: Upsample by 8, downsample by 7 -> (8/7)
    % Stage 3: Upsample by 8, downsample by 3 -> (8/3)
    % Resulting total ratio: (5/7) * (8/7) * (8/3) = 320/147
    
    % Stage 1: Upsample by 5, downsample by 7
    L1 = 5;  % First upsampling factor
    M1 = 7;  % First downsampling factor
    fprintf('Stage 1: Upsample by %d, Downsample by %d\n', L1, M1);
    
    % Stage 2: Upsample by 8, downsample by 7
    L2 = 8;  % Second upsampling factor
    M2 = 7;  % Second downsampling factor
    fprintf('Stage 2: Upsample by %d, Downsample by %d\n', L2, M2);
    
    % Stage 3: Upsample by 8, downsample by 3
    L3 = 8;  % Third upsampling factor
    M3 = 3;  % Third downsampling factor
    fprintf('Stage 3: Upsample by %d, Downsample by %d\n', L3, M3);
    
    % Initial sampling rate at the start of each stage
    current_sampling_rate = Fs_in;
    
    % Step 1: Design low-pass filters for each stage
    fprintf('Designing filters...\n');
    
    % Filter for Stage 1: Upsample by 5, downsample by 7
    wc1 = min(1/L1, 1/M1);  % Normalized cutoff frequency for first stage
    h1 = fir1(1024, wc1);   % FIR filter for first stage
    % Cutoff frequency in Hertz
    cutoff_freq1 = wc1 * (current_sampling_rate / 2);
    fprintf('Stage 1 Filter: Cutoff frequency = %.2f Hz, Filter length = %d\n', cutoff_freq1, length(h1));
    
    % Update sampling rate after Stage 1
    current_sampling_rate = current_sampling_rate * (L1 / M1);
    fprintf('Sampling rate after Stage 1: %.2f Hz\n', current_sampling_rate);
    
    % Filter for Stage 2: Upsample by 8, downsample by 7
    wc2 = min(1/L2, 1/M2);  % Normalized cutoff frequency for second stage
    h2 = fir1(512, wc2);    % FIR filter for second stage
    % Cutoff frequency in Hertz
    cutoff_freq2 = wc2 * (current_sampling_rate / 2);
    fprintf('Stage 2 Filter: Cutoff frequency = %.2f Hz, Filter length = %d\n', cutoff_freq2, length(h2));
    
    % Update sampling rate after Stage 2
    current_sampling_rate = current_sampling_rate * (L2 / M2);
    fprintf('Sampling rate after Stage 2: %.2f Hz\n', current_sampling_rate);
    
    % Filter for Stage 3: Upsample by 8, downsample by 3
    wc3 = min(1/L3, 1/M3);  % Normalized cutoff frequency for third stage
    h3 = fir1(256, wc3);    % FIR filter for third stage
    % Cutoff frequency in Hertz
    cutoff_freq3 = wc3 * (current_sampling_rate / 2);
    fprintf('Stage 3 Filter: Cutoff frequency = %.2f Hz, Filter length = %d\n', cutoff_freq3, length(h3));
    
    % Update sampling rate after Stage 3
    current_sampling_rate = current_sampling_rate * (L3 / M3);
    fprintf('Sampling rate after Stage 3: %.2f Hz\n', current_sampling_rate);
    
    % Polyphase decomposition for all stages
    fprintf('Performing polyphase decomposition...\n');
    H1_poly = poly1(h1, L1);  % Polyphase components for first stage
    H2_poly = poly1(h2, L2);  % Polyphase components for second stage
    H3_poly = poly1(h3, L3);  % Polyphase components for third stage
    
    %% First Stage: Upsample by 5, downsample by 7
    fprintf('Starting Stage 1 (Upsample by %d, Downsample by %d)...\n', L1, M1);
    in_upsampled1 = upsample(in, L1);
    fprintf('Signal length after upsampling: %d samples\n', length(in_upsampled1));
    
    out_stage1 = zeros(size(in_upsampled1));
    for i = 1:L1
        out_stage1 = out_stage1 + fftfilt(H1_poly(i,:), circshift(in_upsampled1, [0, i-1]));
    end
    fprintf('Filtering in Stage 1 complete\n');
    
    out_stage1 = downsample(out_stage1, M1);
    fprintf('Signal length after downsampling: %d samples\n', length(out_stage1));
    
    %% Second Stage: Upsample by 8, downsample by 7
    fprintf('Starting Stage 2 (Upsample by %d, Downsample by %d)...\n', L2, M2);
    in_upsampled2 = upsample(out_stage1, L2);
    fprintf('Signal length after upsampling: %d samples\n', length(in_upsampled2));
    
    out_stage2 = zeros(size(in_upsampled2));
    for i = 1:L2
        out_stage2 = out_stage2 + fftfilt(H2_poly(i,:), circshift(in_upsampled2, [0, i-1]));
    end
    fprintf('Filtering in Stage 2 complete\n');
    
    out_stage2 = downsample(out_stage2, M2);
    fprintf('Signal length after downsampling: %d samples\n', length(out_stage2));
    
    %% Third Stage: Upsample by 8, downsample by 3
    fprintf('Starting Stage 3 (Upsample by %d, Downsample by %d)...\n', L3, M3);
    in_upsampled3 = upsample(out_stage2, L3);
    fprintf('Signal length after upsampling: %d samples\n', length(in_upsampled3));
    
    out_stage3 = zeros(size(in_upsampled3));
    for i = 1:L3
        out_stage3 = out_stage3 + fftfilt(H3_poly(i,:), circshift(in_upsampled3, [0, i-1]));
    end
    fprintf('Filtering in Stage 3 complete\n');
    
    out = downsample(out_stage3, M3);
    fprintf('Signal length after final downsampling: %d samples\n', length(out));
    
    % Output the final sampling rate
    final_sampling_rate = current_sampling_rate;
    fprintf('Final output sampling rate: %.2f Hz\n', final_sampling_rate);
    
    fprintf('Sampling Rate Conversion complete. Output signal length: %d samples\n', length(out));
end
