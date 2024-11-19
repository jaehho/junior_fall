clc; clear; close all;

% Define parameters
sigma2 = 1;   % Variance
rho = sqrt(2 * sigma2 * log(1e4)); % Compute rho for P(R > rho) = 10^-4
N = 1e7;      % Number of samples

% Task 3: Generate samples of n_I + jn_Q
n_I = sqrt(sigma2) * randn(N, 1); % Real part
n_Q = sqrt(sigma2) * randn(N, 1); % Imaginary part
R = abs(n_I + 1j * n_Q);          % Magnitude

% Plot histogram of R and mark rho
figure;
histogram(R, 'Normalization', 'pdf');
hold on;
xline(rho, 'r-', 'LineWidth', 2, 'Label', '\rho');
title('PDF of R with threshold \rho');
xlabel('R'); ylabel('Probability Density');
grid on;

% Task 4: Compute fraction of R > rho
fraction_above_rho = mean(R > rho);
fprintf('Fraction of R > rho: %.5e\n', fraction_above_rho);

% Task 5: Decrease \sigma^2 by 1 dB and compute theoretical/simulated P(R > rho)
sigma2_dB_down = sigma2 * 10^(-0.1);
R_down = abs(sqrt(sigma2_dB_down) * randn(N, 1) + 1j * sqrt(sigma2_dB_down) * randn(N, 1));
P_theoretical_down = exp(-rho^2 / (2 * sigma2_dB_down));
fraction_above_rho_down = mean(R_down > rho);
fprintf('P(R > rho) for sigma^2 decreased by 1 dB (theoretical): %.5e\n', P_theoretical_down);
fprintf('P(R > rho) for sigma^2 decreased by 1 dB (simulated): %.5e\n', fraction_above_rho_down);

% Task 6: Increase \sigma^2 by 1 dB and compute theoretical/simulated P(R > rho)
sigma2_dB_up = sigma2 * 10^(0.1);
R_up = abs(sqrt(sigma2_dB_up) * randn(N, 1) + 1j * sqrt(sigma2_dB_up) * randn(N, 1));
P_theoretical_up = exp(-rho^2 / (2 * sigma2_dB_up));
fraction_above_rho_up = mean(R_up > rho);
fprintf('P(R > rho) for sigma^2 increased by 1 dB (theoretical): %.5e\n', P_theoretical_up);
fprintf('P(R > rho) for sigma^2 increased by 1 dB (simulated): %.5e\n', fraction_above_rho_up);
