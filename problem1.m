clc; clear; close all;

n = -15:10;

% Unit Step
u = (n >= 0);

% Unit Impulse
d = (n == 0);

% Ramp Signal
r = n .* (n >= 0);

t = -1:0.01:1;   

f = 2;           

% Sine Wave
x_sin = sin(2*pi*f*t);

% Cosine Wave
x_cos = cos(2*pi*f*t);

% Plotting
figure;

subplot(3,2,1);
stem(n, u, 'filled');
title('Unit Step u[n]');
grid on

subplot(3,2,2);
stem(n, d, 'filled');
title('Unit Impulse \delta[n]');

subplot(3,2,3);
stem(n, r, 'filled');
title('Ramp Signal');

subplot(3,2,4);
plot(t, x_sin);
title('Sine Wave');

subplot(3,2,5);
plot(t, x_cos);
title('Cosine Wave');