a = input('Enter the value of a : ');
b = input('Enter the value of b : ');
% f = x^3 + 2*x^2 + 10*x - 20
disp('root of equation using Regula-falsi method : ');
root = regula_falsi(a,b);
disp(root)

disp('root of equation using newton raphson method');
root_1 = newton_raphson(a,b);
disp(root_1)

function x = newton_raphson(a,b)
    syms x
    f = @(x) x^3 + 2*x^2 + 10*x - 20;
    y = diff(f(x));
    x0 = 2;
    for m = 1:100
        syms x
        x = x0 - (f(x0)/vpa(subs(y,x,x0)));
        if(abs(x - x0)) < 0.0001
            break;
        end
        x0 = x;
    end
    
end

function x = regula_falsi(a,b)
    f = @(x) x^3 + 2*x^2 + 10*x - 20;
    if f(a)*f(b) < 0
        for k = 1:50
            syms x
            x = a - ((b - a)/(f(b) - f(a)))*f(a);
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
end

