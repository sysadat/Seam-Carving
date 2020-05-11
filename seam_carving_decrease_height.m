% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
pragueImg = imread('inputSeamCarvingPrague.jpg');

for i = 1 : 50 
    energyImg = energy_img(pragueImg);
    [pragueImg, energyImg] = decrease_height(pragueImg, energyImg);
end
imwrite(pragueImg, 'outputReduceHeightPrague.png');