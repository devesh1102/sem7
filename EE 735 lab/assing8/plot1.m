
[id1] = data1();
[id05] = data05();
[id15] = data15();


v= zeros(2001,1);
v(1)= 0;
for i = 2:2001
    v(i) = v(i-1) + 0.001;
end
figure(1)
plot(v,id05 ,v,id1 ,v,id15 )
legend('VSB = 0.5V', 'VSB = 1V' ,'VSB = 1.5V')
xlabel ('V_{ds} (in V)')
ylabel(' I_{gs} (in A)')
title('Q3 ')

figure(2)
plot(v,id1 )

xlabel ('V_{ds} (in V)')
ylabel(' I_{gs} (in A)')
title('Q3 ')
