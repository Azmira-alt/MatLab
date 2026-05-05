clc; clear; close all;

t = 0:0.001:1;
f = 5;
x = sin(2*pi*f*t);

fs = 15;                 
ts = 0:1/fs:1;
xs = sin(2*pi*f*ts);

xr_linear = interp1(ts, xs, t, 'linear');   % linear interpolation
xr_spline = interp1(ts, xs, t, 'spline');   % smoother interpolation

figure;

% Original + sampled
subplot(3,1,1);
plot(t, x, 'b'); hold on;
stem(ts, xs, 'filled');
title('Original Signal with Samples');
legend('Original','Samples');

% Linear reconstruction
subplot(3,1,2);
plot(t, x, 'b'); hold on;
plot(t, xr_linear, 'r--');
title('Reconstruction (Linear)');
legend('Original','Linear Interpolation');

% Spline reconstruction
subplot(3,1,3);
plot(t, x, 'b'); hold on;
plot(t, xr_spline, 'g--');
title('Reconstruction (Spline)');
legend('Original','Spline Interpolation');