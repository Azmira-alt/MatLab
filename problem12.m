t = 0:0.001:2;

% Stationary signal
x1 = sin(2*pi*5*t);

% Non-stationary
x2 = sin(2*pi*5*t) + sin(2*pi*20*t.*(t>1));

subplot(2,1,1);
spectrogram(x1);
title('Stationary');

subplot(2,1,2);
spectrogram(x2);
title('Non-Stationary');