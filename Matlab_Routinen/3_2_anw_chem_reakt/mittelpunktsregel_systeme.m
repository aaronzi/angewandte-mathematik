% Mittelpunktsregel zur Lösung von vektorwertigen Anfangswertproblemen
%   [t,y] = MITTELPUNKTSREGEL_SYSTEME(f,tspan,y0,n)
%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit
%               t       Vektor Zeit
%               dy,y    Vektor
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       ya      Anfangswert (Vektor)
%       n       Anzahl der Teilintervalle
%   Ausgabe
%       t       (n+1) x k Matrix der Zeitpunkte
%       y       (n+1) x k Matrix der Zustände, wobei in Zeile i der
%               Zustand zum Zeitpunkt t(i) gespeichert ist
%
function [t,y]=mittelpunktsregel_systeme(f,tspan,ya,n)
    h = (tspan(2)-tspan(1))/n;
    systemSize = length(ya);
    y = zeros(n+1, systemSize);
    t = zeros(n+1, 1);
    % Anfangswerte
    t(1) = tspan(1);
    y(1,:) = ya';
    % Numerische Lösung DGL
    for i=1:n
        k1 = f(t(i),y(i,:)')';
        k2 = f(t(i)+h/2,y(i,:)'+h/2*k1)';
        y(i+1,:) = y(i,:) + h * k2;
        t(i+1) = tspan(1) + i * h;
    end
end