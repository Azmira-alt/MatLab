t = 0:0.001:1;
x = sin(2*pi*5*t) + sin(2*pi*10*t);

X = fft(x);
f = linspace(0,1,length(X));

plot(f,abs(X));
title('Magnitude Spectrum');