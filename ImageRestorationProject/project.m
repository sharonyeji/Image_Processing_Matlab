I = im2double(imread('blur_me.jpg'));
[m n a] = size(I);
F = fft2(I);
Fc = fftshift(F);

AF = abs(Fc);
M = max(max(max(AF)));
thres = M/1000;
Th = sum(sum(sum(F > thres)));
FM = Th./(m*n*a)

PSF=fspecial('laplacian',0.001);
noise_var = 0.0001;
estimated_nsr = noise_var / var(I(:));

J = deconvwnr(I, PSF, estimated_nsr);
G = I - J;

noisyR = G(:,:,1);
noisyG = G(:,:,2);
noisyB = G(:,:,3);

% Median Filter the channels:
denoised(:,:,1) = medfilt2(noisyR, [3 3]);
denoised(:,:,2) = medfilt2(noisyG, [3 3]);
denoised(:,:,3) = medfilt2(noisyB, [3 3]);

limits = stretchlim(G,0.02);
I2 = imadjust(G, limits, []);
I3 = imgaussfilt(I2,6);

figure(1), imagesc(I);
figure(2), imagesc(mat2gray(log(1+abs(Fc))));
figure(3), imagesc(G);
figure(4),imagesc(I3);

imwrite(I3,'I3.jpg');

I3 = im2double(imread('I3.jpg'));
[m3 n3 a3] = size(I3);

F2 = fft2(I3);
Fc2 = fftshift(I3);

AF2 = abs(Fc2);
M2 = max(max(max(AF2)));
thres2 = M2/1000;
Th2 = sum(sum(sum(F2 > thres2)));
FM2 = Th2./(m3*n3*a3)

figure(5), imagesc(mat2gray(log(1+abs(fftshift(F2)))));
%https://ac.els-cdn.com/S1877705813016007/1-s2.0-S1877705813016007-main.pdf?_tid=7dc2b18d-081d-4ad7-b3c4-a5ad86cca55b&acdnat=1525663603_a1d67b844c79c07e2a7daf3cca52a086
%https://prabugis.wordpress.com/2014/06/27/histogram-adjustments-in-matlab-stretching/