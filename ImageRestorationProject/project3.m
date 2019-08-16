I = im2double(imread('blue2_outside.jpg'));
G = imread('gray2_outside.jpg');
B = imhistmatch(I, G);

limits = stretchlim(B,0.02);
I2 = imadjust(B, limits, []);
K = medfilt3(I2);

HSVimg = rgb2hsv(K);
Ihsv = rgb2hsv(I);

for ch=2:3
    HSVimg(:,:,ch) = imadjust(HSVimg(:,:,ch), stretchlim(HSVimg(:,:,ch), 0.01));
end

hue_angle1 = mean(mean(Ihsv(:,:,1)))*360
hue_angle2 = mean(mean(HSVimg(:,:,1)))*360

c1 = mean(mean(Ihsv(:,:,2)))
c2 = mean(mean(HSVimg(:,:,2)))

RGB = hsv2rgb(HSVimg);

figure(1),imagesc(I);
figure(2),imagesc(B);
figure(3),imagesc(K);
figure(4),imagesc(RGB);