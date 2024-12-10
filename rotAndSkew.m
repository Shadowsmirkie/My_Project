function outImage = rotAndSkew(image,rotTheta,skewTheta)

% Performing rotation and skewing
rotatedImage = imgRotation(image,rotTheta);



outImage = skewImage(rotatedImage,skewTheta);

figure
subplot(1,3,1);
imshow(image);title("Input Image");
subplot(1,3,2);
imshow(rotatedImage); title("After rotation");
subplot(1,3,3)
imshow(outImage);title("Rotation -> Skewing");
end