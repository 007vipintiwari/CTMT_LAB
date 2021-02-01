clc;
A = [10 -5 -2; 4 -10 -1; 1 6 10];
b = [3 ; -3 ; -3];
Ab = [A b];

n = length(A);

x = 0;
y = 0;
z = 0;

x0 = 0;
y0 = 0;
z0 = 0;

for m = 1:100
        x0 = x;
        y0 = y;
        z0 = z;
        x = (Ab(1,end) - (Ab(1,3)*z0 + Ab(1,2)*y0))/Ab(1,1)
        y = (Ab(2,end) - (Ab(2,3)*z0 + Ab(2,1)*x0))/Ab(2,2)
        z = (Ab(3,end) - (Ab(3,1)*x0 + Ab(3,2)*y0))/Ab(3,3)
        
        if( abs(x - x0) < 0.0001 && abs(y - y0) < 0.0001 && abs(z - z0) < 0.0001)
                break;
        end
        x0 = x;
        y0 = y;
        z0 = z;
end