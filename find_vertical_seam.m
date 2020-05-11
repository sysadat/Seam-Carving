% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    [rows, cols] = size(cumulativeEnergyMap);
    verticalSeam = zeros(rows, 1);
    [~,smallestCol] = min(cumulativeEnergyMap(rows,:)); 
    verticalSeam(rows) = smallestCol;
    
    for i=rows-1:-1:1
        if smallestCol == 1
            index = smallestCol + 1;
            currColHere = cumulativeEnergyMap(i, smallestCol);
            currColNext = cumulativeEnergyMap(i, index);
            smallestOfTwo = min(currColHere, currColNext);
            if smallestOfTwo == currColHere
            elseif smallestOfTwo == currColNext
                smallestCol = index; 
            end
        elseif smallestCol == cols
            secondIndex = smallestCol - 1;
            newCurrColHere = cumulativeEnergyMap(i, smallestCol);
            currColPrev = cumulativeEnergyMap(i, secondIndex);
            smallestColHere = min(newCurrColHere, currColPrev);
            if smallestColHere == currColPrev
                smallestCol = secondIndex;
            end
        elseif smallestCol > 1 && smallestCol < cols
            prevIndex = smallestCol - 1;
            nextIndex = smallestCol + 1;
            currColNow = cumulativeEnergyMap(i, smallestCol);
            currColNowPrev = cumulativeEnergyMap(i, prevIndex);
            currColNowNext = cumulativeEnergyMap(i, nextIndex);
            smallestFirstTwo = min(currColNow, currColNowPrev); 
            smallestTotal = min(smallestFirstTwo,currColNowNext);
            if smallestTotal == currColNowPrev
                smallestCol = prevIndex;
            elseif smallestTotal == currColNow
            else
                smallestCol = nextIndex;
            end
        end
    verticalSeam(i) = smallestCol;    
    end
end

