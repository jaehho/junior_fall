function y = srconvert(x)
    L = 320;
    M = 147;
    
    % Perform the multistage interpolation by 320 using polyphase filters
    y = multistage_polyphase_interpolation(x, L);
    
    % Downsample by 147
    y = downsample(y, M);
    
    y = y * M;  % Adjust the scale to account for downsampling
end

function y = multistage_polyphase_interpolation(x, L)
    stages = factors(L); % [2, 2, 2, 2, 2, 2, 5]

    % Loop through each stage and perform interpolation with polyphase decomposition
    y = x;
    for L_stage = stages

        % Design the lowpass filter for the current stage
        h = lpf(L_stage);
        
        % Generate the polyphase filter matrix
        E = poly1(h, L_stage);

        % Polyphase interpolation
        y_upsampled = 0;
        for i = 1:L_stage
            y_filtered = fftfilt(E(i,:),y);
            y_upsampled = y_upsampled + upsample(y_filtered, L_stage, i-1);
        end
        y = y_upsampled;
    end
end