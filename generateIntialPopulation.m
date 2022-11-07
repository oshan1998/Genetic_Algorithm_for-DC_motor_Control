% function is used to generate an initial population with random kp,ki,kd
% values

function[ pop,cost] = generateIntialPopulation(populationSize,sys)
    %max_gain = 150;
    cost = zeors(1,100);
    nDigit = 8;
    pop = randi([0 1],1,3,nDigit,populationSize); 
    
    
    
    for i=1:populationSize
        kp = pop(1,:,i);
        ki = pop(2,:,i);
        kd = pop(3,:,i);
        
        cost(1,i) = calculateFitness(sys,kp,ki,kd);
    end
end
