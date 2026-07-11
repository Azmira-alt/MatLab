% --- Problem 13: Statistical Measures ---
clc; clear; close all;
rng(0);                      % Fixed seed for reproducibility

% Generate a Test Signal
fs = 1000;
t = 0:1/fs:1;
x = sin(2*pi*10*t) + 0.3*randn(size(t)); % Sine wave with added noise
N = length(x);

% Method 1: MATLAB Built-in Functions
mean_builtin = mean(x);
var_builtin = var(x);
std_builtin = std(x);
skew_builtin = skewness(x);
kurt_builtin = kurtosis(x);

% Method 2: Manual Formulas
% Mean: mu = (1/N) * sum(x)
mean_manual = sum(x) / N;

% Variance: sigma^2 = (1/(N-1)) * sum((x - mu)^2)  [sample variance, matches MATLAB's var()]
var_manual = sum((x - mean_manual).^2) / (N - 1);

% Standard deviation: sigma = sqrt(variance)
std_manual = sqrt(var_manual);

% Skewness: (1/N) * sum(((x - mu)/sigma_pop)^3), using population std (N, not N-1)
sigma_pop = sqrt(sum((x - mean_manual).^2) / N);
skew_manual = (sum((x - mean_manual).^3) / N) / sigma_pop^3;

% Kurtosis: (1/N) * sum(((x - mu)/sigma_pop)^4)
kurt_manual = (sum((x - mean_manual).^4) / N) / sigma_pop^4;

% Plotting
figure('Name', 'Problem 13: Statistical Measures');
plot(t, x, 'b');
title('Test Signal (10 Hz Sine Wave + Noise)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

% Display Comparison
fprintf('%-20s %-15s %-15s\n', 'Measure', 'Built-in', 'Manual');
fprintf('%-20s %-15.4f %-15.4f\n', 'Mean', mean_builtin, mean_manual);
fprintf('%-20s %-15.4f %-15.4f\n', 'Variance', var_builtin, var_manual);
fprintf('%-20s %-15.4f %-15.4f\n', 'Std Dev', std_builtin, std_manual);
fprintf('%-20s %-15.4f %-15.4f\n', 'Skewness', skew_builtin, skew_manual);
fprintf('%-20s %-15.4f %-15.4f\n', 'Kurtosis', kurt_builtin, kurt_manual);
