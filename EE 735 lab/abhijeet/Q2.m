%: 0.89657 eV

% Microelectronics Simulation Lab Assignment 2 (EE 735)
% 160070031 (Abhijeet Aanand)
% Question 2


 % This code uses Newton Raphson method to solve the charge neutrality equation for finding the
% fermi energy 𝐸f.


clear;

%Initial parameters ( all are in SI units)

Na=2e21;
Nd=1e22;
q=1.6e-19; %eletronic charge
T=300; % (in K)
Nc=2.75e25;
Nv=2e25;
Eg=1.1*q;    

ktq= 0.026*q; %(in eV at 300K)
epsilon=8.85e-12; 
epsi=epsilon*12;

% Assumption for Respective Energy levels
Ev=0;
Ec=1.1*q;
Ea=0.045*q;
Ed=(1.1-0.045)*q;

%Newton Raphson Implementation

syms ef;

%defining respective four terms
f1=Nd/(1+2*exp((ef-Ec)/ktq));
f2=Na/(1+4*exp((Ea-ef)/ktq));
f3=Nv*exp((Ev-ef)/ktq);
f4=Nc*exp((ef-Ec)/ktq);

f=f1-f2+f3-f4;

diff_f=diff(f); % calculates the deriavtive
ei_guess=1.1*q;
k = 1;
while(true)
    ei_new=ei_guess-vpa(subs(f,ei_guess))/vpa(subs(diff_f,ei_guess));
    k = k+1;
  if abs((ei_new-ei_guess)/(ei_guess))<=0.01
      break;
  else
      ei_guess=ei_new;
  end  
  end
    
e_final=ei_new/q %( calculates final value in eV)