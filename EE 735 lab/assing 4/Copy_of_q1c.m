clear
itr = 1000;
distance= 100*10^-6;
h = distance/itr;
D = 30*10^-4;
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
k =10;
S = 10^16;

for i = 1:itr
    x(i) = (i-1)*h;
end
pt_30 = find(x == 30*10^-6);
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
figure(1)
% semilogy(x,n_old)
figure(3)
plot(x,n_old)
xlabel('distance in m')
ylabel('n concentration in /m^3')