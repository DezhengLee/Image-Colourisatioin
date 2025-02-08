clear all
close all
clc

sigma1 = 100;
sigma2 = 100;
p = 1/2;
delta = 2e-4;
KernelFcn = "CSRBF";
roundScheme = "MinMax";


filename = 'D:\MyDesktop\MMSC Materials\Case Study _ SC\Project_Image_Colourisation\ImageColourisationApp\Pics\peppers.png';
orImg = imread(filename);
greyImg = genGreyImg(filename);
mask = genRand(orImg, 0.4);
comb = combineMaskedImg(orImg, greyImg, mask);
imshow(comb)

length(find(mask))

KD = genKD(mask, greyImg, sigma1, sigma2, p, KernelFcn);

fr = genfs(comb, mask, 1);
fg = genfs(comb, mask, 2);
fb = genfs(comb, mask, 3);

ar = genAs(KD, delta, fr);
ag = genAs(KD, delta, fg);
ab = genAs(KD, delta, fb);

reImg = recoverImg(ar, ag, ab, mask, greyImg, sigma1, sigma2, p, KernelFcn, roundScheme);

imshow(reImg)

% reImgr = uint8(reImg(:, :, 1));
% reImgg = uint8(reImg(:, :, 2));
% reImgb = uint8(reImg(:, :, 3));
% 
% Imgr = orImg(:, :, 1);
% Imgg = orImg(:, :, 2);
% Imgb = orImg(:, :, 3);
% 
% 
% reImg(:, :, 1) = reImgr;
% reImg(:, :, 2) = reImgg;
% reImg(:, :, 3) = reImgb;



% rDif = reImgr - Imgr;
% gDif = reImgg - Imgg;
% bDif = reImgb - Imgb;
% heatmap(rDif)
% 
% h = heatmap(rDif);
% h.GridVisible = 'on';  % 显示网格

