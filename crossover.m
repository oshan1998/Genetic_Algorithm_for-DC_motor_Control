% used to cross two parents on all possible patterns and generate the
% result

function child = crossover(parent1, parent2)
    r = rand();
    
    child = zeros(3,1);
    
    if (r < 1/6)
        child(1,1) = parent1(1,1);
        child(2,1) = parent1(2,1);
        child(3,1) = parent1(3,1);
        
    elseif (r < 2/6)
        child(1,1) = parent2(1,1);
        child(2,1) = parent1(2,1);
        child(3,1) = parent1(3,1);
        
    elseif (r < 3/6)
        child(1,1) = parent1(1,1);
        child(2,1) = parent2(2,1);
        child(3,1) = parent1(3,1);
        
    elseif (r < 4/6)
        child(1,1) = parent2(1,1);
        child(2,1) = parent2(2,1);
        child(3,1) = parent1(3,1);
        
    elseif (r < 5/6)
        child(1,1) = parent2(1,1);
        child(2,1) = parent1(2,1);
        child(3,1) = parent2(3,1);
        
    else
        child(1,1) = parent2(1,1);
        child(2,1) = parent2(2,1);
        child(3,1) = parent2(3,1);
        
    end

end