% function is used to generate an initial population with random kp,ki,kd
% values

function[ population] = generateIntialPopulation(populationSize,sys)
    %max_gain = 150;
    
    nDigit = 8;
    population = zeros(4,8,populationSize);
    for i=1:populationSize
        population(1,:,i) = randi([0 1],1,nDigit); 
        population(2,:,i) = randi([0 1],1,nDigit);
        population(3,:,i) = randi([0 1],1,nDigit);
        population(4,:,i) = ones(1,nDigit);
    end
%     population = randi([0 1],3,nDigit,populationSize); 
    
    
    
    for i=1:populationSize
        kp = binaryVectorToDecimal(population(1,:,i));
        ki = binaryVectorToDecimal(population(2,:,i));
        kd = binaryVectorToDecimal(population(3,:,i));
        
        
        cost = calculateFitness(sys,kp,ki,kd);
        population(4,1,i) = cost;
    end
end
