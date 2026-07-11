% --- Problem 6: Signal Reconstruction ---
clc; clear; close all;
f = 5;                % Frequency of the signal (5 Hz)
T = 1.0;              % Duration (1 second)

% 1. The "Analog" Ground Truth
t_fine = 0:0.001:T;
x_analog = sin(2 * pi * f * t_fine);

% 2. Sampling (Above Nyquist to make reconstruction possible)
fs = 15;              % Sampling at 15 Hz (Nyquist is 10 Hz)
t_samples = 0:1/fs:T;
x_samples = sin(2 * pi * f * t_samples);

% 3. Reconstruction using interp1
x_linear = interp1(t_samples, x_samples, t_fine, 'linear');
x_spline = interp1(t_samples, x_samples, t_fine, 'spline');

% 4. Quantify Reconstruction Error (RMSE vs. analog ground truth)
rmse_linear = sqrt(mean((x_analog - x_linear).^2));
rmse_spline = sqrt(mean((x_analog - x_spline).^2));

fprintf('Linear Reconstruction RMSE: %.4f\n', rmse_linear);
fprintf('Spline Reconstruction RMSE: %.4f\n', rmse_spline);

% --- Plotting ---
figure('Name', 'Problem 6: Reconstruction');

% Plot 1: Linear Reconstruction
subplot(2,1,1);
plot(t_fine, x_analog, 'k--', 'LineWidth', 1); hold on;
stem(t_samples, x_samples, 'filled', 'r');
plot(t_fine, x_linear, 'b', 'LineWidth', 1.5);
title('Linear Reconstruction (Connect-the-dots)');
legend('Original', 'Samples', 'Reconstructed');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

% Plot 2: Spline Reconstruction
subplot(2,1,2);
plot(t_fine, x_analog, 'k--', 'LineWidth', 1); hold on;
stem(t_samples, x_samples, 'filled', 'r');
plot(t_fine, x_spline, 'g', 'LineWidth', 1.5);
title('Spline Reconstruction (Smooth Curve)');
legend('Original', 'Samples', 'Reconstructed');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;
