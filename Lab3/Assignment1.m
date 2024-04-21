%% Date: 17/4/2024
%Laboratory 3:  Linear Convolution
% 4.1. Matlab function “conv” (25%)
%% Input 
n = 0:1:99;
x = [zeros(1,30) ones(1,70)] - [zeros(1,50) ones(1,50)];    % x(n) = u(n-30) – u(n-50)
h1 = [zeros(1,10) ones(1,90)] - [zeros(1,20) ones(1,80)];   % h1(n) = u(n-10) – u(n-20)
h2 = (0.9.^n).*ones(1,100);                                 % h2(n) = (0.9)^n*u(n)
h3 =  [1 -1 zeros(1,98)];                                   % h3(n) = δ(n) – δ(n-1) 

%% Calculate convolution
y1 = conv(x,h1);
y2 = conv(x,h2);
y3 = conv(x,h3);

%% Plot
% y1
subplot(3,1,1)
stem(n(1:100),x(1:100),'m')
title('x (Ánh, Thuận)')
subplot(3,1,2)
stem(n(1:100),h1(1:100),'m')
title('h1 (Ánh, Thuận)')
subplot(3,1,3)
stem(n(1:100),y1(1:100),'m')
title('y1 (Ánh, Thuận)')

% y2
figure()
subplot(3,1,1)
stem(n(1:100),x(1:100),'b')
title('x (Ánh, Thuận)')
subplot(3,1,2)
stem(n(1:100),h2(1:100),'b')
title('h2 (Ánh, Thuận)')
subplot(3,1,3)
stem(n(1:100),y2(1:100),'b')
title('y2 (Ánh, Thuận)')

% y3
figure()
subplot(3,1,1)
stem(n(1:100),x(1:100),'r')
title('x (Ánh, Thuận)')
subplot(3,1,2)
stem(n(1:100),h3(1:100),'r')
title('h3 (Ánh, Thuận)')
subplot(3,1,3)
stem(n(1:100),y3(1:100),'r')
title('y3 (Ánh, Thuận)')
