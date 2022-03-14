% EULER_VERFAHREN zur Lösung von skalaren Anfangswertproblemen
%   [t,y] = EULER_VERFAHREN(f,tspan,y0,n)
%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit
%               t       Skalar Zeit
%               dy,y    Skalar
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       ya      Anfangswert (Vektor)
%       n       Anzahl der Teilintervalle
%   Ausgabe
%       t       (n+1) x 1 Vektor der Zeitpunkte
%       y       (n+1) x 1 Vektor der Zustände, wobei in Zeile i der
%               Zustand zum Zeitpunkt t(i) gespeichert ist
%
function [t,y]=euler_systeme(f,tspan,ya,n)
    h = (tspan(2)-tspan(1))/n;
    systemSize = length(ya);
    y = zeros(n+1, systemSize);
    t = zeros(n+1, 1);
    % Anfangswerte
    y(1,:) = ya';
    t(1) = tspan(1);
    % Numerische Lösung DGL
    for i=1:n
        y(i+1,:) = y(i,:) + h * f(t(i),y(i,:)')';
        t(i+1) = tspan(1) + i * h;
    end
end