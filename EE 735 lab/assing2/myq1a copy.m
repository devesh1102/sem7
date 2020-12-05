clear
n = 50;
xn = n;
xp = n;
delx =1;
q = (1.60217662 * 10^-19 );
Nc = 2.75*10^25;
Nv = 2*10^25;
Nd = 10^22;
Na = 10^22;
e0 = 12*8.854 * 10^-12 ;
ni = 1*10^(16);
vb = 0.025*log(Na*Nd/(ni* ni));
Width = sqrt( 2*e0*vb*2/(q*(Na)))
h = Width/(2*n);
delx =1;
w = (xn+xp)*h;
rho_abrupt = zeros(1,xn+xp);
rho_lin = zeros(1,xn+xp);
x = zeros(1,xn+xp);
Nd = 10^22;
Na = 10^22;
q = (1.6*10^-19);
value = -1*xp;
E_abrupt =  zeros(1,xn+xp);
E_lin =  zeros(1,xn+xp);
Eint_L =  zeros(1,xn+xp)
Eint_a =  zeros(1,xn+xp)
syms xii
F_lin = int(q*xii*(Nd + Na)/(w*e0))
F_abrupt = int(xii/xii)
for i = 1:xp
    x(i) = value*h;
    rho_abrupt(i) = -1*q*Nd/e0;
    rho_lin(i) = q*x(i)*(Nd + Na)/(w*e0);
    dum_abrupt = subs(F_abrupt,((i-xp)*h))-subs(F_abrupt,-(xp*h));
    Eint_a(i) = dum_abrupt * rho_abrupt(i);
    dum_lin = subs(F_lin,((i-xp)*h))-subs(F_lin,-(xp*h));
    Eint_L (i)=  dum_lin;
    value = value +1;
end
value = 0;
for i = xp+1:xn+xp
    x(i) = value*h;
    rho_abrupt(i) = 1*q*Na/e0;
    rho_lin(i) = q*x(i)*(Nd + Na)/(w*e0);
    dum_abrupt = subs(F_abrupt,((i-xp)*h))-subs(F_abrupt,0);
    Eint_a(i) = dum_abrupt * rho_abrupt(i) + Eint_a(xp);
    dum_lin = subs(F_lin,((i-xp)*h))-subs(F_lin,-(xp*h));
    Eint_L (i)=  dum_lin;
    value = value +1;
end

%%%electric field 
for i = 2:xn+xp
    E_abrupt(i) =  E_abrupt(i) + rho_abrupt(i);
    E_lin(i) =  E_lin(i) + rho_lin(i);
    E_abrupt(i) =  E_abrupt(i) + rho_abrupt(1);
    E_lin(i) =  E_lin(i) + rho_lin(1);

    
    for j = 2:(i-1)
        
        if(mod(j,2))
           E_abrupt(i) =  E_abrupt(i) + 4*rho_abrupt(j);
           E_lin(i) =  E_lin(i) + 4*rho_lin(j);
        else
             E_abrupt(i) =  E_abrupt(i) + 2*rho_abrupt(j);
             E_lin(i) =  E_lin(i) + 2*rho_lin(j);
        end
    end
    E_lin(i) = E_lin(i)* (h/3);
    E_abrupt(i) = E_abrupt(i)* (h/3);
end
x= x +h 
figure(1)
plot(x,rho_abrupt*e0)
xlabel('Distance in m' )
ylabel('Charge( in C)')
title('Abrupt graded pn junction diode')
figure(2)
plot(x,rho_lin*e0)
xlabel('Distance in m' )
ylabel('Charge( in C)')
title('Linear graded pn junction diode')
figure(3)
plot(x,E_abrupt)
xlabel('Distance in m' )
ylabel('Electric field( in V/m)')
title('Abrupt graded pn junction diode')
figure(4)
plot(x,E_lin)
xlabel('Distance in m')
ylabel('Electric field( in V/m)')
title('Linear graded pn junction diode')
figure(5)
plot(x,Eint_L)
xlabel('Distance in m')
ylabel('Electric field by integration( in V/m)')
title('Linear graded pn junction diode')
figure(6)
plot(x,Eint_a)
xlabel('Distance in m')
ylabel('Electric field by integration( in V/m)')
title('Abrupt graded pn junction diode')

% figure(7)
% plot(x,abs(Eint_L - E_lin)*100./E_lin)
% xlabel('Distance in m')
% ylabel('Perccentage Error Electric field')
% title('linear graded pn junction diode')
% figure(8)
% plot(x,abs(Eint_a - E_abrupt)*100./E_abrupt)
% xlabel('Distance in m')
% ylabel(' Perccentage Error Electric field ')
% title('Abrupt graded pn junction diode')
