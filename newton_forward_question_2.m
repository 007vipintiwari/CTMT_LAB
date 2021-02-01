clc;
X = [0 , 1 , 2 , 3 ];
Y = [-1 , 1 ,1 , 2];
h = X(2) - X(1);
n = 4;
x = [-7:0.01:7];
for i = 1:n-1
    d(i ,1) = Y(i + 1) - Y(i);
end
for j = 2:n-1
    for i = 1:n-j
        d(i,j) = d(i + 1,j-1) - d(i,j-1);
    end
end
[row ,x_len] = size(x);
for i = 1:x_len
    p = (x - X(1))/h;
    prod = 1;
    y = Y(1);
    for t = 1:n-1
       prod = prod.*(p-t+1)/t;
       y = y + prod*d(1,t);
   end    
  plot(x,y,'--c',X,Y,'*m'),grid
  xlabel('X axis')
  ylabel('Y axis')
  xticks(-10:1:10)
  yticks(-400:30:200)
end
