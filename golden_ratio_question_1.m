%1. Golden Ratio
clc;
syms x
f  = inline(x^2+54/x);
aw = 0;
bw = 1;
Lw = bw - aw;
while(abs(bw- aw)>0.001)  
    w1 = aw + 0.618*Lw;
    w2 = bw - 0.618*Lw;
    if (f(5*w1) > f(5*w2))
        aw = w1;
    elseif (f(5*w1) < f(5*w2)) 
        bw = w2;
    else
        aw = w1;
        bw = w2;
    end    
       
end
fprintf("maxima can be found in  range :%d %d\n",5*w1,5*w2);
