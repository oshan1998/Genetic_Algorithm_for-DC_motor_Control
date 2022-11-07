% function is used to generate an initial population with random kp,ki,kd
% values

function pop = generateIntialPopulation(populationSize, sys)
    max_gain = 150;
    
    pop = zeros(4, populationSize);
    
    for i=1:populationSize
        pop(1:3, i) = rand(3,1)*max_gain;  
    end
    
    for i=1:populationSize
        kp = pop(1,i);
        ki = pop(2,i);
        kd = pop(3,i);
        
        pop(4,i) = calculateFitness(sys,kp,ki,kd);
    end
end
