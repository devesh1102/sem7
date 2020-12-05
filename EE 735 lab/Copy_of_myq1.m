clc;
clear all;
l = 600;
d = 6;
Vhigh = 1;
Vlow = 0;
xlen = 2*l
ylen = 50*d
A = [(xlen - l)/2,(ylen-d)/2 ];
B = [(xlen + l)/2,(ylen-d)/2];
C = [(xlen - l)/2,(ylen+d)/2];
D = [(xlen + l)/2,(ylen+d)/2];
v = zeros(ylen,xlen);
v(B(2)-1,A(1):B(1)) = Vhigh;
%v(B(2)+1,A(1):B(1)) = Vhigh;
%v(D(2)+1,C(1):D(1)) = Vlow;
v(D(2)-1,C(1):D(1)) = Vlow;
count = 0;
while true
    error = zeros(ylen,xlen);
    next = zeros(ylen,xlen);
    for x= 2:ylen-1
        for y = 2:xlen -1
            next(x,y) = (v(x-1,y)+v(x+1,y)+v(x,y-1)+v(x,y+1))/4;
            error(x,y) = abs(next(x,y)- v(x,y))/next(x,y);
        end
    end
    v = next;
    v(B(2)-1,A(1):B(1)) = Vhigh;
    %v(B(2)+1,A(1):B(1)) = Vhigh;
    %v(D(2)+1,C(1):D(1)) = Vlow;
    v(D(2)-1,C(1):D(1)) = Vlow;
    
    error(B(2)-1,A(1):B(1)) = 0;
    %error(B(2)+1,A(1):B(1)) = 0;
    %error(D(2)+1,C(1):D(1)) = 0;
    error(D(2)-1,C(1):D(1)) = 0;
    count = count+1;
    if max(max(error)) <= 0.1
        break;
    end
end
    for i=2:ylen-1
        for j=2:xlen-1
            Ey(i,j) = -1*(v(i+1,j)-v(i-1,j))/2;
            Ex(i,j) = -1*(v(i,j+1)-v(i,j-1))/2;
    %E(row , column)Ey = along column Ex along row            
        end
    end
    for i = A(1):B(1)
         Ey(B(2)- 1,i) = -1*(v(B(2)- 1,i) - v(B(2)- 2,i));
         Ey(D(2)- 1,i) =-1*( v(D(2)- 1,i) - v(D(2)- 2,i));
        %Ey(B(2)+1,i) = -1*( v(B(2)+ 2,i) - v(B(2)+ 1,i));
         %Ey(D(2)+1,i) =-1*( v(D(2)+ 2,i) - v(D(2)+ 1,i));
    end
    figure(1)
    contour(v)
    figure(2)
    contour(sqrt(Ex.^2+Ey.^2))
    figure(3)
    contour(Ey)
    %esum1 =sum(Ey(B(2)+1,A(1):B(1)))
    flux_bottom = -1*sum(Ey(B(2)-1,A(1):B(1)))
    %esum11 = -sum(Ey(D(2)+1,A(1):B(1)))
    flux_right =sum(Ex((B(2)-1):(D(2)-1),A(1)))
    flux_left = -1*sum(Ex((B(2)-1):(D(2)-1),B(1)))
    flux_top = 1*sum(Ey(B(2)+1,A(1):B(1)))
    flux_total = flux_bottom+flux_right+flux_left+flux_top
    
    
    epsilon = 8.85e-12; %permitivity of free space
    charge = epsilon*flux_total;
   
    cap = charge/(Vhigh-Vlow) %6.8909e-10
    cap_ideal = (l*epsilon)/d %5.3100e-10
    figure(11)
    [X,Y]=meshgrid(1:xlen,1:ylen);
    contour(X,Y,v,100)
    xlabel('x ( in nm)')
    ylabel('y(in nm)')
    title('Equipotential Lines')
    colorbar
figure(45)
    mesh(v)
    figure(44)
    [X,Y]=meshgrid(1:xlen-1,1:ylen-1);
    quiver(X,Y,Ex,Ey,2);
    xlabel('x ( in nm)')
    ylabel('y (in nm)')
    title('Electric field ')


    
            
            
            
            