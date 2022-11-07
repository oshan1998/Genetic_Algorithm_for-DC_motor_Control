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
 sizeParent = size(parent);
 flag = rand(sizeParent(2))>mutation_probability;
 child = parent;
 for i=1:sizeParent(1)
     child_i = child(i,:);
     parent_i = parent(i,:);
     child_i(flag) = 1-parent_i(flag);
     child(i,:) = child_i;
 end


end