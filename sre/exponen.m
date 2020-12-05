%data read:
[t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19] = data()
l_16 = size(t_16)
l_17 = size(t_17)
l_18 = size(t_18)
l_19 = size(t_19)

%curve fitting for vt type a*(1-exp(-b_16(t)))+c
exp_16 = zeros(l_16)

% for i=  1:l_16
%     exp_16 = a*(1-exp(-b_16(x_16(i))))+c;
    

%exponential v_max(1-exp(t*m))
m_16 = -1*log(1-(v_16(l_16(1)))/16)/(t_16(l_16(1)));
m_17 = -1*log(1-(v_17(l_17(1)))/17)/(t_17(l_17(1)));
m_18 = -1*log(1-(v_18(l_18(1)))/18)/(t_18(l_18(1)));
m_19 = -1*log(1-(v_19(l_19(1)))/19)/(t_19(l_19(1)));
%m = (m_16+m_17+m_18+m_19 ) /4
for i=  1:l_16
    exp_16(i) = 16*(1-exp(-m*t_16(i)));
end
for i=  1:l_17
    exp_17(i) = 17*(1-exp(-m*t_17(i)));
end
for i=  1:l_18
    exp_18(i) = 18*(1-exp(-m*t_18(i)));
end
for i=  1:l_19
    exp_19(i) = 19*(1-exp(-m*t_19(i)));
end
figure(3)
semilogx(t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19,t_16,exp_16,t_17,exp_17,t_18,exp_18,t_19,exp_19)
legend('16 paper','17 paper','18 paper','19 paper','16 eq','17 eq','18 eq','19 eq')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')

    
%plotting data
figure(1)
plot(t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19)
legend('16','17','18','19')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Data Points from the graph')

figure(2)
semilogx(t_16,v_16,t_17,v_17,t_18,v_18,t_19,v_19)
legend('16','17','18','19')
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Data Points from the graph(log plot)')

figure(4)
plot(t_16,exp_16,t_17,exp_17,t_18,exp_18,t_19,exp_19)