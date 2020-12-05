clear

itr_t = 50;
itr_x = 50;
distance= 10*10^-4; 

D = 10^-4;
h = distance/itr_x;
%p = time /itr_t;

p = h*h/(2*D)

t = 10^-7;
pt_a = 0;
pt_b = 0;
x1 = zeros(itr_x,1);
t1 = zeros(itr_t,1);
n_old = zeros(itr_x,itr_t);
iterations  = 100000;
dum =0
S =10^6;


for i = 1:  itr_x
        x1(i) = (i-1)*h;
end
for i = 1:  itr_t
        t1(i) = (i-1)*p;
end
 pt_5um = find (x1 == 5*10^-4); 
   n_old(pt_5um,:) = S;
   n= n_old
   n_new = n
while(dum<iterations)
    dum = dum + 1;
 
    for x = 2:itr_x-1
        for t = 2:itr_t-1
            temp = (n_old(x+1,t)+ n_old(x-1,t))/(h*h) + n_old(x,t-1)/(D*p) ;
            n_new(x,t) = temp /(2/(h*h) + 1/(D*p)) ;
        end
    end
    %temp2 = (n(pt_5um+1,t)+ n(pt_5um-1,t))/(h*h) + n(pt_5um,t-1)/(D*p)
%     if(max(max(abs((n_old-n_new)./n_old)))<0.001)
%         break;
%     end
    %n(pt_5um,:) = (temp2 - S) /(2/(h*h) + 1/(D*p)) ;
    n_old = n_new;


end
n = n_new
figure(1)
plot (x1,n(:,10),x1,n(:,20),x1,n(:,30),x1,n(:,40),x1,n(:,49));
%legend('2*10^{-5}s','4*10^{-5}s','6*10^{-5}s','8*10^{-5}s','10*10^{-5}s')
legend('10p','20p','30p','40p','50p')
%plot (x1,n(:,2),x1,n(:,3),x1,n(:,4),x1,n(:,5),x1,n(:,6),x1,n(:,7));
%legend('2*10^{-3}','4*10^{-3}','6*10^{-3}','8*10^{-3}','10*10^{-3}')
xlabel('distance in cm')

ylabel('concentration  in /cm^{3}')
%%%%%%analytical 

syms m
tt = 50 * p
A = 1/sqrt((4*pi*D*tt))
M = (m - 5*10^-4)^2
figure(2)
%hold on 
%plot(x1,n(:,49))
ezplot(A*exp(-1*M/(4*D*tt)), [0,distance ])
title('50p')

%hold off
            
