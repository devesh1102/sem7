%data read:
clear
[t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19] = data()
t_16 = t_16(v_16>0)
v_16 = v_16(v_16>0)

t_17 = t_17(v_17>0)
v_17 = v_17(v_17>0)

t_18 = t_18(v_18>0)
v_18 = v_18(v_18>0)

t_19 = t_19(v_19>0)
v_19 = v_19(v_19>0)


l_16 = size(t_16)
l_17 = size(t_17)
l_18 = size(t_18)
l_19 = size(t_19)

%curve fitting for vt type a*(1-exp(-b_16(t)))+c
exp_16 = zeros(l_16)
exp_17 = zeros(l_17)
exp_18 = zeros(l_18)
exp_19 = zeros(l_19)

a_16 = 3.6557
beta_16= 0.41
B_16 =  61.33% 1/tou
%tou_16 =1.362e+05

a_17 = 4.408
beta_17= 0.36
B_17 =  40.14% 1/tou

a_18 = 4.971
beta_18= 0.33
B_18 =  32.75% 1/tou

% a_19 = 4.754
% beta_19= 0.44
% B_19 =  195.6% 1/tou
a_19 = 5.005
beta_19= 0.377
B_19 =  81% 1/tou

 for i=  1:l_16
     dum = ((t_16(i)  ))^beta_16;
     exp_16(i) = a_16*(1-exp(-1*dum*B_16)) ;
 end
 
  for i=  1:l_17
     dum = ((t_17(i) ))^beta_17;
     exp_17(i) = a_17*(1-exp(-1*dum*B_17)) ;
  end
  for i=  1:l_18
     dum = ((t_18(i)))^beta_18;
     exp_18(i) = a_18*(1-exp(-1*dum*B_18)) ;
  end
  for i=  1:l_19
     dum = ((t_19(i)))^beta_19;
     exp_19(i) = a_19*(1-exp(-1*dum*B_19)) ;
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


% figure(3)
% semilogx(t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19)
% legend('16 paper','17 paper','18 paper','19 paper')
% xlabel ('Program Time (in sec)')
% ylabel(' Vth')
% title('Exponential(log plot)')

