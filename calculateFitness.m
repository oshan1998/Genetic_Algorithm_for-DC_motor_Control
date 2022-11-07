% used to calculate the fitness of the kp,kd,ki values on the final system
% for a step response
%ITAE fitness function used...
function [fitness, closedLoopResponse] = calculateFitness(sys, kp, kd, ki)
    s = tf('s');
    K = kp + ki/s + kd*s;
    
    T = feedback(K*sys, 1);
    dt=0.01;
    t = 0:dt:2;
    error = 1-step(T,t);
    fitness = sum(t'.*abs(error)*dt);
    closedLoopResponse = [t' step(T,t)];
    
    % fitness taken as the inverse value of sum of square error
    
%     fitness = 1/sum((closedLoopResponse(:,2)-1).^2);
%     Q = 1;
%     R = 0.001;
%     fitness = (0.01*sum(Q*(1-Y(:)).^2+R*u(:).^2));
    
end