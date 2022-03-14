y = @(t) exp(-t).*sin(t); % Vorgabe einer Lösung
dy = @(t) exp(-t).*cos(t)-exp(-t).*sin(t); % 1. Ableitung der Lösung 
dy2 = @(t) exp(-t).*cos(t).*-2.0; % 2. Ableitung der Lösung

% Konstruktion der DGL
omega0 = 3;
r = @(t) dy2(t) + t * dy(t)+omega0^2*(y(t)-1/6*y(t)^3); % DGL

z = @(t,z) [y(t);dy(t)]; % z = [z1;z2] = [y;y']
fz = @(t,z) [dy(t);r(t)-(t*dy(t)+omega0^2*(y(t)-1/6*y(t)^3))]; % z' = [z1';z2'] = [y';y'']
dfz = @(t,z) [0 1; -omega0+omega0*3*z(1)^2 -t]; % Jacobi-Matrix von fz
za = [y(0);dy(0)]; % Startwerte

tspan = [0,10];
n = 100;
tol = 1e-8;
nmax = 10;

[t,s]=impl_trapez(fz,tspan,za,n,dfz,tol,nmax);

te = 0:0.1:10;
se = [y(te);dy(te)];
plot(t,s, '-o',te,se, 'Linewidth', 3)
legend('FD Lösung', 'FD Lösung', 'Analytisch', 'Analytisch')
grid on
xlabel('Teit t');
ylabel('Funktionswert y');
title('nichtlineares, zeitabhängiges System von Anfangswertproblemen');