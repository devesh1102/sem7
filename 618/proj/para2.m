DCgain = 110;
gain = 10^(DCgain/20);
Inoise =  25E-9;
k=1.38e-23;
t = 300;
ugf =2*pi* 70 *10^6;
kn = 263*10^-6;
kp = 63*10^-6;
cl = 1*10^-12;
i_ss = 20*10^-6;%>slew*cc
slew = 40*10^6;
gm1 = 200*10^-6;
Cc = gm1/ugf;
I_osc = i_ss*(1+cl/Cc);
lambda_n = 0.48*0.18;
lambda_p = 0.32*0.18;
Wl_1 = gm1*gm1/(2*i_ss*kn/2);
Wl_2 = Wl_1;
Wl_3 = Wl_1;
Wl_4= Wl_1;

F_nd = ugf/ tan(30*pi/180);%w hai
gm6 = F_nd*cl;
wl_6 = gm6*gm6/(2*kp*I_osc);
vg6 = 1.3 - sqrt(2*I_osc/(kp*wl_6))
Rz = (cl+Cc)/(gm6*Cc);
r06 = 1/(lambda_p*I_osc);
r10 =   1/(lambda_n*I_osc);
AV2 = gm6* r06*r10/(r06+r10);
%%%%%
vdsat_1 = sqrt(i_ss*2/(2*kn*wl_1))
vx = 0.9 - 0.5-vdsat_1;
%%%%assum
vy = 0.5
vz = vg6
gm5 = 2*i_ss/(2*(1.8-vg6-0.5))
wl_5 = gm5*gm5/(2*kp*i_ss/2)




