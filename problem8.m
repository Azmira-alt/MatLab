e = x - q;                % error
MSE = mean(e.^2);        % mean square error

subplot(2,1,1); plot(t,e); title(['Error (MSE=',num2str(MSE),')']);
subplot(2,1,2); histogram(e); title('Error Distribution');

disp(MSE);