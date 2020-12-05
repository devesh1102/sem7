clear
x = [1 0.9 0.8 0.7 0.6];
v = zeros (1,5);
x = x.*(10^-6)
[v1,x1] = q3V_x(x(1))
[v2,x2] = q3V_x(x(2))
[v3,x3] = q3V_x(x(3))
[v4,x4] = q3V_x(x(4))
[v5,x5] = q3V_x(x(5))
x2 = x2  + 0.05*(10^-6)
x3 = x3  + 0.1*(10^-6)
x4 = x4  + 0.15*(10^-6)
x5 = x5  + 0.2*(10^-6)
figure(3)
plot(x1,v1,x2,v2,x3,v3,x4,v4,x5,v5)
xlabel('Distance in m' )
ylabel('Voltage(in V)')
title('Abrupt graded pn junction diode (N+ P N+)')
legend('1','0.9','0.8','0.7','0.6')


