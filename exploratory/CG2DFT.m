% 2D Fourier Transform
% Chhavi Goenka
% teaching method adapted from Iain Collings
close all;
clear all;
% Sinusoid

N=10; % Number of cycles in the sin wave
Step=0.1; % Resolution
NN=N/Step;
x=sin(2*pi*[0:Step:N-Step]);
xx=zeros(NN,NN);
for i=1:NN
xx(i,:)=x;
end

XX=fft2(xx);
figure(1);
mesh(xx);
colorbar;
figure(2);
mesh(abs(fftshift(XX)));


x=sin(2*pi*[0:Step:N-Step]);
figure(3);
plot(x);
X = fft(x);
figure(4);
plot(abs(fftshift(X)));

% I = imread('sinegrate.png');
% Ig = im2gray(I);
% Y = fft2(Ig);
% 
% Y1 = abs(Y);
% 
% Y2 = log(abs(Y));
% 
% Y3 = log(abs(fftshift(Y)));
% 
% imtool(Y1,[]);
% imtool(Y2,[]);
% imtool(Y3,[]);
% figure;
% imshow(Ig);

% sinusoid in different direction
N2=5; % Number of cycles in the sin wave
Step2=0.1; % Resolution
NN2=N2/Step2;
x2=sin(2*pi*[0:Step2:N2-Step2]);
xx2=zeros(NN2,NN2);
for i2=1:NN2
xx2(:,i2)=x2;
end

XX2=fft2(xx2);
figure(5);
mesh(xx2);
figure(6);
mesh(abs(fftshift(XX2)));

figure(7);
plot(x2);
X2 = fft(x2);
figure(8);
plot(abs(fftshift(X2)));

% adding the 2 perpendicular sinusoids
xxcombo = xx+xx2;
XXcombo=fft2(xxcombo);
figure(9);
mesh(xxcombo);
figure(10);
mesh(abs(fftshift(XXcombo)));
