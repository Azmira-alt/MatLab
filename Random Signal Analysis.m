% --- Problem 15: Random Signal Analysis ---
clc; clear; close all;
rng(0);                      % Fixed seed for reproducibility

% Generate White Gaussian Noise
fs = 1000;                   % Sampling frequency
N_samples = 10000;           % Number of samples
mu_theoretical = 0;          % Theoretical mean
sigma_theoretical = 1;       % Theoretical standard deviation

x = mu_theoretical + sigma_theoretical * randn(1, N_samples);
t = (0:N_samples-1)/fs;

% Compute Statistical Properties
mean_measured = mean(x);
var_measured = var(x);
std_measured = std(x);
skewness_measured = skewness(x);
kurtosis_measured = kurtosis(x);

% Plotting
figure('Name', 'Problem 15: Random Signal Analysis');
subplot(2,1,1);
plot(t, x, 'b');
title('White Gaussian Noise Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(2,1,2);
histogram(x, 50, 'Normalization', 'pdf');
hold on;
x_range = linspace(min(x), max(x), 200);
pdf_theoretical = (1/(sigma_theoretical*sqrt(2*pi))) * ...
    exp(-(x_range - mu_theoretical).^2 / (2*sigma_theoretical^2));
plot(x_range, pdf_theoretical, 'r-', 'LineWidth', 2);
title('Histogram vs Theoretical Gaussian PDF');
xlabel('Amplitude'); ylabel('Probability Density');
legend('Empirical Histogram', 'Theoretical PDF'); grid on;

% Display Results
fprintf('--- Theoretical Expectations ---\n');
fprintf('Mean: %.4f, Variance: %.4f, Std Dev: %.4f\n', ...
    mu_theoretical, sigma_theoretical^2, sigma_theoretical);
fprintf('Skewness (Gaussian): 0, Kurtosis (Gaussian): 3\n');
fprintf('\n--- Measured Statistical Properties ---\n');
fprintf('Mean: %.4f\n', mean_measured);
fprintf('Variance: %.4f\n', var_measured);
fprintf('Std Dev: %.4f\n', std_measured);
fprintf('Skewness: %.4f\n', skewness_measured);
fprintf('Kurtosis: %.4f\n', kurtosis_measured);
