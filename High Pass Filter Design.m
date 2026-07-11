% --- Problem 17: High-Pass Filter Design ---
clc; clear; close all;

% Generate a Signal with DC Offset
fs = 1000;                  % Sampling frequency
t = 0:1/fs:1;                % 1 second duration
f_sig = 10;                  % Desired signal frequency (10 Hz)
dc_offset = 2;               % DC component to be removed
x_original = dc_offset + sin(2*pi*f_sig*t);

% Design High-Pass Filter
fc = 1;                      % Cutoff frequency (Hz) - just above DC
order = 4;
[b, a] = butter(order, fc/(fs/2), 'high');

% Apply Filter
x_filtered = filter(b, a, x_original);

% Plotting
figure('Name', 'Problem 17: High-Pass Filter Design');
subplot(2,1,1);
plot(t, x_original, 'r', 'LineWidth', 1.5);
title('Original Signal (10 Hz + DC Offset)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
ylim([-2 4]);

subplot(2,1,2);
plot(t, x_filtered, 'b', 'LineWidth', 1.5);
title('Filtered Signal (DC Removed)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
ylim([-2 4]);

% Compare Mean Values
mean_original = mean(x_original);
mean_filtered = mean(x_filtered);
fprintf('Mean of original signal: %.4f\n', mean_original);
fprintf('Mean of filtered signal: %.4f\n', mean_filtered);
