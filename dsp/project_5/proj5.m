clear; close all; clc;

[x, fs] = audioread('bjruf.wav');

N = 1024; % FFT size
L = N; % Window length = FFT size

% Set the window type
windowType = 'rect'; % Options: {rect, bartlett}

% Select window based on type
if strcmp(windowType, 'rect')
    window = rectwin(L)';
    windowName = 'Rectangular';
    R = L; % Hop size
else
    window = bartlett(L)';
    windowName = 'Bartlett';
    R = L/2; % Hop size
end

numBlocks = ceil(length(x)/R);
x = x(:)'; % make x a row vector

% Ensure sufficient padding
requiredLength = (numBlocks-1)*R + L;
x = [x zeros(1, requiredLength - length(x))];

% Initialize matrices
X_r = zeros(numBlocks, N);

% Process blocks
for r = 1:numBlocks
    start_idx = (r-1)*R + 1;
    seg = x(start_idx:start_idx+L-1) .* window;
    X_block = fft(seg, N);
    X_r(r,:) = X_block;
end

% Speech detection with band-limited energy
freqs = (0:N-1) * (fs / N); % Frequency bins
band = (freqs >= 300 & freqs <= 3000); % Speech frequency band
block_energies = sum(abs(X_r(:, band)).^2, 2);
energy_threshold = 0.1 * max(block_energies);
is_energy_based = block_energies > energy_threshold;

% Spectral Flatness Measure (SFM)
% References: [https://rdcu.be/d4lsY], [https://link.springer.com/article/10.1007/s00034-009-9141-4]
sfm = zeros(numBlocks, 1);
for r = 1:numBlocks
    magnitudes = abs(X_r(r, :)) + 1e-6; % Add small value to avoid log(0)
    geometric_mean = exp(mean(log(magnitudes)));
    arithmetic_mean = mean(magnitudes);
    sfm(r) = geometric_mean / arithmetic_mean;
end
sfm_threshold = 0.3;
is_sfm_based = sfm < sfm_threshold;

% Combine energy and SFM criteria
speech_presence = is_energy_based & is_sfm_based;

% Reconstruct signal
x_hat = zeros(1, (numBlocks-1)*R + L);
for r = 1:numBlocks
    % Eq. 10.43 (IDFT)
    x_r_block = ifft(X_r(r,:), N);
    x_r_block = real(x_r_block(1:L));

    % Eq 10.44 (Overlap-Add)
    start_idx = (r-1)*R + 1;
    x_hat(start_idx:start_idx+L-1) = x_hat(start_idx:start_idx+L-1) + x_r_block;
end

% Trim to original length
x_hat = x_hat(1:length(x));

% Check reconstruction quality
reconstruction_error = norm(x_hat - x) / norm(x);
disp(['Reconstruction error (' windowName '): ' num2str(reconstruction_error)]);

% 0-1 vector
speech_binary = zeros(size(x));

for r = 1:numBlocks
    start_idx = (r-1)*R + 1;
    end_idx = start_idx + L - 1;
    if end_idx > length(speech_binary)
        end_idx = length(speech_binary);
    end
    if speech_presence(r) == 1
        speech_binary(start_idx:end_idx) = 1;
    end
end

t = (0:length(x)-1)/fs;

figure;
subplot(2,1,1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Audio Signal');

subplot(2,1,2);
plot(t, speech_binary, 'b');
xlabel('Time (s)');
ylabel('Speech Activity');
title(['Detected Speech Activity (' windowName ' Window)']);
ylim([-0.1 1.1]);
