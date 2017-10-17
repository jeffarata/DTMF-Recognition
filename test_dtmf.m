% Jeff Arata
% 10/4/17

% This project and the associated files were provided by Joe Hoffbeck and
% are found in his paper "Enhance Your DSP Course With These Interesting
% Projects.pdf"

% my_test_dtmf.m

clear;
clc;


[x, fs] = audioread('dtmf_training_files\Button1_1.wav');

X = abs(fft(x))';

N = length(x);

freq_ax = linspace(0, fs/2, floor(N/2 + 1));

PSD = (1/(fs*N)) * (X(1:floor(N/2 + 1)) .^ 2);
PSD(2:end-1) = 2*PSD(2:end-1);
PSD = 10*log10(PSD./freq_ax);

%pxx = pwelch(x)


figure(1)
plot(freq_ax, PSD)
%plot(pxx)


N_files = 48;

correct = 0;

for ii = 1:12
    for jj = 1:4
        filename = ['dtmf_training_files\Button', int2str(ii), '_', int2str(jj), '.wav'];
        [x, fs] = audioread(filename);        
        output = my_dtmf(x, fs);
        
        if output == ii
           correct = correct + 1; 
        end  
    end
end

fprintf('Your algorithm got %d DTMF Buttons correct out of %d for the training files.\n', correct, N_files)


correct = 0;

for ii = 1:12
    for jj = 1:4
        filename = ['dtmf_test_files\Button', int2str(ii), '_', int2str(jj), '.wav'];
        [x, fs] = audioread(filename);        
        output = my_dtmf(x, fs);
        
        if output == ii
           correct = correct + 1; 
        end  
    end
end

fprintf('Your algorithm got %d DTMF Buttons correct out of %d for the test files.\n', correct, N_files)
