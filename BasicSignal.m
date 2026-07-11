% --- Problem 1: Basic Signal Generation ---
clc; clear; close all;

rng(0);                      % Fixed seed for reproducibility

n = -10:10; % Define discrete time vector

% 1. Unit Step Signal u[n]
% u[n] = 1 for n >= 0, else 0
u = n >= 0; 

% 2. Unit Impulse Signal δ[n]
% δ[n] = 1 for n == 0, else 0
delta = n == 0;

% 3. Ramp Signal r[n]
% r[n] = n for n >= 0, else 0
ramp = n .* (n >= 0);

% 4. Sine Wave
% x[n] = sin(w*n), where w is angular frequency
w = 0.2 * pi;
sine_wave = sin(w * n);

% 5. Cosine Wave
% x[n] = cos(w*n)
cosine_wave = cos(w * n);

% Plotting in separate subplots
figure('Name', 'Problem 1: Basic Signals');
subplot(5,1,1); stem(n, u, 'filled'); title('Unit Step u[n]'); ylabel('Amplitude');
subplot(5,1,2); stem(n, delta, 'filled'); title('Unit Impulse \delta[n]'); ylabel('Amplitude');
subplot(5,1,3); stem(n, ramp, 'filled'); title('Ramp Signal r[n]'); ylabel('Amplitude');
subplot(5,1,4); stem(n, sine_wave, 'filled'); title('Sine Wave'); ylabel('Amplitude');
subplot(5,1,5); stem(n, cosine_wave, 'filled'); title('Cosine Wave'); xlabel('Time index n'); ylabel('Amplitude');
