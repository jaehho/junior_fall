clc; clear; close all;

%% (a) Compute P(R > rho)
P_R_greater_rho_ = @(rho, sigma2) exp(-rho^2 / (2 * sigma2));

%% (b) Find rho/sigma so that P(R > rho) = 10^-4
rho_threshold = 10^-4;
rho_sigma_ratio_ = @(rho_threshold) sqrt(-2 * log(rho_threshold));
rho_sigma_ratio = rho_sigma_ratio_(10^-4);

%% (c) Sketch R = |n_I + jn_Q|
sigma2 = 1;
sigma = sqrt(sigma2);
rho = rho_sigma_ratio * sigma;
num_samples = 1e7;
n_I = randn(num_samples, 1) * sigma;
n_Q = randn(num_samples, 1) * sigma;
R = abs(n_I + 1j * n_Q);

figure;
 % Empirical PDF
histogram(R, 'Normalization', 'pdf');
hold on;

% Theoretical PDF
r_vals = linspace(0, max(R), num_samples);
pdf_vals = (r_vals / sigma2) .* exp(-r_vals.^2 / (2 * sigma2));
plot(r_vals, pdf_vals, 'r-', 'LineWidth', 2);

% Vertical line at threshold rho
xline(rho, 'k', 'LineWidth', 2);

title('PDF of R and Threshold \rho');
xlabel('R');
ylabel('PDF');
legend('Empirical PDF', 'Theoretical PDF', '\rho');
grid on;

%% (d) Fraction of time R > rho
frac_R_greater_rho = mean(R > rho);

% Display results
fprintf('Empirical fraction R > rho: %.5f\n', frac_R_greater_rho);
fprintf('Theoretical P(R > rho): %.5f\n', P_R_greater_rho_(rho, sigma2));

%% (e) Decrease sigma^2 by 1 dB
sigma2_decreased = sigma2 * 10^(-1/10);
sigma_decreased = sqrt(sigma2_decreased);

% Generate new samples
n_I_new = randn(num_samples, 1) * sigma_decreased;
n_Q_new = randn(num_samples, 1) * sigma_decreased;
R_new = abs(n_I_new + 1j * n_Q_new);

fraction_exceed_new = mean(R_new > rho);

fprintf('\nFor decreased sigma^2 by 1 dB:');
fprintf('Theoretical P(R > rho): %.5e\n', P_R_greater_rho_(rho, sigma2_decreased));
fprintf('Empirical fraction R > rho: %.5f\n', fraction_exceed_new);

%% (f) Increase sigma^2 by 1 dB
sigma2_increased = sigma2 * 10^(1/10); % Increase sigma^2 by 1 dB
sigma_increased = sqrt(sigma2_increased);

% Generate new samples
n_I_new2 = randn(num_samples, 1) * sigma_increased;
n_Q_new2 = randn(num_samples, 1) * sigma_increased;
R_new2 = abs(n_I_new2 + 1j * n_Q_new2);

fraction_exceed_new2 = mean(R_new2 > rho);

% Display results
fprintf('\nFor increased sigma^2 by 1 dB:');
fprintf('Theoretical P(R > rho): %.5e\n', P_R_greater_rho_(rho, sigma2_increased));
fprintf('Empirical fraction R > rho: %.5f\n', fraction_exceed_new2);
