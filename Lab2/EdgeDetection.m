%% Date: 4/4/2024
%Laboratory 2: Introduction to Image Processing
% 4.1. Edge Detection (25%)
%% Read original image
origin_image =imread('DailyShow.jpg','jpeg'); % read image
figure;imshow(origin_image); title("Original Image (Ánh, Thuận)"); % show image
disp('Original image size:');
disp(size(origin_image));

%% Convert image to an 8-bit gray format
gray_image = rgb2gray(origin_image);
figure;imshow(gray_image); title("Gray Image (Ánh, Thuận)"); % show image
% Check size
disp('Gray image size:');
disp(size(gray_image));

%% Edge detection
% create Sobel vertical edge (h1) and Sobel horizontal edge (h2)
h1 = [-1 0 1; -2 0 2; -1 0 1];
h2 = [1 2 1; 0 0 0; -1 -2 -1];
% Apply convolution
M1 = conv2(im2double(gray_image), im2double(h1), 'same');
M2 = conv2(im2double(gray_image), im2double(h2), 'same');


% Display the gradients
figure, imshow(abs(M1), []), title('Column Edge (Ánh, Thuận)');
figure, imshow(abs(M2), []), title('Row Edge (Ánh, Thuận)');
% Overall gradient magnitude
gradient_magnitude = (M1.^2 + M2.^2).^0.5;
figure, imshow(gradient_magnitude, []), title(' Overall Gradient Magnitude (Ánh, Thuận)');

%% Invert area
invert_gradient = 1 - gradient_magnitude;
figure, imshow(invert_gradient, []), title(' Invert Overal Gradient Magnitude (Ánh, Thuận)');



