%% Date: 17/4/2024
%Laboratory 3:  Linear Convolution
% 4.1. Matlab function "conv" (Advance)(25%)
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

%% Convolution live
H = {h1, h2, h3};
Y = {y1, y2, y3};
colors = {'m', 'b', 'r'};

for i = 1:length(H)
    h = H{i};
    y = Y{i};
    color = colors{i};

    % Plot
    figure()
    subplot(3,2,1)
    stem(n,x,color)
    title('x (Ánh, Thuận)')
    subplot(3,2,2)
    stem(n,h,color)
    title(['h' num2str(i) ' (Ánh, Thuận)'])
    
    Y_live = zeros(1,length(n)); 
    for k = 1:length(Y_live)  
        % Convolution steps
        f = fliplr(x);           % Flip 
        Xm = circshift(f,[0,k-1]); % Shift
        m = Xm(1:length(h)).*h;               % Multiply 
        Y_live(k) = sum(m);  % Sum
        
        % Live Convolution Process
        subplot(3,2,[3 4])
        stem(n(1:100),h(1:100),color)
        hold on
        stem(n(1:100),Xm,'k')
        hold off
        title('Convolution Process: 1. Flip, 2. Shift, 3. Multiply 4.Sum')
        % Result of convolution live
        subplot(3,2,[5 6]); 
        stem(Y_live(1:100),'k')
        grid on
        title('Convolution Output y (Ánh, Thuận)');
        pause(0.01);
    end
end