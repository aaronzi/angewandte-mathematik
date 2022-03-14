tspan = [0,1];
ya = [1; 0; 0];
n = 1e4;

[t,y] = euler_systeme(@f_chem,tspan,ya,n);

plot(t,y, '-o')
title('Numerische Lösung')