t = 0:0.001:1;
f = 5;
x = sin(2*pi*f*t);

fs1 = 10;   % Nyquist (2*f)
fs2 = 20;   % above Nyquist
fs3 = 6;    % below Nyquist

t1 = 0:1/fs1:1;
t2 = 0:1/fs2:1;
t3 = 0:1/fs3:1;

subplot(4,1,1); plot(t, sin(2*pi*f*t)); title('Original');
subplot(4,1,2); plot(t1, sin(2*pi*f*t1)); title('Nyquist');
subplot(4,1,3); plot(t2, sin(2*pi*f*t2)); title('Above Nyquist');
subplot(4,1,4); plot(t3, sin(2*pi*f*t3)); title('Below Nyquist');