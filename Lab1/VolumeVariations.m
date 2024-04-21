%% Date: 4/4/2024
%Laboratory 1: Elementary Music Synthesis
% 5.2. Volume Variations 
%% Input
fs = 8000;      %Sampling rate
tnote = 4000;   %Duration of 4000 samples for 1 count
whole_note = 1:4*tnote;  % last 4 count
half_note = 1:2*tnote;   % last 2 count
fourth_note = 1:tnote;   % last 1 count

% Notes frequency (220-440Hz)
pitch = 2^(1/12); % pitch shift
%Notes used in Figure 2
A = 220;    
B = A*(pitch^2);
C = A*(pitch^3);
E = A*(pitch^7);

%% Processing
% Notes in Figure 2
N1 = sin(2*pi*A*half_note/fs);   % A half_note
N2 = sin(2*pi*A*fourth_note/fs); % A fourth_note   
N3 = sin(2*pi*E*fourth_note/fs); % E fourth_note
N4 = sin(2*pi*B*fourth_note/fs); % B fourth_note
N5 = sin(2*pi*C*fourth_note/fs); % C fourth_note
N6 = sin(2*pi*A*whole_note/fs);  % A whole_note
P = zeros(1,1000);  % silent gap

%% Output
% Combine notes
Se = [adsr(N1) P adsr(N2) P adsr(N3) P adsr(N3) P adsr(N3) P adsr(N4) P adsr(N5) P adsr(N4) P adsr(N6)];
% Plot sample ADSR
figure;plot(adsr(N1));
title("A sample when applying ADSR (note A) ( Ánh, Thuận)");
% Plot Se
figure;plot(Se);
title("Volume variation visualization ( Ánh, Thuận)");
% Play sound
sound(Se,fs);
% remmber click Run command, do not evaluata because we use function below
%% Function to apply ADSR 
function newNode = adsr(note)
    L = length(note);
    A = linspace(0, 1, 0.1*L);
    D = linspace(1, 0.85, 0.1*L);
    S = linspace(0.85, 0.85, 0.5*L);
    R = linspace(0.85, 0, 0.3*L);
    newNode = note.*[A, D, S, R];
end



