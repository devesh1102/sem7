clc;
clear all;
l_row = 10
l_col = 20
lcol =30
a =5
Vhigh = 1
Vlow = -1
d = 10
xlen = 5*( l_row+d)
ylen = l_col *5
v = zeros(xlen,ylen)
v(l_row +lcol:(l_row+l_col+lcol),a*l_row) = Vhigh
v(l_row+lcol,a*l_row+d:a*l_row+d+l_row) = Vlow
count = 0;
while true
    error = zeros(xlen,ylen);
    next = zeros(xlen,ylen);
    for y= 2:ylen-1
        for x = 2:xlen -1
            next(x,y) = (v(x-1,y)+v(x+1,y)+v(x,y-1)+v(x,y+1))/4;
            error(x,y) = abs(next(x,y)- v(x,y))/next(x,y);
        end
    end
    v = next;
    v(l_row+lcol:(l_row+l_col+lcol),a*l_row) = Vhigh;
    v(l_row+lcol,a*l_row+d:a*l_row+d+l_row) = Vlow;
    
    error(l_row+lcol:(l_row+l_col+lcol),a*l_row) = 0;
    error(l_row+lcol,a*l_row+d:a*l_row+d+l_row) = 0;
    count = count+1
    if max(max(error)) <= 0.1
        break;
    end
end
for i=2:xlen-1
        for j=2:ylen-1
            Ey(i,j) = -1*(v(i+1,j)-v(i-1,j))/2;
            Ex(i,j) = -1*(v(i,j+1)-v(i,j-1))/2;
    %E(row , column)Ey = along row Ex along column            
        end
end
%    for i  = l_row:(l_row+l_col)
     %   Ex(i,l_row -1) = -1*(v(i+1,l_row -1)-v(i,l_row -1))
%    end
 %   for j = l_row+d:l_row+d+l_row:
 %       Ey(i,j) = -1*(v(i+1,j)-v(i-1,j))
    flux_l = -1*sum(Ex(l_row+lcol:(l_row+l_col+lcol),a*l_row-1));%1.7000

    flux_r = sum(Ex(l_row+lcol:(l_row+l_col),a*l_row+d+l_row+1));%1.3002
    flux_bottom  = sum(Ey(l_row+l_col +1+lcol,a*l_row+d:a*l_row+d+l_row))
    flux_top = -1*sum(Ey(l_row-1+lcol,l_row+d:a*l_row+d+l_row))
    
    flux_total = flux_bottom+flux_r+flux_l+flux_top
    epsilon = 8.85e-12; %permitivity of free space
    charge = epsilon*flux_total;
   
    cap = charge/(Vhigh-Vlow)% 2.941085e-11
    %Emax : 0.232019
    Emax = max(max(sqrt(Ex.^2 +Ey.^2)))
    A = (sqrt(Ex.^2 +Ey.^2))
    [x,y]=find(A==Emax)
    figure(33)
    [X,Y]=meshgrid(1:ylen,1:xlen);
    contour(X,Y,v,100)
    xlabel('x in nm')
    ylabel('y in nm')
    title('Equipotential lines')
    colorbar
    
     figure(44)
    [X,Y]=meshgrid(1:ylen-1,1:xlen-1);
    quiver(X,Y,Ex,Ey,2);
    xlabel('x in nm')
    ylabel('y in nm')
    title('Electric field ')
    
    figure(22)
    mesh(v)
    xlabel('x in nm')
    ylabel('y in nm')
    
    title('Electric Potential')