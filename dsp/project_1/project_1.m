clear all; close all; clc;

y = srconvert([1 zeros(1, 3000)]);
% freqz(y, 1, 1024)
figure;
verify(y);
