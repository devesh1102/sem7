% Ispp formulation
clear
beta  = 0.20;
%tou = a exp(bv);
a =1.367E5
b = -1.304
v_max = 8
del_t = 1e-4
%delta v = 200 mv
n = 50
m = 100
tou = zeros(n,1);

v =0.2;
final_vt = zeros (m*n,1);
for i = 1:n
    tou(i) = a* exp(b*v);
    v = v+0.2;
end
vt = zeros(m,n);
t = zeros(m,n);
for i = 1 :n
    for j = 1:m
        t (j,i) = del_t *(i - 1) + (del_t/m)*(j -1);
    end
end
        
        
for i = 1:m
    vt(i,1) =v_max*(1-exp(-1*((t(i,1)/tou(1))^beta)));
end
ti = tou(2) * exp ((1/beta)*log(-1*(log(1-(vt(m,1)/v_max)))))
t2 = zeros (m)
 y = linspace(0,ti,m)
 for i = 1:m
    vt(i,2) =v_max*(1-exp(-1*((y(i)/tou(2))^beta)));
end
 y = y + (t(m,1) - ti);
 dum = vt(:,2);
 t(:,2) =  t(:,2) -  t(2,1);
 for i = 1:m
    dum(m+i,1) =v_max*(1-exp(-1*((t(i,2)/tou(2))^beta)));
    dum(m+i,1) = dum(m+i,1) ;
    y (m+i) = t(i,2);
end
figure(1)
plot(t(:,1),vt(:,1),y,dum)
xlabel ('Program Time (in sec)')
ylabel(' Vth')
legend('first pulse','second pulse')
title('Exponential(log plot)')
