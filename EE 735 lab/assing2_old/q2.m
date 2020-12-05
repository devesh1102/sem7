ef =0.9
efnew = ef
itr = 1

while(true)
   itr = itr +1
   [func,func_dash] = q2_deri(ef)
   %pause(1)
   if isnan(ef)
       break
   end
   if(abs(func) < 0.0001)
       break
   end
   ef = ef - (func/func_dash)
end