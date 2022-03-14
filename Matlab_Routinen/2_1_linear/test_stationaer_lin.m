function maxerr = test_stationaer_lin(N)
    % importieren der Konstanten
    c = konstanten();
    lambda = 1;
    a = 1;
    
    us = @(z) a*exp(lambda*z); % Vorgabe einer Lösung
    % dus = @(z) lambda*a*exp(lambda*z); % 1. Ableitung der Lösung 
    dus2 = @(z) lambda^2*a*exp(lambda*z); % 2. Ableitung der Lösung
    
    s = @(z) -(c.D * dus2(z) - c.k * us(z)); % DGL
    
    % Näherungsweise Lösung mit eigener Funktion
    [z,u] = stationaer_lin(s, N);
    
    % Exakte Lösung
    ze = 0:0.001:c.d;
    ue = us(ze);
    
    % Plot der Lösung (Vergleich exakt <-> analytisch)
    subplot(2,1,1);
    plot(z,u,'o-', ze, ue, 'Linewidth', 3, 'Markersize', 8);
    legend('FD Lösung', 'Analytisch')
    grid on
    xlabel('z [um]');
    ylabel('u [1]');
    title('Ladungsträgerdichte');
    
    % Bestimmung des Fehlers (zwischen exakt <-> analytisch)
    err = abs(u - us(z));
    
    % Plot des Fehlers
    subplot(2,1,2);
    plot(z, err)
    grid on
    xlabel('z [um]');
    ylabel('abs. Fehler [1]');
    title('Fehler');
    
    % Rückgabe des maximalen Fehlers für Ordnungsbestimmung
    maxerr = max(err);
end