% Use this program to test the accuracy of your DTMF recognition 
% program.
% The training files are named buttonX_Y.wav 
% where Y is 1, 2, 3, or 4 depending on which device was recorded
% and X is given by the following table:
%
%     X    | Button
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

% Written by Joe Hoffbeck 10/24/08

N = 4;     % number of different devices

correct = 0;    % initialize counter
for i = 1:N,    % counter for different tone generators
    for j = 1:12,   % counter for different buttons
      filename = ['dtmf_training_files/Button',int2str(j),'_',int2str(i),'.wav'];     % build filename
      [x,fs] = wavread(filename);        % load file
      y = dtmf(x,fs);       % run it through your program
      if y == j,
         correct = correct + 1;
      else
         fprintf('%s was recognized incorrectly.\n',filename)
      end
    end
end

fprintf('You got %d correct out of %d on the DTMF training files\n',correct,12*N);

