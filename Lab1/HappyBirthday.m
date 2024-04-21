%% Date: 4/4/2024
%Laboratory 1: Elementary Music Synthesis
% 5.4.  Favorite Music Synthesis
% Happy birthday
% For simple, we only play single notes 
%% Input
fs = 8000;      %Sampling rate
tnote = 4000;   %Duration of 4000 samples for 1 count
half_note = 1:2*tnote;   % last 2 count
fourth_note = 1:tnote;   % last 1 count

% Notes frequency (220-440Hz)
pitch = 2^(1/12); % pitch shift
%Notes in the 220-440 Hz octave
A = 440;   
C = A*(pitch^3);
D = A*(pitch^5);
E = A*(pitch^7);
F = A*(pitch^8);
G = A*(pitch^10);
A_h = A*(pitch^12);
D_h = A*(pitch^15);
A_sharp2 = 2*A*pitch;
%% Processing
% Notes in Figure 2
Cf = sin(2*pi*C*fourth_note/fs);
Df = sin(2*pi*D*fourth_note/fs);
Ff = sin(2*pi*F*fourth_note/fs);
Ef = sin(2*pi*E*fourth_note/fs);
Eh = sin(2*pi*E*half_note/fs);
Fh = sin(2*pi*F*half_note/fs);
Gf = sin(2*pi*G*fourth_note/fs);
A = sin(2*pi*A*fourth_note/fs);
A_sharpf = sin(2*pi*A_sharp2*fourth_note/fs);
A_hf = sin(2*pi*A_h*fourth_note/fs);
D_hf = sin(2*pi*D_h*fourth_note/fs);
P = zeros(1,1000);  % silent gap


%% Output
% 1. Music synthesis
S1 = [Cf P Cf P Df P Cf P Ff P Eh P Cf P Cf P Df P Cf P Gf P Fh P Cf P Cf P D_hf P A_hf P Ff P Ef P Df P A_sharpf P A_sharpf P A_hf P Ff P Gf P Fh];
%---------------------------------,-------------------------------,------------------------------------,------
% 2. Volume Variations
S2 = [adsr(Cf) P adsr(Cf) P adsr(Df) P adsr(Cf) P adsr(Ff) P adsr(Eh) P adsr(Cf) P adsr(Cf) P adsr(Df) P adsr(Cf) P adsr(Gf) P adsr(Fh) P adsr(Cf) P adsr(Cf) P adsr(D_hf) P adsr(A_hf) P adsr(Ff) P adsr(Ef) P adsr(Df) P adsr(A_sharpf) P adsr(A_sharpf) P adsr(A_hf) P adsr(Ff) P adsr(Gf) P adsr(Fh)];
% Play sound
sound(S1,fs);
pause(20);
sound(S2,fs);
pause(20);

% 3. Tone Overlapping
% Duration of overlap
overlap = tnote * 0.1;  % 10% of tnote
% Initial combined sequence with the first note
S3 = Cf;
% Combine each note with an overlap
AoNote = {Cf Df Cf Ff Eh Cf Cf Df Cf Gf Fh Cf Cf D_hf A_hf Ff Ef Df A_sharpf A_sharpf A_hf Ff Gf Fh};
for idx = 1:24
    S3 = combineWithOverlap(S3, AoNote{idx}, overlap);
end

% Play sound
sound(S3, fs);
audiowrite('HappyBirthday.wav', [S1, S2, S3],fs);

%% Function to combine two notes with overlap
function combined = combineWithOverlap(note1, note2, overlap)
    overlapPartNote1 = note1(end-round(overlap)+1:end) .* linspace(1, 0, round(overlap)); % overlap note 1
    overlapPartNote2 = note2(1:round(overlap)) .* linspace(0, 1, round(overlap)); % overlap note 2
    combined = [note1(1:end-round(overlap)) overlapPartNote1+overlapPartNote2 note2(round(overlap)+1:end)];
    %combined = adsr(combined);
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

