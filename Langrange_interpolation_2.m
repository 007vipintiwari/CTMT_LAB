clc;
clear all;
X = [0 , 1 , 2 , 5];
Y = [2 , 3 , 12 , 47];
n = length(X);
sum  = 0;
x = [-2:0.1:4];
[x_value,x_len] = size(x);
for i = 1:x_len
    for i = 1:n
        proc = 1;
        for j = 1:n
            if j ~= i
                proc = proc .* (x - X(j))/(X(i) - X(j));
            end
        end
    sum = sum + proc.*Y(i);
end
    plot(x,sum,'--r',X,Y,'*g'),grid;
    xlabel('X axis');
    ylabel('Y axis');
    xticks(-4:1:10);
    yticks(0:200:3000);
end
