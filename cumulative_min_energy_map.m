% Abdullah Mohammed (914923231)
% Sayed Yoseph Sadat (914290757)
function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
    cumulativeEnergyMap = energyImg;
    [rows, cols] = size(energyImg);
    
    if strcmp(seamDirection, 'HORIZONTAL')
        cumulativeEnergyMap(:,1) = energyImg(:,1);
        for c = 2:cols
            for r = 1:rows
                if (r == 1)
                    cumulativeEnergyMap(r,c) = energyImg(r,c) + min([cumulativeEnergyMap(r,c-1),cumulativeEnergyMap(r+1,c-1)]);
                    continue
                end
                if (r == rows)
                    cumulativeEnergyMap(r,c) = energyImg(r,c) + min([cumulativeEnergyMap(r,c-1),cumulativeEnergyMap(r-1,c-1)]);
                    continue
                end
                cumulativeEnergyMap(r,c) = energyImg(r,c)+ min([cumulativeEnergyMap(r+1,c-1),cumulativeEnergyMap(r,c-1),cumulativeEnergyMap(r-1,c-1)]);
            end
        end
    elseif strcmp(seamDirection, 'VERTICAL')
        cumulativeEnergyMap(1,:) = energyImg(1,:);
        for r = 2:rows
            for c = 1:cols
                if (c == 1)
                    cumulativeEnergyMap(r,c) = energyImg(r,c) + min([cumulativeEnergyMap(r-1,c),cumulativeEnergyMap(r-1,c+1)]);
                    continue
                end
                if (c == cols)
                    cumulativeEnergyMap(r,c) = energyImg(r,c) + min([cumulativeEnergyMap(r-1,c),cumulativeEnergyMap(r-1,c-1)]);
                    continue
                end
                cumulativeEnergyMap(r,c) = energyImg(r,c)+ min([cumulativeEnergyMap(r-1,c),cumulativeEnergyMap(r-1,c+1),cumulativeEnergyMap(r-1,c-1)]);
            end
        end
    end
    
end

