% 4. Calculate the value of 1∫2 1/x dx
% by appropriate numerical Integration method taking h=1/4. 

x0 = 1;
xn = 2;
h = 1/4;

x = x0:h:xn;
syms X;
fx = 1/X;
X=x;
y = eval(subs(fx));

%Here (i) Trapezoidal rule
result_Trapezoidal = h/2 * (  (y(1) + y(length(y))) + 2 * sum(y(2:length(y)-1))  );
display(result_Trapezoidal);


% Here, (ii) Simpson’s 1/3rd rule
result_Simpsons13rd = h/3 * (    (y(1) + y(length(y)))  +   4*sum(y(2:2:length(y)-1))   +   2*sum(y(3:2:length(y)-1))   );
display(result_Simpsons13rd);

% (iii) Simpson’s 3/8th rule.
if(~mod(xn, 3))
    result_Simpsons38th = 3*h/8 * (   (y(1) + y(length(y)))   +    3*( sum(y(2:3:length(y)-1)) + sum(y(3:3:length(y)-1)) )   +    2*sum(y(4:3:length(y)-1))  );
    display(result_Simpsons38th);
else
    display("Simpson's 3/8th not applicable as (n mod 3) ~= 0");
end