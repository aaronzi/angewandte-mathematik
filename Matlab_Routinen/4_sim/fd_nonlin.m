% Eingabe:
%   u   Vektor u der Größe (N + 1) x 1
%   N   Anzahl der Teilintervalle N
% Ausgabe:
%   Vektor F(u) der Größe (N + 1) x 1
%
function F = fd_nonlin(u,N)
    % Importieren der Konstanten
    c = konstanten();
    
    % Berechnung der Schrittweite
    h = c.d/N;
    
    
    F = zeros(N+1,1);
    % erste Zeile
    F(1) = (c.D/h^2) * (2*u(2) - ((2*c.D+c.SL*2*h+h^2*c.k)/c.D+(h^2*c.k2)/c.D*u(1))*u(1));
    
    % alle Zeilen dazwischen
    for i=2:N
        F(i) = (c.D/h^2) * (u(i+1) - ((2*c.D + h^2*c.k)/c.D+(h^2*c.k2)/c.D*u(i))*u(i) + u(i-1));
    end
    
    % letzte Zeile
    F(N+1) = (c.D/h^2) * (((-c.SR*2*h-2*c.D-h^2*c.k)/c.D - (h^2*c.k2)/c.D*u(N+1))*u(N+1) + 2*u(N));
end