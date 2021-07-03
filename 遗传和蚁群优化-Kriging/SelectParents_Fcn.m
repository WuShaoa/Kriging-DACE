function SlectedIndexes = SelectParents_Fcn(Cost,SelectionNum,Mode)
switch Mode
    case 1 % Tournment Selection
        PopSize = numel(Cost);
        for ii = 1:SelectionNum
            R = randperm(PopSize);
            SI = R(1:4);
            CostSI = Cost(SI);
            F = find(CostSI == min(CostSI)); F = F(1);
            SlectedIndexes(ii) = SI(F);
        end
        
        
        
        
        
        
        
        
        
        
        
    case 2 % Roulette Wheel
        
        
    case 3 % Random Pairing
        
end
end