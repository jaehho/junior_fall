clear; close all; clc;

y = srconvert([1 zeros(1, 3000)]);
verify(y);

[in, Fs] = audioread('Wagner.wav');
out = srconvert(in);
audiowrite('output_audio.wav', out, 24000);
sound(out, 24000);