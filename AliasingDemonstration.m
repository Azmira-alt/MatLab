% --- Problem 5: Aliasing Demonstration ---
clc; clear; close all;
f_signal = 10;           % Original Signal Frequency: 10 Hz
T = 1.0;                 % Duration: 1 second

% 1. "Analog" Signal (Reference)
fs_analog = 1000;
t_analog = 0:1/fs_analog:T;
x_analog = cos(2 * pi * f_signal * t_analog);

% 2. Under-sampling (Aliasing occurs)
% Nyquist rate is 20 Hz. Let's sample at 12 Hz.
fs_alias = 12;
t_alias = 0:1/fs_alias:T;
x_alias = cos(2 * pi * f_signal * t_alias);

% 3. Calculate the "Perceived" Alias Frequency
% Note: valid here since round(f_signal/fs_alias) = 1
f_perceived = abs(f_signal - fs_alias);
x_perceived = cos(2 * pi * f_perceived * t_analog);

% --- Plotting ---
figure('Name', 'Aliasing: The "Fake" Signal');

subplot(2,1,1);
plot(t_analog, x_analog, 'Color', [0.7 0.7 0.7], 'LineWidth', 1); hold on;
stem(t_alias, x_alias, 'filled', 'r', 'LineWidth', 1.5);
title(['Under-sampled at ', num2str(fs_alias), ' Hz (Signal is ', num2str(f_signal), ' Hz)']);
legend('Original 10Hz Signal', 'Samples taken too slowly');
xlabel('Time (seconds)'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
stem(t_alias, x_alias, 'filled', 'r'); hold on;
plot(t_analog, x_perceived, 'b', 'LineWidth', 2);
title(['The Result: An Alias of ', num2str(f_perceived), ' Hz appears!']);
legend('Same Samples', 'The "Fake" 2Hz Waveform');
xlabel('Time (seconds)'); ylabel('Amplitude');
grid on;
