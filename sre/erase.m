clear
[t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19] = data_er();
%a*exp(-b*(x)^d)+c
a_16 = 6.397;
b_16 = 7.205;
c_16 = -2.376;
d_16 = 0.3939;

a_17 = 6.951;
b_17 = 11.99;
c_17 = -2.856;
d_17 = 0.4147;

a_18 = 7.589;
b_18 = 11.97;
c_18 = -3.435;
d_18 = 0.3681;

a_19 = 7.873;
b_19 = 13.62;
c_19 = -3.698;
d_19 = 0.3546;

l_16 = size(t_16);
l_17 = size(t_17);
l_18 = size(t_18);
l_19 = size(t_19);

exp_16 = zeros(l_16);
exp_17 = zeros(l_17);
exp_18 = zeros(l_18);
exp_19 = zeros(l_19);
%a*exp(-b*(x)^d)+c
for i=  1:l_16
     dum = ((t_16(i)))^d_16;
     exp_16(i) = a_16*(exp(-1*dum*b_16)) + c_16 ;
 end
 
for i=  1:l_17
     dum = ((t_17(i)))^d_17;
     exp_17(i) = a_17*(exp(-1*dum*b_17)) + c_17 ;
 end
for i=  1:l_18
     dum = ((t_18(i)))^d_18;
     exp_18(i) = a_18*(exp(-1*dum*b_18)) + c_18 ;
end
 
for i=  1:l_19
     dum = ((t_19(i)))^d_19;
     exp_19(i) = a_19*(exp(-1*dum*b_19)) + c_19 ;
 end

figure(161)
semilogx(t_16,v_16,t_16,exp_16)
legend('16 paper','16 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

figure(162)
plot(t_16,v_16,t_16,exp_16)
legend('16 paper','16 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

figure(171)
semilogx(t_17,v_17,t_17,exp_17)
legend('17 paper','17 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

figure(172)
plot(t_17,v_17,t_17,exp_17)
legend('17 paper','17 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')


figure(181)
semilogx(t_18,v_18,t_18,exp_18)
legend('18 paper','18 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

figure(182)
plot(t_18,v_18,t_18,exp_18)
legend('18 paper','18 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

figure(191)
semilogx(t_19,v_19,t_19,exp_19)
legend('19 paper','19 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

figure(192)
plot(t_19,v_19,t_19,exp_19)
legend('19 paper','19 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

