clear
%%abrupt

n = 1000;
xn = n;
xp = n;
delx =1;
q = (1.60217662 * 10^-19 );
Nc = 2.75*10^25;
Nv = 2*10^25;
Nd = 10^22;
Na = 10^22;
e0 = 12*8.854 * 10^-12 ;
ni = 1*10^(16)
vb = 0.025*log(Na*Nd/(ni* ni));
Width = sqrt( 2*e0*vb*2/(q*(Na)));
h = Width/(2*n);
%h = (0.6*10^-6)/(2*n)
w = (xn+xp)*h
rho_abrupt = zeros(1,xn+xp);
rho_lin = zeros(1,xn+xp);


value = -1*xp;
x = zeros(1,xn+xp);
for i = 1:xp
    x(i) = value*h;
    rho_abrupt(i) = -1*q*Nd/e0;
    rho_lin(i) = q*x(i)*(Nd + Na)/(e0*w);
    value = value +1;
end
for i = xp+1:xn+xp
    x(i) = value*h;
    rho_abrupt(i) = 1*q*Na/e0;
    rho_lin(i) = q*x(i)*(Nd + Na)/(e0*w);
    
    value = value +1;
end
A = zeros(xn+xp,xn+xp);
B_lin = zeros(xn+xp,1);
B_abrupt = zeros(xn+xp,1);
for i = 2:(xn+xp - 1)
    A (i,i-1) =1;
    A (i,i) = -2;
    A (i,i+1) = 1;
    B_lin(i) = h*h*rho_lin(i);
    B_abrupt(i) = h*h*rho_abrupt(i);

end
%A(1,1)= -1;
%A(1,2)= +2;
%A(xn+xp,xn+xp-1)= -1;
%A(xn+xp,xn+xp)=2;
A(1,1)= 1;
A(1,2)= 0;
A(1,3)= 0;

A(xn+xp,xn+xp-1)=-1;
A(xn+xp,xn+xp)=1;
A(xn+xp,xn+xp-2)=0;


%B_lin(1) = h*h*rho_lin(1);
B_lin(xn+xp) = h*h*rho_lin(xn+xp);
B_abrupt(xn+xp) = h*h*rho_abrupt(xn+xp);
%B_abrupt(1) = h*h*rho_abrupt(1);
B_abrupt(1) = 0;
B_lin(1) =0;

% A = A(2:(xn+xp - 1),2:(xn+xp - 1))
% B_lin = B_lin(2:(xn+xp - 1))
% B_abrupt = B_abrupt(2:(xn+xp - 1))
% x = x(2:(xn+xp - 1))
[L,U] = lu(A);
L_inv = L^-1;
U_inv = U^-1;
A_inv = (A^-1);

y_lin = (L_inv) * B_lin;
x_lin = (U_inv) * y_lin;
Vact_lin = A_inv * B_lin;
Diff_lin = Vact_lin - x_lin;


y_abrupt = (L_inv) * B_abrupt;
x_abrupt = (U_inv) * y_abrupt;
Vact_abrupt = A_inv * B_abrupt;

Diff_abrupt=(abs( Vact_abrupt - x_abrupt)*100)./x_abrupt;
Diff_lin = (abs(Vact_lin - x_lin)*100)./x_lin;
sum_abrupt = sum(Diff_abrupt)/n;
sum_lin = sum(Diff_lin)/n;

x_lin = -1*x_lin;
x_abrupt = -1*x_abrupt;
Vact_abrupt =-1* Vact_abrupt;
Vact_lin = -1*Vact_lin;
figure(1)
plot(x,rho_abrupt*e0)
xlabel('Distance in m' )
ylabel('Charge( in C/m^3)')
title('Abrupt graded pn junction diode')
figure(2)
plot(x,rho_lin*e0)
xlabel('Distance in m' )
ylabel('Charge(in C/m^3)')
title('Linear graded pn junction diode')
figure(3)
plot(x,x_lin)
title('Linear graded pn junction diode')
xlabel('Distance in m' )
ylabel('Voltage( in V)')
figure(4)
plot(x,x_abrupt)
xlabel('Distance in m' )
ylabel('Voltage( in V)')
title('Abrupt graded pn junction diode')
figure(6)
plot(x,Diff_lin)
xlabel('Distance in m' )
ylabel('Percentage error')
title('Linear graded pn junction diode')
figure(5)
plot(x,Diff_abrupt)
xlabel('Distance in m' )
ylabel('Percentage error')
title('Abrupt graded pn junction diode ')
