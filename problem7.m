clc;clear;close all;
t = 0:0.001:1;
x = sin(2*pi*5*t);

L = 8; % levels
xmin = min(x); xmax = max(x);

delta = (xmax-xmin)/L;

q = round(x/delta)*delta;

figure;
plot(t,x); hold on; plot(t,q);
title('Quantized Signal');