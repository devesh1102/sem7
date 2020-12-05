clear
beta  = 0.20;
%tou = a exp(bv);
a =1.367E5;
b = -1.304;
%vt =  V_{th} = v_max*(1-exp(-1*(\frac{t}{tou})^{beta}))
tmax = 1e-3;
v_max = 17;
%delta v = 200 mv
n = 3;%no of steps
m = 30;%no points within that step
del_t = tmax/(n*m);
tou = zeros(n,1);%toue for different steps

del_v =0.2;
V_prs =del_v; 
final_vt = zeros (m*n,1);

t_effective  =del_t;
tou_start = a*exp(b*V_prs);
dummy = zeros (m*n,1);
delta_vt = zeros (n,1);
previous = 0;
for i = 1:n
    for j = 1:m
     final_vt((i-1)*m + j,1) =v_max*(1-exp(-1*((t_effective/tou_start)^beta))); 
     t_effective = t_effective + del_t;
     last = final_vt((i-1)*m + j,1);
     %dummy ((i-1)*m + j,1) = t_effective;
    end
    V_prs = V_prs + del_v;
    tou_start = a*exp(b*V_prs);
    t_effective = tou_start * exp ((1/beta)*log(-1*(log(1-( final_vt((i-1)*m + j,1)/v_max)))));
    %dummy (i) = t_effective;
    %delta_vt(i) = last - previous;
    previous = last;
end
t_actual = zeros (m*n,1);

  
for  i = 2: n*m 
    t_actual(i) = t_actual(i-1) +del_t;
end

figure(1)
plot(t_actual,final_vt)
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('ISPP')%

figure(2)
semilogx(t_actual,final_vt)
xlabel ('Program Time (in sec)')
ylabel(' Vth')
title('Exponential(log plot)')%
% figure(3)
% plot(dummy)
% figure(4)
% plot(delta_vt())
