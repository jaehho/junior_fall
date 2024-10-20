%%%% Problem Set I
%%%% Q2

% Jaeho Cho, Sep 23

clc; clear; close all;

%% (f) Plot X(f) and x(t)

A = 1;
W = 1;

f = linspace(-2*W, 2*W, 1000);
X_f = (A / (2 * W)) * (1 + cos(pi * f / W)) .* (abs(f) <= (2*W)/2);

figure;
subplot(2, 1, 1);
plot(f, X_f, 'LineWidth', 2);
xlabel('Frequency (f)');
ylabel('X(f)');
title('Raised-Cosine Spectrum X(f) with 100% Rolloff');
grid on;

T = 1/(2*W);
t = linspace(-4*T, 4*T, 1000);

x_t = A * (sinc(t/T) + 0.5 * (sinc((1/T)*(t - T)) + sinc((1/T)*(t + T))));

subplot(2, 1, 2);
plot(t, x_t, 'LineWidth', 2);
xlabel('Time (t)');
ylabel('x(t)');
title('Time-Domain Signal x(t)');
grid on;