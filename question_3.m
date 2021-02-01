B = [1 2;3 4];
transpose_B = B';
A = inv(B);
disp(A == transpose_B) %if output of inverse of B and transpose of B is same all  values will be 1 
%disp(tanspose_B*B)  
disp(transpose_B);
disp(A)
