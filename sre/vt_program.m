clear
%data read:
[x_16,y_16,x_17,y_17,x_18,y_18,x_19,y_19] = data()

figure(2)
plot(x_16,y_16,x_17,y_17,x_18,y_18,x_19,y_19)
legend('16','17','18','19')
a_16 = 3.027;
a_16 =       3.027  
b_16 =      0.0734 
c_16 =       5.665 
syms t
funct_16 = a_16*(1-exp(-b_16*log(t)))+c_16


figure(1)
hold on
semilogx(x_16,y_16)
fplot(funct_16,[x_16(1),x_16(length(x_16))])
set(gca, 'XScale','log')
title('Semilogy x')

% ezplot
 
legend('from equation','from data')
 hold off
%         a =       4.547  (4.258, 4.835)
%        b =   5.418e+05  (4.188e+05, 6.648e+05)
%        c =      -1.449  (-1.683, -1.216)
 a_17 =  4.547 
 b_17 =  5.418e+05  
 c_17 =  -1.449 
 
  a_19 =       3.492  
       b_19 =   2.056e+05  
       c_19 =      0.7827  

funct_19 = a_19*(1-exp(-b_17*(t)))+c_19
 
figure(3)
hold on
semilogx(x_19,y_19)
fplot(funct_19,[x_19(1),x_17(length(x_19))])
set(gca, 'XScale','log')
title('Semilogy x')

% ezplot
 
legend('from equation','from data')
 hold off
 [a,b] =(min(abs(y_16 -0)))
y_16 = y_16(b:length(y_16))
x_16 = x_16(b:length(x_16))
 