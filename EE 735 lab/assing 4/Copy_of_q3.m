clear

itr_t = 50;
itr_x = 50;
distance= 100*10^-6; 
time= 10*10^-6;
h = distance/itr_x;
p = time /itr_t 
D = 10^-8;
t = 10^-7;
pt_a = 0;
pt_b = 0;
x1 = zeros(itr_x,1);
t1 = zeros(itr_t,1);
n = zeros(itr_x,itr_t);
iterations  = 100000;
dum =0
S =10^12;


for i = 1:  itr_x
        x1(i) = (i-1)*h;
end
for i = 1:  itr_t
        t1(i) = (i-1)*p;
end
 pt_5um = find (x1 == 5*10^-6); 

while(dum<iterations)
    dum = dum + 1
    n(1,:) = 10^3;
    for x = 2:itr_x-1
        for t = 2:itr_t-1
            temp = (n(x+1,t)+ n(x-1,t))/(h*h) + n(x,t-1)/(D*p) ;
            n(x,t) = temp /(2/(h*h) + 1/(D*p)) ;
        end
    end
    %temp2 = (n(pt_5um+1,t)+ n(pt_5um-1,t))/(h*h) + n(pt_5um,t-1)/(D*p);
    %n(pt_5um,:) = (temp2 - S) /(2/(h*h) + 1/(D*p)) ;



end
figure(1)
plot (x1,n(:,3),x1,n(:,10),x1,n(:,20),x1,n(:,30),x1,n(:,40),x1,n(:,50));
legend('3','10','20','30','40','50')

            
