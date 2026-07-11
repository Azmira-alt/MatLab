% --- Experiment 21: Noise Removal Project --
rng(0);                 
% fixes the random seed for reproducible noise
fs = 1000;              
t = 0:1/fs:1;           
% Sampling frequency
% Time vector (1 second)
% 1. Generate Clean Signal (5 Hz Sine Wave)
f_sig = 5;
x_clean = sin(2*pi*f_sig*t);
P_clean = mean(x_clean.^2); % Power of the clean signal
% 2. Add Noise (White Gaussian Noise)
noise = 0.5 * randn(size(t));
x_noisy = x_clean + noise;
P_noise_initial = mean(noise.^2);
% Calculate Initial SNR (in dB)
SNR_initial = 10 * log10(P_clean / P_noise_initial);
% 3. Design and Apply Low-Pass Filter
fc = 15;
order = 4;
[b, a] = butter(order, fc/(fs/2), 'low');
x_filtered = filtfilt(b, a, x_noisy);
% 4. Calculate Final SNR
noise_final = x_filtered - x_clean;
P_noise_final = mean(noise_final.^2);
SNR_final = 10 * log10(P_clean / P_noise_final);
% --- Plotting --
figure('Name', 'Experiment 21: Noise Removal');
subplot(3,1,1);
plot(t, x_clean, 'g', 'LineWidth', 1.5);
title('Clean Original Signal (5 Hz)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
subplot(3,1,2);
plot(t, x_noisy, 'r');
title(sprintf('Noisy Signal (Initial SNR: %.2f dB)', SNR_initial));
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
subplot(3,1,3);
plot(t, x_filtered, 'b', 'LineWidth', 1.5);
title(sprintf('Filtered Signal (Final SNR: %.2f dB)', SNR_final));
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
1
Published with MATLAB® R2026a
2
