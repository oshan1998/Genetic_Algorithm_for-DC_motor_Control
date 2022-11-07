function [newPop] = generateNewPopulation(oldPopulation,sys)
    
    
    
    newPop = zeros(4,8,200);
    
    mutation_probability = 0.1;
    cross_over_probability = 0.9;
    
    
    
    for i=1:200
        
        [parent1Idx, parent2Idx] = selectParents(oldPopulation);
        parent1 = oldPopulation(:,:,parent1Idx);
        parent2 = oldPopulation(:,:,parent2Idx);
        
        r = rand();
        
        if r < cross_over_probability
            [child1,child2] = crossover(parent1, parent2);
        else
            child1 = parent1(1:3,:);
            child2 = parent2(1:3,:);
        end
        
        r = rand();
        
        if r < mutation_probability
            child1 = mutation(child1, mutation_probability*4);
            child2 = mutation(child2, mutation_probability*4);
        end
        
        newPop(1:3,:,i) = child1;
        newPop(1:3,:,i+1) = child2;
        
        kp_1 = binaryVectorToDecimal(child1(1,:));
        ki_1 = binaryVectorToDecimal(child1(2,:));
        kd_1 = binaryVectorToDecimal(child1(3,:));
        kp_2 = binaryVectorToDecimal(child2(1,:));
        ki_2 = binaryVectorToDecimal(child2(2,:));
        kd_2 = binaryVectorToDecimal(child2(3,:));
        
        newCost_1 = calculateFitness(sys,kp_1,ki_1,kd_1);
        newCost_2 = calculateFitness(sys,kp_2,ki_2,kd_2);
        cost1 = zeros(1,8);
        cost2 = zeros(1,8);
        cost1(1,1) = newCost_1;
        cost2(1,1) = newCost_2;
        newPop(4,:,i) = cost1;
        newPop(4,:,i+1) = cost2;
        
    end
    
end