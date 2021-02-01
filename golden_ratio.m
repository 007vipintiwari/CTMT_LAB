% Golden search Ratio
clc;
syms x 
f=inline(x^2+54/x);
aw=0;
bw=1;
lw=bw-aw;
values=[];
while(abs(lw)>0.001)
    w1=aw+0.618*lw;
    w2=bw-0.618*lw;
    values=[values;[w1 w2]];
    if(f(5*w1)>f(5*w2))
        bw=w1;
    else
        if(f(5*w1)<f(5*w2))
            aw=w2;
        else
            aw=w1;
            bw=w2;
        end
    end
    lw=bw-aw;
    
end
fprintf("maxima found in range :%0.10\t %0.10\n",5*w1,5*w2);
plot(values)
title("Golden search ")