close all
clear all

t = 0:.05:4

Fs = linspace(-10,10,81)

y = sin(2*pi*t)

plot(t,y)
title("sin (2*pi*t")

F = fft(y)

figure
plot(Fs,abs(fftshift(F)))
xticks(-10:1:10)
title("FT of sin(2*pi*t)")
xlabel("Frequency")
ylabel("Correlation Strength")
