%Calculate the value of ∫1/x dx by appropriate numerical Integration method taking h=1/4.
clc;
x0 = 1;
xn = 2;
h = 1/4;

x = x0:h:xn;
syms Z;
f = 1/Z;
Z = x;
y = eval(subs(f));
n = length(y);

%using trapezoidal rule
disp("Using trapezoidal rule");
trapezoidal  = y(1) + y(n);
for i = 2:n-1
    trapezoidal = trapezoidal + 2*y(i);
end
trapezoidal = (trapezoidal*h)/2;
disp(trapezoidal);


%using Simpson's 1/3rd rule;
simpson = y(1) + y(n);
for i = 2:n-1
    z = mod(i,2);
    if z == 0
        simpson = simpson + 4*y(i);
    else
        simpson = simpson + 2*y(i);
    end    
end 
simpson = (simpson*h)/3;
disp("Using Simpson's 1/3rd rule");
disp(simpson);

if(mod(xn,3) == 0)
    simpson_38th = y(1) + y(n);
    for i = 2:3:n-1
        simpson_38th = simpson_38th + 3*y(i); 
    end 

    for i = 3:3:n-1
        simpson_38th = simpson_38th + 3*y(i); 
    end 
    for j = 4:3:n-1
        simpson_38th = simpson_38th + 2*y(j); 
    end   
    simpson_38th = (simpson_38th*3*h)/8;
    disp("Using Simpson's 3/8th rule");
    disp(simpson_38th);
 else
    disp("Simpson's 3/8th is not applicable if xn is not divisible by 3");
end





