% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
    [rows, cols] = size(cumulativeEnergyMap);
    horizontalSeam = zeros(rows, 1);
    [~, smallestRow] = min(cumulativeEnergyMap(:, cols)); 
    horizontalSeam(cols) = smallestRow;
    
    for i=cols-1:-1:1
        if smallestRow == 1
            index = smallestRow + 1;
            currRowHere = cumulativeEnergyMap(smallestRow, i);
            currRowNext = cumulativeEnergyMap(index, i);
            smallestOfTwo = min(currRowHere, currRowNext);
            if smallestOfTwo == currRowHere
            elseif smallestOfTwo == currRowNext
                smallestRow = index; 
            end
        elseif smallestRow == rows
            secondIndex = smallestRow - 1;
            newCurrRowHere = cumulativeEnergyMap(smallestRow, i);
            currRowPrev = cumulativeEnergyMap(secondIndex, i);
            smallestRowHere = min(newCurrRowHere, currRowPrev);
            if smallestRowHere == currRowPrev
                smallestRow = secondIndex;
            end
        elseif smallestRow > 1 && smallestRow < rows
            prevIndex = smallestRow - 1;
            nextIndex = smallestRow + 1;
            currRowNow = cumulativeEnergyMap(smallestRow, i);
            currRowNowPrev = cumulativeEnergyMap(prevIndex, i);
            currRowNowNext = cumulativeEnergyMap(nextIndex, i);
            smallestFirstTwo = min(currRowNow, currRowNowPrev); 
            smallestTotal = min(smallestFirstTwo,currRowNowNext);
            if smallestTotal == currRowNowPrev
                smallestRow = prevIndex;
            elseif smallestTotal == currRowNow
            else
                smallestRow = nextIndex;
            end         
        end
    horizontalSeam(i) = smallestRow;
    end
end

