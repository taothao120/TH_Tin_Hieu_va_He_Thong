%% Date: 17/4/2024
%Laboratory 3:  Linear Convolution
% 4.2. Matrix-vector Multiplication to perform Linear Convolution (25%) 
%% Input sequences
x = [1; 2; 3; 4];
h = [3; 2; 1];

%% Calculate
[y, H] = conv_tp(h, x);

%% Display 
disp('Output sequence y:');
disp(y);
disp('Toeplitz matrix H:');
disp(H);

function [y,H]= conv_tp(h,x) 
% Linear Convolution using Toeplitz Matrix 
% ----------------------------------------------------------------------------------- 
% [y,H] = conv_tp(h,x) 
% y = Output sequence in column vector form 
% H = Toeplitz matrix corresponding to sequence h so that y =Hx 
% h = Impulse Response sequence in column vector form 
% x = Input sequence in column vector form 
% -----------------------------------------------------------------------------------
    % Length of input vectors
    Nh = length(h);
    Nx = length(x);
    % Extend h 
    h = [h; zeros(Nh+Nx-1-Nh,1)];
    % Initialize H with zeros
    H = zeros(Nh+Nx-1, Nx);
    % Construct the Toeplitz matrix
    for i = 1:Nx
        H(i:end, i) = h(1:end-i+1);
    end
    % Calculate the convolution
    y = H*x;
end