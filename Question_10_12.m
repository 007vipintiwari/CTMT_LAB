a = input('Enter the value of a : ');
b = input('Enter the value of b : ');

f = @(x) x^3 + 2*x^2 + 10*x - 20;
if f(a)*f(b) < 0
    for m = 1: 50
       syms x
       x = a - ((b - a)/(f(b) - f(a)))*f(a)
       if abs(f(x)) < 0.0001
          break;
       end
       if f(a)*f(x) < 0
          b = x;
       end
       if f(b)*f(x) < 0
         a = x;
       end
    end
else
    disp('No root exists between a and b')
end