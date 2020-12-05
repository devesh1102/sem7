clear

itr_t = 250;
itr_x = 50;
distance= 100*10^-4; 

D = 10^-4;
%D = 30*10^-4
h = distance/itr_x;
%p = time /itr_t;

p = h*h/(2*D)

t = 10^-7;
pt_a = 0;
pt_b = 0;
x1 = zeros(itr_x,1);
t1 = zeros(itr_t,1);
n_old = zeros(itr_x,itr_t);
n_new = zeros(itr_x,itr_t);
iterations  = 100000;
dum =0
S =10^6;


for i = 1:  itr_x
        x1(i) = (i-1)*h;
end
for i = 1:  itr_t
        t1(i) = (i-1)*p;
end


while(dum<iterations)
    dum = dum + 1
    n_old(1,:) = 10^3;
    for x = 2:itr_x-1
        for t = 2:itr_t-1
            temp = (n_old(x+1,t)+ n_old(x-1,t))/(h*h) + n_old(x,t-1)/(D*p) ;
            n_new(x,t) = temp /(2/(h*h) + 1/(D*p)) ;
        end
    end
    %temp2 = (n(pt_5um+1,t)+ n(pt_5um-1,t))/(h*h) + n(pt_5um,t-1)/(D*p);
    %n(pt_5um,:) = (temp2 - S) /(2/(h*h) + 1/(D*p)) ;
    n_new(1,:) = 10^3;
    if(max(max(abs((n_old-n_new)./n_old)))<0.001)
        break;
    end
    n_old =n_new;



end
n_old(1,:) = 10^3;
n = n_old
% syms x t
% func = 1000*erfc(x1/(2*sqrt(D*t)))
% n_ana = zeros(itr_x);
% 
% for j = 1:itr_x
%     n_ana = 1000*erfc(x1(j)/(2*sqrt(D*t))
figure(1)
plot (x1,n(:,2),x1,n(:,10*5),x1,n(:,20*5),x1,n(:,30*5),x1,n(:,40*5),x1,n(:,49*5));
%plot (x1,n(:,2),x1,n(:,3),x1,n(:,4),x1,n(:,5),x1,n(:,6),x1,n(:,7));
%legend('2*10^{-4}','2*10^{-3}','4*10^{-3}','6*10^{-3}','8*10^{-3}','10*10^{-3}')
legend('2p','50p','100p','150p','200p','198p')
xlabel('distance in cm')
title(p)
ylabel('concentration  in /cm{3}')

syms m
tt = 50 * p

M = 1000
for i = 1:itr_x
    A =-x1(i)/(sqrt(4*D*tt))
    n_analy(i) = M*(erf(A) +1)
end
figure(2)

plot(x1,n_analy,x1,n(:,10*5))
% title('50p')
% legend('Analytical(0.0100s) ','numerical(0.0100s)')


            
