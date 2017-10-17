% Jeff Arata
% 10/4/17

% This project and the associated files were provided by Joe Hoffbeck and
% are found in his paper "Enhance Your DSP Course With These Interesting
% Projects.pdf"

function [ output ] = my_dtmf( x, fs )
% This function takes in an audio signal, x, and its sampling frequency,
% fs, and outputs which button on a telephone was pressed, according to the
% table:
%
%        Output | Button
%           1   |   1
%           2   |   2
%           3   |   3
%           4   |   4
%           5   |   5
%           6   |   6
%           7   |   7
%           8   |   8
%           9   |   9
%           10  |   *
%           11  |   0
%           12  |   #
%

buttons = [1,   2,  3;
           4,   5,  6;
           7,   8,  9;
           10, 11, 12];
       
row_freq = [697;
            770;
            852;
            941];

col_freq = [1209, 1336, 1477];

N = 512;

col_idx = round(col_freq * N / fs);
row_idx = round(row_freq * N / fs);

fft_start = floor(length(x)/2 - N/2);

X = abs(fft(x(fft_start:fft_start + N -1)));

[val, col] = max(X(col_idx));
[val, row] = max(X(row_idx));

output = buttons(row, col);



end

