I = imread('Moon.jpg');
colormap(gray);

second_der = [1 1 1; 1 -8 1; 1 1 1];

laplace = imfilter(I,second_der);

I2 = I - laplace;

subplot(1,3,1),imagesc(I);
subplot(1,3,2), imagesc(laplace);
subplot(1,3,3), imagesc(I2);
