%% Date: 11/4/2024
%Laboratory 2: Introduction to Image Processing
% 4.3. Image Flipping (25%)
%% Read image
origin_image =imread('DailyShow.jpg','jpeg'); % read image

%% Flip image
% (i) Vertical flip (up-down flip)
verticalFlip = flipud(origin_image);

% (ii) Horizontal flip (left-right flip)
horizontalFlip = fliplr(origin_image);

% (iii) Horizontal and vertical flip
bothFlip = flipud(horizontalFlip);

%% Display the images
subplot(2,2,1), imshow(origin_image), title('Original Image (Ánh,Thuận)');
subplot(2,2,2), imshow(verticalFlip), title('(i) Verical Flip (Ánh,Thuận)');
subplot(2,2,3), imshow(horizontalFlip), title('(ii) Horizontal Flip (Ánh,Thuận)');
subplot(2,2,4), imshow(bothFlip), title('(iii) Both Flip (Ánh,Thuận)');