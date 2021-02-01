%  A firm produces three products which are processedon three machines.The relevant data is given
% below.
% Machine       Time per unit (minutes)                    Machine capacity
%                                                         (minutes day)
%               Product A  Product B  Product C
%  M1                  2         3            2                    440
%  M2                  4         -            3                    470
%  M3                  2         5            -                    430
%The profit per unit of products A, B and C is Rs 4, Rs 3 and Rs 6, respectively. Determine the daily
%number of units to be manufactured for each product. Assume that all the units are consumed in the
%market.
%Z = 4*x1 + 3*x2 + 6*x3;
clc;
Cj = [4 3 6 0 0 0]; 
Cb = [0 ;0 ; 0];
incoming_var = zeros(1,3);
outgoing_var = zeros(1,3);

a = [2 3 2 1 0 0 440; 4 0 3 0 1 0 470 ; 2 5 0 0 0 1 430];
rows = 3;
columns = 7;
b =[440 ; 470 ; 430];
Zj = zeros(1,columns);
cjZj = zeros(1,columns-1);
min_ratio = zeros(rows,1);
for m = 1:2
    for i = 1 : columns-1
        s = 0;
        for j = 1:rows
            s = s +  Cb(j,1)*a(j,i);
        end
        Zj(1,i) = s;  % finding Zj
    end  
    for k = 1:columns-1
        cjZj(1,k) = Cj(k) - Zj(1,k); %finding cj - Zj
    end  
    [max_value,key_column] = max(cjZj); %finding value and column index of incoming variable
    incoming_var(1,key_column) = 1;
    for i = 1:rows
        b(i,1) = a(i,columns);
    end
    
    for i = 1:rows
        min_ratio(i,1) = b(i,1)/a(i,key_column);  
    end
    [min_value,key_row] = min(min_ratio); %finding minimum ratio
    outgoing_var(1,key_row) = 1;
    key_element = a(key_row,key_column);  %key element
    
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
x1 = 0;
x2 = a(1,columns);
x3 = a(2,columns);
Z = 4*x1 + 3*x2 + 6*x3;
fprintf("X1 is %0.10f\n",x1);
fprintf("X2 is %0.10f\n",x2);
fprintf("X3 is %0.10f\n",x3);
fprintf("The optimal solution is %0.20f",Z);