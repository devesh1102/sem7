clear
q = (1.6*10^-19);
ef = 1*q
efnew = ef
itr = 1
Ef = ef
while(true)
   itr = itr +1
   %[func,func_dash] = q2_deri(ef)
   %pause(1)

    Nd = 10^22;
    Na = 2*10^21;
    T = 300;
    eg = 1.1*q;
    Nc = 2.75*10^25;
    Nv = 2*10^25;
    k = (1.3807*10^-23);
    q = (1.6*10^-19);
    kt_q = 0.025*q

    Ev =0;
    Ec =Ev + 1.1;
    Ed = Ec - 0.05;
    Ea = Ev + 0.05;
    Ec = Ec*q;
    Ed = Ed*q;
    Ea = Ea*q;

    D = (Ef - Ed)/kt_q;
    A = (Ea - Ef)/kt_q;
    V = (Ev - Ef)/kt_q;
    C = (Ef - Ec)/kt_q;
    eD = exp(D);
    eA= exp(A);
    eV = exp(V);
    eC = exp(C);
    F = -Nd/(1+2*exp(D)) + Na/(1+4*exp(A)) - Nv*exp(V) + Nc*exp(C);
    %Fdash = Nd *2*eD/((1+2*eD)^2)
    Fdash = +1*Nd*2*exp(D)/(kt_q*((1+2*exp(D))^2)) + 1*Na*4*exp(A)/(kt_q*((1+4*exp(A))^2)) + Nv*exp(V)/kt_q +  Nc*exp(V)/kt_q;

    func = F;
    func_dash = Fdash;
    Ef = ef
   if isnan(ef)
       break
   end
   if(abs(func) < 0.0001)
       break
   end
   ef = ef - (func/func_dash);
   a = (func/func_dash)
end