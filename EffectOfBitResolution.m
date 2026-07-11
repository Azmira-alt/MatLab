% --- Problem 9: Effect of Bit Resolution ---
clc; clear; close all;
fs = 1000;
t = 0:1/fs:0.4;
f = 5;
x = sin(2 * pi * f * t); % Original Signal
bits = [2, 4, 8]; % Bit depths to compare

figure('Name', 'Problem 9: Bit Resolution Comparison');
for i = 1:length(bits)
    n = bits(i);
    L = 2^n; % Number of levels

    % Quantization Process
    delta = (max(x) - min(x)) / L;
    xq = round(x / delta) * delta;

    % Error Calculation
    error_sig = x - xq;
    mse = mean(error_sig.^2);

    % --- Plotting ---
    subplot(3, 2, 2*i-1);
    plot(t, x, 'k--', 'LineWidth', 0.5); hold on;
    stairs(t, xq, 'b', 'LineWidth', 1.2);
    title([num2str(n), '-Bit Signal (', num2str(L), ' Levels)']);
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;

    subplot(3, 2, 2*i);
    plot(t, error_sig, 'r');
    title(['Quantization Error (MSE: ', num2str(mse, '%.6f'), ')']);
    xlabel('Time (s)'); ylabel('Error'); grid on;

    fprintf('%d-bit (%d levels): MSE = %.6f\n', n, L, mse);
end
