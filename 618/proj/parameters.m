DCgain = 110;
gain = 10^(DCgain/20);
Inoise =  25E-9;
k=1.38e-23;
t = 300;
ugf = 70 *10^6;

Cl = 1 *10^-12;
slew = 40*10^6;
%Iss = slew*Cl;
kn = 263e-6;
kp = 63e-6;
iss = 40e-6;
Iss = iss
wl_12 =0.5;
wl_11 = wl_12*(iss/(10e-6))

Vx= sqrt(iss*2/(kn *wl_11));
wl_1 = iss/(kn*(0.9-0.48-Vx)^2);
gm1 = sqrt(2*wl_1*kn*iss/2)
Vy  = Vx +sqrt(iss/(kn *wl_1));
vsat1 = sqrt(iss/(kn *wl_1))
Vb = Vy+0.48;
ro1 = 1/(0.48*Iss/2);
ro5 = 1/(0.328*Iss/2);
%vg8 = Vb-0.5
%wl_8 = iss/(kp*(1.8-0.5-vg8)^2)
gm5 = gm1/2
wl_5 = gm5*gm5/(2*kp*iss/2)
Av1 = gm1 *(ro1*ro5*ro1*ro5*gm1*gm5/(ro1*ro1*gm1+ro5*ro5*gm5))
vz = 1.4 - sqrt (iss/(kp*wl_5))
vdsat5 = sqrt (iss/(kp*wl_5))
av2 = gain/Av1
syms f
limit_1m = 25*25*10^-18
cox = 8.78*10^-15
V_noise =8*k*t*2/(3*gm1) * (1+gm5/gm1)  %2* (10^-25)*(10^12)\((100*1000)*cox *(0.18*0.18*wl_1))

i2 = 40E-6
ro6 = 1/(0.328*i2)
gm6  = av2/ro6
wl_6 = gm6*gm6/(2*kp*i2)

Cc = gm1/(2*pi*ugf); 
RZ = (Cl +Cc)/(gm6*Cc)

vg12 = 0.48 + sqrt ((10e-6)*2/(kn*wl_12))
r0 =( 0.93- vg12)/(10e-6)