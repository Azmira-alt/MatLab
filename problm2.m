clc; clear; close all;

x = [1 2 3 4 5 6];
n = 0:length(x)-1;

n_shift = n + 2;
x_shift = x;

x_rev = fliplr(x);     % reverse signal
n_rev = -fliplr(n);    % reverse index

a = 2
x_exp = zeros(1, a*length(x)); % create empty array
x_exp(1:a:end) = x;            % insert values at odd positions
n_exp = 0:length(x_exp)-1;

x_comp = x(1:a:end);           % take every 2nd sample
n_comp = 0:length(x_comp)-1;


figure;

subplot(3,2,1);
stem(n,x);
title('Original Signal');

subplot(3,2,2);
stem(n_shift,x_shift);
title('Time Shifted');

subplot(3,2,3);
stem(n_rev,x_rev);
title('Time Reversed');

subplot(3,2,4);
stem(n_exp,x_exp);
title(['Expansion (n/', num2str(a),')']);

subplot(3,2,5);
stem(n_comp,x_comp);
title(['Compression (', num2str(a), 'n)']);