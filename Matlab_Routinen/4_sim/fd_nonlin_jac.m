% Eingabe:
%   u   Vektor u der Größe (N + 1) x 1
%   N   Anzahl der Teilintervalle N
% Ausgabe:
%   Jacobi-Matrix DF(u) der Größe (N + 1) x (N + 1) als sparse matrix.
%
function J = fd_nonlin_jac(u,N)
    % Importieren der Konstanten
    c = konstanten();
    
    % Berechnung der Schrittweite
    h = c.d/N;
    
    % Matrix
    diagVar = zeros(N+1,1);
    for i=2:N
        diagVar(i) = -((2*c.D+h^2*c.k)/c.D + (h^2*c.k2)/c.D.*u(i)); % Wert der Diagonalen
    end
    e = ones(N+1,1); % Wert der beiden Nebendiagonalen
    
    J = spdiags([e diagVar.*e e], -1:1, N+1,N+1); % Erstellen der Matrix als sparse Matrix
    
    J(1,1) = -((2*c.D+c.SL*2*h+h^2*c.k)/c.D + (h^2*c.k2)/c.D.*u(1)); % Ersetzen der ersten Zeile mit Randbedingungen
    J(1,2) = 2;
    
    J(N+1,N+1) = ((-c.SR*2*h-2*c.D-h^2*c.k)/c.D - (h^2*c.k2)/c.D.*u(N+1)); % Ersetzen der letzten Zeile mit Randbedingungen
    J(N+1,N) = 2;
    
    J = J.*(c.D/h^2); % Multiplikation mit ausgeklammerter Konstanten
    % full(J) % Anzeigen der Vollständigen Jacobi-Matrix im Terminal
end