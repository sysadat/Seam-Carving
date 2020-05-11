% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
pragueImg = imread('inputSeamCarvingPrague.jpg');
disp(size(pragueImg));

%mallImg = imread('inputSeamCarvingMall.jpg');
%disp(size(mallImg));

for i = 1 : 100 
    energyImg = energy_img(pragueImg);
    [pragueImg, energyImg] = decrease_width(pragueImg, energyImg);
    
    %energyImg = energy_img(mallImg);
    %[mallImg, energyImg] = decrease_width(mallImg, energyImg);
end
%imagesc(pragueImg);
disp(size(pragueImg));
imwrite(pragueImg, 'outputReduceWidthPrague.png');

%imagesc(mallImg);
%disp(size(mallImg));
%imwrite(mallImg, 'outputReduceWidthMall.png');
