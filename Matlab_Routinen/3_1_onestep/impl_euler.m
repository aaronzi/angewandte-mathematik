% EULER_VERFAHREN zur Lösung von vektorwertigen Anfangswertproblemen
%   [t,y] = IMPL_EULER(f,tspan,y0,n,df,tol,nmax)
%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit
%               t       Skalar Zeit
%               dy,y    Skalar
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       ya      Anfangswert (Vektor)
%       n       Anzahl der Teilintervalle
%       df      Funktionshandle für D_yf(t, y) bezüglich y
%       tol     Toleranz für Newton-Verfahren
%       nmax    maximale Anzahl an Schritten des Newton-Verfahrens
%   Ausgabe
%       t       (n+1) x 1 Vektor der Zeitpunkte
%       y       (n+1) x 1 Vektor der Zustände, wobei in Zeile i der
%               Zustand zum Zeitpunkt t(i) gespeichert ist
%
function [t,y]=impl_euler(f,tspan,ya,n,df,tol,nmax)
    h = (tspan(2)-tspan(1))/n;
    systemSize = length(ya);
    y = zeros(n+1, systemSize);
    t = zeros(n+1, 1);
    % Anfangswerte
    t(1) = tspan(1);
    y(1,:) = ya';
    % Numerische Lösung DGL
    for i=1:n
        [z,~,~] = newton(@(z) F_euler(z, t(i), h, y(i,:)', f, df), zeros(systemSize,1), tol, nmax);
        y(i+1,:) = y(i,:) + z';
        t(i+1) = tspan(1) + i * h;
    end
end