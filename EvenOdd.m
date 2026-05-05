% --- Problem 3: Even and Odd Decomposition ---
% Let's define a signal from n = -3 to 3 to easily compute x[-n]
n = -3:3;
x = [0, 1, 2, 4, 2, 1, 0]; % Arbitrary discrete signal

% Time reversal of x[n]
x_rev = fliplr(x); % Because n is symmetrically centered around 0

% Calculate Even and Odd components
xe = 0.5 * (x + x_rev);
xo = 0.5 * (x - x_rev);

% Verification: Reconstruct original signal
x_reconstructed = xe + xo;

% Plotting
figure('Name', 'Problem 3: Even and Odd Decomposition');
subplot(4,1,1); stem(n, x, 'filled'); title('Original Signal x[n]');
subplot(4,1,2); stem(n, xe, 'filled'); title('Even Component x_e[n]');
subplot(4,1,3); stem(n, xo, 'filled'); title('Odd Component x_o[n]');
subplot(4,1,4); stem(n, x_reconstructed, 'filled'); title('Verification: x_e[n] + x_o[n]'); xlabel('n');

% Display numerical verification in Command Window
disp('Original Signal:'); disp(x);
disp('Reconstructed (Even + Odd):'); disp(x_reconstructed);
disp('Is the reconstruction exact? (1=Yes, 0=No):');
disp(isequal(round(x,5), round(x_reconstructed,5))); % Rounded to handle minor floating point errors