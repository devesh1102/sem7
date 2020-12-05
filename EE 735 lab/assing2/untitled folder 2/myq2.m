 clear
q = (1.6*10^-19);
ef = 1.1*q;
Nd = 10^22;
Na = 2*10^21;
Nc = 2.75*10^25;
Nv = 2*10^25;
T = 300;
eg = 1.1*q;
k = (1.3807*10^-23);
q = (1.6*10^-19);
kt_q = 0.025*q;
q = 1.6e-19;
Ev =0;
Ec =( 1.1)*q;
Ed =( 1.1 - 0.045)*q;
Ea =  0.045*q;
syms e
p = 1*Nv*exp((Ev - e)/kt_q);
n = 1*Nc* exp((e - Ec)/kt_q);
nd_plus = Nd/(1+2*(exp((e-Ed)/kt_q)));
na_min =  Na/(1+4*(exp((Ea-e)/kt_q)));
F = nd_plus - na_min+p-n;
F_d = diff(F);
k = 0;

while(1)
    func =vpa( subs(F,ef));
    func_diff = vpa(subs(F_d,ef));
    if(abs(func/func_diff)<0.001*q)
        break
    end
    m = (func/func_diff);
    if (abs(m) > 1.1 *q)
        ef = 1.1 *q;
    else
       ef = ef - m ;
    end
    a = (func/func_diff)/q;
    ef_q = ef/q;
    k = k+1;
    
end
ef = ef
ef_in_ev= ef_q


    
    
    