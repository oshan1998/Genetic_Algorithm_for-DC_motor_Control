close all;
clear all;
clc;

s = tf('s');
sys = 1/(s^2 + 10*s + 20);

num_of_evolutions = 10;

pop = generateIntialPopulation(100, sys);

%% Evolution steps
fprintf("Generation %d \n",0);
newPop = pop;
max_fitness = max(newPop(4,:));
avg_fitness = mean(newPop(4,:));
    
fprintf("Fitness max : %f, avg : %f \n",max_fitness, avg_fitness);
    
for i=1:num_of_evolutions
    fprintf("Generation %d \n",i);
    newPop = generateNewPopulation(newPop, sys);
    
    max_fitness = max(newPop(4,:));
    avg_fitness = mean(newPop(4,:));
    
    fprintf("Fitness max : %f, avg : %f \n",max_fitness, avg_fitness);
end
%% drawing
t = 0:0.01:10;
y0 = step(sys,t);

best_fitness = max(newPop(4,:));
best_fitness_index = find(newPop(4,:) == best_fitness);

y1 = drawFitness(sys, pop(1,best_fitness_index),pop(2,best_fitness_index),pop(3,best_fitness_index), t);
 
% draw response for manual kp,ki,kd values

kp = 300;
ki = 350;
kd = 50;

y2 = drawFitness(sys, kp,ki,kd, t);
 
figure;
plot(t, y0, 'LineWidth', 1.5);
hold on
plot(t, y1, 'LineWidth', 1.5);
hold off
hold on
plot(t, y2, 'LineWidth', 1.5);
hold off
title('Step Responses');

axis([0 10 0 1.25]);
legend('OpenLoop Response', 'ClosedLoop Response (GA)', 'ClosedLoop Response (Manual)');
grid on;

