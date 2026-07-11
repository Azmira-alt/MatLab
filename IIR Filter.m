% --- Problem 18: IIR Filter Design ---
clc; clear; close all;

% Generate a Noisy Test Signal
fs = 1000;                  % Sampling frequency
t = 0:1/fs:1;                % 1 second duration
f_sig = 20;                  % Desired low-frequency signal (20 Hz)
f_noise = 150;               % High-frequency noise component (150 Hz)
x_clean = sin(2*pi*f_sig*t);
x_noisy = x_clean + 0.5*sin(2*pi*f_noise*t);

% Design Butterworth Low-Pass Filter
fc = 50;                     % Cutoff frequency (Hz)
order = 4;
[b, a] = butter(order, fc/(fs/2), 'low');

% Apply Filter
x_filtered = filter(b, a, x_noisy);

% Plotting
figure('Name', 'Problem 18: IIR Filter Design');
subplot(3,1,1);
plot(t, x_clean, 'g', 'LineWidth', 1.5);
title('Original Clean Signal (20 Hz)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,2);
plot(t, x_noisy, 'r');
title('Noisy Signal (20 Hz + 150 Hz)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,3);
plot(t, x_filtered, 'b', 'LineWidth', 1.5);
title('Filtered Signal (Butterworth Low-Pass, 50 Hz cutoff)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

% Display Filter Coefficients
fprintf('Butterworth filter coefficients:\n');
fprintf('b = '); disp(b);
fprintf('a = '); disp(a);
