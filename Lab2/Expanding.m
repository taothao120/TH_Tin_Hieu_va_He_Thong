%% Date: 11/4/2024
%Laboratory 2: Introduction to Image Processing     
% 4.4. Image Expanding (25%)
%% Function 
function Expanding()
    % Read the original image
    originalImage = imread('DailyShow.jpg');
  
    % Get the size of image
    [rows, cols, ~] = size(originalImage);

    expandedImage = zeros(2*rows, 2*cols, size(originalImage, 3));

    % Bilinear interpolation
    for row = 1:rows
        for col = 1:cols
            A = double(originalImage(row, col, :));
            B = double(originalImage(row, min(col+1,cols), :));
            C = double(originalImage(min(row+1,rows), col, :));
            D = double(originalImage(min(row+1,rows),min(col+1,cols), :));
            
            b = (A + B) / 2;
            c = (C + D) / 2;
            a = (A + C) / 2;
            d = (B + D) / 2;
            e = (A + B + C + D) / 4;
            
            expandedImage(2*row-1,2*col-1, :) = A;
            expandedImage(2*row-1,2*col+1, :) = B;
            expandedImage(2*row-1, 2*col, :) = b;
            expandedImage(2*row, 2*col-1, :) = a;
            expandedImage(2*row+1,2*col-1, :) = C;
            expandedImage(2*row+1, 2*col, :) = c;
            expandedImage(2*row+1, 2*col+1, :) = D;
            expandedImage(2*row, 2*col+1, :) = d;
            expandedImage(2*row, 2*col, :) = e;
        end
    end

    % Display the original and expanded images
    figure, imshow(originalImage), title('Original Image (Ánh,Thuận)');
    figure, imshow(uint8(expandedImage)), title('Expanded Image by Bilinear Interpolation (Ánh,Thuận)');
end