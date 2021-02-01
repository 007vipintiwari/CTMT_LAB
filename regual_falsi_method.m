a = input('Enter the value of a : ');
b = input('Enter the value of b : ');
syms x
f = @(x) x^2 - 5*x + 2;
x0 = 9999; 
x = 55555;
if f(a)*f(b) < 0
    for m = 1:100
        x0 = x;
        x = a - ((b - a)/(f(b) - f(a)))*f(a)
        if abs(x - x0) < 0.0001
            break;
        end
        if f(a)*f(x) < 0
            b = x;
        end
        if f(b)*f(x)< 0
            a = x;
        end
    end
else 
    disp('No root present  between a and b');
end
   