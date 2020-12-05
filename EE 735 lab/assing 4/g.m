x= x1
t = [2*10^-3 4*10^-3 6*10^-3 8*10^-3 ];
a = 1000;
k = 10^-4;
b = 0;
figure(11)
hold on
for i = 1:3
    u(i,:) = (a/2)*(erf((x-b)/sqrt(4*k*t(i))));
    plot(x,u(i,:))
end
grid on
xlabel('x')
ylabel('Temperature')
legend('t = 0.1','t = 5','t = 100','Location','best')
title('Temperatures across material at t = 0.1, t = 5, and t = 100')