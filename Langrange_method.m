clc;
clear all;
X = [2 , 5 , 7 ,10 ,12];
Y = [18 , 180 , 448 , 1210 , 2028];
n = length(X);
x = input('Enter the value of X : ');
sum = 0;
for i = 1:n
    proc = 1;
    for j = 1:n
        if j ~= i
            proc = proc * (x - X(j))/(X(i) - X(j));
        end
    end
    sum = sum + proc*Y(i);
end
disp('Value of X is:')
disp(sum)