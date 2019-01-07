clear all
close all

formatArray = [2,16384];
file301 = fopen('../assets/301.sc');
file303 = fopen('../assets/303.sc');
data301 = fread(file301, formatArray, 'int16');
data303 = fread(file303, formatArray, 'int16');
barker13 = [1,1,1,1,1,-1,-1,1,1,-1,1,-1,1];

function x = BarkerEstimator(data, barker)
  reshapeData = data(1,:) + i*data(2,:);
  complex = transpose(reshape(reshapeData,64,256));
  for i=1:1:256
    correlateData(i,:) = conv(fliplr(barker),complex(i,:));
  end
  Power = abs(correlateData).^2;
  figure
  plot (mean(Power))
end

function y = PulseEstimator(data)
  reshapeData = data(1,:) + i*data(2,:);
  complex = transpose(reshape(reshapeData,64,256));
  Power = abs(complex).^2;
  figure
  plot (mean(Power))
end

function a = FFTPuse(data)
  reshapeData = data301(1,:) + i*data301(2,:);
  complex = transpose(reshape(reshapeData,64,256));
  FFT = fft(complex,[],1)
  plot(fftshift(abs(FFT)))
end

PulseEstimator(data301)
BarkerEstimator(data303, barker13)