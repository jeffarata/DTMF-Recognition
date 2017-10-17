% Use this program to test the accuracy of the student's DTMF decoder,
% which must be in file dtmf.m
%
% Written by Joe Hoffbeck 4/7/02

N = 4;     % number of different tone generators (phones)

correct = 0;    % initialize counter
for i = 1:N,    % counter for different tone generators
    for j = 1:12,   % counter for different buttons
      filename = ['dtmf_training_files/Button',int2str(j),'_',int2str(i),'.wav'];     % build filename
      [x,fs] = wavread(filename);        % load file
      y = dtmf(x,fs);       % call DTMF decoder 
      if y == j,
         correct = correct + 1;
      else
         fprintf('%s was recognized incorrectly.\n',filename)
      end
    end
end

fprintf('You got %d correct out of %d on DTMF training samples\n',correct,12*N);

correct = 0;    % initialize counter
for i = 1:N,    % counter for different tone generators
    for j = 1:12,   % counter for different buttons
      filename = ['dtmf_test_files/Button',int2str(j),'_',int2str(i),'.wav'];     % build filename
      [x,fs] = wavread(filename);        % load file
      y = dtmf(x,fs);       % call DTMF decoder 
      if y == j,
         correct = correct + 1;
      else
         fprintf('%s was recognized incorrectly.\n',filename)
      end
    end
end

fprintf('You got %d correct out of %d on DTMF test samples\n\n\n\n',correct,12*N);

