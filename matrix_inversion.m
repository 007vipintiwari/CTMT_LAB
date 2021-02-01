A = [3 1 2 ; 2 -10 3; 1 6 10];
B =[3 ; -3 ; 3];
adj_A = adjoint(A);
d = det(A);
X = ((adj_A)/d)*B;
disp('vaue of x y z')
disp(X)