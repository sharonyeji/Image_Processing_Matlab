L1 = imread('cameraman.jpg');
L1 = im2double(L1(:,:,1));
L2 = rand(256);

[U,S,V] = svd(L1);
[U2,S2,V2] = svd(L2);

rank1_L1 = (S(1,1)*U(:,1)')'*V(:,1)';
rank1_L2 = (S2(1,1)*U2(:,1)')'*V2(:,1)';

rank2_L1 = (S(1:2,1:2)*U(:,1:2)')'*V(:,1:2)';
rank2_L2 = (S2(1:2,1:2)*U2(:,1:2)')'*V2(:,1:2)';

rank4_L1 = (S(1:4,1:4)*U(:,1:4)')'*V(:,1:4)';
rank4_L2 = (S2(1:4,1:4)*U2(:,1:4)')'*V2(:,1:4)';

rank8_L1 = (S(1:8,1:8)*U(:,1:8)')'*V(:,1:8)';
rank8_L2 = (S2(1:8,1:8)*U2(:,1:8)')'*V2(:,1:8)';

rank16_L1 = (S(1:16,1:16)*U(:,1:16)')'*V(:,1:16)';
rank16_L2 = (S2(1:16,1:16)*U2(:,1:16)')'*V2(:,1:16)';

rank32_L1 = (S(1:32,1:32)*U(:,1:32)')'*V(:,1:32)';
rank32_L2 = (S2(1:32,1:32)*U2(:,1:32)')'*V2(:,1:32)';

rank64_L1 = (S(1:64,1:64)*U(:,1:64)')'*V(:,1:64)';
rank64_L2 = (S2(1:64,1:64)*U2(:,1:64)')'*V2(:,1:64)';

rank128_L1 = (S(1:128,1:128)*U(:,1:128)')'*V(:,1:128)';
rank128_L2 = (S2(1:128,1:128)*U2(:,1:128)')'*V2(:,1:128)';

figure(1), subplot(3,3,1),imagesc(L1);
subplot(3,3,2),imagesc(rank1_L1);
subplot(3,3,3),imagesc(rank2_L1);
subplot(3,3,4),imagesc(rank4_L1);
subplot(3,3,5),imagesc(rank8_L1);
subplot(3,3,6),imagesc(rank16_L1);
subplot(3,3,7),imagesc(rank32_L1);
subplot(3,3,8),imagesc(rank64_L1);
subplot(3,3,9),imagesc(rank128_L1);
colormap('gray');

figure(2), subplot(3,3,1),imagesc(L2);
subplot(3,3,2),imagesc(rank1_L2);
subplot(3,3,3),imagesc(rank2_L2);
subplot(3,3,4),imagesc(rank4_L2);
subplot(3,3,5),imagesc(rank8_L2);
subplot(3,3,6),imagesc(rank16_L2);
subplot(3,3,7),imagesc(rank32_L2);
subplot(3,3,8),imagesc(rank64_L2);
subplot(3,3,9),imagesc(rank128_L2);
colormap('gray');

x1=1:225;
x2=1:256;
figure(3),subplot(1,2,1);
plot(x1,sum(S));
title('Decay of S for L1');
subplot(1,2,2);
plot(x2,sum(S2));
title('Decay of S for L2');

Erel1_L1 = sqrt(sum(sum((L1-rank1_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel2_L1 = sqrt(sum(sum((L1-rank2_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel4_L1 = sqrt(sum(sum((L1-rank4_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel8_L1 = sqrt(sum(sum((L1-rank8_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel16_L1 = sqrt(sum(sum((L1-rank16_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel32_L1 = sqrt(sum(sum((L1-rank32_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel64_L1 = sqrt(sum(sum((L1-rank64_L1).^2)))/sqrt(sum(sum(L1.^2)));
Erel128_L1 = sqrt(sum(sum((L1-rank128_L1).^2)))/sqrt(sum(sum(L1.^2)));

Erel1_L2 = sqrt(sum(sum((L2-rank1_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel2_L2 = sqrt(sum(sum((L2-rank2_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel4_L2 = sqrt(sum(sum((L2-rank4_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel8_L2 = sqrt(sum(sum((L2-rank8_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel16_L2 = sqrt(sum(sum((L2-rank16_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel32_L2 = sqrt(sum(sum((L2-rank32_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel64_L2 = sqrt(sum(sum((L2-rank64_L2).^2)))/sqrt(sum(sum(L2.^2)))
Erel128_L2 = sqrt(sum(sum((L2-rank128_L2).^2)))/sqrt(sum(sum(L2.^2)))