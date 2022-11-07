% used to calculate the fitness of the kp,kd,ki values on the final system
% for a step response

function [fitness, closedLoopResponse] = calculateFitness(sys, kp, kd, ki)
    s = tf('s');
    K = kp + ki/s + kd*s;
    
    T = feedback(K*sys, 1);
    
    t = 0:0.01:2;
    closedLoopResponse = [t' step(T,t)];
    
    % fitness taken as the inverse value of sum of square error
    
    fitness = 1/sum((closedLoopResponse(:,2)-1).^2);
    
end