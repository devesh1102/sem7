clear
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
dum = 0
n_old(1) = pt_a;
n_new(1) = pt_a;
n_old(itr) = pt_b;
n_new(itr) = pt_b;
for i = 1:itr
    x(i) = (i-1)*h;
end
while(dum< 100000)
    dum = dum +1;
    for i = 2:itr -1
       n_new(i) =( n_old(i-1)  +  n_old(i+1) )/(h*h/(D*t) +2); 
    end
%     if(max(max(abs((n_old-n_new)./n_old)))<0.001)
%         break;
%     end
    n_old = n_new;
end

figure(1)
plot(x,n_new)
xlabel('distance in cm')
ylabel('n concentration in /cm^3')

syms m


%hold on 
%plot(x1,n(:,49))

A= -9.66e+6;
B = 1.0e+12;
figure(222)
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

parta = n_old;


    
