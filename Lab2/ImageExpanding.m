%% Date: 11/4/2024
%Laboratory 2: Introduction to Image Processing
% 4.4. Image Expanding (25%)
%% Function 
function ImageExpanding()
    % Read the original image
    originalImage = imread('DailyShow.jpg');
    originalImage = rgb2gray(originalImage); % Convert to grayscale 
    % Get the size of image
    [rows, cols] = size(originalImage);

    expandedImage = zeros(2*rows, 2*cols, class(originalImage));

    % Copy the original pixels into the expanded image
    for row = 1:rows
        for col = 1:cols
            expandedImage(2*row-1, 2*col-1) = originalImage(row, col);
        end
    end

    % Bilinear interpolation
    for row = 1:2:2*rows-3
        for col = 1:2:2*cols-3
            A = double(expandedImage(row, col));
            B = double(expandedImage(row, col+2));
            C = double(expandedImage(row+2, col));
            D = double(expandedImage(row+2, col+2));
            
            b = (A + B) / 2;
            c = (C + D) / 2;
            a = (A + C) / 2;
            d = (B + D) / 2;
            e = (A + B + C + D) / 4;
            
            expandedImage(row, col+1) = b;
            expandedImage(row+1, col) = a;
            expandedImage(row+2, col+1) = c;
            expandedImage(row+1, col+2) = d;
            expandedImage(row+1, col+1) = e;
        end
    end

    % For the last row and column, simple replication used as a fallback
    expandedImage(2*rows-1, :) = expandedImage(2*rows-3, :);
    expandedImage(:, 2*cols-1) = expandedImage(:, 2*cols-3);

    % Display the original and expanded images
    figure, imshow(originalImage), title('Original Image (Ánh,Thuận)');
    figure, imshow(uint8(expandedImage)), title('Expanded Image by Bilinear Interpolation (Ánh,Thuận)');
end
