% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
function view_seam(im,seam,seamDirection)

[rowMax, colMax, ~] = size(im);

if strcmp(seamDirection, 'HORIZONTAL')
    xVals = [1 : colMax];
    yVals = seam; 
    
    imagesc(im);
    hold on
    
    scatter(xVals, yVals, 1, [1 0 0]);
    
end

if strcmp(seamDirection, 'VERTICAL')
    xVals = seam;
    yVals = [1 : rowMax];
    
    imagesc(im);
    hold on
    
    scatter(xVals, yVals, 1, [1 0 0]);
    
end

end

