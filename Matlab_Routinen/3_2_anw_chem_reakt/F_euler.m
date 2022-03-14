%%  Eingabe:
%   z       Vektor z der Größe k × 1
%   ti      Zeitpunkt ti
%   h       Schrittweite h
%   yi      Vektor y^(i) der Größe k × 1
%   f       Funktionshandle für f(t,y)
%   df      Funktionshandle für D_yf(t,y)
%%  Ausgabe:
%   F       Vektor Feuler(z) bzw. Ftrapez(z) der Größe k × 1
%   J       Jacobi-Matrix DFeuler(z) bzw. DFtrapez(z) der Größe k × k als sparse matrix.
function [F,J] = F_euler(z, ti, h, yi, f, df)
    F = z - h*f(ti+h,yi+z);
    J = speye(length(z)) - h * df(ti+h,yi+z);
end