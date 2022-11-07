% population is mutated with a small propability to avoid local minimums

function child = mutation(parent, mutation_probability)
    
%     gain = 100;
%     
%     child = parent;
%    
%     
%     % kp mutation
%     r = rand();
%     
%     if (r < mutation_probability)
%         child(1,1) = child(1,1) + gain*(rand() - 0.5);
%     end
%     
%     % ki mutation
%     r = rand();
%     
%     if (r < mutation_probability)
%         child(2,1) = child(2,1) + gain*(rand() - 0.5);
%     end
%     
%     % kd mutation
%     r = rand();
%     
%     if (r < mutation_probability)
%         child(3,1) = child(3,1) + gain*(rand() - 0.5);
%     end
 flag = rand(size(parent))>mutation_probability;
 child = parent;
 child(flag) = 1-parent(flag);

end