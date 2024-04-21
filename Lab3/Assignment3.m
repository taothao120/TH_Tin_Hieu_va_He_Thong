%% Date: 18/4/2024
%Laboratory 3:  Linear Convolution
% 4.3. Z-transform and Inverse Z-Transform (25%)
%% Input
b = [0 0 0 0.25 -0.5 0.0625]; 
a = [1 -1 0.75 -0.25 0.0625];
delta = [1 0 0 0 0 0 0 0 0 0];
n = 0:9;

%% Calculation 
x1 = filter(b,a,delta);
u = [0 0 ones(1,8)];
x2 = (n-2).*((1/2).^(n-2)).*cos(pi*(n-2)/3).*u ;

%% còn phần dưới