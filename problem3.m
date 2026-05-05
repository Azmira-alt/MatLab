n = -5:5;
x = [1 2 3 4 5 4 3 2 1 0 0]; % example signal

x_neg = fliplr(x);   % x[-n]

xe = (x + x_neg)/2;  % even part
xo = (x - x_neg)/2;  % odd part

subplot(4,1,1); stem(n,x); title('Original');
subplot(4,1,2); stem(n,xe); title('Even');
subplot(4,1,3); stem(n,xo); title('Odd');

x_mod = xe + xo;
subplot(4, 1, 4); stem(n, x_mod); title("Even + Odd");