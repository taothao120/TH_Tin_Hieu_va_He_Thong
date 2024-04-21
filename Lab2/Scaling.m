%% Date: 8/4/2024
%Laboratory 2: Introduction to Image Processing
% 4.2. Scaling (25%)
%% Read image
origin_image =imread('DailyShow.jpg','jpeg'); % read image
figure;imshow(origin_image); title("Original Image (Ánh, Thuận)"); % show image
SimpleScaling(2);
SimpleScaling(5);
AdvancedScaling(2);
AdvancedScaling(5);

%% Function for simple scaling
function simpleScaledImage = SimpleScaling(S)
    % Read image and convert to 8-bit gray format
    img = imread('DailyShow.jpg','jpeg');
    img = rgb2gray(img);

    % Calculte the size of new image
    [rows, cols] = size(img); 
    newRows = ceil(rows/S); % ceil: bounded upward rows/S (integers)
    newCols = ceil(cols/S);
    simpleScaledImage = zeros(newRows, newCols, 'uint8'); % create new image matrix = 0, uint8: 0 -255 

    for i = 1:newRows
        for j = 1:newCols
            if mod(S, 2) == 1
                % S odd: keeping the center pixel
                rowIdx = (i-1)*S + floor(S/2) + 1;
                colIdx = (j-1)*S + floor(S/2) + 1;
            else
                % S even: one of the 4 center pixels (left)
                rowIdx = (i-1)*S + (S/2);
                colIdx = (j-1)*S + (S/2);
            end
            simpleScaledImage(i, j) = img(rowIdx, colIdx);
        end
    end
    % Plot image
    figure;imshow(simpleScaledImage);
    title(['Simple Scaling with S = ', num2str(S), ' (Ánh,Thuận)']);
end

%% Function for advanced scaling
function advancedScaledImage = AdvancedScaling(S)
    % Read image and convert to 8-bit gray format
    img = imread('DailyShow.jpg','jpeg');
    img = rgb2gray(img);

    % Calculte the size of new image
    [rows, cols] = size(img); 
    newRows = ceil(rows/S); % ceil: bounded upward rows/S (integers)
    newCols = ceil(cols/S);
    advancedScaledImage = zeros(newRows, newCols, 'uint8'); % create new image matrix = 0, uint8: 0 -255

    for i = 1:newRows
        for j = 1:newCols
            % Calculate S*S block
            rowStart = (i-1)*S + 1;
            colStart = (j-1)*S + 1;
            rowEnd = min(rowStart + S - 1, rows); % using min to avoid un-boundary edge
            colEnd = min(colStart + S - 1, cols);
            child_block = img(rowStart:rowEnd, colStart:colEnd);
            advancedScaledImage(i, j) = mean(child_block(:));
        end
    end
    
    % Plot image
    figure;imshow(advancedScaledImage);
    title(['Advanced Scaling with S = ', num2str(S), ' (Ánh,Thuận)']);
end



