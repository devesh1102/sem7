clear all;
q = 1.6e-19;
Nd = 1e16;
Na = 2e15;
Ev = 0;
Ea = 0.045*q;
Ed = (1.1-0.045)*q;
Ec = 1.1*q;
kT = 0.025*q;
Ef1 = 0.55*q;
Nc = 2.75e19;
Nv = 2e19;

syms Ef
Nd_plus = Nd/(1 + 2*exp((Ef-Ed)/kT)); 
Na_plus = Na/(1 + 4*exp((Ea-Ef)/kT));
n = Nc*exp((Ef - Ec)/kT);
p = Nv*exp((Ev-Ef)/kT);
g = Nd_plus - Na_plus + p - n;
g_diff = diff(g);
error = q;
num_it = 0;
while (error > 1e-10*q)
    g_val = vpa(subs(g,Ef,Ef1));
    g_diff_val = vpa(subs(g_diff,Ef,Ef1));
    Ef1_updt = Ef1 - g_val/g_diff_val;
    error = abs(Ef1_updt - Ef1);
    error/q
    if(Ef1_updt > 1.1*q)
        Ef1 = 1.1*q;
    elseif(Ef1_updt < 0)
        Ef1 = 0;
    else
        Ef1 = Ef1_updt;
    end
    num_it = num_it +1
end