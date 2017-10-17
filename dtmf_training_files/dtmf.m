function output = dtmf(x,fs)
% Algorithm for deciding which DTMF tone is in the audio signal in vector x.
% x (vector) input audio signal
% fs (scalar) sampling frequency in Hz 
% output (scalar) integer value between 1 and 12 that corresponds 
%  to the button as follows:
%   output | Button
%   -------|--------
%     1    |    1
%     2    |    2
%     3    |    3
%     4    |    4
%     5    |    5
%     6    |    6
%     7    |    7
%     8    |    8
%     9    |    9
%    10    |    *
%    11    |    0
%    12    |    #

% list of the outputs for each button
Button = [
    1,2,3;      % values for buttons 1,2,3
    4,5,6;      % values for buttons 4,5,6
    7,8,9;      % values for buttons 7,8,9
    10,11,12];  % values for buttons *,0,#

N = 512;    % length of DFT
row_k_values = round([697 770 852 941]*N/fs);   % k values at DTMF row frequencies
col_k_values = round([1209 1336 1477]*N/fs);    % k values at DTMF col frequencies
start = round(length(x)/2-N/2); % start DFT in center of recording
X = fft(x(start:start+N-1));    % take length N DFT 
[tmp,r] = max(abs(X(row_k_values)));    % Find row frequency with highest magnitude
[tmp,c] = max(abs(X(col_k_values)));    % Find col frequency with highest magnitude

% output 
output = Button(r,c);
