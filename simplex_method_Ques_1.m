% Using simplex method 
% Using Simplex method solve the Linear Programming problem to
% maximize f=3x1 + 4x2 + 5x3
% subjected to
% x1+2x2+x3≤120
% x1+2x2+3x3≤150
% x1+2x2≤90
% xi≥0 for all i
clc;
incoming_var = zeros(1,3);
outgoing_var = zeros(1,3);
Cj = [3 4 5 0 0 0]; 
Cb = [0;0;0];
a = [1 2 1 1 0 0 120; 1 2 3 0 1 0 150 ; 1 2 0 0 0 1 90];
rows = 3;
columns = 7;
b =[120 ; 150 ; 90];
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
x1 = a(3,columns);
x2 = 0;
x3 = a(2,columns);
Z = 3*x1 + 4*x2 + 5*x3;
fprintf("X1 is %0.10f\n",x1);
fprintf("X2 is %0.10f\n",x2);
fprintf("X2 is %0.10f\n",x3);
fprintf("The optimal solution is %0.20f",Z);