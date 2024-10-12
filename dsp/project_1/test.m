[in, Fs] = audioread('Wagner.wav');  % Assuming input audio is sampled at 11,025 Hz
if Fs == 11025
    out = srconvert(in);  % Convert to 24,000 Hz
    audiowrite('output_audio.wav', out, 24000);  % Write the output audio
else
    error('Input sampling rate must be 11,025 Hz');
end
