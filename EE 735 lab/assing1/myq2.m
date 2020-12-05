l = 10
i = 1
d = 6
cap = zeros(1,20)
cap_ideal = zeros(1,20)
diff = zeros(1,20)
length = zeros(1,20)

while l<10500
    length(i) = l
    [cap(i),cap_ideal(i),diff(i)] = myq2F(d,l)
    l = l+50
    i = i+1
end

figure(1)
plot(length,diff)
title('Difference')
xlabel('Length')
ylabel('Percentage Difference')
figure(2)
plot(length,cap_ideal)
title('Capacitance Ideal')
xlabel('Length(in nm)')
ylabel('Capacitance per unit length')
figure(3)
plot(length,cap)
title('Capacitance Calculated')
xlabel('Length(in nm)')
ylabel('Capacitance per unit length')

figure(4)
plot(length,cap - cap_ideal)
title('Difference')
xlabel('Length(in nm)')
ylabel('Difference in Capacitance')

