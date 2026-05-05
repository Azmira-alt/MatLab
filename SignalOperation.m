% --- Problem 2: Signal Operations ---
n = 0:3;         % Original time index
x = [1, 2, 3, 4]; % Original signal

% 1. Time Shifting: x[n-2] (Delay by 2)
n_shift = n + 2; % The values stay the same, but the time axis shifts right
x_shift = x;

% 2. Time Reversal: x[-n]
n_rev = -fliplr(n); % Flip time indices and make them negative
x_rev = fliplr(x);  % Flip the signal values

% 3. Time Scaling: x[2n] (Decimation/Downsampling by 2)
% We only keep even indices of n. 
% For n = 0,2 -> n_scaled = 0,1. 
n_scale = n(1:2:end) / 2; % New time axis
x_scale = x(1:2:end);     % Grab every 2nd sample

% Plotting
figure('Name', 'Problem 2: Signal Operations');
subplot(4,1,1); stem(n, x, 'filled'); title('Original x[n]');
subplot(4,1,2); stem(n_shift, x_shift, 'filled'); title('Shifted x[n-2]'); xlim([-4 6]);
subplot(4,1,3); stem(n_rev, x_rev, 'filled'); title('Reversed x[-n]'); xlim([-4 6]);
subplot(4,1,4); stem(n_scale, x_scale, 'filled'); title('Scaled x[2n]'); xlim([-4 6]); xlabel('n');