clear

itr_x = 1000;
D = 10^-4;
distance= 10*10^-4; 
h = distance/itr_x;
p=  h*h/(2*D);
A = zeros(itr_x,itr_x);
n_old = zeros(itr_x,1);
n_new = zeros(itr_x,1);
B_old = zeros(itr_x,1);
B_new = zeros(itr_x,1);
S =10^6;
pt_c = 5*10^-4;
pt_a = 0;
pt_b = 0;
x1 = zeros(itr_x,1);
iterations  = 1000;
dum =1

for i = 1:  itr_x
        x1(i) = (i-1)*h;
end

 pt_5um = find (x1 == pt_c); 
for i= 2:itr_x-1
    
        A(i,i-1)= 1/(h*h);
        A(i,i)  = -1*(2/(h*h) + 1/(D*p));
        A(i,i+1)= 1/(h*h);
end
%  A(1,1) =  -1*(1/(h*h) + 1/(D*p));
%  A(1,2) =  1/(h*h);
%  A(itr_x,itr_x) =-1*(1/(h*h) + 1/(D*p));
%  A(itr_x,itr_x-1) =1/(h*h);
 A(1,1) =  1;
 A(1,2) =  0;
 A(itr_x,itr_x) =1;
 A(itr_x,itr_x-1) =0;

% n_old(1) =1000;
% n_new(1) =1000;
A_inverse = A^-1;

n= zeros(itr_x,iterations) ;
n_old(pt_5um) = S/h
while(dum<iterations)
    dum = dum + 1;
    B_new = -n_old/(D*p);
    n_new = A_inverse * B_new;
    n_old(1) =0;
    n_new(1) =0;
    n_old(itr_x) =0;
    n_new(itr_x) =0;
    n_old = n_new;
    %temp2 = (n(pt_5um+1,t)+ n(pt_5um-1,t))/(h*h) + n(pt_5um,t-1)/(D*p);
    %n(pt_5um,:) = (temp2 - S) /(2/(h*h) + 1/(D*p)) ;
    n(:,dum) = n_old;
end
figure(1)
plot (x1,n(:,50*4),x1,n(:,100*4),x1,n(:,150*4),x1,n(:,200*4),x1,n(:,240),x1,n(:,999));
%legend('2*10^{-5}s','4*10^{-5}s','6*10^{-5}s','8*10^{-5}s','10*10^{-5}s')
legend('5.0000e-07s','2.0000e-06s',' 3.0000e-06s',' 4.0000e-06s','1.2000e-06s',' 5.0000e-06s')
%plot (x1,n(:,2),x1,n(:,3),x1,n(:,4),x1,n(:,5),x1,n(:,6),x1,n(:,7));
%legend('2*10^{-3}','4*10^{-3}','6*10^{-3}','8*10^{-3}','10*10^{-3}')
xlabel('distance in cm')

ylabel('concentration  in /cm^{3}')
%%%%%%analytical 

syms m
tt = 240 * p;
A = S/sqrt((4*pi*D*tt));
for i = 1:itr_x
    M = (x1(i)- 5*10^-4)^2;
    n_analy(i) = A*exp(-1*M/(4*D*tt));
end
figure(2)

plot(x1,n_analy,x1,n(:,240))
title('t =1.2000e-06 s')
legend('Analytical','numerical')
xlabel('distance in cm')

ylabel('concentration  in /cm^{3}')
            
