% --- Problem 8: Quantization Error Analysis ---
fs = 1000;                    % High sampling frequency for "smooth" signal
t = 0:1/fs:0.5;               % 0.5 seconds of data
f = 4;                        % 4 Hz sine wave
x = sin(2 * pi * f * t);      % Original signal

% 1. Quantization Setup
n_bits = 4;                   % 4-bit quantization (16 levels)
Vmax = 1; Vmin = -1;
L = 2^n_bits;
delta = (Vmax - Vmin) / L;    % Step size

% 2. Quantize the signal
% Shift to [0, Range], scale by delta, round, then shift back
xq = round(x / delta) * delta;

% 3. Compute Quantization Error
q_error = x - xq;

% 4. Calculate Mean Squared Error (MSE)
% MSE = (1/N) * sum((original - quantized)^2)
mse_val = mean(q_error.^2);

% --- Plotting ---
figure('Name', 'Problem 8: Quantization Error Analysis');

% Subplot 1: Signal Comparison
subplot(2,1,1);
plot(t, x, 'k', 'LineWidth', 1.2); hold on;
stairs(t, xq, 'b', 'LineWidth', 1);
grid on;
title(['Signal vs. ', num2str(n_bits), '-bit Quantization']);
legend('Original', 'Quantized');
ylabel('Amplitude');

% Subplot 2: Error Signal
subplot(2,1,2);
plot(t, q_error, 'r');
grid on;
title(['Quantization Error Signal (MSE = ', num2str(mse_val, '%.6f'), ')']);
xlabel('Time (s)');
ylabel('Error');

% Display MSE in Command Window
fprintf('The Mean Squared Error (MSE) for %d bits is: %f\n', n_bits, mse_val);