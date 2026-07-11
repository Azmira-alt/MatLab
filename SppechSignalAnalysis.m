% --- Experiment 22: Speech Signal Analysis ---
% Note: Place any audio file named 'speech.wav' in your MATLAB folder.

try
    [x, fs] = audioread('speech.wav');
catch
    % Fallback if no audio file is found so the code doesn't crash
    disp('Audio file not found. Generating synthetic speech sweep...');
    fs = 8000; t_temp = 0:1/fs:2;
    x = chirp(t_temp, 100, 2, 3000)' + 0.05*randn(length(t_temp),1);
end

x = x(:,1); % Ensure mono channel
t = (0:length(x)-1)/fs; % Time vector

figure('Name', 'Experiment 22: Speech Analysis');

% 1. Original Signal (Time Domain)
subplot(2,2,1);
plot(t, x, 'k');
title('Original Speech Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

% 2. Original Signal (Spectrogram/STFT)
subplot(2,2,2);
spectrogram(x, hamming(256), 128, 256, fs, 'yaxis');
title('STFT: Original Spectrogram');

% 3. Filter Design and Application (Low-pass at 1500 Hz)
fc = 1500; 
order = 6;
[b, a] = butter(order, fc/(fs/2), 'low');
x_filtered = filter(b, a, x);

% 4. Filtered Signal (Time Domain)
subplot(2,2,3);
plot(t, x_filtered, 'b');
title('Filtered Speech (<1500 Hz)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

% 5. Filtered Signal (Spectrogram/STFT)
subplot(2,2,4);
spectrogram(x_filtered, hamming(256), 128, 256, fs, 'yaxis');
title('STFT: Filtered Spectrogram');
