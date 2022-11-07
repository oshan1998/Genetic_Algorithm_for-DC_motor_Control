function y = drawFitness(sys, kp, ki, kd, t)

    pidC = pid(kp,ki,kd);
    openSys = series(pidC,sys);
    T = feedback(openSys,1);
    y = step(T,t);
end