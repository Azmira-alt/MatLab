% --- Problem 7: Uniform Quantizer ---
clc; clear; close all;
t = 0:0.01:1;           % Time vector
A = 1;                  % Amplitude of sine wave
f = 2;                  % Frequency 2 Hz
x = A * sin(2 * pi * f * t); % Original "Continuous" signal

% 1. Define Quantization Parameters
n_bits = 3;             % Number of bits (e.g., 3-bit quantizer)
L = 2^n_bits;           % Number of quantization levels (2^3 = 8)
Vmin = -1;              % Minimum voltage
Vmax = 1;               % Maximum voltage

% 2. Calculate Step Size (Delta)
delta = (Vmax - Vmin) / L;

% 3. Perform Uniform Quantization
xq = round(x / delta) * delta;

% 4. Calculate Quantization Error
quant_error = x - xq;

% --- Plotting ---
figure('Name', 'Problem 7: Uniform Quantization');

% Plot 1: Original vs Quantized
subplot(2,1,1);
plot(t, x, 'k--', 'LineWidth', 1); hold on;
stairs(t, xq, 'b', 'LineWidth', 1.5);
grid on;
title(['Original vs. ', num2str(n_bits), '-bit Quantized Signal']);
legend('Original (Analog)', 'Quantized (Digital)');
xlabel('Time (s)'); ylabel('Amplitude');

% Plot 2: Quantization Error
subplot(2,1,2);
plot(t, quant_error, 'r');
grid on;
title('Quantization Error (e[n] = x[n] - x_q[n])');
xlabel('Time (s)'); ylabel('Error');
