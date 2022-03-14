% Eingabe:
%   N   Anzahl der Teilintervalle N
% Ausgabe:
%   Finite Differenzen Matrix für u der Größe (N + 1) × (N + 1) als sparse matrix
%
function A = fd_lin_matrix(N)
    % Importieren der Konstanten
    c = konstanten();
    
    % Berechnung der Schrittweite
    h = c.d/N;
    
    % Matrix
    diagVar = -(2+(h^2*c.k)/c.D); % Wert der Diagonalen
    e = ones(N+1,1); % Wert der beiden Nebendiagonalen
    
    A = spdiags([e diagVar*e e],-1:1,N+1,N+1); % Erstellen der Matrix als sparse Matrix
    
    A(1,1) = -(2+(c.SL*2*h)/c.D+(c.k*h^2)/c.D); % Ersetzen der ersten Zeile mit Randbedingungen
    A(1,2) = 2;
    
    A(N+1,N+1) = -2-(c.SR*2*h)/c.D - (c.k*h^2)/c.D; % Ersetzen der letzten Zeile mit Randbedingungen
    A(N+1,N) = 2;
    
    A = A.*(c.D/h^2); % Multiplikation mit ausgeklammerter Konstanten
    % full(A) % Anzeigen der Vollständigen Matrix im Terminal
end