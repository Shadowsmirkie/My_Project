function imgRotated = imgRotation(image,theta1)
[imgR0, imgC0,a] = size(image); %rows & columns of the reference image



% padImg = zeros(imgR0*2, imgC0*2,'like',img); % padding
% padImg(rOffset:rOffset+imgR0-1,cOffset:cOffset+imgC0-1) = img;
% [imgR1, imgC1] = size(padImg);%rows and columns of the padded image

rotMat = [cosd(theta1),-sind(theta1);% Inverse of the rotation matrix
          sind(theta1), cosd(theta1)]; %Inverse(rotMat) = transpose(rotMat)


rotimgh = round(abs(imgC0*sind(theta1))) + round(abs(imgR0*cosd(theta1)));
rotimgw = round(abs(imgR0*cosd(theta1))) + round(abs(imgC0*sind(theta1)));

imgRotated = zeros(rotimgh,rotimgw,a,'like',image);
[imgR1, imgC1,~] = size(imgRotated);


% \declaring the size of rotated image and type same as PadImg
% rowOffset = round(imgR1/2);% rounding of decimals if the size value is odd
% colOffset = round(imgC1/2);
% rowOffset = round((imgR1)/4.6);
% colOffset = round((imgC1)/1.5);
% rowOffset = round((imgR1*cosd(thetaVal))/2);
% colOffset = round((imgC1*sind(thetaVal))/2);
rowOffset = round(imgR0/2); % original image offsets
colOffset = round(imgC0/2);

rowOffset1 = round(imgR1/2);% rotated image offset
colOffset1 = round(imgC1/2);


for i = 1:imgR1
    for j = 1:imgC1

        newCoord = rotMat*[i-rowOffset1;j-colOffset1];% rotating and then skewing

        iRot = round(newCoord(1)+(rowOffset));% fitting the image via offset values
        jRot = round(newCoord(2)+(colOffset));

        if 0 < iRot && iRot <= imgR0 && ...
                0 < jRot && jRot <= imgC0
            imgRotated(i,j,:) = image(iRot,jRot,:); % matching pixel value by position
        end
    end
end


end
