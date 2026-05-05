% --- Problem 11: Frequency Spectrum Analysis ---
fs = 1000;              % Sampling frequency (1000 samples per second)
T = 1.0;                % Duration (1 second)
t = 0:1/fs:T-1/fs;      % Time vector

% 1. Generate a Composite Signal (Mixing 3 different frequencies)
f1 = 50;   % 50 Hz component
f2 = 120;  % 120 Hz component
f3 = 300;  % 300 Hz component

% Create the signal: x(t) = A1*sin(2pi*f1*t) + A2*sin(2pi*f2*t) + ...
% We'll give them different amplitudes too.
x = 1.5*sin(2*pi*f1*t) + 2.0*sin(2*pi*f2*t) + 0.8*sin(2*pi*f3*t);

% 2. Add some "Real-world" Random Noise
x_noisy = x + 1.2*randn(size(t));

% 3. Compute the Frequency Spectrum (using FFT)
N = length(x_noisy);
X_fft = fft(x_noisy);

% Calculate Magnitude and Normalize
mag = abs(X_fft) / N; 

% We only need the first half of the spectrum (0 to fs/2)
half_N = floor(N/2);
freq_axis = (0:half_N) * (fs/N);
mag_half = mag(1:half_N+1);

% Multiply by 2 to account for the energy in the dropped negative half
mag_half(2:end) = 2 * mag_half(2:end);

% --- Plotting ---
figure('Name', 'Problem 11: Frequency Spectrum Analysis');

% Plot the Time Domain Signal (The "Messy" look)
subplot(2,1,1);
plot(t(1:200), x_noisy(1:200)); % Plot first 200 samples for clarity
title('Time Domain: Composite Signal + Noise');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;

% Plot the Frequency Domain (The "Clear" look)
subplot(2,1,2);
plot(freq_axis, mag_half, 'LineWidth', 1.5);
title('Frequency Domain: Magnitude Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
xlim([0 400]); % Zoom in on the area of interest
grid on;