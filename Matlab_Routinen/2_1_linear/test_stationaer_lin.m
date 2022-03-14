function maxerr = test_stationaer_lin(N)
    % importieren der Konstanten
    c = konstanten();
    lambda = 1;
    a = 1;
    
    us = @(z) a*exp(lambda*z); % Vorgabe einer L�sung
    % dus = @(z) lambda*a*exp(lambda*z); % 1. Ableitung der L�sung 
    dus2 = @(z) lambda^2*a*exp(lambda*z); % 2. Ableitung der L�sung
    
    s = @(z) -(c.D * dus2(z) - c.k * us(z)); % DGL
    
    % N�herungsweise L�sung mit eigener Funktion
    [z,u] = stationaer_lin(s, N);
    
    % Exakte L�sung
    ze = 0:0.001:c.d;
    ue = us(ze);
    
    % Plot der L�sung (Vergleich exakt <-> analytisch)
    subplot(2,1,1);
    plot(z,u,'o-', ze, ue, 'Linewidth', 3, 'Markersize', 8);
    legend('FD L�sung', 'Analytisch')
    grid on
    xlabel('z [um]');
    ylabel('u [1]');
    title('Ladungstr�gerdichte');
    
    % Bestimmung des Fehlers (zwischen exakt <-> analytisch)
    err = abs(u - us(z));
    
    % Plot des Fehlers
    subplot(2,1,2);
    plot(z, err)
    grid on
    xlabel('z [um]');
    ylabel('abs. Fehler [1]');
    title('Fehler');
    
    % R�ckgabe des maximalen Fehlers f�r Ordnungsbestimmung
    maxerr = max(err);
end