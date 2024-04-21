%% Date: 18/4/2024
%Laboratory 3:  Linear Convolution
% 4.4 Circular Convolution (25%)
%% Input 
n = 0:1:99;
x = [zeros(1,30) ones(1,70)] - [zeros(1,50) ones(1,50)];    % x(n) = u(n-30) – u(n-50)
h1 = [zeros(1,10) ones(1,90)] - [zeros(1,20) ones(1,80)];   % h1(n) = u(n-10) – u(n-20)
h2 = (0.9.^n).*ones(1,100);                                 % h2(n) = (0.9)^n*u(n)
h3 =  [1 -1 zeros(1,98)];                                   % h3(n) = δ(n) – δ(n-1) 

%% Performing the FFT on x(n) and h(n)
X = fft(x);
H1 = fft(h1);
H2 = fft(h2);
H3 = fft(h3);

% Multiplying the FFTs of x(n) and h(n)
Y1 = X.*H1;
Y2 = X.*H2;
Y3 = X.*H3;

% Performing the inverse FFT to get y(n)
y1 = ifft(Y1);
y2 = ifft(Y2);
y3 = ifft(Y3);

%% Plot
% y1
% y1
figure()
subplot(4,2,1)
stem(n(1:100),abs(X(1:100)),'m')  % Plot the magnitude of X
title('Magnitude of X (Ánh, Thuận)')
subplot(4,2,2)
stem(n(1:100),angle(X(1:100)),'m')  % Plot the phase of X
title('Phase of X (Ánh, Thuận)')

subplot(4,2,3)
stem(n(1:100),abs(H1(1:100)),'m')  % Plot the magnitude of H1
title('Magnitude of H1 (Ánh, Thuận)')
subplot(4,2,4)
stem(n(1:100),angle(H1(1:100)),'m')  % Plot the phase of H1
title('Phase of H1 (Ánh, Thuận)')

subplot(4,2,5)
stem(n(1:100),abs(Y1(1:100)),'m')  % Plot the magnitude of Y1
title('Magnitude of Y1 (Ánh, Thuận)')
subplot(4,2,6)
stem(n(1:100),angle(Y1(1:100)),'m')  % Plot the phase of Y1
title('Phase of Y1 (Ánh, Thuận)')

subplot(4,2,7)
stem(n(1:100),y1(1:100),'m')  % Plot the magnitude of y1
title('y1 (Ánh, Thuận)')


% y2
figure()
subplot(4,2,1)
stem(n(1:100),abs(X(1:100)),'b')  % Plot the magnitude of X
title('Magnitude of X (Ánh, Thuận)')
subplot(4,2,2)
stem(n(1:100),angle(X(1:100)),'b')  % Plot the phase of X
title('Phase of X (Ánh, Thuận)')

subplot(4,2,3)
stem(n(1:100),abs(H2(1:100)),'b')  % Plot the magnitude of H1
title('Magnitude of H2 (Ánh, Thuận)')
subplot(4,2,4)
stem(n(1:100),angle(H2(1:100)),'b')  % Plot the phase of H1
title('Phase of H2 (Ánh, Thuận)')

subplot(4,2,5)
stem(n(1:100),abs(Y2(1:100)),'b')  % Plot the magnitude of Y1
title('Magnitude of Y2 (Ánh, Thuận)')
subplot(4,2,6)
stem(n(1:100),angle(Y2(1:100)),'b')  % Plot the phase of Y1
title('Phase of Y2 (Ánh, Thuận)')

subplot(4,2,7)
stem(n(1:100),y2(1:100),'b')  % Plot the magnitude of y1
title(' y2 (Ánh, Thuận)');


% y3
figure()
subplot(4,2,1)
stem(n(1:100),abs(X(1:100)),'r')  % Plot the magnitude of X
title('Magnitude of X (Ánh, Thuận)')
subplot(4,2,2)
stem(n(1:100),angle(X(1:100)),'r')  % Plot the phase of X
title('Phase of X (Ánh, Thuận)')

subplot(4,2,3)
stem(n(1:100),abs(H3(1:100)),'r')  % Plot the magnitude of H1
title('Magnitude of H3 (Ánh, Thuận)')
subplot(4,2,4)
stem(n(1:100),angle(H3(1:100)),'r')  % Plot the phase of H1
title('Phase of H3 (Ánh, Thuận)')

subplot(4,2,5)
stem(n(1:100),abs(Y3(1:100)),'r')  % Plot the magnitude of Y1
title('Magnitude of Y3 (Ánh, Thuận)')
subplot(4,2,6)
stem(n(1:100),angle(Y3(1:100)),'r')  % Plot the phase of Y1
title('Phase of Y3 (Ánh, Thuận)')

subplot(4,2,7)
stem(n(1:100),y3(1:100),'r')  % Plot the magnitude of y1
title('y3 (Ánh, Thuận)');
