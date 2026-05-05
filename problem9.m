bits = [2 4 8];

for i=1:3
    L = 2^bits(i);
    delta = (max(x)-min(x))/L;
    q = round(x/delta)*delta;
    
    subplot(3,1,i);
    plot(t,x,t,q);
    title(['Bits = ', num2str(bits(i))]);
end