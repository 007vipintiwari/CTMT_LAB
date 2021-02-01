% Using simplex method 
% Maximize Z = 5x1 + 3x2
% Subjected to:
%  x1+x2 ≤ 2;
% 5x1+2X2 ≤ 10;
% 3x1+8x2 ≤ 12;
% x1, x2 ≥ 0
clc;
incoming_var = zeros(1,3);
outgoing_var = zeros(1,3);
Cj = [5 3 0 0 0]; 
Cb = [0;0;0];
a = [1 1 1 0 0 2; 5 2 0 1 0 10 ; 3 8 0 0 1 12];
rows = 3;
columns = 6;
b =[2 ; 10 ; 12];
Zj = zeros(1,columns);
cjZj = zeros(1,columns-1);
min_ratio = zeros(rows,1);
for m = 1:5
    for i = 1 : columns
        s = 0;
        for j = 1:rows
            s = s +  Cb(j,1)*a(j,i);
        end
        Zj(1,i) = s;  % finding Zj
    end  
    for k = 1:columns-1
        cjZj(1,k) = Cj(k) - Zj(1,k); %finding cj - Zj
    end  
    [max_value,key_column] = max(cjZj);
    incoming_var(1,key_column) = 1;
    for i = 1:rows
        min_ratio(i,1) = b(i,1)/a(i,key_column);  %finding value and column index of incoming variable
    end
    [min_value,key_row] = min(min_ratio);
    key_element = a(key_row,key_column);  %key element
    outgoing_var(1,key_row) = 1;
    for i = 1:columns
        a(key_row,i) = a(key_row,i)/key_element;    %making the key element unity 
    end 
    
    for i = 1:rows
       if i ~= key_row
            z = a(i,key_column);
            for j = 1:columns
                a(i,j) = a(i,j) - (a(key_row,j)*z);
            end    
       end    
    end 
    
    Cb(key_row,1)  = Cj(1,key_column); 
end
x1 = a(1,columns);
x2 = 0;
Z = 5*x1 + 3*x2;
fprintf("X1 is %0.10f\n",x1);
fprintf("X2 is %0.10f\n",x2);
fprintf("The optimal solution is %0.20f",Z);