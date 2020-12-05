clear
[t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19] = data_er();
v_16 = v_16 - min(v_16);
v_17 = v_17 - min(v_17);
v_18 = v_18 - min(v_18);
v_19 = v_19 - min(v_19);

a_16 = 6.397;
b_16 = 7.205;
c_16 = -0.4253;
d_16 = 0.3939;
tou_16 = (1/b_16)^(1/d_16)

a_17 = 6.951;
b_17 = 11.99;
c_17 = -0.03158;
d_17 = 0.4147;
tou_17 = (1/b_17)^(1/d_17)

a_18 = 7.589;
b_18 = 11.97;
c_18 =  +0.2
d_18 = 0.3681;
tou_18 = (1/b_18)^(1/d_18)

a_19 = 7.873;
b_19 = 13.62;
c_19 = -0.06298;
d_19 = 0.3546;
tou_19 = (1/b_19)^(1/d_19)

a = 7
b = (b_16+b_17+b_18+b_19)/4
c = 0.031
d  = (d_16+d_17+d_18+d_19)/4
l_16 = size(t_16);
l_17 = size(t_17);
l_18 = size(t_18);
l_19 = size(t_19);

[val,idx]=min(abs(t_16-1e-7));
v_16 = v_16(idx:l_16,1);
t_16 = t_16(idx:l_16);

[val,idx]=min(abs(t_17-1e-7));
v_17 = v_17(idx:l_17);
t_17 = t_17(idx:l_17);

[val,idx]=min(abs(t_18-1e-7));
v_18 = v_18(idx:l_18);
t_18 = t_18(idx:l_18);

[val,idx]=min(abs(t_19-1e-7));
v_19 = v_19(idx:l_19);
t_19 = t_19(idx:l_19);

l_16 = size(t_16);
l_17 = size(t_17);
l_18 = size(t_18);
l_19 = size(t_19);

Tou = [tou_16 tou_17 tou_18 tou_19]
 p1_t =      0.0009 
 p2_t =    -0.03344  
 p3_t =      0.3111  
D = [d_16 d_17 d_18 d_19]
 p1_d =    -0.01645 ;
 p2_d =      0.6707  ;

X = [16 17 18 19]
exp_16 = zeros(l_16);
exp_17 = zeros(l_17);
exp_18 = zeros(l_18);
exp_19 = zeros(l_19);
%a*exp(-b*(x)^d)+c
for i=  1:l_16
    d_16 = p1_d*16 +p2_d;
    tou_16 = p1_t*16*16 + p2_t *16 +p3_t
     dum = ((t_16(i)/tou_16))^d_16;
     exp_16(i) = a*(exp(-1*dum)) + c_16 ;
 end
 
for i=  1:l_17
    d_17 = p1_d*17 +p2_d;
    tou_17 = p1_t*17*17 + p2_t *17 +p3_t
     dum = ((t_17(i))/tou_17)^d_17;
     exp_17(i) = a*(exp(-1*dum)) + c_17 ;
 end
for i=  1:l_18
    d_18 = p1_d*18 +p2_d;
    tou_18= p1_t*18*18 + p2_t *18 +p3_t
     dum = ((t_18(i))/tou_18)^d_18;
     exp_18(i) = a*(exp(-1*dum)) + c_18 ;
end
 
for i=  1:l_19
    d_19 = p1_d*19 +p2_d;
    tou_19 = p1_t*19*19 + p2_t *19 +p3_t
     dum = ((t_19(i)/tou_19))^d_19;
     exp_19(i) = a*(exp(-1*dum)) + c_19 ;
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

