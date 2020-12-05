
itr = 1000;
distance= 100*10^-4;
h = distance/itr;
D = 30;
t = 10^-7;
pt_a = 0;
pt_b = 0;
n_old = zeros(itr,1);
n_new = zeros(itr,1);
J = zeros(itr,itr);
B = zeros(itr,1);
del_B = zeros(itr,1);
x = zeros(itr,1);
F = zeros(itr,1);
dum = 0;
n_old(1) = pt_a;
n_new(1) = pt_a;
n_old(itr) = pt_b;
n_new(itr) = pt_b;
pt_c =30*10^-4;
k =10;
S = 10^12;

for i = 1:itr
    x(i) = (i-1)*h;
end
pt_30 = find(x == 30*10^-4);
for i = 2:itr-1
    J(i,i-1)= 1;
    J(i,i)  = -1*(2 + h*h/(D*t));
    J(i,i+1)= 1;
end
J(1,1) = 1;
J(itr,itr) = 1;
%J(itr,itr) = 1;
%J(itr,itr-1) = 1;
B(1) = pt_a;
B(itr) = pt_b;
J(pt_30,pt_30) = 2;
J(pt_30,pt_30-1) = -1;
J(pt_30,pt_30 +1) = -1;
B(pt_30) = S*h/D;
n_old = (J^-1)*B;
n_new = n_old
figure(1)
% semilogy(x,n_old)
figure(1)
plot(x,n_old)
xlabel('distance in cm')
ylabel('n concentration in /cm^3')

%flux
flux = zeros(itr-1);
for i = 2: itr
    flux(i) =-1*D*(n_new(i) - n_new(i-1))/h;
end
figure(3)
plot(x(2:itr),flux(2:itr))
title('Flux')
xlabel('distance in cm')
ylabel('Flux concentration in s^{-1}cm^{-2}')
% tou = (10^-4)/sqrt(D*t)
% tou1 = 1/sqrt(D*t)
% A_aa = (exp(-70*tou) - exp(70*tou))/(exp(30*tou) - exp(-30*tou));
% alpha = ((exp(30*tou) + exp(-30*tou)) - A_aa*(exp(-70*tou) + exp(70*tou)))*tou1;
tou = 1/sqrt(D*t);
e_30 = exp(tou * 30*10^-4)
e_m30 =  exp(tou * -1*30*10^-4)
beta = exp(tou*100*10^-4) * exp(tou*100*10^-4)
gamma = (e_30- e_m30)/(e_30-beta*e_m30);

A =S/(D* tou*((e_30 + e_m30) - gamma* (e_30+beta*e_m30)))
B = -1*A
C = gamma*A
D = -beta*C
M = 1000
for i = 1:pt_30
    
    n_analy(i) = A* exp(x(i)*tou) +  B* exp(-1*x(i)*tou);
end
for i = pt_30:itr
n_analy(i) = C* exp((x(i))*tou) +  D* exp(-1*(x(i))*tou);
end
figure(12)
plot(x , n_analy,x , n_old)
xlabel('distance in cm')
ylabel('n concentration in /cm^3')
legend ('Analytical','numerical')


partc = n_old;





