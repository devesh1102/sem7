%clear
n = 100;
xn = n;
xp = n;
q = (1.60217662 * 10^-19 );
Nd = 10^22;
Na = 10^22;
e_si = 12*8.854 * 10^-12 ;
ni = 1.45*10^(16);
vb = 0.025*log(Na*Nd/(ni* ni));
Width =10^-6;
h = Width/(n);
rho_abrupt = zeros(1,xn+xp);
x = zeros(1,xn+xp);
vt = 0.025;
m = 2*n;
Eg = 1.12

B = zeros(2*n,1);
del_B = zeros(2*n,1);
B = zeros(2*n,1);
del_B = zeros(2*n,1);
F =  zeros(2*n,1);
J = zeros(2*n,2*n);
V_old = zeros(2*n,1); 
V_new = zeros(2*n,1); 
del_V = zeros(2*n,1); 
Ndop_lin = zeros(2*n,1); 
Ndop_abrupt = zeros(2*n,1); 
rho_lin = zeros(2*n,1);
rho_abrupt = zeros(2*n,1);
n_mat = zeros(2*n,1);
p_mat = zeros(2*n,1);
Ec = zeros(2*n,1);
Ef = zeros(2*n,1);
Ev = zeros(2*n,1);
Ei = zeros(2*n,1);

kt_q =  0.02585;
vmax1 = kt_q*(log(Na/ni));
vmax2 = kt_q*(log(10*Na/ni));
V_old(1:n) = 1*vmax2;
V_old(n:2*n) = 1*vmax1;
value = -1*xp;

for i = 1:xp
    x(i) = value*h;
    Ndop_abrupt(i) = 10*Na;
    
    value = value+1;

end
value = 0;
for i = xp+1:xn+xp
    x(i) = value*h;
    Ndop_abrupt(i) = Na;
    
    value = value+1;
end
%for abrupt
itr = 0;
while(true)
    for i = 2:(xn+xp -1) 
       p = ni*exp(-1*V_old(i)/kt_q);
       n_p = ni*exp(1*V_old(i)/kt_q);
       n_mat(i) =  n_p;
       p_mat(i) = p;
       %%%%%%%%%%%%%%%
       B(i) = -q*(Ndop_abrupt(i)+ p - n_p)/e_si;
       del_B(i) = -q*(p/(-1*kt_q)-(n_p/kt_q))/e_si;
       F(i) = (V_old(i-1)-2*(V_old(i))+V_old(i+1))/(h*h)- B(i);
       
       J(i,i-1) = 1/(h*h);
       J(i,i) = -1*((2/(h*h))  + del_B(i));
       J(i,i+1) = 1/(h*h);
    end
    B(1) = V_old(1) ;
    B(2*n) = V_old(2*n);
    
    del_B(1) = 0 ;
    del_B(2*n) = 0;
    %%%%%%%%%%%%%%%
    F(1) =  V_old(1) -  B(1);
    F(2*n) = V_old(2*n) -  B(2*n);
    
    J(1,1) = 1-del_B(1);
    J(2*n,2*n) = 1-del_B(2*n);
    del_V = -1.* (J^-1) * F ;
    V_new = V_old + del_V;
    if (max(abs(V_new - V_old)) < 0.000001)
        break
    end
    itr = itr+1
    
    V_old = V_new;
    
end
E_field = zeros(2*n,1); 
for i = 2:(xn+xp -1) 
       E_field(i) = -1*(V_new(i+1) - V_new(i-1))/(2*h);
       Ei(i) = Ef(i) - kt_q*(log(n_mat(i)/ni));
end
Ev = Ei - Eg/2;
Ec = Ei + Eg/2;


E_field = E_field(2:(xn+xp -1));
n_mat = n_mat(2:(xn+xp -1));
p_mat = p_mat(2:(xn+xp -1));
Ec= Ec(2:(xn+xp -1));
Ev = Ev(2:(xn+xp -1));
Ei = Ei(2:(xn+xp -1));
Ef = Ef(2:(xn+xp -1));
x2 = x(2:(xn+xp -1));

figure(1)
plot(x,Ndop_abrupt)
xlabel('Distance in m' )
ylabel('Ndoping(in /m^3)')
title('Abrupt graded pn junction diode(N+ N)')


figure(3)
plot(x,V_new)
xlabel('Distance in m' )
ylabel('Voltage(in V)')
title('Abrupt graded pn junction diode(N+ N)')

figure(4)
plot(x(2:(xn+xp -1)),E_field)
xlabel('Distance in m' )
ylabel('Electric Field (in SI units)')
title('Abrupt graded pn junction diode(N+ N)')


figure(5)
plot(x,B*e_si/q)
xlabel('Distance in m' )
ylabel('Charge concentration(in /m^3)')
title('Abrupt graded pn junction diode(N+ N)')

figure(6)
semilogy(x2,n_mat,x2,p_mat)
xlabel('Distance in m' )
ylabel('ELetron hole concentration(in /m^3)')
title('Abrupt graded pn junction diode(N+ N)')
legend('Electron','Hole')

figure(7)
plot(x2,Ec,x2,Ev,x2,Ef,x2,Ei)
xlabel('Distance in m' )
ylabel('Bandgap(in ev)')
title('Abrupt graded pn junction diode(N+ N)')
legend('Ec','Ev','Ef','Ei')




 figure(4)
plot(x(2:(xn+xp -1)),abs(E_field) , x2_q1,abs(E_q1))
xlabel('Distance in m' )
ylabel('Magnitude of Electric Field (V/m)')
title('Abrupt graded pn junction diode')
legend('N+ N diode', 'P N diode')


