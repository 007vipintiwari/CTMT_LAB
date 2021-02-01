% find the sum of Geometric series;
r = input('Enter the value of r : '); 
n = input('Enter the value of n: ');
gp_sum =  sum_of_series(r,n);
disp(gp_sum);
function gp_sum = sum_of_series(r,n)
         gp_sum = (abs(r^(n+1) - 1)/abs(r - 1));  
end