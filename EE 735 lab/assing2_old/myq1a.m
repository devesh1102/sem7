clear
%%abrupt

n = 1000
xn = n
xp = n
e0 = 8.854 * 10^-12 
h = (0.6*10^-6)/(2*n)
delx =1
w = (xn+xp)*h
rho_abrupt = zeros(1,xn+xp);
rho_lin = zeros(1,xn+xp);
x = zeros(1,xn+xp);
Nd = 10^22;
Na = 10^22;
q = (1.6*10^-19);
value = -1*xp
for i = 1:xp
    x(i) = value*h;
    rho_abrupt(i) = 1*q*Nd/e0;
    rho_lin(i) = -q*x(i)*(Nd + Na)/(w*e0);
    
    value = value +1;
end
value = 0
for i = xp+1:xn+xp
    x(i) = value*h;
    rho_abrupt(i) = -1*q*Na/e0;
    rho_lin(i) = -q*x(i)*(Nd + Na)/(w*e0);
    
    value = value +1;
end
E_abrupt =  zeros(1,xn+xp);
E_lin =  zeros(1,xn+xp);
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
