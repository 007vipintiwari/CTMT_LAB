% 5. Evaluate 0∫1 1/(1+x^2) dx using Romberg’s method and hence obtain an approximate value of ∏

x0 = 0;
xn = 1;
h1 = xn-x0;
j=7; %hyperparameter
h = h1./(2.^[0:j]); %h1 to hj

syms X;
fx(X) = 1/(1+X^2);

Rjk = zeros(1,j);

Rjk(1) = h(1)/2 * (  fx(x0) + fx(xn)  );

for row=2:j
    interResult = 0;
    for i=1:2^(row-2)
        interResult = interResult + fx(x0+(2*i-1)*h(row));
    end
    Rjk(row) = 0.5 * Rjk(row-1) + h(row) * interResult;
end

display(Rjk);
fprintf("Result using Romberg's method: %.4f\n", Rjk(j));