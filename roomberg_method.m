%  5. Evaluate ∫1/(1 + x^2) dx using Romberg’s method and hence obtain an approximate value of ∏.
clc;
x0 = 0;
xn = 1;
h = 8;
for i = 1:h-1
   d(i) = (xn - x0)/2^(i-1);
end    

syms X;
f(X) = 1 /(1 + X^2);
R(1) = (d(1)/2)*(f(xn) + f(x0));

for i = 2:h-1
    prod = 0;
    for j = 1:2^(i-2)
        prod = prod + f(x0 + (2*j - 1)*d(i));
    end
    R(i) = 0.5 * R(i-1) + d(i)*prod; 
    
end 

fprintf("Using Romberg Formula on given equation : %0.20f",R(h-1));




 