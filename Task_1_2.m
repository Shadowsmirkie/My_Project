clc
clear all
close all

I = imread("NAME.png");
imshow(I); title("Original Image");

rotAngles = [30 60 120 -50];

I2 = I;

figure
for i = 1 : 4
   rotImage = imgRotation(I2,rotAngles(i));
   
   subplot(2,4,i)
   imshow(rotImage);
   I2 = rotImage;
   
end


skewAngles = [10 40 60];

for j = 1 : 3
    
    skewI = skewImage(I2,skewAngles(j));
    
    subplot(2,4,j+4)
    imshow(skewI);
    I3 = skewI;
end

% figure
% subplot(2,2,1);
% imshow(I); title("Original Image");
% subplot(2,2,2);
% imshow(rotImage);title("Rotated Image")
% 
% 
% subplot(2,2,3);
% imshow(I2);
% subplot(2,2,4);
% imshow(skewI);