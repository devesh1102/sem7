
itr = 500;
distance= 100*10^-4;
h = distance/itr;
D = 30;
t = 10^-7;
pt_a = 10^12;
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
k =10
x(1) =  0;
x(itr) = h*itr;
for i = 2:itr-1
    x(i) = (i-1)*h;
    J(i,i-1)= 1;
    J(i,i)  = -1*(2 + h*h/(D*t));
    J(i,i+1)= 1;
end
J(1,1) = 1;
J(itr,itr) = -1*(1-(k*h/D));
%J(itr,itr) = 1;
J(itr,itr-1) = 1;
B(1) = pt_a;
n_old = (J^-1)*B;

n_new =n_old
% figure(1)
% semilogy(x,n_old)
figure(1)
plot(x,n_old)
xlabel('distance in cm')
ylabel('n concentration in /cm^3')
partb = n_old;
syms m


%hold on 
%plot(x1,n(:,49))
A=1.084e+06;
B=9.99e+11;
figure(22)
hold on
ezplot(A*exp(m/(sqrt(D*t))) + B*exp(-1*m/(sqrt(D*t))), [0,distance ])
plot(x,n_old)
title('Analytical and Numerical ')
legend('Analytical', 'Numerical')
xlabel('distance in cm')
ylabel('n concentration in /cm^3')
hold off
%flux
flux = zeros(itr-1)
for i = 2: itr
    flux(i) =-1*D*(n_new(i) - n_new(i-1))/h;
end
figure(3)
plot(x(2:itr),flux(2:itr))
title('Flux')
xlabel('distance in cm')
ylabel('Flux concentration in s^{-1}cm^{-2}')
