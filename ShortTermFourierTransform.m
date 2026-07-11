% --- Problem 12: Short-Time Fourier Transform (STFT) ---
clc; clear; close all;
rng(0);                      
fs = 1000;              
t = 0:1/fs:2;           

% 1. Stationary Signal (Constant 100 Hz and 250 Hz)
x_static = sin(2*pi*100*t) + sin(2*pi*250*t);

% 2. Non-Stationary Signal (Chirp signal: frequency increases over time)
% Starts at 50 Hz and sweeps up to 400 Hz
x_chirp = chirp(t, 50, 2, 400);

% --- Plotting Spectrograms ---
figure('Name', 'Problem 12: STFT Analysis');

% Plot 1: Stationary Signal Spectrogram
subplot(2,1,1);
spectrogram(x_static, hamming(256), 250, 256, fs, 'yaxis');
title('Spectrogram of Stationary Signal (Constant Frequencies)');

% Plot 2: Non-Stationary Signal Spectrogram
subplot(2,1,2);
spectrogram(x_chirp, hamming(256), 250, 256, fs, 'yaxis');
title('Spectrogram of Non-Stationary Signal (Chirp/Frequency Sweep)');

% Adjust color limits for better visibility
colormap jet;
