% used to cross two parents on all possible patterns and generate the
% result

function child1, child2 = crossover(parent1, parent2)
%     r = rand();
%     
%     child = zeros(3,1);
%     
%     if (r < 1/6)
%         child(1,1) = parent1(1,1);
%         child(2,1) = parent1(2,1);
%         child(3,1) = parent1(3,1);
%         
%     elseif (r < 2/6)
%         child(1,1) = parent2(1,1);
%         child(2,1) = parent1(2,1);
%         child(3,1) = parent1(3,1);
%         
%     elseif (r < 3/6)
%         child(1,1) = parent1(1,1);
%         child(2,1) = parent2(2,1);
%         child(3,1) = parent1(3,1);
%         
%     elseif (r < 4/6)
%         child(1,1) = parent2(1,1);
%         child(2,1) = parent2(2,1);
%         child(3,1) = parent1(3,1);
%         
%     elseif (r < 5/6)
%         child(1,1) = parent2(1,1);
%         child(2,1) = parent1(2,1);
%         child(3,1) = parent2(3,1);
%         
%     else
%         child(1,1) = parent2(1,1);
%         child(2,1) = parent2(2,1);
%         child(3,1) = parent2(3,1);
%         
%     end
% single point crossover-------------------------------------------
    nDigit = numel(parent1);% number of digits in binary vector
    brkPoint = rand([1,nDigit-1]); % generate random value for the position to break the arrray
    child1 = [parent1(1:brkPoint) parent2(brkPoint+1:end)];
    child2 = [parent2(1:brkPoint) parent1(brkPoint+1:end)];
% single point crossover-------------------------------------------    

end