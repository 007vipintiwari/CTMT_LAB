a = input('Enter the value of a :');
b = input('Enter the value of b :');
%function :- f(x) = x^(1/3)
f = @(x) x^(1/3);
if f(a)*f(b) < 0
    for m = 1:100
        syms x
        x = a - ((b - a)/(f(b) - f(a)))*f(a)
        if abs(f(x)) < 0.0001
            break;
        end
        if f(a)*f(x) < 0
            b = x;
        end
        if f(x)*f(b) < 0
            a = x;
        end
    end
else
    disp('No root present between a and b :')
end
