%% Date: 4/4/2024
%Laboratory 1: Elementary Music Synthesis
% 5.3. Tone Overlapping
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

%% Applying ADSR
N1 = adsr(N1);
N2 =  adsr(N2);   
N3 =  adsr(N3);
N4 =  adsr(N4);
N5 =  adsr(N5);
N6 =  adsr(N6);
%% overlapping notes
% Duration of overlap
overlap = tnote * 0.1;  % 10% of tnote
% Initial combined sequence with the first note
S = N1;
% Combine each note with an overlap
AoNote = {N2, N3, N3, N3, N4, N5, N4, N6};
for idx = 1:8
    S = combineWithOverlap(S, AoNote{idx}, overlap);
end
% Plot
plot(S);
title("Tone Overlap visualization ( Ánh, Thuận)");
% Play sound
sound(S, fs);

%% Function to combine two notes with overlap
function combined = combineWithOverlap(note1, note2, overlap)
    overlapPartNote1 = note1(end-round(overlap)+1:end) .* linspace(1, 0, round(overlap)); % overlap note 1
    overlapPartNote2 = note2(1:round(overlap)) .* linspace(0, 1, round(overlap)); % overlap note 2
    combined = [note1(1:end-round(overlap)) overlapPartNote1+overlapPartNote2 note2(round(overlap)+1:end)];
end

%% Function to apply ADSR 
function newNode = adsr(note)
    L = length(note);
    A = linspace(0, 1, 0.1*L);
    D = linspace(1, 0.85, 0.1*L);
    S = linspace(0.85, 0.85, 0.5*L);
    R = linspace(0.85, 0, 0.3*L);
    newNode = note.*[A, D, S, R];
end

