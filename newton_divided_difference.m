X = [8 , 7, 4 , 2 ];
Y = [1515 , 778 , 43 , 3 ];
n = 4;
x = 0:0.1:10;
[x_six,x_len] = size(x);
for i = 1:n-1
    d(i,1) = (Y(i+1) - Y(i))/(X(i+1) - X(i));
end
for j = 2:n-1
   for i = 1:n-j
        d(i,j) = (d(i+1,j-1) - d(i,j-1))/(X(i+j) - X(i));
   end    
end

for i = 1: x_len
    y = Y(1);
    prod = 1;
    for j = 1:n-1
        prod = x - X(j);
        y = y + prod.*d(1,j);
    end 
    plot(x,y,'--m',X,Y,'*r'),grid
    xlabel('X axis');
    ylabel('Y axis');
    %xticks(1:1:10);
    %yticks(-4000:500:2000);
end    
    