% --- Problem 10: Discrete Fourier Transform (DFT) ---
fs = 100;               % Sampling frequency
t = 0:1/fs:0.5;         % Time vector (half a second)
f_signal = 10;          % Signal frequency (10 Hz)
x = sin(2 * pi * f_signal * t); % Input signal
N = length(x);          % Number of points

% --- 1. Manual Implementation of DFT ---
X_manual = zeros(1, N); 
for k = 0:N-1
    for n = 0:N-1
        % Applying the summation formula: x[n] * exp(-j*2*pi*k*n/N)
        X_manual(k+1) = X_manual(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
end

% --- 2. Built-in FFT Implementation ---
X_fft = fft(x);

% --- 3. Comparison of Results ---
% We compare magnitudes because DFT results are complex numbers
mag_manual = abs(X_manual);
mag_fft = abs(X_fft);

% Create frequency axis for plotting
freq_axis = (0:N-1) * (fs / N);

% --- Plotting ---
figure('Name', 'Problem 10: DFT vs FFT');

subplot(2,1,1);
stem(freq_axis, mag_manual, 'filled', 'r');
title('Manual DFT Magnitude');
ylabel('|X(k)|');
grid on;

subplot(2,1,2);
stem(freq_axis, mag_fft, 'filled', 'b');
title('Built-in FFT Magnitude');
ylabel('|X(k)|');
xlabel('Frequency (Hz)');
grid on;

% Numerical Verification in Command Window
difference = max(abs(X_manual - X_fft));
fprintf('The maximum difference between Manual and Built-in is: %e\n', difference);