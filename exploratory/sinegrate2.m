close all;
clear all;
frequency = 10;
phase = 90;
amplitude = 1;
[X,Y]=meshgrid(0:0.001:1,0:0.001:1);
% X = square(X);
Z = amplitude*sin((2*3.1415*frequency.*X)+(phase));
surf(X,Y,Z)
shading interp
view(0,90)
% colormap gray
axis off
axis square 
% saveas(gcf,'image.jpg')
% 
% XX=fft2(xx);
% figure(1);
% mesh(xx);
% figure(2);
% mesh(abs(fftshift(XX)));

% XX=fft2(Z);
% figure(2);
% mesh(Z);
% % colormap gray
% figure(3);
% mesh(abs(fftshift(XX)));