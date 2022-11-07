% parents are selected based on Roulette Wheel Selection
function [parent1, parent2] = selectParents(population)
    fitnesses = population(4,:);
    
    fitnesses = fitnesses/sum(fitnesses);
    
    parent_1_probability = rand();
    parent_2_probability = rand();
    
    cumalative_sum = 0;
    
    num_selected_parents = 0;
    
    for i=1:length(fitnesses)
        
        if (num_selected_parents == 2)
            break
        end
        
        if (parent_1_probability >= cumalative_sum && parent_1_probability <= cumalative_sum + fitnesses(1,i))
            parent1 = population(:,i);
            num_selected_parents = num_selected_parents + 1;
        end
        
        if (parent_2_probability >= cumalative_sum && parent_2_probability <= cumalative_sum + fitnesses(1,i))
            parent2 = population(:,i);
            num_selected_parents = num_selected_parents + 1;
        end
        
        cumalative_sum = cumalative_sum +  fitnesses(1,i);
    end
    
    
end