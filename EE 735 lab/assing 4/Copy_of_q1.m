clear
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

while(true)
    x(itr) = h*itr;
    for i = 2:(itr-1) 
        x(i) = h*i;
       %%%%%%%%%%%%%%%
       B(i) = 1*n_old(i)/(D*t) ;
       del_B(i)  = 1 /(D*t);
       F(i) = (n_old(i-1)-2*(n_old(i))+n_old(i+1))/(h*h) - B(i);
       
       J(i,i-1) = 1/(h*h);
       J(i,i) = (-2/(h*h))  - del_B(i);
       J(i,i+1) = 1/(h*h);
    end
    B(1) = (pt_a)/(D*t);
    B(itr) =pt_b/(D*t);
    
    del_B(1) = 0;
    del_B(itr) = 0;
    %%%%%%%%%%%%%%%
    F(1) =  n_old(1) -  B(1);
    F(itr) = n_old(itr) -  B(itr);
    
    J(1,1) = 1-del_B(1);
    J(itr,itr) = 1-del_B(itr);
    del_V = -1.* (J^-1) *(F) ;
    n_new = n_old + del_V;
    dum = dum+1
    if (max(abs(n_old - n_new)) < 0.000001)
        break
    end
 n_old(1) = pt_a;
n_new(1) = pt_a;
n_old(itr) = pt_b;
n_new(itr) = pt_b;
end
figure(1)
semilogy(x,n_new)
figure(2)
plot(x,n_new)
