
function skewed_image = skewImage(img,skewTheta)% function with outputs

% Compute the padding needed. The rows remains same, but number of cols
% will depend on the angle of shear.
[imgR,imgC,a] = size(img);
outImgCols = imgC + ceil(imgR*tand(skewTheta));
outImgRows = imgR;
A = a;
% Allocate output image
skewed_image = zeros(outImgRows,outImgCols,A,'like',img);
invSkewMatrix = [1,-tand(skewTheta);0,1];

% Inverse map the output coordinates to nearest input coordinate.
for cIter = 1:outImgCols
    for rIter = 1:outImgRows
        inpCoords = invSkewMatrix*[cIter;rIter];
        
        cInp = round(inpCoords(1));
        rInp = round(inpCoords(2));

        if (cInp > 0 && cInp <= imgC) && (rInp > 0 && rInp <= imgR)
            skewed_image(rIter,cIter,:) = img(rInp,cInp,:);
        end
    end
end

end
