function outImage = skewAndRot(image,rotTheta,skewTheta)

% Performing skewing and rotation
skewedImage = skewImage(image,skewTheta);

outImage = imgRotation(skewedImage,rotTheta);

figure
subplot(1,3,1);
imshow(image);title("Input Image");
subplot(1,3,2);
imshow(skewedImage);
subplot(1,3,3);
imshow(outImage);title("Skewing -> Rotation");