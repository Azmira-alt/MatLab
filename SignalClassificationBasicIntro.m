% --- Problem 24: Signal Classification (Basic Intro) ---
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % 1 second duration

% 1. Generate Three Unknown Signals
sig1 = sin(2*pi*10*t);            % A smooth 10 Hz sine wave
sig2 = randn(size(t));            % Random white noise
sig3 = square(2*pi*10*t);         % A 10 Hz square wave

% Put them in a cell array for easy looping
signals = {sig1, sig2, sig3};
figure('Name', 'Problem 24: Signal Classification');

% 2. Feature Extraction and Classification
for i = 1:3
    x = signals{i};
    
    % --- Extract Features ---
    mu = mean(x);                        % Feature 1: Mean
    v = var(x);                          % Feature 2: Variance (Power)
    % Feature 3: Zero-Crossing Rate (How often it crosses the x-axis)
    zcr = sum(abs(diff(x > 0))) / length(x);
    
    % --- Simple Classification Logic ---
    if zcr > 0.2
        % Noise crosses the zero line constantly
        prediction = 'Gaussian Noise';
    elseif v > 0.8
        % Square waves spend all their time at extremes (+1 or -1), so variance is high (~1.0)
        prediction = 'Square Wave';
    else
        % Sine waves have smooth transitions, variance is around 0.5
        prediction = 'Sine Wave';
    end
    
    % --- Plotting ---
    subplot(3, 1, i);
    plot(t(1:200), x(1:200), 'LineWidth', 1.5); % Plot a small chunk for visibility
    title(['Unknown Signal ', num2str(i), ' -> Classified as: ', prediction]);
    xlabel('Time (s)'); ylabel('Amplitude');
    grid on;
    
    % Print details to command window
    fprintf('Signal %d Features -> Mean: %.2f, Var: %.2f, ZCR: %.3f | Result: %s\n', ...
        i, mu, v, zcr, prediction);
end
