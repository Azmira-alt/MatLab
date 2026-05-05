clc; clear; close all;

t = 0:0.001:1;
f = 10;
x = sin(2*pi*f*t);

fs1 = 100;   % no aliasing (good sampling)
fs2 = 25;    % borderline
fs3 = 15;    % aliasing occurs

% Sampled time axes
t1 = 0:1/fs1:1;
t2 = 0:1/fs2:1;
t3 = 0:1/fs3:1;

% Sampled signals
x1 = sin(2*pi*f*t1);
x2 = sin(2*pi*f*t2);
x3 = sin(2*pi*f*t3);

figure;

% Original signal
subplot(3,1,1);
plot(t, x, 'b'); hold on;
stem(t1, x1, 'r');
title('No Aliasing (fs = 100 Hz)');
legend('Original','Sampled');

% Near Nyquist
subplot(3,1,2);
plot(t, x, 'b'); hold on;
stem(t2, x2, 'r');
title('Near Nyquist (fs = 25 Hz)');
legend('Original','Sampled');

% Aliasing case
subplot(3,1,3);
plot(t, x, 'b'); hold on;
stem(t3, x3, 'r');
title('Aliasing Occurs (fs = 15 Hz)');
legend('Original','Sampled');