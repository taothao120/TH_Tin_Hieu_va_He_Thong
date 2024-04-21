function synthesize_music_with_overlap
    % Basic setup
    fs = 8000; % Sampling rate
    tnote = 4000; % Duration of a note in samples (1 count)
    overlap_duration = tnote / 4; % Overlap duration: 25% of the note's length

    % Frequencies for notes in the 220-440 Hz octave
    pitch = 2^(1/12); % Pitch shift for semitones
    A = 220; % Frequency of A note
    E = A * pitch^7;
    D = A * pitch^5;
    
    % Generate notes with sine waves
    N1 = sin(2 * pi * A * (1:2*tnote) / fs); % A half note
    N2 = sin(2 * pi * E * (1:tnote) / fs); % E fourth note
    N3 = sin(2 * pi * D * (1:4*tnote) / fs); % D whole note
    
    % Overlapping notes instead of just concatenating
    S = N1;
    S = overlap_notes(S, N2, overlap_duration, fs);
    S = overlap_notes(S, N3, overlap_duration, fs);

    % Play sound
    sound(S, fs);
end

function note_out = overlap_notes(note1, note2, overlap_dur, fs)
    % Function to overlap notes
    % Calculate the fade out for note1 and fade in for note2
    fade_out = linspace(1, 0, overlap_dur);
    fade_in = linspace(0, 1, overlap_dur);
    
    % Apply fade out to the end of note1
    note1_end = length(note1) - overlap_dur + 1:length(note1);
    note1(note1_end) = note1(note1_end) .* fade_out;
    
    % Apply fade in to the start of note2
    note2_start = 1:overlap_dur;
    note2(note2_start) = note2(note2_start) .* fade_in;
    
    % Overlap note2 start with note1 end
    note1(length(note1) - overlap_dur + 1:length(note1)) = ...
        note1(length(note1) - overlap_dur + 1:length(note1)) + note2(1:overlap_dur);
    
    % Concatenate note1 and the rest of note2
    note_out = [note1, note2(overlap_dur+1:end)];
end
