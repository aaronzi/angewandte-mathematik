% Eingabe:
%   s       Funktionshandle auf Funktion s(z)
%           function sz=s(z) mit Spaltenvektoren z und sz
%   N       Anzahl der Teilintervalle N
%   tol     Toleranz für Newton-Verfahren
%   nmax    maximale Anzahl an Schritten des Newton-Verfahrens
% Ausgabe:
%   z       Knotenpunkte (z0,z1,...,zN) der Größe (N + 1) x 1
%   u       Vektor u der Größe (N + 1) x 1
%
function [z,u] = stationaer_nonlin(s,N,tol,nmax)
    % import der Konstanten
    c = konstanten();
    
    z = (0:N)'/ N * c.d; % Gitterpunkte
    b = -s(z); % rechte Seite
    f = @(u) deal(fd_nonlin(u,N)-b,fd_nonlin_jac(u,N));
    x0 = zeros(N+1,1);
    
    u = newton(f, x0, tol, nmax);
end