% Exercise 1: Fading of Images
colormap(gray)

C = imread('cat.jpg');
C = imresize(C, [168 260]);
C = double(C);

D = imread('puppy.jpg');
D = imresize(D, [168 260]);
D = double(D);

for k=1:15
    for i=1:168
        for j=1:260
            I(i,j) = C(i,j) + ((k/15)*(D(i,j) - C(i,j)));
        end
    end
    imagesc(I)
    drawnow
    pause(0.3)
end

% Exercise 3: Histogram Equalization
colormap(gray)
I = imread('albert.jpg');
subplot(2,2,1), imagesc(I);
I = double(I);

dim = size(I)
m = dim(1)
n = dim(2)

x = 1:256;
h = zeros(1,256);
count = 0
for i=1:m
    for j=1:n
        h(I(i,j)+1) = h(I(i,j)+1) + 1;
        count = count + 1;
    end
end
subplot(2,2,2), plot(x,h)
 
a = zeros(1,256);
for i=1:256
    a(i) = h(i)/(m*n);
end
 
suma = zeros(1,256);
b = 0;
for i = 1:255
    suma(i+1) = a(i) + b;
    b = suma(i+1);
end
 
for i = 1:m
    for j = 1:n
        J(i,j) = suma(I(i,j)+1);
    end
end
J = double(J);

J2 = zeros(1,256);
for i = 1:m
    for j = 1:n
        J2(i,j) = floor((256 - 1)*J(i,j) + 0.5);
    end
end
J2 = double(J2);
subplot(2,2,3),imagesc(J2)

count = 0;
x2 = 1:256;
h2 = zeros(1,256);
for i=1:m
    for j=1:n
        h2(J2(i,j)+1) = h2(J2(i,j)+1) + 1;
        count = count + 1;
    end
end
subplot(2,2,4), plot(x2,h2)