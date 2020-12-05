%clear
itr = 500;
distance= 100*10^-6;
h = distance/itr;
D = 30*10^-4;
t = 10^-7;
pt_a = 10^18;
pt_b = 0;
n_old = zeros(itr,1);
n_new = zeros(itr,1);
J = zeros(itr,itr);
B = zeros(itr,1);
del_B = zeros(itr,1);
x = zeros(itr,1);
F = zeros(itr,1);
dum = 0
n_old(1) = pt_a
n_new(1) = pt_a
n_old(itr) = pt_b
n_new(itr) = pt_b
for i = 1:itr
    x(i) = (i-1)*h;
end
while(dum< 100000)
    dum = dum +1
    for i = 2:itr -1
       n_old(i) =( n_old(i-1)  +  n_old(i+1) )/(h*h/(D*t) +2); 
    end


end
figure(1)
semilogy(x,n_old)
figure(2)
plot(x,n_old)
xlabel('distance in m')
ylabel('n concentration in /m^3')
