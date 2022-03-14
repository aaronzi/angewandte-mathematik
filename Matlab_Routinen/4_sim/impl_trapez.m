% TRAPEZREGEL zur L�sung von vektorwertigen Anfangswertproblemen
%   [t,y] = IMPL_TRAPEZ(f,tspan,y0,n,df,tol,nmax)
%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit
%               t       Skalar Zeit
%               dy,y    Skalar
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       ya      Anfangswert (Vektor)
%       n       Anzahl der Teilintervalle
%       df      Funktionshandle f�r D_yf(t, y) bez�glich y
%       tol     Toleranz f�r Newton-Verfahren
%       nmax    maximale Anzahl an Schritten des Newton-Verfahrens
%   Ausgabe
%       t       (n+1) x 1 Vektor der Zeitpunkte
%       y       (n+1) x 1 Vektor der Zust�nde, wobei in Zeile i der
%               Zustand zum Zeitpunkt t(i) gespeichert ist
%
function [t,y]=impl_trapez(f,tspan,ya,nTime,df,tol,nmax)
    h = (tspan(2)-tspan(1))/nTime;
    systemSize = length(ya);
    y = zeros(nTime+1, systemSize);
    t = zeros(nTime+1, 1);
    % Anfangswerte
    y(1,:) = ya';
    t(1) = tspan(1);
    % Numerische L�sung DGL
    for i=1:nTime
        [z,~,~] = newton(@(z) F_trapez(z, t(i), h, y(i,:)', f, df), zeros(systemSize,1), tol, nmax);
        y(i+1,:) = y(i,:) + z';
        t(i+1) = tspan(1) + i * h;
    end
end