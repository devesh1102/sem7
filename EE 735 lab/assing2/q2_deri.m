function [func,func_dash] = q2_deri(Ef)

Nd = 10^22;
Na = 2*10^21;
T = 300;
eg = 1.1;
Nc = 2.75*10^25;
Nv = 2*10^25;
k = (1.3807e-23);
q = (1.6*10^-19);
kt_q = 0.025;

Ev =0;
Ec =Ev + 1.1;
Ed = Ec - 0.045;
Ea = Ev + 0.045;
D = (Ef - Ed)/kt_q
A = (Ea - Ef)/kt_q
V = (Ev - Ef)/kt_q
C = (Ef - Ec)/kt_q
F = Nd/(1+2*exp(D)) - Na/(1+4*exp(A)) + Nv*exp(V) - Nc*exp(C);
Fdash = -1*Nd*2*exp(D)/(kt_q*((1+2*exp(D))^2)) - 1*Na*4*exp(A)/(kt_q*((1+4*exp(A))^2)) - Nv*exp(V)/kt_q -  Nc*exp(V)/kt_q;
func = F;
func_dash = Fdash;

end

