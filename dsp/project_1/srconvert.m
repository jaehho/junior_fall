function out = srconvert(in)
    % Sampling rate converter from 11,025 Hz to 24,000 Hz using
    % a multistage approach with explicit polyphase decomposition.
    
    % Stage 1: Upsample by 5, downsample by 7
    L1 = 5;  % First upsampling factor
    M1 = 7;  % First downsampling factor
    
    % Stage 2: Upsample by 8, downsample by 7
    L2 = 8;  % Second upsampling factor
    M2 = 7;  % Second downsampling factor
    
    % Stage 3: Upsample by 8, downsample by 3
    L3 = 8;  % Third upsampling factor
    M3 = 3;  % Third downsampling factor
    
    % Design low-pass filters for each stage
    wc1 = min(1/L1, 1/M1);  % Cutoff for first stage
    h1 = fir1(1024, wc1);   % FIR filter for first stage
    
    wc2 = min(1/L2, 1/M2);  % Cutoff for second stage
    h2 = fir1(512, wc2);    % FIR filter for second stage
    
    wc3 = min(1/L3, 1/M3);  % Cutoff for third stage
    h3 = fir1(256, wc3);    % FIR filter for third stage
    
    % Perform multistage conversion
    out_stage1 = process_stage(in, h1, L1, M1);
    out_stage2 = process_stage(out_stage1, h2, L2, M2);
    out = process_stage(out_stage2, h3, L3, M3);
end    

function out_stage = process_stage(in_signal, h, L, M)
    % Polyphase decomposition for upsampling
    H_poly_up = poly1(h, L);
    
    % Upsample by L and apply polyphase filtering
    len_in = length(in_signal);
    upsampled_signal = zeros(1, len_in * L);
    for i = 1:L
        % Apply each polyphase component to the shifted input signal
        upsampled_signal(i:L:end) = fftfilt(H_poly_up(i,:), in_signal);
    end
    
    % Polyphase decomposition for downsampling
    H_poly_down = poly1(h, M);
    
    % Downsample by M using polyphase filtering
    out_stage = zeros(1, ceil(length(upsampled_signal) / M));
    for i = 1:M
        % Apply each polyphase component to the shifted input signal
        filtered_signal = fftfilt(H_poly_down(i,:), upsampled_signal);
        downsampled_signal = downsample(filtered_signal, M, i-1);
        out_stage(1:length(downsampled_signal)) = out_stage(1:length(downsampled_signal)) + downsampled_signal;
    end
end