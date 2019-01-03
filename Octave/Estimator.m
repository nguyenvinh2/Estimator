clear all
close all

formatArray = [2,16384]
file301 = fopen('../assets/301.sc')
data301 = fread(file301, formatArray, 'int16')

IQ301 = data301(1,:) + i*data301(2,:)
IQ301Reshape = mean(transpose(reshape(IQ301,256,64)),2)

barker13 = [1,1,1,1,1,-1,-1,1,1,-1,1,-1,1]

figure
plot (abs(IQ301Reshape).^2)

