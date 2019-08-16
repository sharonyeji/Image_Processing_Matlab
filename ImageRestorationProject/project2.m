I = imread('bright_bro.jpg');

R=imhist(I(:,:,1));
G=imhist(I(:,:,2));
B=imhist(I(:,:,3));

figure(2), plot(R,'r')
hold on, plot(G,'g')
plot(B,'b'), legend(' Red channel','Green channel','Blue channel');
hold off,

limits = stretchlim(I,0.02);
I2 = imadjust(I, limits, []);

R2=imhist(I2(:,:,1));
G2=imhist(I2(:,:,2));
B2=imhist(I2(:,:,3));

figure(4), plot(R2,'r')
hold on, plot(G2,'g')
plot(B2,'b'), legend(' Red channel','Green channel','Blue channel');
hold off,

HSVimg = rgb2hsv(I2);

for ch=2:3
    HSVimg(:,:,ch) = imadjust(HSVimg(:,:,ch), stretchlim(HSVimg(:,:,ch), 0.01));
end

RGB = hsv2rgb(HSVimg);

figure(5),imshow(I);title('Before Histogram Equalization');

figure(6),imshow(RGB);title('After Histogram Equalization');

mean(mean(rms(I)))
mean(mean(rms(RGB)))