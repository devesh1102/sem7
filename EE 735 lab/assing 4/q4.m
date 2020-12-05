clear
load('Q4_values.mat')
x = x*10^-4
plot (x,log(N))
conc = 1e17
[a ,dum] = min(abs(N- conc))
%D = 10^-4
h = (x(5) - x(4))
T =1027 + 273;
D0 = 10.5;
k = 1.38E-23/1.6E-19;
D = D0*exp(-(3.69)/(k*T))
p = h*h/(2*D)
itr_x = 210


n_old = zeros (itr_x)
n_old(1:101) = N
n_old = n_old(:,1)
qq =length(N)
for i = length(N) +1:itr_x
    x(i) = x(i-1) +h
    N(i) = 0
end
for i= 2:itr_x-1
    A(i,i-1)= 1/(h*h);
    A(i,i)  = -1*(2/(h*h) + 1/(D*p));
    A(i,i+1)= 1/(h*h);
end
 A(1,1) =  -1*(1/(h*h) + 1/(D*p));
 A(1,2) =  1/(h*h);
 A(itr_x,itr_x) =-1*(1/(h*h) + 1/(D*p));
  A(itr_x,itr_x-1) =1/(h*h);
  
 A_inverse = A^-1;
 dum = 0
while (true)
    dum = dum + 1;
    B_new = -n_old/(D*p);
    n_new = A_inverse * B_new;
    n_old = n_new;
    [a ,pointA] = min(abs(n_new- conc));
    [b,pointB] = min(abs(n_new- (conc/10)));
    aa(dum) = abs(pointA- pointB)*h;
    if (abs(pointA- pointB)*h > 40*10^-7)
        break
    end
end
thermal_bud =  D*dum*p
time_taken = dum*p
roll_off = aa(dum)
figure(1)
semilogy(x(1:qq+15),(n_old(1:qq+15)),x(1:qq+15),(N(1:qq+15)))
legend('After diffusion','before diffusion')
xlabel('Distance in cm')
ylabel('Concentration in log cm^{-3}')
figure(2)
plot(x,n_old,x,(N))
legend('After diffusion','before diffusion')
xlabel('Distance in cm')
ylabel('Concentration in cm^{-3}')
figure(66)
plot(aa)
    


