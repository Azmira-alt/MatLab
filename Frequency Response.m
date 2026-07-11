clc; clear; close all;

% Problem 19: Design a filter to analyze
% Butterworth low-pass filter, 4th order, cutoff at 200 Hz
fs = 1000;              % Sampling frequency
fc = 200;               % Desired cutoff frequency (Hz)
order = 4;              % Filter order

[b, a] = butter(order, fc/(fs/2), 'low');

% Frequency Response using freqz
N = 1024;  % Number of frequency points
[H, f] = freqz(b, a, N, fs);   % f returned in Hz directly

% Plot Magnitude Response
figure('Name', 'Problem 19: Frequency Response');
subplot(2,1,1);
plot(f, abs(H), 'b-', 'LineWidth', 1.5);
hold on;
yline(1/sqrt(2), 'r--', 'LineWidth', 1.2); % -3 dB reference line
xline(fc, 'g--', 'LineWidth', 1.2);        % Marked cutoff frequency
title('Magnitude Response |H(f)|');
xlabel('Frequency (Hz)'); ylabel('|H(f)|');
legend('Magnitude', '-3 dB Level', 'Cutoff Frequency');
grid on;

% Plot Phase Response
subplot(2,1,2);
plot(f, unwrap(angle(H)), 'b-', 'LineWidth', 1.5);
hold on;
xline(fc, 'g--', 'LineWidth', 1.2);
title('Phase Response');
xlabel('Frequency (Hz)'); ylabel('Phase (radians)');
legend('Phase', 'Cutoff Frequency');
grid on;
