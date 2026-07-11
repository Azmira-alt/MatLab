% --- Problem 4: Sampling of Analog Signal ---
clc; clear; close all;
f = 10;               % Frequency of the sine wave (10 Hz)
T = 0.3;              % Total duration to observe (0.3 seconds)

% 1. Create a "Continuous-time" reference (Very high sampling rate)
t_fine = 0:0.001:T;
x_cont = sin(2 * pi * f * t_fine);

% 2. Define Sampling Frequencies
fs_nyquist = 2 * f;     % Nyquist Rate (Exactly 20 Hz)
fs_above = 5 * f;       % Above Nyquist (50 Hz)
fs_below = 1.2 * f;     % Below Nyquist (12 Hz) - Will cause Aliasing

% 3. Generate Sampled Time Vectors
t_nyquist = 0 : 1/fs_nyquist : T;
t_above   = 0 : 1/fs_above : T;
t_below   = 0 : 1/fs_below : T;

% 4. Sample the Signal
x_nyquist = sin(2 * pi * f * t_nyquist);
x_above   = sin(2 * pi * f * t_above);
x_below   = sin(2 * pi * f * t_below);

% 5. Quantify the Nyquist-rate degenerate case
fprintf('Max |amplitude| of Nyquist-rate samples: %.2e (vs signal amplitude 1)\n', max(abs(x_nyquist)));
fprintf('--> Samples land exactly on zero-crossings; the signal is invisible at fs = 2f.\n');

% --- Plotting ---
figure('Name', 'Problem 4: Sampling Theorem');

% Above Nyquist (Over-sampling)
subplot(3,1,1);
plot(t_fine, x_cont, 'r--'); hold on;
stem(t_above, x_above, 'filled', 'b');
title(['Above Nyquist (f_s = ', num2str(fs_above), ' Hz)']);
legend('Analog Signal', 'Samples');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

% At Nyquist Rate
subplot(3,1,2);
plot(t_fine, x_cont, 'r--'); hold on;
stem(t_nyquist, x_nyquist, 'filled', 'b');
title(['At Nyquist Rate (f_s = ', num2str(fs_nyquist), ' Hz)']);
legend('Analog Signal', 'Samples (all zero!)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

% Below Nyquist (Under-sampling / Aliasing)
subplot(3,1,3);
plot(t_fine, x_cont, 'r--'); hold on;
stem(t_below, x_below, 'filled', 'b');
plot(t_below, x_below, 'g', 'LineWidth', 1.5);
title(['Below Nyquist (f_s = ', num2str(fs_below), ' Hz) - Aliasing!']);
legend('Analog Signal', 'Samples', 'Aliased Reconstruction');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
