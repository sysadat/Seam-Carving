% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
function energyImg = energy_img(im)
    grayScaleImg = double(rgb2gray(im));
    xFilter = [-1, 1];
    yFilter = [-1; 1];
    dx = imfilter(grayScaleImg, xFilter);
    dy = imfilter(grayScaleImg, yFilter);
    energyImg = sqrt(dx.^2 + dy.^2);
end

