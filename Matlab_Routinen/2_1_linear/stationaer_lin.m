% Eingabe:
%   s   Funktionshandle auf Funktion s(z)
%       function sz=s(z) mit Spaltenvektoren z und sz
%   N   Anzahl der Teilintervalle N
% Ausgabe:
%   z   Knotenpunkte (z0,z1,...,zN) der Größe (N + 1) x 1
%   u   Vektor u der Größe (N + 1) x 1
%
function [z,u] = stationaer_lin(s,N)
    % Importieren der Konstanten
    c = konstanten();
    
    % Aufruf fd_lin_matrix um A zu erhalten
    A = fd_lin_matrix(N);
    
    % Gitterpunkte
    z = (0:N)'/ N * c.d;
    
    % Rechte Seite
    b = -s(z);
    
    % Lösen den Gleichungssystems
    u = A\b;
end
    
    